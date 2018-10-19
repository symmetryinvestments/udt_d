import udtwrap;


enum g_IP_Version = AF_INET;
enum g_Socket_Type = SOCK_STREAM;
enum g_Localhost = "127.0.0.1";
enum g_Server_Port = 9000;


int createUDTSocket(UdtSocket usock, int port = 0, bool rendezvous = false)
{
   addrinfo hints;
   addrinfo* res;
   memset(&hints, 0, sizeof(struct addrinfo));
   hints.ai_flags = AI_PASSIVE;
   hints.ai_family = g_IP_Version;
   hints.ai_socktype = g_Socket_Type;

   char service[16];
   sprintf(service, "%d", port);

   enforce(getaddrinfo(null, service, &hints, &res)==0, "illegal port number or port is busy.");

   auto usock = UdtSocket.create(res.ai_family,resi.ai_socktype,res.ai_protocol);

   // since we will start a lot of connections, we set the buffer size to smaller value.
   int snd_buf = 16000;
   int rcv_buf = 16000;

   usock.options.sendBuffer(snd_buf);
   usock.options.receiveBuffer(rcv_buf);

   snd_buf = 8192;
   rcv_buf = 8192;
   
   usock.options.sendBuffer(snd_buf);
   usock.options.receiveBuffer(rcv_buf);
   
   int fc = 16;
   usock.options.maximumWindowSize(fc);
   
   bool reuse = true;
   usock.options.reuseAddress(reuse);
   usock.options.rendezVous(reuse);

   usock.bind(res.ai_addr);

   freeaddrinfo(res);
   return 0;
}

int createTCPSocket(SYSSOCKET& ssock, int port = 0, bool rendezvous = false)
{
   addrinfo hints;
   addrinfo* res;
   memset(&hints, 0, sizeof(struct addrinfo));
   hints.ai_flags = AI_PASSIVE;
   hints.ai_family = g_IP_Version;
   hints.ai_socktype = g_Socket_Type;

   char service[16];
   sprintf(service, "%d", port);

   enforce(getaddrinfo(null, service, &hints, &res)==0, "illegal port number or port is busy.");

   ssock = socket(res.ai_family, res.ai_socktype, res.ai_protocol);
   try
   {
	   ssock.bind(res.ai_addr, res.ai_addrlen);
   }
   catch(Exception e)
   {
      return -1;
   }

   freeaddrinfo(res);
   return 0;
}

int connect(UDTSOCKET& usock, int port)
{
   addrinfo hints, *peer;
   memset(&hints, 0, sizeof(struct addrinfo));
   hints.ai_flags = AI_PASSIVE;
   hints.ai_family =  g_IP_Version;
   hints.ai_socktype = g_Socket_Type;

   char buffer[16];
   sprintf(buffer, "%d", port);

   if (0 != getaddrinfo(g_Localhost, buffer, &hints, &peer))
   {
      return -1;
   }

   usock.connect(peer.ai_addr);
   freeaddrinfo(peer);
   return 0;
}

int tcp_connect(SYSSOCKET& ssock, int port)
{
   addrinfo hints, *peer;
   memset(&hints, 0, sizeof(struct addrinfo));
   hints.ai_flags = AI_PASSIVE;
   hints.ai_family = g_IP_Version;
   hints.ai_socktype = g_Socket_Type;

   char buffer[16];
   sprintf(buffer, "%d", port);

   if (0 != getaddrinfo(g_Localhost, buffer, &hints, &peer))
   {
      return -1;
   }

   ssock.connect(peer.ai_addr);

   freeaddrinfo(peer);
   return 0;
}


// Test basic data transfer.

enum g_TotalNum = 10000;

void* Test_1_Srv(void* param)
{
   writeln("Testing simple data transfer");

   UDTSOCKET serv;
   if (createUDTSocket(serv, g_Server_Port) < 0)
      return null;

   serv.listen(1024);
   sockaddr_storage clientaddr;
   int addrlen = sizeof(clientaddr);
   UDTSOCKET new_sock = serv.accept(cast(sockaddr*)&clientaddr);
   serv.close();

   if (new_sock == UDT::INVALID_SOCK)
   {
      return null;
   }

   int32_t buffer[g_TotalNum];
   fill_n(buffer, 0, g_TotalNum);

   int torecv = g_TotalNum * sizeof(int32_t);
   while (torecv > 0)
   {
      int rcvd = new_sock.recv( (char*)buffer + g_TotalNum * sizeof(int32_t) - torecv, torecv, 0);
      torecv -= rcvd;
   }

   // check data
   foreach(i;0..g_TotalNum)
   {
      if (buffer[i] != i)
      {
         writefln("DATA ERROR %s %s",i,buffer[i]);
         break;
      }
   }

   int eid = UDT::epoll_create();
   UDT::epoll_add_usock(eid, new_sock);
   /*
   set<UDTSOCKET> readfds;
   if (UDT::epoll_wait(eid, &readfds, null, -1) > 0)
   {
      UDT::close(new_sock);
   }
   */

   UDTSOCKET readfds[1];
   int num = 1;
   if (UDT::epoll_wait2(eid, readfds, &num, null, null, -1) > 0)
   {
      new_sock.close();
   }

   return null;
}

