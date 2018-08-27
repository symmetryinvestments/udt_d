import std.experimental.all;
import udtwrap;
import std.string;

int main(string[] args)
{
	if ((args.length!=1) || (args.length==2 && args[1].isNumeric))
	{
		stderr.writeln("usage: appserver [server_port]");
		return 0;
	}

	// Automatically start up and clean up UDT module.
	UDTUpDown _udt_;

	addrinfo hints;
	addrinfo* res;

	memset(&hints, 0, sizeof(struct addrinfo));

	hints.ai_flags = AI_PASSIVE;
	hints.ai_family = AF_INET;
	hints.ai_socktype = SOCK_STREAM;
	//hints.ai_socktype = SOCK_DGRAM;

	string service = (args.length == 2) ? args[1] : "9000";

	if (0 != getaddrinfo(NULL, service.c_str(), &hints, &res))
	{
		writefln("illegal port number or port is busy.");
		return 0;
	}

	auto serv = Udtsocket(res.ai_family, res.ai_socktype, res.ai_protocol);

	// UDT Options
	//UDT::setsockopt(serv, 0, UDT_CC, new CCCFactory<CUDPBlast>, sizeof(CCCFactory<CUDPBlast>));
	//UDT::setsockopt(serv, 0, UDT_MSS, new int(9000), sizeof(int));
	//UDT::setsockopt(serv, 0, UDT_RCVBUF, new int(10000000), sizeof(int));
	//UDT::setsockopt(serv, 0, UDP_RCVBUF, new int(10000000), sizeof(int));

	serv.bind(serv, res.ai_addr, res.ai_addrlen);

	freeaddrinfo(res);

	writefln("server is ready at port: %s" ,service);
	serv.listen(10);

	sockaddr_storage clientaddr;
	int addrlen = clientaddr.sizeof;

	UDTSOCKET recver;

	while (true)
	{
		recver = serv.accept(cast(sockaddr*)&clientaddr, &addrlen);
		char[NI_MAXHOST]  clienthost;
		char[NI_MAXSERV]  clientservice;
		getnameinfo((sockaddr *)&clientaddr, addrlen, clienthost, sizeof(clienthost), clientservice, sizeof(clientservice), NI_NUMERICHOST|NI_NUMERICSERV);
		writefln("new connection: %s:%s" ,clienthost,clientservice);

		pthread_t rcvthread;
		pthread_create(&rcvthread, NULL, recvdata, new UDTSOCKET(recver));
		pthread_detach(rcvthread);
	}

	serv.close();
	return 0;
}

void* recvdata(void* usocket)
{
	UDTSOCKET recver = *(UDTSOCKET*)usocket;
	delete (UDTSOCKET*)usocket;
	enum size = 100000;
	auto data = new char[size];

	while (true)
	{
		int rsize = 0;
		int rs;
		while (rsize < size)
		{
			int rcv_size;
			int var_size = int.sizeof;
			recver.getsockopt(0, UDT_RCVDATA, &rcv_size, &var_size);
			rs = recver.receive(data + rsize, size - rsize, 0);
			rsize += rs;
		}

		if (rsize < size)
			break;
	}

	recver.close();
	return null;
}
