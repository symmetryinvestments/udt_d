DC=dmd

udtwrap: udtc gen
	-dub --compiler=${DC}

udtc:
	make -C udt/src/

gen: source/udtwrap.dpp
	d++ --include-path udt/src/ --keep-d-files --preprocess-only source/udtwrap.dpp
