


        import core.stdc.config;
        import core.stdc.stdarg: va_list;
        static import core.simd;

        template __from(string moduleName) {
            mixin("import from = " ~ moduleName ~ ";");
        }
        struct DppOffsetSize{ long offset; long size; }
        struct Int128 { long lower; long upper; }
        struct UInt128 { ulong lower; ulong upper; }

        struct __locale_data { int dummy; }


alias _Bool = bool;
struct dpp {

    static bool isEmpty(T)() {
        return T.tupleof.length == 0;
    }
    static struct Move(T) {
        T* ptr;
    }

    static auto move(T)(ref T value) {
        return Move!T(&value);
    }
    mixin template EnumD(string name, T, string prefix) if(is(T == enum)) {
        private static string _memberMixinStr(string member) {
            import std.conv: text;
            import std.array: replace;
            return text(` `, member.replace(prefix, ""), ` = `, T.stringof, `.`, member, `,`);
        }
        private static string _enumMixinStr() {
            import std.array: join;
            string[] ret;
            ret ~= "enum " ~ name ~ "{";
            static foreach(member; __traits(allMembers, T)) {
                ret ~= _memberMixinStr(member);
            }
            ret ~= "}";
            return ret.join("\n");
        }
        mixin(_enumMixinStr());
    }
}

