all: appclient appserver recvfile

udtwrap.o: udtwrap.dpp
	d++ -c --keep-d-files udtwrap.dpp

appclient: appclient.dpp udtwrap.o
	d++ -c appclient.dpp --keep-d-files
	g++ -o appclient appclient.o udtwrap.o libudtc.a libudt.a -L-lstdc++ -lpthread -lphobos2 -L-L~/dlang/dmd-2.080.0/linux/lib64

appserver: appserver.dpp udtwrap.o
	d++ -c appserver.dpp --keep-d-files
	g++ -o appserver appserver.o udtwrap.o libudtc.a libudt.a -L-lstdc++ -lpthread -lphobos2 -L-L~/dlang/dmd-2.080.0/linux/lib64

recvfile: recvfile.dpp udtwrap.o
	d++ -c recvfile.dpp --keep-d-files
	g++ -o recvfile recvfile.o udtwrap.o libudtc.a libudt.a -L-lstdc++ -lpthread -lphobos2 -L-L~/dlang/dmd-2.080.0/linux/lib64
