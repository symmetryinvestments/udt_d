import udtwrap;
import core.thread;
import core.time;
import std.string;
import std.stdio;
import std.conv:to;
import std.socket:AddressInfoFlags,AddressFamily,SocketType;
import std.concurrency : spawn;

int main(string[] args) {
	if (args.length !=3 || !args[2].isNumeric)
	{
		stderr.writefln("usage: appclient server_ip server_port");
		return 0;
	}

	addrinfo hints;
	addrinfo* local, peer;

	hints.ai_flags = AddressInfoFlags.PASSIVE.to!int;
	hints.ai_family = AddressFamily.INET.to!int;
	//hints.ai_socktype = SOCK_STREAM;
	hints.ai_socktype = SocketType.STREAM.to!int;

	if (0 != getaddrinfo(null, "9000", &hints, &local))
	{
		writeln("incorrect network address.");
		return 0;
	}

	auto client = UdtSocket.create(cast(AddressFamily)local.ai_family, SocketType.STREAM, local.ai_protocol);

	// UDT Options
	//client.options.udtSenderBufferSize(10000000);
	//client.options.udpSenderBufferSize(10000000);
	//client.options.maximumBytesPerSecondPerConnection(12500000);
	
	//UDT::setsockopt(client, 0, UDT_CC, new CCCFactory<CUDPBlast>, sizeof(CCCFactory<CUDPBlast>));
	//UDT::setsockopt(client, 0, UDT_MSS, new int(9000), sizeof(int));

	// for rendezvous connection, enable the code below
	/*
	client.options.enableRendezVous(true);
	auto localAddr = SocketAddress(local.ai_addr);
	client.bind(localAddr);
	*/

	freeaddrinfo(local);

	if (0 != getaddrinfo(args[1].toStringz, args[2].toStringz, &hints, &peer))
	{
		writefln("incorrect server/peer address. %s:%s",args[1],args[2]);
		return 0;
	}

	// connect to the server, implict bind
	auto peerAddress = SocketAddress(*peer.ai_addr);
	client.connect(peerAddress);
	freeaddrinfo(peer);

	ubyte[] data;
	data.length = 100000;

	//pthread_create(new pthread_t, null, &monitor, cast(void*)&client);
	spawn(&monitor, cast(shared)&client);

	foreach(i;0.. 1000000)
	{
		int ssize = 0;
		int ss;
		while (ssize < data.length)
		{
			//writefln!"%d %d %d"(ssize, data.length.to!int, data.length);
			ss = client.send(data[ssize .. $], 0);
			if(ss == UDT_ERROR) {
				writefln!"ERROR %d"(ss);
			}
			ssize += ss;
		}

		if (ssize < data.length)
			break;
	}

	client.close();
	return 0;
}

void monitor(shared(UdtSocket)* s) {
	auto u = * cast(UdtSocket*) s;

	TraceInfo perf;

	writefln(	[	"SendRate(Mb/s)",
				"RTT(ms)",
				"CWnd",
				"PktSndPeriod(us)",
				"RecvACK",
				"RecvNAK",
			].join("\t")
	);

	while (true) {
		Thread.sleep(1.seconds);
		perf = u.perfMon(perf);
		writefln("%s\t\t%s\t%s\t%s\t\t\t%s\t%s", perf.mbpsSendRate, perf.msRTT, perf.pktCongestionWindow, perf.usPktSndPeriod, perf.pktRecvACK, perf.pktRecvNAK);
	}

}