extern(C)
{
    alias size_t = c_ulong;
    alias fsfilcnt_t = c_ulong;
    alias fsblkcnt_t = c_ulong;
    alias blkcnt_t = c_long;
    alias blksize_t = c_long;
    alias register_t = c_long;
    alias u_int64_t = c_ulong;
    alias u_int32_t = uint;
    alias u_int16_t = ushort;
    alias u_int8_t = ubyte;
    alias key_t = int;
    alias caddr_t = char*;
    alias daddr_t = int;
    alias ssize_t = c_long;
    alias id_t = uint;
    alias pid_t = int;
    alias off_t = c_long;
    alias uid_t = uint;
    alias nlink_t = c_ulong;
    alias mode_t = uint;
    alias gid_t = uint;
    alias dev_t = c_ulong;
    alias ino_t = c_ulong;
    alias loff_t = c_long;
    alias fsid_t = __fsid_t;
    alias u_quad_t = c_ulong;
    alias quad_t = c_long;
    alias u_long = c_ulong;
    alias u_int = uint;
    alias u_short = ushort;
    alias u_char = ubyte;
    int isfdtype(int, int) @nogc nothrow;
    int sockatmark(int) @nogc nothrow;
    int shutdown(int, int) @nogc nothrow;
    int accept(int, sockaddr*, uint*) @nogc nothrow;
    int listen(int, int) @nogc nothrow;
    int setsockopt(int, int, int, const(void)*, uint) @nogc nothrow;
    int getsockopt(int, int, int, void*, uint*) @nogc nothrow;
    c_long recvmsg(int, msghdr*, int) @nogc nothrow;
    c_long sendmsg(int, const(msghdr)*, int) @nogc nothrow;
    c_long recvfrom(int, void*, c_ulong, int, sockaddr*, uint*) @nogc nothrow;
    c_long sendto(int, const(void)*, c_ulong, int, const(sockaddr)*, uint) @nogc nothrow;
    c_long recv(int, void*, c_ulong, int) @nogc nothrow;
    c_long send(int, const(void)*, c_ulong, int) @nogc nothrow;
    int getpeername(int, sockaddr*, uint*) @nogc nothrow;
    int connect(int, const(sockaddr)*, uint) @nogc nothrow;
    int getsockname(int, sockaddr*, uint*) @nogc nothrow;
    int bind(int, const(sockaddr)*, uint) @nogc nothrow;
    int socketpair(int, int, int, int*) @nogc nothrow;
    int socket(int, int, int) @nogc nothrow;
    enum _Anonymous_0
    {
        SHUT_RD = 0,
        SHUT_WR = 1,
        SHUT_RDWR = 2,
    }
    enum SHUT_RD = _Anonymous_0.SHUT_RD;
    enum SHUT_WR = _Anonymous_0.SHUT_WR;
    enum SHUT_RDWR = _Anonymous_0.SHUT_RDWR;
    int pselect(int, fd_set*, fd_set*, fd_set*, const(timespec)*, const(__sigset_t)*) @nogc nothrow;
    int select(int, fd_set*, fd_set*, fd_set*, timeval*) @nogc nothrow;
    alias fd_mask = c_long;
    struct fd_set
    {
        @DppOffsetSize(0,128) c_long[16] __fds_bits;
    }
    alias __fd_mask = c_long;
    alias suseconds_t = c_long;
    int strncasecmp_l(const(char)*, const(char)*, c_ulong, __locale_struct*) @nogc nothrow;
    int strcasecmp_l(const(char)*, const(char)*, __locale_struct*) @nogc nothrow;
    int strncasecmp(const(char)*, const(char)*, c_ulong) @nogc nothrow;
    int strcasecmp(const(char)*, const(char)*) @nogc nothrow;
    int ffsll(long) @nogc nothrow;
    int ffsl(c_long) @nogc nothrow;
    int ffs(int) @nogc nothrow;
    char* rindex(const(char)*, int) @nogc nothrow;
    char* index(const(char)*, int) @nogc nothrow;
    void bzero(void*, c_ulong) @nogc nothrow;
    void bcopy(const(void)*, void*, c_ulong) @nogc nothrow;
    int bcmp(const(void)*, const(void)*, c_ulong) @nogc nothrow;
    char* stpncpy(char*, const(char)*, c_ulong) @nogc nothrow;
    char* __stpncpy(char*, const(char)*, c_ulong) @nogc nothrow;
    char* stpcpy(char*, const(char)*) @nogc nothrow;
    char* __stpcpy(char*, const(char)*) @nogc nothrow;
    char* strsignal(int) @nogc nothrow;
    char* strsep(char**, const(char)*) @nogc nothrow;
    void explicit_bzero(void*, c_ulong) @nogc nothrow;
    char* strerror_l(int, __locale_struct*) @nogc nothrow;
    int strerror_r(int, char*, c_ulong) @nogc nothrow;
    char* strerror(int) @nogc nothrow;
    c_ulong strnlen(const(char)*, c_ulong) @nogc nothrow;
    c_ulong strlen(const(char)*) @nogc nothrow;
    char* strtok_r(char*, const(char)*, char**) @nogc nothrow;
    char* __strtok_r(char*, const(char)*, char**) @nogc nothrow;
    char* strtok(char*, const(char)*) @nogc nothrow;
    char* strstr(const(char)*, const(char)*) @nogc nothrow;
    char* strpbrk(const(char)*, const(char)*) @nogc nothrow;
    c_ulong strspn(const(char)*, const(char)*) @nogc nothrow;
    alias SYSSOCKET = int;
    alias UDPSOCKET = int;
    alias UDTSOCKET = int;
    enum UDT_UDTSTATUS
    {
        UDT_INIT = 1,
        UDT_OPENED = 2,
        UDT_LISTENING = 3,
        UDT_CONNECTING = 4,
        UDT_CONNECTED = 5,
        UDT_BROKEN = 6,
        UDT_CLOSING = 7,
        UDT_CLOSED = 8,
        UDT_NONEXIST = 9,
    }
    enum UDT_INIT = UDT_UDTSTATUS.UDT_INIT;
    enum UDT_OPENED = UDT_UDTSTATUS.UDT_OPENED;
    enum UDT_LISTENING = UDT_UDTSTATUS.UDT_LISTENING;
    enum UDT_CONNECTING = UDT_UDTSTATUS.UDT_CONNECTING;
    enum UDT_CONNECTED = UDT_UDTSTATUS.UDT_CONNECTED;
    enum UDT_BROKEN = UDT_UDTSTATUS.UDT_BROKEN;
    enum UDT_CLOSING = UDT_UDTSTATUS.UDT_CLOSING;
    enum UDT_CLOSED = UDT_UDTSTATUS.UDT_CLOSED;
    enum UDT_NONEXIST = UDT_UDTSTATUS.UDT_NONEXIST;
    enum UDT_UDTOpt
    {
        UDT_UDT_MSS = 0,
        UDT_UDT_SNDSYN = 1,
        UDT_UDT_RCVSYN = 2,
        UDT_UDT_CC = 3,
        UDT_UDT_FC = 4,
        UDT_UDT_SNDBUF = 5,
        UDT_UDT_RCVBUF = 6,
        UDT_UDT_LINGER = 7,
        UDT_UDP_SNDBUF = 8,
        UDT_UDP_RCVBUF = 9,
        UDT_UDT_MAXMSG = 10,
        UDT_UDT_MSGTTL = 11,
        UDT_UDT_RENDEZVOUS = 12,
        UDT_UDT_SNDTIMEO = 13,
        UDT_UDT_RCVTIMEO = 14,
        UDT_UDT_REUSEADDR = 15,
        UDT_UDT_MAXBW = 16,
        UDT_UDT_STATE = 17,
        UDT_UDT_EVENT = 18,
        UDT_UDT_SNDDATA = 19,
        UDT_UDT_RCVDATA = 20,
    }
    enum UDT_UDT_MSS = UDT_UDTOpt.UDT_UDT_MSS;
    enum UDT_UDT_SNDSYN = UDT_UDTOpt.UDT_UDT_SNDSYN;
    enum UDT_UDT_RCVSYN = UDT_UDTOpt.UDT_UDT_RCVSYN;
    enum UDT_UDT_CC = UDT_UDTOpt.UDT_UDT_CC;
    enum UDT_UDT_FC = UDT_UDTOpt.UDT_UDT_FC;
    enum UDT_UDT_SNDBUF = UDT_UDTOpt.UDT_UDT_SNDBUF;
    enum UDT_UDT_RCVBUF = UDT_UDTOpt.UDT_UDT_RCVBUF;
    enum UDT_UDT_LINGER = UDT_UDTOpt.UDT_UDT_LINGER;
    enum UDT_UDP_SNDBUF = UDT_UDTOpt.UDT_UDP_SNDBUF;
    enum UDT_UDP_RCVBUF = UDT_UDTOpt.UDT_UDP_RCVBUF;
    enum UDT_UDT_MAXMSG = UDT_UDTOpt.UDT_UDT_MAXMSG;
    enum UDT_UDT_MSGTTL = UDT_UDTOpt.UDT_UDT_MSGTTL;
    enum UDT_UDT_RENDEZVOUS = UDT_UDTOpt.UDT_UDT_RENDEZVOUS;
    enum UDT_UDT_SNDTIMEO = UDT_UDTOpt.UDT_UDT_SNDTIMEO;
    enum UDT_UDT_RCVTIMEO = UDT_UDTOpt.UDT_UDT_RCVTIMEO;
    enum UDT_UDT_REUSEADDR = UDT_UDTOpt.UDT_UDT_REUSEADDR;
    enum UDT_UDT_MAXBW = UDT_UDTOpt.UDT_UDT_MAXBW;
    enum UDT_UDT_STATE = UDT_UDTOpt.UDT_UDT_STATE;
    enum UDT_UDT_EVENT = UDT_UDTOpt.UDT_UDT_EVENT;
    enum UDT_UDT_SNDDATA = UDT_UDTOpt.UDT_UDT_SNDDATA;
    enum UDT_UDT_RCVDATA = UDT_UDTOpt.UDT_UDT_RCVDATA;
    enum UDT_ERRNO
    {
        UDT_SUCCESS = 0,
        UDT_ECONNSETUP = 1000,
        UDT_ENOSERVER = 1001,
        UDT_ECONNREJ = 1002,
        UDT_ESOCKFAIL = 1003,
        UDT_ESECFAIL = 1004,
        UDT_ECONNFAIL = 2000,
        UDT_ECONNLOST = 2001,
        UDT_ENOCONN = 2002,
        UDT_ERESOURCE = 3000,
        UDT_ETHREAD = 3001,
        UDT_ENOBUF = 3002,
        UDT_EFILE = 4000,
        UDT_EINVRDOFF = 4001,
        UDT_ERDPERM = 4002,
        UDT_EINVWROFF = 4003,
        UDT_EWRPERM = 4004,
        UDT_EINVOP = 5000,
        UDT_EBOUNDSOCK = 5001,
        UDT_ECONNSOCK = 5002,
        UDT_EINVPARAM = 5003,
        UDT_EINVSOCK = 5004,
        UDT_EUNBOUNDSOCK = 5005,
        UDT_ENOLISTEN = 5006,
        UDT_ERDVNOSERV = 5007,
        UDT_ERDVUNBOUND = 5008,
        UDT_ESTREAMILL = 5009,
        UDT_EDGRAMILL = 5010,
        UDT_EDUPLISTEN = 5011,
        UDT_ELARGEMSG = 5012,
        UDT_EINVPOLLID = 5013,
        UDT_EASYNCFAIL = 6000,
        UDT_EASYNCSND = 6001,
        UDT_EASYNCRCV = 6002,
        UDT_ETIMEOUT = 6003,
        UDT_EPEERERR = 7000,
        UDT_EUNKNOWN = -1,
    }
    enum UDT_SUCCESS = UDT_ERRNO.UDT_SUCCESS;
    enum UDT_ECONNSETUP = UDT_ERRNO.UDT_ECONNSETUP;
    enum UDT_ENOSERVER = UDT_ERRNO.UDT_ENOSERVER;
    enum UDT_ECONNREJ = UDT_ERRNO.UDT_ECONNREJ;
    enum UDT_ESOCKFAIL = UDT_ERRNO.UDT_ESOCKFAIL;
    enum UDT_ESECFAIL = UDT_ERRNO.UDT_ESECFAIL;
    enum UDT_ECONNFAIL = UDT_ERRNO.UDT_ECONNFAIL;
    enum UDT_ECONNLOST = UDT_ERRNO.UDT_ECONNLOST;
    enum UDT_ENOCONN = UDT_ERRNO.UDT_ENOCONN;
    enum UDT_ERESOURCE = UDT_ERRNO.UDT_ERESOURCE;
    enum UDT_ETHREAD = UDT_ERRNO.UDT_ETHREAD;
    enum UDT_ENOBUF = UDT_ERRNO.UDT_ENOBUF;
    enum UDT_EFILE = UDT_ERRNO.UDT_EFILE;
    enum UDT_EINVRDOFF = UDT_ERRNO.UDT_EINVRDOFF;
    enum UDT_ERDPERM = UDT_ERRNO.UDT_ERDPERM;
    enum UDT_EINVWROFF = UDT_ERRNO.UDT_EINVWROFF;
    enum UDT_EWRPERM = UDT_ERRNO.UDT_EWRPERM;
    enum UDT_EINVOP = UDT_ERRNO.UDT_EINVOP;
    enum UDT_EBOUNDSOCK = UDT_ERRNO.UDT_EBOUNDSOCK;
    enum UDT_ECONNSOCK = UDT_ERRNO.UDT_ECONNSOCK;
    enum UDT_EINVPARAM = UDT_ERRNO.UDT_EINVPARAM;
    enum UDT_EINVSOCK = UDT_ERRNO.UDT_EINVSOCK;
    enum UDT_EUNBOUNDSOCK = UDT_ERRNO.UDT_EUNBOUNDSOCK;
    enum UDT_ENOLISTEN = UDT_ERRNO.UDT_ENOLISTEN;
    enum UDT_ERDVNOSERV = UDT_ERRNO.UDT_ERDVNOSERV;
    enum UDT_ERDVUNBOUND = UDT_ERRNO.UDT_ERDVUNBOUND;
    enum UDT_ESTREAMILL = UDT_ERRNO.UDT_ESTREAMILL;
    enum UDT_EDGRAMILL = UDT_ERRNO.UDT_EDGRAMILL;
    enum UDT_EDUPLISTEN = UDT_ERRNO.UDT_EDUPLISTEN;
    enum UDT_ELARGEMSG = UDT_ERRNO.UDT_ELARGEMSG;
    enum UDT_EINVPOLLID = UDT_ERRNO.UDT_EINVPOLLID;
    enum UDT_EASYNCFAIL = UDT_ERRNO.UDT_EASYNCFAIL;
    enum UDT_EASYNCSND = UDT_ERRNO.UDT_EASYNCSND;
    enum UDT_EASYNCRCV = UDT_ERRNO.UDT_EASYNCRCV;
    enum UDT_ETIMEOUT = UDT_ERRNO.UDT_ETIMEOUT;
    enum UDT_EPEERERR = UDT_ERRNO.UDT_EPEERERR;
    enum UDT_EUNKNOWN = UDT_ERRNO.UDT_EUNKNOWN;
    alias UDT_TRACEINFO = UDT_CPerfMon_;
    struct UDT_CPerfMon_
    {
        @DppOffsetSize(0,8) c_long msTimeStamp;
        @DppOffsetSize(8,8) c_long pktSentTotal;
        @DppOffsetSize(16,8) c_long pktRecvTotal;
        @DppOffsetSize(24,4) int pktSndLossTotal;
        @DppOffsetSize(28,4) int pktRcvLossTotal;
        @DppOffsetSize(32,4) int pktRetransTotal;
        @DppOffsetSize(36,4) int pktSentACKTotal;
        @DppOffsetSize(40,4) int pktRecvACKTotal;
        @DppOffsetSize(44,4) int pktSentNAKTotal;
        @DppOffsetSize(48,4) int pktRecvNAKTotal;
        @DppOffsetSize(56,8) c_long usSndDurationTotal;
        @DppOffsetSize(64,8) c_long pktSent;
        @DppOffsetSize(72,8) c_long pktRecv;
        @DppOffsetSize(80,4) int pktSndLoss;
        @DppOffsetSize(84,4) int pktRcvLoss;
        @DppOffsetSize(88,4) int pktRetrans;
        @DppOffsetSize(92,4) int pktSentACK;
        @DppOffsetSize(96,4) int pktRecvACK;
        @DppOffsetSize(100,4) int pktSentNAK;
        @DppOffsetSize(104,4) int pktRecvNAK;
        @DppOffsetSize(112,8) double mbpsSendRate;
        @DppOffsetSize(120,8) double mbpsRecvRate;
        @DppOffsetSize(128,8) c_long usSndDuration;
        @DppOffsetSize(136,8) double usPktSndPeriod;
        @DppOffsetSize(144,4) int pktFlowWindow;
        @DppOffsetSize(148,4) int pktCongestionWindow;
        @DppOffsetSize(152,4) int pktFlightSize;
        @DppOffsetSize(160,8) double msRTT;
        @DppOffsetSize(168,8) double mbpsBandwidth;
        @DppOffsetSize(176,4) int byteAvailSndBuf;
        @DppOffsetSize(180,4) int byteAvailRcvBuf;
    }
    extern __gshared const(int) UDT_INVALID_SOCK;
    extern __gshared const(int) UDT_ERROR;
    int udt_startup() @nogc nothrow;
    int udt_cleanup() @nogc nothrow;
    int udt_socket(int, int, int) @nogc nothrow;
    int udt_bind(int, const(sockaddr)*, int) @nogc nothrow;
    int udt_bind2(int, int) @nogc nothrow;
    int udt_listen(int, int) @nogc nothrow;
    int udt_accept(int, sockaddr*, int*) @nogc nothrow;
    int udt_connect(int, const(sockaddr)*, int) @nogc nothrow;
    int udt_close(int) @nogc nothrow;
    int udt_getpeername(int, sockaddr*, int*) @nogc nothrow;
    int udt_getsockname(int, sockaddr*, int*) @nogc nothrow;
    int udt_getsockopt(int, int, int, void*, int*) @nogc nothrow;
    int udt_setsockopt(int, int, int, const(void)*, int) @nogc nothrow;
    int udt_send(int, const(char)*, int, int) @nogc nothrow;
    int udt_recv(int, char*, int, int) @nogc nothrow;
    int udt_sendmsg(int, const(char)*, int, int, int) @nogc nothrow;
    int udt_recvmsg(int, char*, int) @nogc nothrow;
    c_long udt_sendfile2(int, const(char)*, c_long*, c_long, int) @nogc nothrow;
    c_long udt_recvfile2(int, const(char)*, c_long*, c_long, int) @nogc nothrow;
    const(char)* udt_getlasterror_desc() @nogc nothrow;
    int udt_getlasterror_code() @nogc nothrow;
    void udt_clearlasterror() @nogc nothrow;
    int udt_perfmon(int, UDT_CPerfMon_*, int) @nogc nothrow;
    int udt_getsockstate(int) @nogc nothrow;
    enum UDT_EPOLLOpt
    {
        UDT_UDT_EPOLL_IN = 1,
        UDT_UDT_EPOLL_OUT = 4,
        UDT_UDT_EPOLL_ERR = 8,
    }
    enum UDT_UDT_EPOLL_IN = UDT_EPOLLOpt.UDT_UDT_EPOLL_IN;
    enum UDT_UDT_EPOLL_OUT = UDT_EPOLLOpt.UDT_UDT_EPOLL_OUT;
    enum UDT_UDT_EPOLL_ERR = UDT_EPOLLOpt.UDT_UDT_EPOLL_ERR;
    int udt_epoll_create() @nogc nothrow;
    int udt_epoll_add_usock(int, int, const(int)*) @nogc nothrow;
    int udt_epoll_add_ssock(int, int, const(int)*) @nogc nothrow;
    int udt_epoll_remove_usock(int, int) @nogc nothrow;
    int udt_epoll_remove_ssock(int, int) @nogc nothrow;
    int udt_epoll_wait2(int, int*, int*, int*, int*, c_long, int*, int*, int*, int*) @nogc nothrow;
    int udt_epoll_release(int) @nogc nothrow;
    uint inet_addr(const(char)*) @nogc nothrow;
    uint inet_lnaof(in_addr) @nogc nothrow;
    in_addr inet_makeaddr(uint, uint) @nogc nothrow;
    uint inet_netof(in_addr) @nogc nothrow;
    uint inet_network(const(char)*) @nogc nothrow;
    char* inet_ntoa(in_addr) @nogc nothrow;
    int inet_pton(int, const(char)*, void*) @nogc nothrow;
    const(char)* inet_ntop(int, const(void)*, char*, uint) @nogc nothrow;
    int inet_aton(const(char)*, in_addr*) @nogc nothrow;
    char* inet_neta(uint, char*, c_ulong) @nogc nothrow;
    char* inet_net_ntop(int, const(void)*, int, char*, c_ulong) @nogc nothrow;
    int inet_net_pton(int, const(char)*, void*, c_ulong) @nogc nothrow;
    uint inet_nsap_addr(const(char)*, ubyte*, int) @nogc nothrow;
    char* inet_nsap_ntoa(int, const(ubyte)*, char*) @nogc nothrow;
    c_ulong strcspn(const(char)*, const(char)*) @nogc nothrow;
    char* strrchr(const(char)*, int) @nogc nothrow;
    char* strchr(const(char)*, int) @nogc nothrow;
    char* strndup(const(char)*, c_ulong) @nogc nothrow;
    char* strdup(const(char)*) @nogc nothrow;
    c_ulong strxfrm_l(char*, const(char)*, c_ulong, __locale_struct*) @nogc nothrow;
    int strcoll_l(const(char)*, const(char)*, __locale_struct*) @nogc nothrow;
    c_ulong strxfrm(char*, const(char)*, c_ulong) @nogc nothrow;
    int strcoll(const(char)*, const(char)*) @nogc nothrow;
    int strncmp(const(char)*, const(char)*, c_ulong) @nogc nothrow;
    int strcmp(const(char)*, const(char)*) @nogc nothrow;
    char* strncat(char*, const(char)*, c_ulong) @nogc nothrow;
    char* strcat(char*, const(char)*) @nogc nothrow;
    char* strncpy(char*, const(char)*, c_ulong) @nogc nothrow;
    char* strcpy(char*, const(char)*) @nogc nothrow;
    void* memchr(const(void)*, int, c_ulong) @nogc nothrow;
    int memcmp(const(void)*, const(void)*, c_ulong) @nogc nothrow;
    void* memset(void*, int, c_ulong) @nogc nothrow;
    void* memccpy(void*, const(void)*, int, c_ulong) @nogc nothrow;
    void* memmove(void*, const(void)*, c_ulong) @nogc nothrow;
    void* memcpy(void*, const(void)*, c_ulong) @nogc nothrow;
    int bindresvport6(int, sockaddr_in6*) @nogc nothrow;
    int bindresvport(int, sockaddr_in*) @nogc nothrow;
    ushort htons(ushort) @nogc nothrow;
    uint htonl(uint) @nogc nothrow;
    ushort ntohs(ushort) @nogc nothrow;
    uint ntohl(uint) @nogc nothrow;
    struct group_filter
    {
        @DppOffsetSize(0,4) uint gf_interface;
        @DppOffsetSize(8,128) sockaddr_storage gf_group;
        @DppOffsetSize(136,4) uint gf_fmode;
        @DppOffsetSize(140,4) uint gf_numsrc;
        @DppOffsetSize(144,128) sockaddr_storage[1] gf_slist;
    }
    struct ip_msfilter
    {
        @DppOffsetSize(0,4) in_addr imsf_multiaddr;
        @DppOffsetSize(4,4) in_addr imsf_interface;
        @DppOffsetSize(8,4) uint imsf_fmode;
        @DppOffsetSize(12,4) uint imsf_numsrc;
        @DppOffsetSize(16,4) in_addr[1] imsf_slist;
    }
    struct group_source_req
    {
        @DppOffsetSize(0,4) uint gsr_interface;
        @DppOffsetSize(8,128) sockaddr_storage gsr_group;
        @DppOffsetSize(136,128) sockaddr_storage gsr_source;
    }
    struct group_req
    {
        @DppOffsetSize(0,4) uint gr_interface;
        @DppOffsetSize(8,128) sockaddr_storage gr_group;
    }
    struct ipv6_mreq
    {
        @DppOffsetSize(0,16) in6_addr ipv6mr_multiaddr;
        @DppOffsetSize(16,4) uint ipv6mr_interface;
    }
    struct ip_mreq_source
    {
        @DppOffsetSize(0,4) in_addr imr_multiaddr;
        @DppOffsetSize(4,4) in_addr imr_interface;
        @DppOffsetSize(8,4) in_addr imr_sourceaddr;
    }
    struct ip_mreq
    {
        @DppOffsetSize(0,4) in_addr imr_multiaddr;
        @DppOffsetSize(4,4) in_addr imr_interface;
    }
    struct sockaddr_in6
    {
        @DppOffsetSize(0,2) ushort sin6_family;
        @DppOffsetSize(2,2) ushort sin6_port;
        @DppOffsetSize(4,4) uint sin6_flowinfo;
        @DppOffsetSize(8,16) in6_addr sin6_addr;
        @DppOffsetSize(24,4) uint sin6_scope_id;
    }
    struct sockaddr_in
    {
        @DppOffsetSize(0,2) ushort sin_family;
        @DppOffsetSize(2,2) ushort sin_port;
        @DppOffsetSize(4,4) in_addr sin_addr;
        @DppOffsetSize(8,8) ubyte[8] sin_zero;
    }
    extern __gshared const(in6_addr) in6addr_loopback;
    extern __gshared const(in6_addr) in6addr_any;
    struct in6_addr
    {
        static union _Anonymous_1
        {
            @DppOffsetSize(0,16) ubyte[16] __u6_addr8;
            @DppOffsetSize(0,16) ushort[8] __u6_addr16;
            @DppOffsetSize(0,16) uint[4] __u6_addr32;
        }
        @DppOffsetSize(0,16) _Anonymous_1 __in6_u;
    }
    enum _Anonymous_2
    {
        IPPORT_ECHO = 7,
        IPPORT_DISCARD = 9,
        IPPORT_SYSTAT = 11,
        IPPORT_DAYTIME = 13,
        IPPORT_NETSTAT = 15,
        IPPORT_FTP = 21,
        IPPORT_TELNET = 23,
        IPPORT_SMTP = 25,
        IPPORT_TIMESERVER = 37,
        IPPORT_NAMESERVER = 42,
        IPPORT_WHOIS = 43,
        IPPORT_MTP = 57,
        IPPORT_TFTP = 69,
        IPPORT_RJE = 77,
        IPPORT_FINGER = 79,
        IPPORT_TTYLINK = 87,
        IPPORT_SUPDUP = 95,
        IPPORT_EXECSERVER = 512,
        IPPORT_LOGINSERVER = 513,
        IPPORT_CMDSERVER = 514,
        IPPORT_EFSSERVER = 520,
        IPPORT_BIFFUDP = 512,
        IPPORT_WHOSERVER = 513,
        IPPORT_ROUTESERVER = 520,
        IPPORT_RESERVED = 1024,
        IPPORT_USERRESERVED = 5000,
    }
    enum IPPORT_ECHO = _Anonymous_2.IPPORT_ECHO;
    enum IPPORT_DISCARD = _Anonymous_2.IPPORT_DISCARD;
    enum IPPORT_SYSTAT = _Anonymous_2.IPPORT_SYSTAT;
    enum IPPORT_DAYTIME = _Anonymous_2.IPPORT_DAYTIME;
    enum IPPORT_NETSTAT = _Anonymous_2.IPPORT_NETSTAT;
    enum IPPORT_FTP = _Anonymous_2.IPPORT_FTP;
    enum IPPORT_TELNET = _Anonymous_2.IPPORT_TELNET;
    enum IPPORT_SMTP = _Anonymous_2.IPPORT_SMTP;
    enum IPPORT_TIMESERVER = _Anonymous_2.IPPORT_TIMESERVER;
    enum IPPORT_NAMESERVER = _Anonymous_2.IPPORT_NAMESERVER;
    enum IPPORT_WHOIS = _Anonymous_2.IPPORT_WHOIS;
    enum IPPORT_MTP = _Anonymous_2.IPPORT_MTP;
    enum IPPORT_TFTP = _Anonymous_2.IPPORT_TFTP;
    enum IPPORT_RJE = _Anonymous_2.IPPORT_RJE;
    enum IPPORT_FINGER = _Anonymous_2.IPPORT_FINGER;
    enum IPPORT_TTYLINK = _Anonymous_2.IPPORT_TTYLINK;
    enum IPPORT_SUPDUP = _Anonymous_2.IPPORT_SUPDUP;
    enum IPPORT_EXECSERVER = _Anonymous_2.IPPORT_EXECSERVER;
    enum IPPORT_LOGINSERVER = _Anonymous_2.IPPORT_LOGINSERVER;
    enum IPPORT_CMDSERVER = _Anonymous_2.IPPORT_CMDSERVER;
    enum IPPORT_EFSSERVER = _Anonymous_2.IPPORT_EFSSERVER;
    enum IPPORT_BIFFUDP = _Anonymous_2.IPPORT_BIFFUDP;
    enum IPPORT_WHOSERVER = _Anonymous_2.IPPORT_WHOSERVER;
    enum IPPORT_ROUTESERVER = _Anonymous_2.IPPORT_ROUTESERVER;
    enum IPPORT_RESERVED = _Anonymous_2.IPPORT_RESERVED;
    enum IPPORT_USERRESERVED = _Anonymous_2.IPPORT_USERRESERVED;
    alias in_port_t = ushort;
    enum _Anonymous_3
    {
        IPPROTO_HOPOPTS = 0,
        IPPROTO_ROUTING = 43,
        IPPROTO_FRAGMENT = 44,
        IPPROTO_ICMPV6 = 58,
        IPPROTO_NONE = 59,
        IPPROTO_DSTOPTS = 60,
        IPPROTO_MH = 135,
    }
    enum IPPROTO_HOPOPTS = _Anonymous_3.IPPROTO_HOPOPTS;
    enum IPPROTO_ROUTING = _Anonymous_3.IPPROTO_ROUTING;
    enum IPPROTO_FRAGMENT = _Anonymous_3.IPPROTO_FRAGMENT;
    enum IPPROTO_ICMPV6 = _Anonymous_3.IPPROTO_ICMPV6;
    enum IPPROTO_NONE = _Anonymous_3.IPPROTO_NONE;
    enum IPPROTO_DSTOPTS = _Anonymous_3.IPPROTO_DSTOPTS;
    enum IPPROTO_MH = _Anonymous_3.IPPROTO_MH;
    enum _Anonymous_4
    {
        IPPROTO_IP = 0,
        IPPROTO_ICMP = 1,
        IPPROTO_IGMP = 2,
        IPPROTO_IPIP = 4,
        IPPROTO_TCP = 6,
        IPPROTO_EGP = 8,
        IPPROTO_PUP = 12,
        IPPROTO_UDP = 17,
        IPPROTO_IDP = 22,
        IPPROTO_TP = 29,
        IPPROTO_DCCP = 33,
        IPPROTO_IPV6 = 41,
        IPPROTO_RSVP = 46,
        IPPROTO_GRE = 47,
        IPPROTO_ESP = 50,
        IPPROTO_AH = 51,
        IPPROTO_MTP = 92,
        IPPROTO_BEETPH = 94,
        IPPROTO_ENCAP = 98,
        IPPROTO_PIM = 103,
        IPPROTO_COMP = 108,
        IPPROTO_SCTP = 132,
        IPPROTO_UDPLITE = 136,
        IPPROTO_MPLS = 137,
        IPPROTO_RAW = 255,
        IPPROTO_MAX = 256,
    }
    enum IPPROTO_IP = _Anonymous_4.IPPROTO_IP;
    enum IPPROTO_ICMP = _Anonymous_4.IPPROTO_ICMP;
    enum IPPROTO_IGMP = _Anonymous_4.IPPROTO_IGMP;
    enum IPPROTO_IPIP = _Anonymous_4.IPPROTO_IPIP;
    enum IPPROTO_TCP = _Anonymous_4.IPPROTO_TCP;
    enum IPPROTO_EGP = _Anonymous_4.IPPROTO_EGP;
    enum IPPROTO_PUP = _Anonymous_4.IPPROTO_PUP;
    enum IPPROTO_UDP = _Anonymous_4.IPPROTO_UDP;
    enum IPPROTO_IDP = _Anonymous_4.IPPROTO_IDP;
    enum IPPROTO_TP = _Anonymous_4.IPPROTO_TP;
    enum IPPROTO_DCCP = _Anonymous_4.IPPROTO_DCCP;
    enum IPPROTO_IPV6 = _Anonymous_4.IPPROTO_IPV6;
    enum IPPROTO_RSVP = _Anonymous_4.IPPROTO_RSVP;
    enum IPPROTO_GRE = _Anonymous_4.IPPROTO_GRE;
    enum IPPROTO_ESP = _Anonymous_4.IPPROTO_ESP;
    enum IPPROTO_AH = _Anonymous_4.IPPROTO_AH;
    enum IPPROTO_MTP = _Anonymous_4.IPPROTO_MTP;
    enum IPPROTO_BEETPH = _Anonymous_4.IPPROTO_BEETPH;
    enum IPPROTO_ENCAP = _Anonymous_4.IPPROTO_ENCAP;
    enum IPPROTO_PIM = _Anonymous_4.IPPROTO_PIM;
    enum IPPROTO_COMP = _Anonymous_4.IPPROTO_COMP;
    enum IPPROTO_SCTP = _Anonymous_4.IPPROTO_SCTP;
    enum IPPROTO_UDPLITE = _Anonymous_4.IPPROTO_UDPLITE;
    enum IPPROTO_MPLS = _Anonymous_4.IPPROTO_MPLS;
    enum IPPROTO_RAW = _Anonymous_4.IPPROTO_RAW;
    enum IPPROTO_MAX = _Anonymous_4.IPPROTO_MAX;
    struct in_addr
    {
        @DppOffsetSize(0,4) uint s_addr;
    }
    alias in_addr_t = uint;
    struct ip_opts
    {
        @DppOffsetSize(0,4) in_addr ip_dst;
        @DppOffsetSize(4,40) char[40] ip_opts_;
    }
    struct ip_mreqn
    {
        @DppOffsetSize(0,4) in_addr imr_multiaddr;
        @DppOffsetSize(4,4) in_addr imr_address;
        @DppOffsetSize(8,4) int imr_ifindex;
    }
    struct in_pktinfo
    {
        @DppOffsetSize(0,4) int ipi_ifindex;
        @DppOffsetSize(4,4) in_addr ipi_spec_dst;
        @DppOffsetSize(8,4) in_addr ipi_addr;
    }
    alias timer_t = void*;
    alias time_t = c_long;
    struct timeval
    {
        @DppOffsetSize(0,8) c_long tv_sec;
        @DppOffsetSize(8,8) c_long tv_usec;
    }
    struct timespec
    {
        @DppOffsetSize(0,8) c_long tv_sec;
        @DppOffsetSize(8,8) c_long tv_nsec;
    }
    struct osockaddr
    {
        @DppOffsetSize(0,2) ushort sa_family;
        @DppOffsetSize(2,14) ubyte[14] sa_data;
    }
    struct iovec
    {
        @DppOffsetSize(0,8) void* iov_base;
        @DppOffsetSize(8,8) c_ulong iov_len;
    }
    alias sigset_t = __sigset_t;
    alias locale_t = __locale_struct*;
    alias clockid_t = int;
    alias clock_t = c_long;
    struct __sigset_t
    {
        @DppOffsetSize(0,128) c_ulong[16] __val;
    }
    alias __locale_t = __locale_struct*;
    struct __locale_struct
    {
        @DppOffsetSize(0,104) __locale_data*[13] __locales;
        @DppOffsetSize(104,8) const(ushort)* __ctype_b;
        @DppOffsetSize(112,8) const(int)* __ctype_tolower;
        @DppOffsetSize(120,8) const(int)* __ctype_toupper;
        @DppOffsetSize(128,104) const(char)*[13] __names;
    }
    alias __sig_atomic_t = int;
    alias __socklen_t = uint;
    alias __intptr_t = c_long;
    alias __caddr_t = char*;
    alias __loff_t = c_long;
    struct __pthread_rwlock_arch_t
    {
        @DppOffsetSize(0,4) uint __readers;
        @DppOffsetSize(4,4) uint __writers;
        @DppOffsetSize(8,4) uint __wrphase_futex;
        @DppOffsetSize(12,4) uint __writers_futex;
        @DppOffsetSize(16,4) uint __pad3;
        @DppOffsetSize(20,4) uint __pad4;
        @DppOffsetSize(24,4) int __cur_writer;
        @DppOffsetSize(28,4) int __shared;
        @DppOffsetSize(32,1) byte __rwelision;
        @DppOffsetSize(33,7) ubyte[7] __pad1;
        @DppOffsetSize(40,8) c_ulong __pad2;
        @DppOffsetSize(48,4) uint __flags;
    }
    alias __syscall_ulong_t = c_ulong;
    alias pthread_t = c_ulong;
    union pthread_mutexattr_t
    {
        @DppOffsetSize(0,4) char[4] __size;
        @DppOffsetSize(0,4) int __align;
    }
    union pthread_condattr_t
    {
        @DppOffsetSize(0,4) char[4] __size;
        @DppOffsetSize(0,4) int __align;
    }
    alias pthread_key_t = uint;
    alias pthread_once_t = int;
    union pthread_attr_t
    {
        @DppOffsetSize(0,56) char[56] __size;
        @DppOffsetSize(0,8) c_long __align;
    }
    alias __syscall_slong_t = c_long;
    union pthread_mutex_t
    {
        @DppOffsetSize(0,40) __pthread_mutex_s __data;
        @DppOffsetSize(0,40) char[40] __size;
        @DppOffsetSize(0,8) c_long __align;
    }
    union pthread_cond_t
    {
        @DppOffsetSize(0,48) __pthread_cond_s __data;
        @DppOffsetSize(0,48) char[48] __size;
        @DppOffsetSize(0,8) long __align;
    }
    union pthread_rwlock_t
    {
        @DppOffsetSize(0,56) __pthread_rwlock_arch_t __data;
        @DppOffsetSize(0,56) char[56] __size;
        @DppOffsetSize(0,8) c_long __align;
    }
    union pthread_rwlockattr_t
    {
        @DppOffsetSize(0,8) char[8] __size;
        @DppOffsetSize(0,8) c_long __align;
    }
    alias pthread_spinlock_t = int;
    union pthread_barrier_t
    {
        @DppOffsetSize(0,32) char[32] __size;
        @DppOffsetSize(0,8) c_long __align;
    }
    union pthread_barrierattr_t
    {
        @DppOffsetSize(0,4) char[4] __size;
        @DppOffsetSize(0,4) int __align;
    }
    alias __ssize_t = c_long;
    alias __fsword_t = c_long;
    alias sa_family_t = ushort;
    alias __fsfilcnt64_t = c_ulong;
    alias socklen_t = uint;
    alias __fsfilcnt_t = c_ulong;
    alias __fsblkcnt64_t = c_ulong;
    alias __fsblkcnt_t = c_ulong;
    alias __blkcnt64_t = c_long;
    alias __blkcnt_t = c_long;
    alias __blksize_t = c_long;
    alias __timer_t = void*;
    alias __clockid_t = int;
    alias __key_t = int;
    alias __daddr_t = int;
    alias __suseconds_t = c_long;
    alias __useconds_t = uint;
    alias __time_t = c_long;
    alias __id_t = uint;
    alias __rlim64_t = c_ulong;
    alias __rlim_t = c_ulong;
    alias __clock_t = c_long;
    struct __fsid_t
    {
        @DppOffsetSize(0,8) int[2] __val;
    }
    alias __pid_t = int;
    alias __off64_t = c_long;
    alias __off_t = c_long;
    alias __nlink_t = c_ulong;
    alias __mode_t = uint;
    alias __ino64_t = c_ulong;
    alias __ino_t = c_ulong;
    alias __gid_t = uint;
    alias __uid_t = uint;
    alias __dev_t = c_ulong;
    alias __uintmax_t = c_ulong;
    alias __intmax_t = c_long;
    alias __u_quad_t = c_ulong;
    alias __quad_t = c_long;
    alias __uint_least64_t = c_ulong;
    alias __int_least64_t = c_long;
    alias __uint_least32_t = uint;
    alias __int_least32_t = int;
    alias __uint_least16_t = ushort;
    alias __int_least16_t = short;
    alias __uint_least8_t = ubyte;
    alias __int_least8_t = byte;
    alias __uint64_t = c_ulong;
    alias __int64_t = c_long;
    alias __uint32_t = uint;
    alias __int32_t = int;
    alias __uint16_t = ushort;
    alias __int16_t = short;
    alias __uint8_t = ubyte;
    alias __int8_t = byte;
    alias __u_long = c_ulong;
    alias __u_int = uint;
    alias __u_short = ushort;
    alias __u_char = ubyte;
    struct __pthread_cond_s
    {
        static union _Anonymous_5
        {
            @DppOffsetSize(0,8) ulong __wseq;
            static struct _Anonymous_6
            {
                @DppOffsetSize(0,4) uint __low;
                @DppOffsetSize(4,4) uint __high;
            }
            @DppOffsetSize(0,8) _Anonymous_6 __wseq32;
        }
        _Anonymous_5 _anonymous_7;
        auto __wseq() @property @nogc pure nothrow { return _anonymous_7.__wseq; }
        void __wseq(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_7.__wseq = val; }
        auto __wseq32() @property @nogc pure nothrow { return _anonymous_7.__wseq32; }
        void __wseq32(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_7.__wseq32 = val; }
        static union _Anonymous_8
        {
            @DppOffsetSize(0,8) ulong __g1_start;
            static struct _Anonymous_9
            {
                @DppOffsetSize(0,4) uint __low;
                @DppOffsetSize(4,4) uint __high;
            }
            @DppOffsetSize(0,8) _Anonymous_9 __g1_start32;
        }
        _Anonymous_8 _anonymous_10;
        auto __g1_start() @property @nogc pure nothrow { return _anonymous_10.__g1_start; }
        void __g1_start(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_10.__g1_start = val; }
        auto __g1_start32() @property @nogc pure nothrow { return _anonymous_10.__g1_start32; }
        void __g1_start32(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_10.__g1_start32 = val; }
        @DppOffsetSize(16,8) uint[2] __g_refs;
        @DppOffsetSize(24,8) uint[2] __g_size;
        @DppOffsetSize(32,4) uint __g1_orig_size;
        @DppOffsetSize(36,4) uint __wrefs;
        @DppOffsetSize(40,8) uint[2] __g_signals;
    }
    struct sockaddr
    {
        @DppOffsetSize(0,2) ushort sa_family;
        @DppOffsetSize(2,14) char[14] sa_data;
    }
    struct sockaddr_storage
    {
        @DppOffsetSize(0,2) ushort ss_family;
        @DppOffsetSize(2,118) char[118] __ss_padding;
        @DppOffsetSize(120,8) c_ulong __ss_align;
    }
    enum _Anonymous_11
    {
        MSG_OOB = 1,
        MSG_PEEK = 2,
        MSG_DONTROUTE = 4,
        MSG_CTRUNC = 8,
        MSG_PROXY = 16,
        MSG_TRUNC = 32,
        MSG_DONTWAIT = 64,
        MSG_EOR = 128,
        MSG_WAITALL = 256,
        MSG_FIN = 512,
        MSG_SYN = 1024,
        MSG_CONFIRM = 2048,
        MSG_RST = 4096,
        MSG_ERRQUEUE = 8192,
        MSG_NOSIGNAL = 16384,
        MSG_MORE = 32768,
        MSG_WAITFORONE = 65536,
        MSG_BATCH = 262144,
        MSG_ZEROCOPY = 67108864,
        MSG_FASTOPEN = 536870912,
        MSG_CMSG_CLOEXEC = 1073741824,
    }
    enum MSG_OOB = _Anonymous_11.MSG_OOB;
    enum MSG_PEEK = _Anonymous_11.MSG_PEEK;
    enum MSG_DONTROUTE = _Anonymous_11.MSG_DONTROUTE;
    enum MSG_CTRUNC = _Anonymous_11.MSG_CTRUNC;
    enum MSG_PROXY = _Anonymous_11.MSG_PROXY;
    enum MSG_TRUNC = _Anonymous_11.MSG_TRUNC;
    enum MSG_DONTWAIT = _Anonymous_11.MSG_DONTWAIT;
    enum MSG_EOR = _Anonymous_11.MSG_EOR;
    enum MSG_WAITALL = _Anonymous_11.MSG_WAITALL;
    enum MSG_FIN = _Anonymous_11.MSG_FIN;
    enum MSG_SYN = _Anonymous_11.MSG_SYN;
    enum MSG_CONFIRM = _Anonymous_11.MSG_CONFIRM;
    enum MSG_RST = _Anonymous_11.MSG_RST;
    enum MSG_ERRQUEUE = _Anonymous_11.MSG_ERRQUEUE;
    enum MSG_NOSIGNAL = _Anonymous_11.MSG_NOSIGNAL;
    enum MSG_MORE = _Anonymous_11.MSG_MORE;
    enum MSG_WAITFORONE = _Anonymous_11.MSG_WAITFORONE;
    enum MSG_BATCH = _Anonymous_11.MSG_BATCH;
    enum MSG_ZEROCOPY = _Anonymous_11.MSG_ZEROCOPY;
    enum MSG_FASTOPEN = _Anonymous_11.MSG_FASTOPEN;
    enum MSG_CMSG_CLOEXEC = _Anonymous_11.MSG_CMSG_CLOEXEC;
    struct __pthread_mutex_s
    {
        @DppOffsetSize(0,4) int __lock;
        @DppOffsetSize(4,4) uint __count;
        @DppOffsetSize(8,4) int __owner;
        @DppOffsetSize(12,4) uint __nusers;
        @DppOffsetSize(16,4) int __kind;
        @DppOffsetSize(20,2) short __spins;
        @DppOffsetSize(22,2) short __elision;
        @DppOffsetSize(24,16) __pthread_internal_list __list;
    }
    struct __pthread_internal_list
    {
        @DppOffsetSize(0,8) __pthread_internal_list* __prev;
        @DppOffsetSize(8,8) __pthread_internal_list* __next;
    }
    alias __pthread_list_t = __pthread_internal_list;
    alias uint64_t = ulong;
    alias uint32_t = uint;
    alias uint16_t = ushort;
    alias uint8_t = ubyte;
    alias int64_t = c_long;
    alias int32_t = int;
    alias int16_t = short;
    alias int8_t = byte;
    struct msghdr
    {
        @DppOffsetSize(0,8) void* msg_name;
        @DppOffsetSize(8,4) uint msg_namelen;
        @DppOffsetSize(16,8) iovec* msg_iov;
        @DppOffsetSize(24,8) c_ulong msg_iovlen;
        @DppOffsetSize(32,8) void* msg_control;
        @DppOffsetSize(40,8) c_ulong msg_controllen;
        @DppOffsetSize(48,4) int msg_flags;
    }
    struct cmsghdr
    {
        @DppOffsetSize(0,8) c_ulong cmsg_len;
        @DppOffsetSize(0,4) int cmsg_level;
        @DppOffsetSize(0,4) int cmsg_type;
        @DppOffsetSize(0,-2) ubyte[0] __cmsg_data;
    }
    enum __socket_type
    {
        SOCK_STREAM = 1,
        SOCK_DGRAM = 2,
        SOCK_RAW = 3,
        SOCK_RDM = 4,
        SOCK_SEQPACKET = 5,
        SOCK_DCCP = 6,
        SOCK_PACKET = 10,
        SOCK_CLOEXEC = 524288,
        SOCK_NONBLOCK = 2048,
    }
    enum SOCK_STREAM = __socket_type.SOCK_STREAM;
    enum SOCK_DGRAM = __socket_type.SOCK_DGRAM;
    enum SOCK_RAW = __socket_type.SOCK_RAW;
    enum SOCK_RDM = __socket_type.SOCK_RDM;
    enum SOCK_SEQPACKET = __socket_type.SOCK_SEQPACKET;
    enum SOCK_DCCP = __socket_type.SOCK_DCCP;
    enum SOCK_PACKET = __socket_type.SOCK_PACKET;
    enum SOCK_CLOEXEC = __socket_type.SOCK_CLOEXEC;
    enum SOCK_NONBLOCK = __socket_type.SOCK_NONBLOCK;
    struct linger
    {
        @DppOffsetSize(0,4) int l_onoff;
        @DppOffsetSize(4,4) int l_linger;
    }
    cmsghdr* __cmsg_nxthdr(msghdr*, cmsghdr*) @nogc nothrow;
    enum _Anonymous_12
    {
        SCM_RIGHTS = 1,
    }
    enum SCM_RIGHTS = _Anonymous_12.SCM_RIGHTS;
    enum DPP_ENUM__BITS_STDINT_INTN_H = 1;
    enum DPP_ENUM__BITS_STDINT_UINTN_H = 1;
    enum DPP_ENUM__THREAD_SHARED_TYPES_H = 1;
    enum DPP_ENUM___PTHREAD_MUTEX_HAVE_PREV = 1;


    enum DPP_ENUM_SOMAXCONN = 128;


    enum DPP_ENUM_SOL_XDP = 283;


    enum DPP_ENUM_SOL_TLS = 282;


    enum DPP_ENUM_SOL_KCM = 281;


    enum DPP_ENUM__BITS_TIME64_H = 1;


    enum DPP_ENUM_SOL_NFC = 280;




    enum DPP_ENUM_SOL_ALG = 279;




    enum DPP_ENUM__BITS_TYPES_H = 1;


    enum DPP_ENUM_SOL_CAIF = 278;


    enum DPP_ENUM_SOL_IUCV = 277;


    enum DPP_ENUM_SOL_RDS = 276;


    enum DPP_ENUM_SOL_PNPIPE = 275;


    enum DPP_ENUM_SOL_BLUETOOTH = 274;


    enum DPP_ENUM_SOL_PPPOL2TP = 273;


    enum DPP_ENUM_SOL_RXRPC = 272;


    enum DPP_ENUM_SOL_TIPC = 271;


    enum DPP_ENUM_SOL_NETLINK = 270;


    enum DPP_ENUM_SOL_DCCP = 269;


    enum DPP_ENUM_SOL_LLC = 268;


    enum DPP_ENUM_SOL_NETBEUI = 267;


    enum DPP_ENUM_SOL_IRDA = 266;


    enum DPP_ENUM_SOL_AAL = 265;


    enum DPP_ENUM_SOL_ATM = 264;


    enum DPP_ENUM_SOL_PACKET = 263;


    enum DPP_ENUM_SOL_X25 = 262;


    enum DPP_ENUM_SOL_DECNET = 261;


    enum DPP_ENUM_SOL_RAW = 255;
    enum DPP_ENUM_PF_MAX = 45;


    enum DPP_ENUM_PF_XDP = 44;


    enum DPP_ENUM_PF_SMC = 43;


    enum DPP_ENUM_PF_QIPCRTR = 42;


    enum DPP_ENUM_PF_KCM = 41;


    enum DPP_ENUM_PF_VSOCK = 40;


    enum DPP_ENUM_PF_NFC = 39;


    enum DPP_ENUM_PF_ALG = 38;


    enum DPP_ENUM_PF_CAIF = 37;


    enum DPP_ENUM_PF_IEEE802154 = 36;


    enum DPP_ENUM_PF_PHONET = 35;


    enum DPP_ENUM_PF_ISDN = 34;


    enum DPP_ENUM_PF_RXRPC = 33;


    enum DPP_ENUM_PF_IUCV = 32;


    enum DPP_ENUM_PF_BLUETOOTH = 31;


    enum DPP_ENUM_PF_TIPC = 30;


    enum DPP_ENUM_PF_CAN = 29;


    enum DPP_ENUM_PF_MPLS = 28;


    enum DPP_ENUM_PF_IB = 27;


    enum DPP_ENUM_PF_LLC = 26;


    enum DPP_ENUM_PF_WANPIPE = 25;


    enum DPP_ENUM_PF_PPPOX = 24;


    enum DPP_ENUM_PF_IRDA = 23;


    enum DPP_ENUM_PF_SNA = 22;


    enum DPP_ENUM_PF_RDS = 21;


    enum DPP_ENUM_PF_ATMSVC = 20;


    enum DPP_ENUM_PF_ECONET = 19;


    enum DPP_ENUM_PF_ASH = 18;


    enum DPP_ENUM_PF_PACKET = 17;




    enum DPP_ENUM_PF_NETLINK = 16;


    enum DPP_ENUM_PF_KEY = 15;


    enum DPP_ENUM_PF_SECURITY = 14;


    enum DPP_ENUM_PF_NETBEUI = 13;


    enum DPP_ENUM_PF_DECnet = 12;


    enum DPP_ENUM_PF_ROSE = 11;


    enum DPP_ENUM_PF_INET6 = 10;


    enum DPP_ENUM_PF_X25 = 9;


    enum DPP_ENUM_PF_ATMPVC = 8;


    enum DPP_ENUM_PF_BRIDGE = 7;


    enum DPP_ENUM_PF_NETROM = 6;


    enum DPP_ENUM_PF_APPLETALK = 5;


    enum DPP_ENUM_PF_IPX = 4;


    enum DPP_ENUM_PF_AX25 = 3;


    enum DPP_ENUM_PF_INET = 2;






    enum DPP_ENUM_PF_LOCAL = 1;


    enum DPP_ENUM_PF_UNSPEC = 0;
    enum DPP_ENUM__SS_SIZE = 128;







    enum DPP_ENUM__BITS_SOCKADDR_H = 1;
    enum DPP_ENUM___have_pthread_attr_t = 1;


    enum DPP_ENUM__BITS_PTHREADTYPES_COMMON_H = 1;


    enum DPP_ENUM___PTHREAD_RWLOCK_INT_FLAGS_SHARED = 1;
    enum DPP_ENUM___PTHREAD_MUTEX_USE_UNION = 0;


    enum DPP_ENUM___PTHREAD_MUTEX_NUSERS_AFTER_KIND = 0;


    enum DPP_ENUM___PTHREAD_MUTEX_LOCK_ELISION = 1;






    enum DPP_ENUM___SIZEOF_PTHREAD_BARRIERATTR_T = 4;


    enum DPP_ENUM___SIZEOF_PTHREAD_RWLOCKATTR_T = 8;


    enum DPP_ENUM___SIZEOF_PTHREAD_CONDATTR_T = 4;


    enum DPP_ENUM___SIZEOF_PTHREAD_COND_T = 48;




    enum DPP_ENUM__BITS_TYPES___LOCALE_T_H = 1;


    enum DPP_ENUM___SIZEOF_PTHREAD_MUTEXATTR_T = 4;


    enum DPP_ENUM___SIZEOF_PTHREAD_BARRIER_T = 32;






    enum DPP_ENUM___SIZEOF_PTHREAD_RWLOCK_T = 56;


    enum DPP_ENUM___SIZEOF_PTHREAD_MUTEX_T = 40;


    enum DPP_ENUM___SIZEOF_PTHREAD_ATTR_T = 56;


    enum DPP_ENUM___clock_t_defined = 1;


    enum DPP_ENUM__BITS_PTHREADTYPES_ARCH_H = 1;


    enum DPP_ENUM___clockid_t_defined = 1;


    enum DPP_ENUM___GLIBC_USE_IEC_60559_TYPES_EXT = 0;


    enum DPP_ENUM___GLIBC_USE_IEC_60559_FUNCS_EXT = 0;


    enum DPP_ENUM__BITS_TYPES_LOCALE_T_H = 1;


    enum DPP_ENUM___GLIBC_USE_IEC_60559_BFP_EXT = 0;


    enum DPP_ENUM___GLIBC_USE_LIB_EXT2 = 0;


    enum DPP_ENUM___sigset_t_defined = 1;


    enum DPP_ENUM_IPV6_RTHDR_TYPE_0 = 0;


    enum DPP_ENUM_IPV6_RTHDR_STRICT = 1;


    enum DPP_ENUM___iovec_defined = 1;


    enum DPP_ENUM_IPV6_RTHDR_LOOSE = 0;


    enum DPP_ENUM_SOL_ICMPV6 = 58;


    enum DPP_ENUM___osockaddr_defined = 1;


    enum DPP_ENUM_SOL_IPV6 = 41;


    enum DPP_ENUM__STRUCT_TIMESPEC = 1;


    enum DPP_ENUM_IPV6_PMTUDISC_OMIT = 5;


    enum DPP_ENUM_IPV6_PMTUDISC_INTERFACE = 4;


    enum DPP_ENUM___timeval_defined = 1;


    enum DPP_ENUM_IPV6_PMTUDISC_PROBE = 3;


    enum DPP_ENUM_IPV6_PMTUDISC_DO = 2;


    enum DPP_ENUM___time_t_defined = 1;


    enum DPP_ENUM_IPV6_PMTUDISC_WANT = 1;


    enum DPP_ENUM_IPV6_PMTUDISC_DONT = 0;


    enum DPP_ENUM___timer_t_defined = 1;
    enum DPP_ENUM__BITS_TYPESIZES_H = 1;
    enum DPP_ENUM_IPV6_FREEBIND = 78;
    enum DPP_ENUM_IPV6_RECVFRAGSIZE = 77;


    enum DPP_ENUM___OFF_T_MATCHES_OFF64_T = 1;


    enum DPP_ENUM___INO_T_MATCHES_INO64_T = 1;


    enum DPP_ENUM___RLIM_T_MATCHES_RLIM64_T = 1;


    enum DPP_ENUM___FD_SETSIZE = 1024;


    enum DPP_ENUM_IPV6_UNICAST_IF = 76;


    enum DPP_ENUM_IPV6_TRANSPARENT = 75;




    enum DPP_ENUM_IPV6_ORIGDSTADDR = 74;


    enum DPP_ENUM__BITS_UINTN_IDENTITY_H = 1;


    enum DPP_ENUM_IPV6_MINHOPCOUNT = 73;


    enum DPP_ENUM_IPV6_ADDR_PREFERENCES = 72;


    enum DPP_ENUM_IPV6_AUTOFLOWLABEL = 70;


    enum DPP_ENUM_IPV6_TCLASS = 67;


    enum DPP_ENUM_IPV6_RECVTCLASS = 66;


    enum DPP_ENUM_IPV6_DONTFRAG = 62;


    enum DPP_ENUM_IPV6_PATHMTU = 61;


    enum DPP_ENUM_IPV6_RECVPATHMTU = 60;


    enum DPP_ENUM___WORDSIZE = 64;


    enum DPP_ENUM_IPV6_DSTOPTS = 59;


    enum DPP_ENUM_IPV6_RECVDSTOPTS = 58;


    enum DPP_ENUM_IPV6_RTHDR = 57;


    enum DPP_ENUM_IPV6_RECVRTHDR = 56;


    enum DPP_ENUM___WORDSIZE_TIME64_COMPAT32 = 1;


    enum DPP_ENUM___SYSCALL_WORDSIZE = 64;


    enum DPP_ENUM__ENDIAN_H = 1;


    enum DPP_ENUM_IPV6_RTHDRDSTOPTS = 55;


    enum DPP_ENUM___LITTLE_ENDIAN = 1234;


    enum DPP_ENUM___BIG_ENDIAN = 4321;


    enum DPP_ENUM___PDP_ENDIAN = 3412;


    enum DPP_ENUM_IPV6_HOPOPTS = 54;




    enum DPP_ENUM_IPV6_RECVHOPOPTS = 53;
    enum DPP_ENUM_IPV6_HOPLIMIT = 52;


    enum DPP_ENUM_IPV6_RECVHOPLIMIT = 51;




    enum DPP_ENUM_IPV6_PKTINFO = 50;


    enum DPP_ENUM_IPV6_RECVPKTINFO = 49;


    enum DPP_ENUM_IPV6_HDRINCL = 36;


    enum DPP_ENUM_IPV6_XFRM_POLICY = 35;


    enum DPP_ENUM_IPV6_IPSEC_POLICY = 34;
    enum DPP_ENUM__FEATURES_H = 1;




    enum DPP_ENUM_IPV6_MULTICAST_ALL = 29;


    enum DPP_ENUM_IPV6_LEAVE_ANYCAST = 28;





    enum DPP_ENUM_IPV6_JOIN_ANYCAST = 27;


    enum DPP_ENUM_IPV6_V6ONLY = 26;







    enum DPP_ENUM__DEFAULT_SOURCE = 1;


    enum DPP_ENUM_IPV6_RECVERR = 25;


    enum DPP_ENUM_IPV6_MTU = 24;


    enum DPP_ENUM___USE_ISOC11 = 1;


    enum DPP_ENUM_IPV6_MTU_DISCOVER = 23;


    enum DPP_ENUM_IPV6_ROUTER_ALERT = 22;


    enum DPP_ENUM___USE_ISOC99 = 1;


    enum DPP_ENUM_IPV6_LEAVE_GROUP = 21;


    enum DPP_ENUM_IPV6_JOIN_GROUP = 20;


    enum DPP_ENUM___USE_ISOC95 = 1;


    enum DPP_ENUM_IPV6_MULTICAST_LOOP = 19;


    enum DPP_ENUM___USE_POSIX_IMPLICITLY = 1;


    enum DPP_ENUM__POSIX_SOURCE = 1;




    enum DPP_ENUM_IPV6_MULTICAST_HOPS = 18;


    enum DPP_ENUM_IPV6_MULTICAST_IF = 17;


    enum DPP_ENUM_IPV6_UNICAST_HOPS = 16;


    enum DPP_ENUM_IPV6_AUTHHDR = 10;


    enum DPP_ENUM_IPV6_NEXTHOP = 9;




    enum DPP_ENUM_IPV6_2292HOPLIMIT = 8;


    enum DPP_ENUM___USE_POSIX = 1;


    enum DPP_ENUM_IPV6_CHECKSUM = 7;


    enum DPP_ENUM_IPV6_2292PKTOPTIONS = 6;


    enum DPP_ENUM___USE_POSIX2 = 1;


    enum DPP_ENUM_IPV6_2292RTHDR = 5;


    enum DPP_ENUM_IPV6_2292DSTOPTS = 4;


    enum DPP_ENUM___USE_POSIX199309 = 1;


    enum DPP_ENUM_IPV6_2292HOPOPTS = 3;


    enum DPP_ENUM_IPV6_2292PKTINFO = 2;


    enum DPP_ENUM___USE_POSIX199506 = 1;


    enum DPP_ENUM_IPV6_ADDRFORM = 1;


    enum DPP_ENUM_IP_MAX_MEMBERSHIPS = 20;


    enum DPP_ENUM___USE_XOPEN2K = 1;


    enum DPP_ENUM_IP_DEFAULT_MULTICAST_LOOP = 1;


    enum DPP_ENUM_IP_DEFAULT_MULTICAST_TTL = 1;


    enum DPP_ENUM___USE_XOPEN2K8 = 1;


    enum DPP_ENUM__ATFILE_SOURCE = 1;


    enum DPP_ENUM_SOL_IP = 0;


    enum DPP_ENUM___USE_MISC = 1;


    enum DPP_ENUM_IP_UNICAST_IF = 50;


    enum DPP_ENUM___USE_ATFILE = 1;


    enum DPP_ENUM___USE_FORTIFY_LEVEL = 0;


    enum DPP_ENUM_IP_MULTICAST_ALL = 49;


    enum DPP_ENUM___GLIBC_USE_DEPRECATED_GETS = 0;


    enum DPP_ENUM_IP_MSFILTER = 41;


    enum DPP_ENUM_IP_DROP_SOURCE_MEMBERSHIP = 40;


    enum DPP_ENUM___GLIBC_USE_DEPRECATED_SCANF = 0;


    enum DPP_ENUM_IP_ADD_SOURCE_MEMBERSHIP = 39;


    enum DPP_ENUM___GNU_LIBRARY__ = 6;


    enum DPP_ENUM___GLIBC__ = 2;


    enum DPP_ENUM___GLIBC_MINOR__ = 29;





    enum DPP_ENUM_IP_BLOCK_SOURCE = 38;


    enum DPP_ENUM_IP_UNBLOCK_SOURCE = 37;


    enum DPP_ENUM_IP_DROP_MEMBERSHIP = 36;


    enum DPP_ENUM_IP_ADD_MEMBERSHIP = 35;


    enum DPP_ENUM_IP_MULTICAST_LOOP = 34;


    enum DPP_ENUM_IP_MULTICAST_TTL = 33;
    enum DPP_ENUM_IP_MULTICAST_IF = 32;


    enum DPP_ENUM_IP_PMTUDISC_OMIT = 5;


    enum DPP_ENUM_IP_PMTUDISC_INTERFACE = 4;


    enum DPP_ENUM_IP_PMTUDISC_PROBE = 3;


    enum DPP_ENUM_IP_PMTUDISC_DO = 2;


    enum DPP_ENUM__NETINET_IN_H = 1;


    enum DPP_ENUM_IP_PMTUDISC_WANT = 1;


    enum DPP_ENUM_IP_PMTUDISC_DONT = 0;


    enum DPP_ENUM_IP_RECVFRAGSIZE = 25;


    enum DPP_ENUM_IP_BIND_ADDRESS_NO_PORT = 24;


    enum DPP_ENUM_IP_CHECKSUM = 23;


    enum DPP_ENUM_IP_NODEFRAG = 22;


    enum DPP_ENUM_IP_MINTTL = 21;




    enum DPP_ENUM_IP_ORIGDSTADDR = 20;
    enum DPP_ENUM_IP_TRANSPARENT = 19;
    enum DPP_ENUM_IP_PASSSEC = 18;


    enum DPP_ENUM_IP_XFRM_POLICY = 17;






    enum DPP_ENUM_IN_CLASSA_NSHIFT = 24;




    enum DPP_ENUM_IN_CLASSA_MAX = 128;






    enum DPP_ENUM_IN_CLASSB_NSHIFT = 16;




    enum DPP_ENUM_IN_CLASSB_MAX = 65536;






    enum DPP_ENUM_IN_CLASSC_NSHIFT = 8;
    enum DPP_ENUM_IN_LOOPBACKNET = 127;
    enum DPP_ENUM_IP_IPSEC_POLICY = 16;


    enum DPP_ENUM_IP_FREEBIND = 15;




    enum DPP_ENUM_IP_MTU = 14;






    enum DPP_ENUM_IP_RECVTOS = 13;


    enum DPP_ENUM_IP_RECVTTL = 12;






    enum DPP_ENUM_INET_ADDRSTRLEN = 16;


    enum DPP_ENUM_INET6_ADDRSTRLEN = 46;


    enum DPP_ENUM_IP_RECVERR = 11;


    enum DPP_ENUM_IP_MTU_DISCOVER = 10;


    enum DPP_ENUM_IP_PMTUDISC = 10;


    enum DPP_ENUM_IP_PKTOPTIONS = 9;


    enum DPP_ENUM_IP_PKTINFO = 8;


    enum DPP_ENUM_IP_ROUTER_ALERT = 5;


    enum DPP_ENUM_MCAST_INCLUDE = 1;


    enum DPP_ENUM_MCAST_EXCLUDE = 0;


    enum DPP_ENUM_MCAST_MSFILTER = 48;


    enum DPP_ENUM_MCAST_LEAVE_SOURCE_GROUP = 47;


    enum DPP_ENUM_MCAST_JOIN_SOURCE_GROUP = 46;


    enum DPP_ENUM_MCAST_LEAVE_GROUP = 45;


    enum DPP_ENUM_MCAST_UNBLOCK_SOURCE = 44;






    enum DPP_ENUM_MCAST_BLOCK_SOURCE = 43;







    enum DPP_ENUM_MCAST_JOIN_GROUP = 42;


    enum DPP_ENUM_IP_RETOPTS = 7;
    enum DPP_ENUM_IP_RECVOPTS = 6;


    enum DPP_ENUM_IP_TTL = 2;


    enum DPP_ENUM_IP_TOS = 1;


    enum DPP_ENUM_IP_HDRINCL = 3;
    enum DPP_ENUM_IP_OPTIONS = 4;


    enum DPP_ENUM__STDC_PREDEF_H = 1;


    enum DPP_ENUM__STRING_H = 1;




    enum DPP_ENUM___USE_KERNEL_IPV6_DEFS = 0;
    enum DPP_ENUM__BITS_BYTESWAP_H = 1;
    enum DPP_ENUM_SO_TXTIME = 61;


    enum DPP_ENUM_SO_ZEROCOPY = 60;


    enum DPP_ENUM_SO_PEERGROUPS = 59;


    enum DPP_ENUM_SCM_TIMESTAMPING_PKTINFO = 58;


    enum DPP_ENUM_SO_COOKIE = 57;


    enum DPP_ENUM_SO_INCOMING_NAPI_ID = 56;


    enum DPP_ENUM_SO_MEMINFO = 55;


    enum DPP_ENUM_SCM_TIMESTAMPING_OPT_STATS = 54;


    enum DPP_ENUM_SO_CNX_ADVICE = 53;


    enum DPP_ENUM_SO_ATTACH_REUSEPORT_EBPF = 52;


    enum DPP_ENUM_SO_ATTACH_REUSEPORT_CBPF = 51;




    enum DPP_ENUM_SO_ATTACH_BPF = 50;


    enum DPP_ENUM_SO_INCOMING_CPU = 49;


    enum DPP_ENUM_SO_BPF_EXTENSIONS = 48;


    enum DPP_ENUM_SO_MAX_PACING_RATE = 47;


    enum DPP_ENUM_SO_BUSY_POLL = 46;


    enum DPP_ENUM_SO_SELECT_ERR_QUEUE = 45;


    enum DPP_ENUM_SO_LOCK_FILTER = 44;


    enum DPP_ENUM_SO_NOFCS = 43;


    enum DPP_ENUM_SO_PEEK_OFF = 42;




    enum DPP_ENUM_SO_WIFI_STATUS = 41;


    enum DPP_ENUM_SO_RXQ_OVFL = 40;


    enum DPP_ENUM_SO_DOMAIN = 39;


    enum DPP_ENUM_SO_PROTOCOL = 38;




    enum DPP_ENUM_SO_TIMESTAMPING = 37;


    enum DPP_ENUM_SO_MARK = 36;




    enum DPP_ENUM_SO_TIMESTAMPNS = 35;


    enum DPP_ENUM_SO_PASSSEC = 34;


    enum DPP_ENUM_SO_PEERSEC = 31;


    enum DPP_ENUM_SO_ACCEPTCONN = 30;




    enum DPP_ENUM_SO_TIMESTAMP = 29;


    enum DPP_ENUM_SO_PEERNAME = 28;




    enum DPP_ENUM_SO_DETACH_FILTER = 27;


    enum DPP_ENUM_SO_ATTACH_FILTER = 26;


    enum DPP_ENUM_SO_BINDTODEVICE = 25;


    enum DPP_ENUM_SO_SECURITY_ENCRYPTION_NETWORK = 24;


    enum DPP_ENUM_SO_SECURITY_ENCRYPTION_TRANSPORT = 23;


    enum DPP_ENUM_SO_SECURITY_AUTHENTICATION = 22;


    enum DPP_ENUM_SO_SNDTIMEO = 21;


    enum DPP_ENUM_SO_RCVTIMEO = 20;


    enum DPP_ENUM_SO_SNDLOWAT = 19;


    enum DPP_ENUM_SO_RCVLOWAT = 18;


    enum DPP_ENUM_SO_PEERCRED = 17;


    enum DPP_ENUM_SO_PASSCRED = 16;


    enum DPP_ENUM_SO_REUSEPORT = 15;


    enum DPP_ENUM_SO_BSDCOMPAT = 14;


    enum DPP_ENUM_SO_LINGER = 13;


    enum DPP_ENUM_SO_PRIORITY = 12;


    enum DPP_ENUM_SO_NO_CHECK = 11;


    enum DPP_ENUM_SO_OOBINLINE = 10;


    enum DPP_ENUM_SO_KEEPALIVE = 9;


    enum DPP_ENUM_SO_RCVBUFFORCE = 33;


    enum DPP_ENUM_SO_SNDBUFFORCE = 32;


    enum DPP_ENUM_SO_RCVBUF = 8;


    enum DPP_ENUM_SO_SNDBUF = 7;


    enum DPP_ENUM_SO_BROADCAST = 6;


    enum DPP_ENUM_SO_DONTROUTE = 5;


    enum DPP_ENUM_SO_ERROR = 4;


    enum DPP_ENUM_SO_TYPE = 3;


    enum DPP_ENUM_SO_REUSEADDR = 2;


    enum DPP_ENUM_SO_DEBUG = 1;


    enum DPP_ENUM_SOL_SOCKET = 1;




    enum DPP_ENUM__ARPA_INET_H = 1;
    enum DPP_ENUM__STRINGS_H = 1;


    enum DPP_ENUM__SYS_CDEFS_H = 1;
    enum DPP_ENUM___glibc_c99_flexarr_available = 1;
    enum DPP_ENUM___HAVE_GENERIC_SELECTION = 1;


    enum DPP_ENUM__SYS_SELECT_H = 1;
    enum DPP_ENUM__SYS_SOCKET_H = 1;
    enum DPP_ENUM__SYS_TYPES_H = 1;
    enum DPP_ENUM___BIT_TYPES_DEFINED__ = 1;
}