void* Test_1_Cli(void* param)
{
   UDTSOCKET client;
   if (createUDTSocket(client, 0) < 0)
      return null;

   connect(client, g_Server_Port);

   int32_t buffer[g_TotalNum];
   for (int i = 0; i < g_TotalNum; ++ i)
      buffer[i] = i;

   int tosend = g_TotalNum * sizeof(int32_t);
   while (tosend > 0)
   {
      int sent = client.send((char*)buffer + g_TotalNum * sizeof(int32_t) - tosend, tosend, 0);
      tosend -= sent;
   }

   UDT::close(client);
   return null;
}


// Test parallel UDT and TCP connections, over shared and dedicated ports.

enum g_UDTNum = 200;
enum g_IndUDTNum = 100;  // must < g_UDTNum.
enum g_TCPNum = 10;
enum g_ActualUDTNum = 0;

void* Test_2_Srv(void* param)
{
   writeln("Test parallel UDT and TCP connections");

   //ignore SIGPIPE
   sigset_t ps;
   sigemptyset(&ps);
   sigaddset(&ps, SIGPIPE);
   pthread_sigmask(SIG_BLOCK, &ps, null);

   // create concurrent UDT sockets
   UDTSOCKET serv;
   if (createUDTSocket(serv, g_Server_Port) < 0)
      return null;

   serv.listen(1024);

   UdtSocket[] new_socks;
   new_socks.length = g_UDTNum;

   int eid = UDT::epoll_create();

   foreach(i;0..g_UDTNum)
   {
      sockaddr_storage clientaddr;
      int addrlen = sizeof(clientaddr);
      new_socks[i] = serv.accept(cast(sockaddr*)&clientaddr, &addrlen);
      UDT::epoll_add_usock(eid, new_socks[i]);
   }


   // create TCP sockets
   SYSSOCKET tcp_serv;
   if (createTCPSocket(tcp_serv, g_Server_Port) < 0)
      return null;

   tcp_serv.listen(1024);

   SYSSOCKET[] tcp_socks;
   tcp_socks.length = g_TCPNum;

   foreach(i;0..g_TCPNum)
   {
      sockaddr_storage clientaddr;
      socklen_t addrlen = sizeof(clientaddr);
      tcp_socks[i] = tcp_serv.accept(cast(sockaddr*)&clientaddr, &addrlen);
      UDT::epoll_add_ssock(eid, tcp_socks[i]);
   }


   // using epoll to retrieve both UDT and TCP sockets
   bool[UdtSocket] readfds;
   bool[SysSocket] tcpread;
   int count = g_UDTNum + g_TCPNum;
   while (count > 0)
   {
      UDT::epoll_wait(eid, &readfds, null, -1, &tcpread);
      for (set<UDTSOCKET>::iterator i = readfds.begin(); i != readfds.end(); ++ i)
      {
         int32_t data;
         UDT::recv(*i, (char*)&data, 4, 0);
         -- count;
      }

      for (set<SYSSOCKET>::iterator i = tcpread.begin(); i != tcpread.end(); ++ i)
      {
         int32_t data;
         recv(*i, (char*)&data, 4, 0);
         -- count;
      }
   }

   foreach(ref sock;new_socks)
   {
      sock.close();
   }

   foreach(ref sock;tcp_socks)
   {
      sock.close();
   }

   serv.close();
   tcp_serv.close();
   return null;
}

void* Test_2_Cli(void* param)
{
   //ignore SIGPIPE
   sigset_t ps;
   sigemptyset(&ps);
   sigaddset(&ps, SIGPIPE);
   pthread_sigmask(SIG_BLOCK, &ps, null);

   // create UDT clients
   UDTSOCKET[] cli_socks;
   cli_socks.length = g_UDTNum;

   // create UDT on individual ports
   for (int i = 0; i < g_IndUDTNum; ++ i)
   {
      cli_socks[i].createUDTSocket(0);
   }

   // create UDT on shared port
   cli_socks[g_IndUDTNum].createUDTSocket(0);
   sockaddr* addr = null;
   int size = 0;
   addr = cast(sockaddr*)new sockaddr_in;
   size = sockaddr_in.sizeof;
   cli_socks[g_IndUDTNum].getsockname( addr, &size);
   char sharedport[NI_MAXSERV];
   getnameinfo(addr, size, null, 0, sharedport, sizeof(sharedport), NI_NUMERICSERV);

   // Note that the first shared port has been created, so we start from g_IndUDTNum + 1.
   foreach(i; g_IndUDTNum + 1 .. g_UDTNum)
   {
      cli_socks[i].createUDTSocket(sharedport.to!ushort);
   }
   for(ref sock;cli_scoks)
   {
      sock.connect(g_Server_Port);
   }

   // create TCP clients
   SYSSOCKET[] tcp_socks;
   tcp_socks.length = g_TCPNum;
   foreach(ref sock;tcp_socks)
   {
      sock.createTCPSocket(0);
      sock.tcp_connect(g_Server_Port);
   }

   // send data from both UDT and TCP clients
   int32_t data = 0;
   foreach(ref sock;cli_scoks)
   {
      sock.send(buf,0);
      ++ data;
   }
   foreach(ref sock;tcp_socks)
   {
      sock.send(buf,0);
      ++ data;
   }

   // close all client sockets
   foreach(ref sock;cli_socks)
   {
      sock.close();
   }
   foreach(ref sock;tcp_socks)
   {
      sock.close();
   }

   return null;
}


