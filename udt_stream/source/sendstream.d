module udt.sendstream;
import udtwrap;

import std.conv : to;
import std.stdio : writeln, writefln, stdin, stdout, stderr, File;
import std.socket:AddressInfoFlags,AddressFamily,SocketType,InternetAddress,Socket;
import std.string : toStringz, fromStringz;
import std.exception : enforce;
import std.getopt;


int main(string[] args)
{
	string filename = null;
	bool receiveMode = false;
	bool sendMode = false;
	bool bindMode = false;
	bool connectMode = false;
	string addr = "127.0.0.1";
	ushort port = 9009;
	size_t bufSize = 20_000_000;
	enum backlog = 10;
	ushort tcpPort = 0;
	string tcpAddress = "127.0.0.1";
	bool tcpBind = false;

	auto helpInformation = getopt(args,
			"recv",		&receiveMode,
			"send",		&sendMode,
			"bind",		&bindMode,
			"connect",	&connectMode,
			"address",	&addr,
			"port",		&port,
			"bufsize",	&bufSize,
			"filename", &filename,
			"tcpaddress",&tcpAddress,
			"tcpport", &tcpPort,
			"tcpbind",&tcpBind,
	);
/+
	if (receiveMode && sendMode)
	{
		stderr.writeln("cannot enable both --recv and --send for now\n");
		helpInformation.helpWanted = true;
	}
+/
	if (bindMode && connectMode)
	{
		stderr.writeln("cannot enable both --bind and --connect");
		helpInformation.helpWanted = true;
	}

	if (!bindMode && !connectMode)
	{
		stderr.writeln("must specify one of --bind and --connect");
		helpInformation.helpWanted = true;
	}

	if (filename.length > 0 && (tcpAddress!="127.0.0.1" || tcpPort!=0))
	{
		stderr.writefln("cannot specify filename and tcp address/port");
		helpInformation.helpWanted = true;
	}

	if (helpInformation.helpWanted)
	{
		stderr.writeln("usage: udtstream <--bind | --connect> <--recv | --send> --address <address> --port <port>");
		stderr.writeln("  example udtstream --connect --send --address 10.10.1.10 --port 9000");
		stderr.writeln("  or      udtstream --bind --recv --address 0.0.0.0 --port 9000");
		return -1;
	}

	File filehandle;
	Socket tcpSocket;
	if (filename.length >0)
	{
		filehandle = File(filename,sendMode ? "rb":"wb");
	}
	else if(tcpPort!=0)
	{
		auto tcpAddress4 = new InternetAddress(tcpAddress,tcpPort);
		if (tcpBind)
		{
			tcpSocket.bind(tcpAddress4);
			tcpSocket.listen(backlog);
			auto newTcpSocket = tcpSocket.accept();
			filehandle.fdopen(newTcpSocket.handle);
		}
		else
		{
			tcpSocket.connect(tcpAddress4);
			filehandle.fdopen(tcpSocket.handle);
		}
	}
	else
	{
		filehandle = sendMode ? stdin: stdout;
	}
	auto socket = UdtSocket.create4(true);
	auto address = new InternetAddress(addr,port);
	if (bindMode)
	{
		socket.bind(address);
		socket.listen(backlog);
		auto result = socket.accept();
		auto socket2 = result[0];
		auto clientAddr = result[1];
		stderr.writefln!"new connection: %s:%s"(clientAddr.toHostNameString, clientAddr.port);
		if(sendMode && !receiveMode)
		{
			sendStream(filehandle,socket2,bufSize);
		}
		else if (!sendMode && receiveMode)
		{
			receiveStream(socket2,filehandle,bufSize);
		}
		else // two-way pipe
		{
			pipeStreams(socket2,filehandle,bufSize);
		}
		socket2.close();
		socket.close();
	}

	else if (connectMode)
	{
		socket.connect(address);
		if(sendMode && !receiveMode)
		{
			sendStream(filehandle,socket,bufSize);
			socket.close();
		}
		else if (!sendMode && receiveMode)
		{
			receiveStream(socket,filehandle,bufSize);
			socket.close();
		}
		else // two-way pipe
		{
			pipeStreams(socket,filehandle,bufSize);
		}
	}
	filehandle.flush();
	stderr.writefln("* done");
	return 0;
}