import core.time:Duration,msecs;
import std.string:toStringz,fromStringz;
import std.conv:to;
import std.exception:enforce;
import std.format:format;
static import std.socket;
import std.socket:AddressInfoFlags,SocketType,Address,InternetAddress,Socket,ProtocolType;
import std.stdio:File;
import std.typecons:tuple;
import std.traits : isArray;

mixin dpp.EnumD!("SocketType",__socket_type,"SOCK_");
mixin dpp.EnumD!("Status",UDT_UDTSTATUS,"UDT_");
mixin dpp.EnumD!("Option",UDT_UDTOpt,"UDT_");
mixin dpp.EnumD!("ErrNo",UDT_ERRNO,"UDT_");
mixin dpp.EnumD!("EpollOption",UDT_EPOLLOpt,"UDT_UDT_");

alias AddressFamily = typeof(2);


struct addrinfo
{
  int ai_flags;
  int ai_family;
  int ai_socktype;
  int ai_protocol;
  socklen_t ai_addrlen;
  sockaddr *ai_addr;
  char *ai_canonname;
  addrinfo *ai_next;
}





struct SocketAddressStorage {
 sockaddr_storage handle;
 private enum NI_MAXHOST = 200;
 private enum NI_MAXSERV = 200;
 private char[NI_MAXHOST] clienthost;
 private char[NI_MAXSERV] clientservice;

