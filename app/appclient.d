import udtwrap;
import std.string;
import std.stdio;
import std.experimental.all;

int main(string[] args)
{
	if (args.length !=3 || args[2].isNumeric)
	{
		stderr.writefln("usage: appclient server_ip server_port");
		return 0;
	}

	// Automatically start up and clean up UDT module.
	UDTUpDown _udt_;

	addrinfo hints, *local, *peer;

	memset(&hints, 0, sizeof(struct addrinfo));

	hints.ai_flags = AI_PASSIVE;
	hints.ai_family = AF_INET;
	hints.ai_socktype = SOCK_STREAM;
	//hints.ai_socktype = SOCK_DGRAM;

	if (0 != getaddrinfo(null, "9000", &hints, &local))
	{
		writeln("incorrect network address.");
		return 0;
	}

	UDTSOCKET client = UdtSocket(local.ai_family, local.ai_socktype, local.ai_protocol);

	// UDT Options
	//UDT::setsockopt(client, 0, UDT_CC, new CCCFactory<CUDPBlast>, sizeof(CCCFactory<CUDPBlast>));
	//UDT::setsockopt(client, 0, UDT_MSS, new int(9000), sizeof(int));
	//UDT::setsockopt(client, 0, UDT_SNDBUF, new int(10000000), sizeof(int));
	//UDT::setsockopt(client, 0, UDP_SNDBUF, new int(10000000), sizeof(int));
	//UDT::setsockopt(client, 0, UDT_MAXBW, new int64_t(12500000), sizeof(int));

	// for rendezvous connection, enable the code below
	/*
	UDT::setsockopt(client, 0, UDT_RENDEZVOUS, new bool(true), sizeof(bool));
	if (UDT::ERROR == UDT::bind(client, local.ai_addr, local.ai_addrlen))
	{
	cout << "bind: " << UDT::getlasterror().getErrorMessage() << endl;
	return 0;
	}
	*/

	freeaddrinfo(local);

	if (0 != getaddrinfo(argv[1], argv[2], &hints, &peer))
	{
		writefln("incorrect server/peer address. %s:%s",args[1],args[2]);
		return 0;
	}

	// connect to the server, implict bind
	client.connect(peer.ai_addr,peer.ai_addrlen);
	freeaddrinfo(peer);

	// using CC method
	//CUDPBlast* cchandle = null;
	//int temp;
	//UDT::getsockopt(client, 0, UDT_CC, &cchandle, &temp);
	//if (null != cchandle)
	//   cchandle.setRate(500);

	int size = 100000;
	auto data = new char[size];

	pthread_create(new pthread_t, null, monitor, &client);

	foreach(i;0.. 1000000)
	{
		int ssize = 0;
		int ss;
		while (ssize < size)
		{
			ss = client.send(data + ssize, size - ssize, 0);
			ssize += ss;
		}

		if (ssize < size)
			break;
	}

	client.close();
	return 0;
}

void* monitor(void* s)
{
	UDTSOCKET u = *(UDTSOCKET*)s;

	TraceInfo perf;

	writefln(	[	"SendRate(Mb/s)",
				"RTT(ms)",
				"CWnd",
				"PktSndPeriod(us)",
				"RecvACK",
				"RecvNAK")
			].join("\t"
	);

	while (true)
	{
		sleep(1);
		perf = u.perfMon(perf);
		writefln("%s\t\t%s\t%s\t%s\t\t\t%s\t%s", perf.mbpsSendRate, perf.msRTT, perf.pktCongestionWindow, perf.usPktSndPeriod, perf.pktRecvACK, perf.pktRecvNAK);
	}

	return null;
}
