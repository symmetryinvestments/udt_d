all: udtc udtwrap appclient appserver recvfile sendfile

udtc:
	make -C udt/src/

udtwrap: udtc
	-dub

appclient: udtwrap
	cd appclient && dub build

appserver: udtwrap
	cd appserver && dub build

recvfile: udtwrap
	cd recvfile && dub build

sendfile: udtwrap
	cd sendfile && dub build
