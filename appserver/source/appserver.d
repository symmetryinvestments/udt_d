import udtwrap;
import core.thread;
import core.time;
import std.string;
import std.format : format;
import std.stdio;
import std.conv:to;
import std.socket:AddressInfoFlags,AddressFamily,SocketType;
static import core.sys.posix.netdb;

enum NI_MAXHOST=200;
enum NI_MAXSERV = 200;

int main(string[] args)
{
	if ((args.length!=1) || (args.length==2 && args[1].isNumeric))
	{
		stderr.writeln("usage: appserver [server_port]");
		return 0;
	}

	addrinfo hints;
    memset(&hints, 0, addrinfo.sizeof);

	addrinfo* res;

	hints.ai_flags = AddressInfoFlags.PASSIVE.to!int;
	//hints.ai_family = AddressFamily.INET.to!int;
	hints.ai_family = AddressFamily.UNSPEC.to!int;
	hints.ai_socktype = SocketType.STREAM; // DGRAM

	string service = (args.length == 2) ? args[1] : "9000";

	if (0 != getaddrinfo(null, service.toStringz, &hints, &res)) {
		writefln("illegal port number or port is busy.");
		return 0;
	}

	auto serv = UdtSocket.create(res.ai_family.to!AddressFamily,
			to!SocketType(res.ai_socktype), res.ai_protocol);

	// UDT Options
	//UDT::setsockopt(serv, 0, UDT_CC, new CCCFactory<CUDPBlast>, sizeof(CCCFactory<CUDPBlast>));
	//UDT::setsockopt(serv, 0, UDT_MSS, new int(9000), sizeof(int));
	//UDT::setsockopt(serv, 0, UDT_RCVBUF, new int(10000000), sizeof(int));
	//UDT::setsockopt(serv, 0, UDP_RCVBUF, new int(10000000), sizeof(int));

	auto aiAddr = SocketAddress(*res.ai_addr);
	serv.bind(aiAddr);

	freeaddrinfo(res);

	writefln("server is ready at port: %s" ,service);
	serv.listen(10);

	SocketAddressStorage clientAddr;
	UdtSocket recver;

	while (true) {
		import std.concurrency:spawn;
		serv.accept(recver, clientAddr);

		clientAddr.getNameInfo();

		writefln("new connection: %s:%s" , clientAddr.clientHost, clientAddr.clientService);

		spawn(&recvData, cast(shared)&recver);
	}

//	serv.close();
//	return 0;
}

void recvData(shared(UdtSocket)* usocket) {
	UdtSocket recver;
	recver = *cast()usocket;

	enum Size = 100000;
	ubyte[Size] data;

	while(true) {
		int rsize;
		int rs;

		while(rsize < Size) {
			int bytesReceived = recver.receive(data[rsize .. $]);
			//writefln!"%7d %7d"(bytesReceived, rsize);
			rsize += bytesReceived;
		}

		if(rsize < Size) {
			break;
		}
	}

	recver.close();
}
