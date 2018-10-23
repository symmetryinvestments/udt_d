import std.stdio;
import udtwrap;
import std.socket:AddressInfoFlags,AddressFamily,SocketType;
import std.conv : to;
import std.string : toStringz;
import std.exception : enforce;

int main(string[] args) {
	if (args.length!=5) {
		stderr.writeln("usage: recvfile server_ip server_port remote_filename local_filename");
		return -1;
	}

	addrinfo hints; 
	addrinfo *peer;
	hints.ai_flags = AddressInfoFlags.PASSIVE.to!int;
	hints.ai_family = AddressFamily.INET.to!int;
	hints.ai_socktype = SocketType.STREAM.to!int;

	if (0 != getaddrinfo(args[1].toStringz(), args[2].toStringz(), &hints, &peer)) {
		writefln("incorrect server/peer address. %s:%s",args[1],args[2]);
		return -1;
	}

	auto fhandle = UdtSocket.create(cast(AddressFamily)peer.ai_family, SocketType.STREAM, peer.ai_protocol);

	// connect to the server, implict bind
	auto socketAddr = SocketAddress(*peer.ai_addr);
	fhandle.connect(socketAddr);
	freeaddrinfo(peer);

	// send name information of the requested file
	int len = to!int(args[3].length);

	fhandle.send(len);

	// TODO only works as long args[3] only consists of ASCII charaters
	fhandle.send((cast(ubyte*)args[3].ptr)[0 .. args[3].length], 0);

	// get size information
	long size;
	ubyte[] sizePtr = (cast(ubyte*)&size)[0 .. long.sizeof];
	assert(cast(void*)&size is cast(void*)sizePtr.ptr);

	long recvRslt = fhandle.receive(sizePtr);
	enforce(size >= 0," no such file " ~args[3] ~ " on the server");


	long recvsize;
	long offset = 0;
	if(UDT_ERROR == (recvsize = fhandle.receiveFile(
			args[4], offset, size)))
	{
		writeln("recvfile: ", getLastError());
		return  -1;
	}
	fhandle.close();
	return 0;
}
