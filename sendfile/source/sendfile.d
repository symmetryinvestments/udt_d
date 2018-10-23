import udtwrap;

import std.conv : to;
import std.stdio : writeln, writefln;
import std.socket:AddressInfoFlags,AddressFamily,SocketType;
import std.string : toStringz, fromStringz;
import std.exception : enforce;

int main(string[] args) {
	if(args.length>2 || (args.length==2 && args[0].to!int <= 0)) {
		writeln("usage: sendfile [server_port]");
		return 0;
	}
	
	addrinfo hints;
	addrinfo* res;

	hints.ai_flags = AddressInfoFlags.PASSIVE.to!int;
	hints.ai_family = AddressFamily.INET.to!int;
	hints.ai_socktype = SocketType.STREAM.to!int;

	string service="9000";
	if(args.length == 2) {
	   	service = args[1];
	}

	if(0 != getaddrinfo(null, service.toStringz(), &hints, &res)) {
	   	writeln("illegal port number or port is busy.");
	   	return -1;
	}

	auto serv = UdtSocket.create(res.ai_family.to!AddressFamily,
			to!SocketType(res.ai_socktype), res.ai_protocol);
	auto aiAddr = SocketAddress(*res.ai_addr);
	serv.bind(aiAddr);

	writefln!"sendfile listening on port %s"(service);

	freeaddrinfo(res);

	serv.listen(10);

	SocketAddressStorage clientAddr;
	UdtSocket fhandle;

	while (true) {
		import std.concurrency:spawn;
		serv.accept(fhandle, clientAddr);
		clientAddr.getNameInfo();
		writefln!"new connection: %s:%s"(clientAddr.clientHost, clientAddr.clientService);
		spawn(&sendfile, cast(shared)&fhandle);
	}
}

void sendfile(shared(UdtSocket)* usocket) {
	import std.file : getSize;
	import std.string : fromStringz;
	import std.exception : assumeUnique;
	import std.format : format;

	UdtSocket fhandle = *cast()usocket;

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
