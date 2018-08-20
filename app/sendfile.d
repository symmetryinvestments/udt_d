import udtwrap;


int main(string[] args)
{
   //usage: sendfile [server_port]
   if (args.length>2 || (args.length==2 &&args[0].to!int<=0))
   {
      stderr.writeln( "usage: sendfile [server_port]");
      return 0;
   }

   addrinfo hints;
   addrinfo* res;

   memset(&hints, 0, sizeof(struct addrinfo));
   hints.ai_flags = AI_PASSIVE;
   hints.ai_family = AF_INET;
   hints.ai_socktype = SOCK_STREAM;

   auto service = (args
   string service="9000";
   if (2 == argc)
      service = argv[1];

   if (0 != getaddrinfo(NULL, service.c_str(), &hints, &res))
   {
      cout << "illegal port number or port is busy.\n" << endl;
      return 0;
   }

   UDTSOCKET serv = UDT::socket(res.ai_family, res.ai_socktype, res.ai_protocol);
   serv.bind(res.ai_addr, res.ai_addrlen);
   freeaddrinfo(res);
   writefln("server is ready at port: %s",service);
   serv.listen(10);

   sockaddr_storage clientaddr;
   int addrlen = clientaddr.sizeof;

   UDTSOCKET fhandle;

   while (true)
   {
      fhandle = serv.accept(cast(scokaddr*)&clientaddr);

      char clienthost[NI_MAXHOST];
      char clientservice[NI_MAXSERV];
      getnameinfo((sockaddr *)&clientaddr, addrlen, clienthost, sizeof(clienthost), clientservice, sizeof(clientservice), NI_NUMERICHOST|NI_NUMERICSERV);
      writefln("new connection: %s:%s" ,clienthost,clientservice);

	 pthread_t filethread;
	 pthread_create(&filethread, null, sendfile, new UDTSOCKET(fhandle));
	 pthread_detach(filethread);
   }

   serv.close();

   return 0;
}

void* sendfile(void* usocket)
{
   UDTSOCKET fhandle = *(UDTSOCKET*)usocket;
   delete (UDTSOCKET*)usocket;

   char[1024] file;
   int len;

   fhandle.receive(cast(ubyte[0..4])len,0);
   fhandle.receive(file,len,0);
   file[len] = '\0';

   // open the file
   fstream ifs(file, ios::in | ios::binary);

   ifs.seekg(0, ios::end);
   int64_t size = ifs.tellg();
   ifs.seekg(0, ios::beg);

   // send file size information
   fhandle.send(size,0);

   TraceInfo trace;
   trace = fhandle.perfMon(trace);

   // send the file
   int64_t offset = 0;
   fhandle.sendfile(ifs,offset,size);

   trace = fhandle.perfMon(trace);
   writefln("speed = %s Mbits/sec",trace.mbpsSendRate);

   fhandle.close();
   ifs.close();
   return null;
}
