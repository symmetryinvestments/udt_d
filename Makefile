DC=dmd

all: udtc udtwrap appclient appserver recvfile sendfile

udtc:
	make -C udt/src/

udtwrap: udtc
	-dub --compiler=${DC}

appclient: udtwrap
	cd appclient && dub build --compiler=${DC}

appserver: udtwrap
	cd appserver && dub build --compiler=${DC}

recvfile: udtwrap
	cd recvfile && dub build --compiler=${DC}

sendfile: udtwrap
	cd sendfile && dub build --compiler=${DC}