 @property char[] clientHost() {
  return fromStringz(this.clienthost.ptr);
 }

 @property char[] clientService() {
  return fromStringz(this.clientservice.ptr);
 }

 void getNameInfo() {
  import std.traits: Parameters;
  version(Windows) {
   import core.sys.windows.winsock2: getnameinfo;
   alias gai_strerror = gai_strerrorA;
  } else
     import core.sys.posix.netdb: getnameinfo, gai_strerror;

  int rslt = getnameinfo(cast(Parameters!getnameinfo[0])&this.handle,
          this.handle.sizeof.to!int,
          this.clienthost.ptr,
          this.clienthost.length.to!int,
          this.clientservice.ptr,
          this.clientservice.length.to!int,
   AddressInfoFlags.NUMERICHOST);

        version(Windows)
            enforce(rslt == 0, "getnameinfo error");
        else
            enforce(rslt == 0,
                    format(" getnameinfo error: %s", gai_strerror(rslt).fromStringz()));
 }
}

struct SocketAddressIn
{
 sockaddr_in handle = sockaddr_in(2,9000,in_addr((cast(in_addr_t) 0x00000000)));
 alias handle this;

 this(sa_family_t family, ushort port, string address= null)
 {
  if (address.length ==0)
  {
   this.handle = sockaddr_in(family,port,in_addr((cast(in_addr_t) 0x00000000)));
  }
  else
  {
   this.handle=sockaddr_in(family,port);
   inet_pton(family,address.toStringz,&this.sin_addr);
  }
 }
}

