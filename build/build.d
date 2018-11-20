int main() {
    import std.stdio: stderr;

    try {
        run;
        return 0;
    } catch(Throwable e) {
        stderr.writeln("Error: ", e);
        return 1;
    }
}


@safe:

void run() {
    import std.stdio: writeln;
    import std.file: thisExePath;
    import std.path: buildNormalizedPath, dirName;

    const repoPath = buildNormalizedPath(thisExePath.dirName, "..");

    writeln("Building libudt.a");
    enforceExecute(["make"], buildNormalizedPath(repoPath, "udt", "src"));

    writeln("Building libudpwrap.a");
    dubBuild(repoPath);

    writeln("Building sendFile");
    dubBuild(buildNormalizedPath(repoPath, "sendfile"));

    writeln("Building recvFile");
    dubBuild(buildNormalizedPath(repoPath, "recvfile"));

    writeln("Running tests");
    dubRun(buildNormalizedPath(repoPath, "test"));
}


void dubBuild(in string workPath) {
    enforceExecute(dubBuildArgs, workPath);
}


void dubRun(in string workPath) {
    enforceExecute(dubRunArgs, workPath);
}


void enforceExecute(in string[] args, in string workPath) {
    import std.exception: enforce;
    import std.conv: text;
    import std.array: join;
    import std.stdio: writeln;

    try {
        const res = execute(args, workPath);
        enforce(res.status == 0,
                text("Could not execute `", args.join(" "), "` in directory '",
                     workPath, "':\n", res.output));
        writeln(res.output);
    } catch(Exception e)
        throw new Exception(text("Could not execute `", args.join(" "), "` in directory '",
                                 workPath, "':\n", () @trusted { return e.toString; }()));
}


auto execute(in string[] args, in string workPath) {
    import std.process: Config, execute_ = execute;


    const string[string] env = null;
    Config config = Config.none;
    size_t maxOutput = size_t.max;

    return execute_(args, env, config, maxOutput, workPath);
}


string[] dubBuildArgs() {
    return dubArgs("build");
}


string[] dubRunArgs() {
    return dubArgs("run");
}

string[] dubArgs(in string command) {
    return ["dub", command, "-q", "--compiler=" ~ compiler];
}


string compiler() {
    import std.process: environment;
    return environment.get("DC", "dmd");
}