// Test concurrent rendezvous connections.

enumg_UDTNum3 = 50;

void* Test_3_Srv(void* param)
{
   writeln("Test rendezvous connections");

   UDTSOCKET[] srv_socks;
   srv_socks.length = g_UDTNum3;

   int port = 61000;

   foreach(ref sock;srv_socks)
   {
      sock.createUDTSocket(port++,true);
    }

   int peer_port = 51000;

   foreach(ref sock;srv_socks)
   {
      sock.connect(peer_port++);
   }

   foreach(ref sock;srv_socks)
   { 
	ubyte[4] data;
	sock.recv(data,0);
   }

   foreach(ref sock;srv_socks)
   {
      sock.close();
   }

   return null;
}

void* Test_3_Cli(void* param)
{
   UdtSocket[] cli_socks;
   cli_socks.length = g_UDTNum3;

   int port = 51000;

   foreach(ref sock;cli_socks)
   	sock.createUDTSocket(port++,true);

   int peer_port = 61000;

   foreach(ref sock;cli_scoks)
   {
      sock.connect( peer_port ++);
   }
	int data;

   foreach(ref sock;cli_socks)
   {
	   auto buf = cast(ubyte[0..4])(cast(ubyte*)&i);
      sock.send(buf,0);
      ++ data;
   }

   foreach(ref sock;cli_socks)
   {
      sock.close();
   }

   return null;
}


// Test concurrent UDT connections in multiple threads.

enumg_UDTNum4 = 1000;
enumg_UDTThreads = 40;
enumg_UDTPerThread = 25;

void* Test_4_Srv(void* param)
{
   writeln( "Test UDT in multiple threads");

   UdtSocket serv;
   if (createUDTSocket(serv, g_Server_Port) < 0)
      return null;

   serv.listen(1024);

   UdtSocket[] new_socks;
   new_socks.length=g_UDTNum4;

   foreach(i;0..g_UDTNum4)
   {
      sockaddr_storage clientaddr;
      int addrlen = clientaddr.sizeof;
      new_socks[i] = serv.accept(cast(sockaddr*)&clientaddr, &addrlen);
   }

   foreach(ref sock;new_socks)
   {
      sock.close();
   }

   serv.close();

   return null;

}

void* start_and_destroy_clients(void* param)
{
   UdtSocket[]  cli_socks;
   cli_socks.length = g_UDTPerThread;
   cli_socks[0].createUDTSocket(0);

   sockaddr* addr = null;
   int size = 0;

   addr = cast (sockaddr*)new sockaddr_in;
   size = sockaddr_in.sizeof;

   cli_socks.getSockName(addr,&size);
   
   char sharedport[NI_MAXSERV];
   getnameinfo(addr, size, null, 0, sharedport, sharedport.sizeof, NI_NUMERICSERV);

   foreach(i;1..g_UDTPerThread)
      cli_socks[i].createUDTSocket(sharedport.to!int);

   foreach(ref sock;cli_socks)
	   sock.connect(g_Server_Port);


   foreach(ref sock;cli_socks)
	   sock.close();

   return null;
}

void* Test_4_Cli(void*)
{
   pthread_t[] cli_threads;
   cli_threads.length=g_UDTThreads;

   foreach (ref th;cli_threads)
   {
      pthread_create(&th, null, start_and_destroy_clients, null);
   }

   foreach(ref th;cli_threads)
   {
      pthread_join(th, null);
   }
   return null;
}


int main()
{
   enum test_case = 4;
   
   //void* (*Test_Srv[test_case])(void*);
   //void* (*Test_Cli[test_case])(void*);

   void* function(void*)[test_case] Test_Srv;
   void* function(void*)[test_case] Test_Cli;

   Test_Srv[0] = Test_1_Srv;
   Test_Cli[0] = Test_1_Cli;
   Test_Srv[1] = Test_2_Srv;
   Test_Cli[1] = Test_2_Cli;
   Test_Srv[2] = Test_3_Srv;
   Test_Cli[2] = Test_3_Cli;
   Test_Srv[3] = Test_4_Srv;
   Test_Cli[3] = Test_4_Cli;

   foreach(i;0..test_case)
   {
      writeln("Start Test # %s",i+1);
      UDT::startup();

      pthread_t srv, cli;
      pthread_create(&srv, null, Test_Srv[i], null);
      pthread_create(&cli, null, Test_Cli[i], null);
      pthread_join(srv, null);
      pthread_join(cli, null);

      UDT::cleanup();
      writefln("Test # %s completed",i+1);
   }

   return 0;
}