private T getSocketOptionHelper(T)(UDTSOCKET socket, UDT_UDTOpt option)
{
 T ret;
 uint retSize=ret.sizeof;
 int result = getsockopt(socket,0,option,cast(void*)&ret,&retSize);
 enforce(option == Option.UDT_UDT_RCVDATA || option == Option.UDT_UDT_SNDDATA || result != UDT_ERROR, format!"error (%s) getting socket option %s for %s: %s"(result,option,socket,getLastError()));
 return ret;
}

private void setSocketOptionHelper(T)(UDTSOCKET socket, UDT_UDTOpt option, T value)
{
 T temp = value;
 int result = setsockopt(socket,0,option,cast(void*)&temp,temp.sizeof.to!int);
 enforce(result != UDT_ERROR, format!"error (%s) setting socket option %s for %s: %s"(result,option,socket,getLastError()));
}







final class SocketOptions
{
 UdtSocket socket;

 this(UdtSocket socket)
 {
  this.socket = socket;
 }

 int maximumPacketSize()
 {
      return getSocketOptionHelper!int(socket.handle,Option.UDT_UDT_MSS);
 }

 void maximumPacketSize(int size)
 {
  setSocketOptionHelper!int(socket.handle,Option.UDT_UDT_MSS,size);
 }

 bool blockingSending()
 {
  return getSocketOptionHelper!bool(socket.handle,Option.UDT_UDT_SNDSYN);
 }

