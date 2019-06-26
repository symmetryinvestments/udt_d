import udtwrap;

import core.time:dur;
import std.conv : to;
import std.stdio : writeln, writefln;
import std.socket: InternetAddress;
import std.string : toStringz, fromStringz;
import std.exception : enforce;
import std.getopt;
import std.traits:ReturnType;
import core.thread:Thread;

int main(string[] args)
{
	ushort port = 9000;

	auto helpInformation = getopt(args, "port",&port);

	if (helpInformation.helpWanted)
	{
		writeln("usage: sendfile [server_port]");
		return -1;
	}

	auto address = new InternetAddress("127.0.0.1",port);
	auto serv = UdtSocket.create4(true);
	serv.bind(address);

	writefln!"sendfile listening on port %s"(port);

	serv.listen(10);
	while (true) {
		import std.concurrency:spawn;
	/+	if (!serv.isAlive)
		{	
			serv.bind(address);
			enforce(serv.isAlive);
		}
	+/
		ReturnType!(serv.accept) result;
		while(serv.wouldBlock())
			Thread.sleep(dur!"msecs"(50));

		result = serv.accept();
		auto fhandle = result[0];
		auto clientAddr = result[1];
		writefln!"new connection: %s:%s"(clientAddr.toHostNameString(),clientAddr.port);
		spawn(&sendfile, cast(shared)&fhandle);
	}
}

void sendfile(shared(UdtSocket)* usocket) {
	import std.file : getSize;
	import std.string : fromStringz;
	import std.exception : assumeUnique;
	import std.format : format;

	UdtSocket* fhandle = cast(UdtSocket*)usocket;

	char[1024] file;
	int len;

	fhandle.receive(len);
	enforce(len >= 0, format!"no file could have a length of '%d'"(len));
	enforce(len < file.length, "the length of the expected filename exceeds " ~
		"the size of the buffer the filename is supposed to be stored in");

	fhandle.receive(cast(ubyte[])file);
	file[len] = '\0';

	ulong size = getSize(file[0 .. len]);

	// send file size information
	fhandle.send(size);

	TraceInfo trace;
	trace = fhandle.perfMon(trace);

	// send the file
	long offset = 0;
	fhandle.sendFile(assumeUnique(file[0 .. len]), offset);

	trace = fhandle.perfMon(trace);
	writefln!"speed = %7.2f MiB/Sec"(trace.mbpsSendRate);

	fhandle.close();
}
