d++ -c --keep-d-files udtwrap.dpp
d++ -c appclient.dpp
d++ -c appserver.dpp
g++ -o appclient appclient.o udtwrap.o libudtc.a libudt.a -L-lstdc++ -lpthread -lphobos2 -L-L~/dlang/dmd-2.080.0/linux/lib64
g++ -o appserver appserver.o udtwrap.o libudtc.a libudt.a -L-lstdc++ -lpthread -lphobos2 -L-L~/dlang/dmd-2.080.0/linux/lib64