 void blockingSending(bool mode)
 {
  setSocketOptionHelper!bool(socket.handle,Option.UDT_UDT_SNDSYN,mode);
 }

 bool blockingReceiving()
 {
  return getSocketOptionHelper!bool(socket.handle,Option.UDT_UDT_RCVSYN);
 }

 void blockingReceiving(bool mode)
 {
  setSocketOptionHelper!bool(socket.handle,Option.UDT_UDT_RCVSYN,mode);
 }

 int maximumWindowSize()
 {
  return getSocketOptionHelper!int(socket.handle,Option.UDT_UDT_FC);
 }

 void maximumWindowSize(int size)
 {
  setSocketOptionHelper!int(socket.handle,Option.UDT_UDT_FC,size);
 }

 int udtSenderBufferSize()
 {
  return getSocketOptionHelper!int(socket.handle,Option.UDT_UDT_SNDBUF);
 }

 void udtSenderBufferSize(int size)
 {
  setSocketOptionHelper!int(socket.handle,Option.UDT_UDT_SNDBUF,size);
 }

 int udtReceiverBufferSize()
 {
  return getSocketOptionHelper!int(socket.handle,Option.UDT_UDT_RCVBUF);
 }

 void udtReceiverBufferSize(int size)
 {
  setSocketOptionHelper!int(socket.handle,Option.UDT_UDT_RCVBUF,size);
 }

