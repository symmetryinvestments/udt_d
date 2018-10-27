import std.stdio;
import std.process;
import std.exception : enforce;
import std.file : remove;
import std.format : format;
import std.random : uniform, Random;

void main() {
	auto rnd = Random(1337);

	foreach(i; 0 .. 10) {
		auto randomfile = spawnProcess(["dd", "if=/dev/urandom", "of=orig",
				format!"count=%d"(uniform(5000, 20000, rnd)),
				format!"bs=%d"(uniform(5000, 20000, rnd))
			]);
		randomfile.wait();
	
		auto sendfile = spawnProcess(["../sendfile/sendfile"]);
		auto recvfile = spawnProcess(["../recvfile/recvfile", "localhost",
				"9000", "orig", "orig.bak"]);
		recvfile.wait();
		sendfile.kill();
	
		auto cmp = spawnProcess(["cmp", "orig", "orig.bak"]);
		enforce(cmp.wait() == 0, "send file did not match original");
		remove("orig");
		remove("orig.bak");
	}
}
