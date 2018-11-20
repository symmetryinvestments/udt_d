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

    writeln("UDT Build Program");

    const repoPath = buildNormalizedPath(thisExePath.dirName, "..");
    writeln("Repository path: ", repoPath);

    version(Windows) {
        writeln("Building udt.lib");
        buildOnWindows(repoPath);
    } else {
        writeln("Building libudt.a");
        enforceExecute(["make"], buildNormalizedPath(repoPath, "udt", "src"));
    }

    version(Windows)
        writeln("Building udpwrap.lib");
    else
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
    return ["dub", command, "-q", "--compiler=" ~ compiler, "--arch=x86_mscoff"];
}


string compiler() {
    import std.process: environment;
    return environment.get("DC", "dmd");
}


void buildOnWindows(in string repoPath) @trusted {
    import std.path: buildNormalizedPath, withExtension;
    import std.file: dirEntries, SpanMode, exists;
    import std.stdio: writeln;
    import std.exception: enforce;
    import std.array: array;
    import std.algorithm: map;

    const udtSrcPath = buildNormalizedPath(repoPath, "udt", "src");
    const srcFileNames = dirEntries(udtSrcPath, "*.cpp", SpanMode.breadth).array;

    writeln("Compiling");

    string objFileName(in string srcFileName) {
        return srcFileName.withExtension(".obj").array;
    }

    const clDefines = ["WIN32", "NDEBUG", "_CONSOLE", "UDT_EXPORTS"];
    const clDefineArgs = clDefines.map!(a => "/D" ~ a).array;

    foreach(srcFileName; srcFileNames) {

        const obj = objFileName(srcFileName);
        if(!obj.exists) {
            writeln("Building source file ", srcFileName);
            const args = ["cl", "/c", "/EHsc"] ~ clDefineArgs ~ srcFileName;
            enforceExecute(args, udtSrcPath);
            enforce(exists(obj), "Failed to create " ~ obj);
        }
    }

    writeln("Linking");
    enforceExecute(["lib", "/out:udt.lib"] ~ srcFileNames.map!objFileName.array,
                   udtSrcPath);
    enforce(exists(buildNormalizedPath(udtSrcPath, "udt.lib")),
            "udt.lib not created");
}