 int udpSenderBufferSize()
 {
  return getSocketOptionHelper!int(socket.handle,Option.UDT_UDP_SNDBUF);
 }

 void udpSenderBufferSize(int size)
 {
  setSocketOptionHelper!int(socket.handle,Option.UDT_UDP_SNDBUF,size);
 }

 int udpReceiverBufferSize()
 {
  return getSocketOptionHelper!int(socket.handle,Option.UDT_UDP_RCVBUF);
 }

 void udpReceiverBufferSize(int size)
 {
  setSocketOptionHelper!int(socket.handle,Option.UDT_UDP_RCVBUF,size);
 }

 linger lingerTime()
 {
  linger result = getSocketOptionHelper!linger(socket.handle,Option.UDT_UDT_LINGER);
  return result;
 }

 void lingerTime(linger lingerTime)
 {
  setSocketOptionHelper!linger(socket.handle,Option.UDT_UDT_LINGER,lingerTime);
 }

 bool enableRendezVous()
 {
  return getSocketOptionHelper!bool(socket.handle,Option.UDT_UDT_RENDEZVOUS);
 }

 void enableRendezVous(bool enable)
 {
  setSocketOptionHelper!bool(socket.handle,Option.UDT_UDT_RENDEZVOUS,enable);
 }



 Duration sendCallTimeOut()
 {
  return getSocketOptionHelper!int(socket.handle,Option.UDT_UDT_SNDTIMEO).msecs();
 }

 void sendCallTimeOut(Duration dur)
 {
  setSocketOptionHelper!int(socket.handle,Option.UDT_UDT_SNDTIMEO,dur.total!"msecs".to!int);
 }

 Duration receiveCallTimeout()
 {
  return getSocketOptionHelper!int(socket.handle,Option.UDT_UDT_RCVTIMEO).msecs();
 }

 void receiveCallTimeOut(Duration dur)
 {
  setSocketOptionHelper!int(socket.handle,Option.UDT_UDT_RCVTIMEO,dur.total!"msecs".to!int);
 }

 bool reuseAddress()
 {
  return getSocketOptionHelper!bool(socket.handle,UDT_UDT_REUSEADDR);
 }

 void reuseAddress(bool reuse)
 {
  setSocketOptionHelper!bool(socket.handle,Option.UDT_UDT_REUSEADDR,reuse);
 }

 long maximumBytesPerSecondPerConnection()
 {
  return getSocketOptionHelper!long(socket.handle,Option.UDT_UDT_MAXBW);
 }

 void maximumBytesPerSecondPerConnection(long bw)
 {
  setSocketOptionHelper!long(socket.handle,Option.UDT_UDT_MAXBW,bw);
 }

 int state()
 {
  return getSocketOptionHelper!int(socket.handle,Option.UDT_UDT_STATE);
 }

 int epollEvents()
 {
  return getSocketOptionHelper!int(socket.handle,Option.UDT_UDT_EVENT);
 }

 int sizePendingDataSend()
 {
  return getSocketOptionHelper!int(socket.handle,Option.UDT_UDT_SNDDATA);
 }

 int sizePendingDataReceive()
 {
  return getSocketOptionHelper!int(socket.handle,Option.UDT_UDT_RCVDATA);
 }
}

shared static this()
{
 udt_startup();
}

shared static ~this()
{
 udt_cleanup();
}
alias clearLastError = udt_clearlasterror;

string getLastError()
{
 return udt_getlasterror_desc().fromStringz().idup;
}

struct TraceInfo {
 UDT_TRACEINFO handle;
 alias handle this;
}


final class UdtSocket
{
 UDTSOCKET handle = -1;


 this(UDTSOCKET handle)
 {
  this.handle = handle;
 }

 int sizePendingDataSend()
 {
  return getSocketOptionHelper!int(handle,Option.UDT_UDT_SNDDATA);
 }

 int sizePendingDataReceive()
 {
  return getSocketOptionHelper!int(handle,Option.UDT_UDT_RCVDATA);
 }

 int state()
 {
  return udt_getsockstate(this.handle);
 }

 bool wouldBlock()
 {
  return (state() == UDT_EASYNCRCV);
 }

 bool isListening()
 {
  return state() == UDT_LISTENING;
 }

 bool isConnecting()
 {
  return state() == UDT_CONNECTING;
 }

 bool isAlive()
 {
  return state() == UDT_CONNECTED;
 }

 override string toString()
 {
  return format!"UDT socket %s; peerName %s; socketName %s"(this.handle,this.peerName(),this.socketName());
 }

 InternetAddress peerName()
 {
  sockaddr_in addr;
  int retLength;
  int result = udt_getpeername(this.handle,cast(sockaddr*)&addr,&retLength);
  enforce(result != UDT_ERROR, format!"unable to get peername info: %s"(getLastError()));
  return new InternetAddress(cast(std.socket.sockaddr_in)addr);
 }

 InternetAddress socketName()
 {
  sockaddr_in addr;
  int retLength;
  int result = udt_getsockname(this.handle,cast(sockaddr*)&addr,&retLength);
  return new InternetAddress(cast(std.socket.sockaddr_in)addr);
 }

 ref TraceInfo perfMon(ref TraceInfo info, bool clear = true)
 {
  int result = udt_perfmon(this.handle, &info.handle, clear);
  enforce(result != UDT_ERROR, format!"unable to get perfmon info: %s"(getLastError()));
  return info;
 }

 auto ref options()
 {
  return new SocketOptions(new UdtSocket(this.handle));
 }


 static auto create4(bool stream)
 {
  return create(std.socket.AddressFamily.INET,stream?SocketType.STREAM:SocketType.DGRAM,ProtocolType.RAW);
 }

 static auto create6(bool stream)
 {
  return create(std.socket.AddressFamily.INET6,stream?SocketType.STREAM:SocketType.DGRAM,ProtocolType.RAW);
 }

 static auto create(std.socket.AddressFamily addressFamily, SocketType socketType, int protocol)
 {
  int result = udt_socket(addressFamily.to!int, socketType.to!int, protocol);
  enforce(result != UDT_INVALID_SOCK, format!"unable to create UdtSocket: %s"(getLastError()));
  return new UdtSocket(result);
 }

 void bind(InternetAddress socketAddress)
 {
  int result = udt_bind(this.handle, cast(const(sockaddr)*)socketAddress.name, socketAddress.nameLen);
  enforce(result != UDT_ERROR, format!"unable to bind to %s: %s"(socketAddress,getLastError()));
 }

 void bind2(ref UdtSocket socket)
 {
  int result = udt_bind2(this.handle, socket.handle);
  enforce(result != UDT_ERROR, format!"unable to bind to UDP Socket %s: %s"(socket,getLastError()));
 }

 void connect(InternetAddress internetAddress)
 {
  int result = udt_connect(this.handle,cast(const(sockaddr)*) internetAddress.name, internetAddress.nameLen);
  enforce(result != UDT_ERROR, format!"unable to connect to %s: %s"(internetAddress,getLastError()));
 }

 void listen(int backlog)
 {
  enforce(udt_listen(this.handle,backlog) != UDT_ERROR,format!"unable to bind to listen to %s: %s"(backlog,getLastError()));
 }

 auto accept()
 {
  sockaddr_in addr;
  int addressLength;
  handle = udt_accept(this.handle, cast(sockaddr*) &addr,&addressLength);
  enforce(handle != UDT_INVALID_SOCK, format!"unable to accept : %s"(getLastError()));
  return tuple(new UdtSocket(handle),new InternetAddress(cast(std.socket.sockaddr_in)addr));
 }

 int receive(T)(scope ref T data) if(!isArray!T && !is(T == ubyte[])) {
  ubyte[] s = (cast(ubyte*)&data)[0 .. int.sizeof];
  return this.receive(s);
 }

 int receive(scope ubyte[] data) {
  int rcv_size;
  int var_size = int.sizeof;

  int opt = udt_getsockopt(this.handle, 0, UDT_UDTOpt.UDT_UDT_RCVDATA, &rcv_size, &var_size);
  if(opt == UDT_ERROR) {
   throw new Exception(format("getsockopt: %s", getLastError()));
  }

  int rs = udt_recv(this.handle, cast(char*)(data.ptr), to!int(data.length), 0);
  if(rs == UDT_ERROR) {
   throw new Exception(format("recv: %s", getLastError()));
  }

  return rs;
 }

 int send(T)(scope ref T data) @system {

  int result = this.send((cast(ubyte*)&data)[0 .. T.sizeof], 0);
  enforce(result != UDT_ERROR, format!"unable to send data of length %s:%s"(T.sizeof, getLastError()));
  return result;
 }

 auto send(scope ubyte[] data, int flags=0)
 {
  int result = udt_send(this.handle,cast(char*)data.ptr,data.length.to!int,flags);
  enforce(result != UDT_ERROR, format!"unable to send data of length %s: %s"(data.length,getLastError()));
  return result;
 }

 auto receiveMessage(scope const ubyte[] data)
 {
  int result = udt_recvmsg(this.handle,cast(char*)data.ptr,data.length.to!int);
  enforce(result != UDT_ERROR, format!"unable to receive message to buffer of length %s: %s"(data.length,getLastError()));
  return result;
 }

 auto sendMessage(scope ubyte[] data, int ttl, bool inOrder = true)
 {
  int result = udt_sendmsg(this.handle,cast(char*)data.ptr,data.length.to!int,ttl,inOrder ? 1:0);
  enforce(result != UDT_ERROR, format!"unable to send message of length %s: %s"(data.length,getLastError()));
  return result;
 }

 auto receiveFile(string filename, ref long offset, ulong size, int block = 7280000)
 {
  long result = udt_recvfile2(this.handle, filename.toStringz(), &offset, size, block);
  enforce(result != UDT_ERROR,
   format!"unable to receive data to buffer of length %s: %s"(size, getLastError())
  );
  return result;
 }

 auto sendFile(string filename, ref long offset, int block = 364000)
 {
  import std.file : getSize;
  import std.conv : to;

  const length = to!long(getSize(filename));
  long result = udt_sendfile2(this.handle, filename.toStringz(),
    &offset, length, block
   );
  enforce(result != UDT_ERROR, format!"unable to send file of length %s: %s"(length, getLastError()));
  return result;
 }


 void close()
 {
  int result = udt_close(this.handle);
  enforce(result != UDT_ERROR, format!"unable to close UdtSocket : %s"(getLastError()));
  this.handle=-1;
 }
 ~this()
 {
  if (this.handle!=-1)
   this.close();
 }
}

void sendStream(Socket sourceSocket, UdtSocket targetSocket, size_t bufSize = 10_000_000)
{
 auto buf = new ubyte[bufSize];
 ptrdiff_t numBytes = 0, sentBytes = 0;
 while(sourceSocket.isAlive())
 {
  numBytes = sourceSocket.receive(cast(void[])buf);
  if (numBytes > 0)
  {
   sentBytes = targetSocket.send(buf[0..numBytes]);
   enforce(sentBytes == numBytes);
  }
 }
}

void sendStream(File sourceFile, UdtSocket socket, size_t bufSize = 10_000_000)
{
 foreach(ubyte[] buf; sourceFile.byChunk(new ubyte[bufSize]))
 {
  auto leftBuf = buf;
  while(leftBuf.length>0)
  {
   auto bytesSent = socket.send(leftBuf);
   leftBuf = leftBuf[bytesSent..$];
  }
 }
}

void receiveStream(UdtSocket sourceSocket, Socket targetSocket, size_t bufSize = 10_000_000)
{
 auto buf = new ubyte[bufSize];
 while(sourceSocket.isAlive())
 {
  int numBytes = udt_recv(sourceSocket.handle,cast(char*)(buf.ptr), to!int(buf.length), 0);
  if (numBytes <=0)
   continue;
  auto leftBuf = buf[0..numBytes];
  while(leftBuf.length > 0)
  {
   auto bytesSent = targetSocket.send(leftBuf);
   leftBuf = (bytesSent >=0) ? leftBuf[bytesSent .. $] : [];
  }
 }
}

void receiveStream(UdtSocket sourceSocket, File targetFile, size_t bufSize = 16384)
{
 auto buf = new ubyte[bufSize];
 while(sourceSocket.isAlive())
 {
  int numBytes = udt_recv(sourceSocket.handle,cast(char*)(buf.ptr), to!int(buf.length), 0);
  if (!sourceSocket.isAlive())
   break;
  if (numBytes > 0) targetFile.rawWrite(buf[0..numBytes]);
 }
}

void pipeStreams(UdtSocket udtSocket, Socket socket, size_t bufSize = 10_000_000)
{
 import std.parallelism:scopedTask;
 auto reader = scopedTask!receiveStream(udtSocket,socket,bufSize);
 auto writer = scopedTask!sendStream(socket,udtSocket,bufSize);
 reader.executeInNewThread();
 writer.executeInNewThread();
}

void pipeStreams(UdtSocket udtSocket, File file, size_t bufSize = 10_000_000)
{
 import std.parallelism:scopedTask;
 auto reader = scopedTask!receiveStream(udtSocket,file,bufSize);
 auto writer = scopedTask!sendStream(file,udtSocket,bufSize);
 reader.executeInNewThread();
 writer.executeInNewThread();
}
