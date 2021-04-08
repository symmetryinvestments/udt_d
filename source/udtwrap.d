


        import core.stdc.config;
        import core.stdc.stdarg: va_list;
        static import core.simd;
        static import std.conv;

        struct Int128 { long lower; long upper; }
        struct UInt128 { ulong lower; ulong upper; }

        struct __locale_data { int dummy; }



alias _Bool = bool;
struct dpp {
    static struct Opaque(int N) {
        void[N] bytes;
    }

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
        c_long[16] __fds_bits;
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
        c_long msTimeStamp;
        c_long pktSentTotal;
        c_long pktRecvTotal;
        int pktSndLossTotal;
        int pktRcvLossTotal;
        int pktRetransTotal;
        int pktSentACKTotal;
        int pktRecvACKTotal;
        int pktSentNAKTotal;
        int pktRecvNAKTotal;
        c_long usSndDurationTotal;
        c_long pktSent;
        c_long pktRecv;
        int pktSndLoss;
        int pktRcvLoss;
        int pktRetrans;
        int pktSentACK;
        int pktRecvACK;
        int pktSentNAK;
        int pktRecvNAK;
        double mbpsSendRate;
        double mbpsRecvRate;
        c_long usSndDuration;
        double usPktSndPeriod;
        int pktFlowWindow;
        int pktCongestionWindow;
        int pktFlightSize;
        double msRTT;
        double mbpsBandwidth;
        int byteAvailSndBuf;
        int byteAvailRcvBuf;
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
    alias __kernel_long_t = c_long;
    alias __kernel_ulong_t = c_ulong;
    alias __kernel_ino_t = c_ulong;
    alias __kernel_mode_t = uint;
    alias __kernel_pid_t = int;
    alias __kernel_ipc_pid_t = int;
    alias __kernel_uid_t = uint;
    alias __kernel_gid_t = uint;
    alias __kernel_suseconds_t = c_long;
    alias __kernel_daddr_t = int;
    alias __kernel_uid32_t = uint;
    alias __kernel_gid32_t = uint;
    alias __kernel_size_t = c_ulong;
    alias __kernel_ssize_t = c_long;
    alias __kernel_ptrdiff_t = c_long;
    struct __kernel_fsid_t
    {
        int[2] val;
    }
    alias __kernel_off_t = c_long;
    alias __kernel_loff_t = long;
    alias __kernel_old_time_t = c_long;
    alias __kernel_time_t = c_long;
    alias __kernel_time64_t = long;
    alias __kernel_clock_t = c_long;
    alias __kernel_timer_t = int;
    alias __kernel_clockid_t = int;
    alias __kernel_caddr_t = char*;
    alias __kernel_uid16_t = ushort;
    alias __kernel_gid16_t = ushort;
    char* strstr(const(char)*, const(char)*) @nogc nothrow;
    char* strpbrk(const(char)*, const(char)*) @nogc nothrow;
    c_ulong strspn(const(char)*, const(char)*) @nogc nothrow;
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
    alias __kernel_old_uid_t = ushort;
    alias __kernel_old_gid_t = ushort;
    void* memmove(void*, const(void)*, c_ulong) @nogc nothrow;
    alias __kernel_old_dev_t = c_ulong;
    void* memcpy(void*, const(void)*, c_ulong) @nogc nothrow;
    static ushort __bswap_16(ushort) @nogc nothrow;
    static uint __bswap_32(uint) @nogc nothrow;
    static c_ulong __bswap_64(c_ulong) @nogc nothrow;
    int bindresvport6(int, sockaddr_in6*) @nogc nothrow;
    int bindresvport(int, sockaddr_in*) @nogc nothrow;
    ushort htons(ushort) @nogc nothrow;
    uint htonl(uint) @nogc nothrow;
    ushort ntohs(ushort) @nogc nothrow;
    uint ntohl(uint) @nogc nothrow;
    struct group_filter
    {
        uint gf_interface;
        sockaddr_storage gf_group;
        uint gf_fmode;
        uint gf_numsrc;
        sockaddr_storage[1] gf_slist;
    }
    struct ip_msfilter
    {
        in_addr imsf_multiaddr;
        in_addr imsf_interface;
        uint imsf_fmode;
        uint imsf_numsrc;
        in_addr[1] imsf_slist;
    }
    struct group_source_req
    {
        uint gsr_interface;
        sockaddr_storage gsr_group;
        sockaddr_storage gsr_source;
    }
    struct group_req
    {
        uint gr_interface;
        sockaddr_storage gr_group;
    }
    struct ipv6_mreq
    {
        in6_addr ipv6mr_multiaddr;
        uint ipv6mr_interface;
    }
    struct ip_mreq_source
    {
        in_addr imr_multiaddr;
        in_addr imr_interface;
        in_addr imr_sourceaddr;
    }
    struct ip_mreq
    {
        in_addr imr_multiaddr;
        in_addr imr_interface;
    }
    struct sockaddr_in6
    {
        ushort sin6_family;
        ushort sin6_port;
        uint sin6_flowinfo;
        in6_addr sin6_addr;
        uint sin6_scope_id;
    }
    struct sockaddr_in
    {
        ushort sin_family;
        ushort sin_port;
        in_addr sin_addr;
        ubyte[8] sin_zero;
    }
    extern __gshared const(in6_addr) in6addr_loopback;
    extern __gshared const(in6_addr) in6addr_any;
    struct in6_addr
    {
        static union _Anonymous_1
        {
            ubyte[16] __u6_addr8;
            ushort[8] __u6_addr16;
            uint[4] __u6_addr32;
        }
        _Anonymous_1 __in6_u;
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
        IPPROTO_ETHERNET = 143,
        IPPROTO_RAW = 255,
        IPPROTO_MPTCP = 262,
        IPPROTO_MAX = 263,
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
    enum IPPROTO_ETHERNET = _Anonymous_4.IPPROTO_ETHERNET;
    enum IPPROTO_RAW = _Anonymous_4.IPPROTO_RAW;
    enum IPPROTO_MPTCP = _Anonymous_4.IPPROTO_MPTCP;
    enum IPPROTO_MAX = _Anonymous_4.IPPROTO_MAX;
    struct in_addr
    {
        uint s_addr;
    }
    alias in_addr_t = uint;
    alias __kernel_mqd_t = int;
    alias __kernel_key_t = int;
    alias __kernel_sighandler_t = void function(int);
    struct __kernel_fd_set
    {
        c_ulong[16] fds_bits;
    }
    struct ip_opts
    {
        in_addr ip_dst;
        char[40] ip_opts_;
    }
    struct ip_mreqn
    {
        in_addr imr_multiaddr;
        in_addr imr_address;
        int imr_ifindex;
    }
    struct in_pktinfo
    {
        int ipi_ifindex;
        in_addr ipi_spec_dst;
        in_addr ipi_addr;
    }
    static c_ulong __uint64_identity(c_ulong) @nogc nothrow;
    static uint __uint32_identity(uint) @nogc nothrow;
    static ushort __uint16_identity(ushort) @nogc nothrow;
    alias timer_t = void*;
    alias time_t = c_long;
    struct timeval
    {
        c_long tv_sec;
        c_long tv_usec;
    }
    struct timespec
    {
        c_long tv_sec;
        c_long tv_nsec;
    }
    struct osockaddr
    {
        ushort sa_family;
        ubyte[14] sa_data;
    }
    struct iovec
    {
        void* iov_base;
        c_ulong iov_len;
    }
    alias sigset_t = __sigset_t;
    alias locale_t = __locale_struct*;
    alias clockid_t = int;
    alias clock_t = c_long;
    struct __sigset_t
    {
        c_ulong[16] __val;
    }
    alias __locale_t = __locale_struct*;
    struct __locale_struct
    {
        __locale_data*[13] __locales;
        const(ushort)* __ctype_b;
        const(int)* __ctype_tolower;
        const(int)* __ctype_toupper;
        const(char)*[13] __names;
    }
    alias __sig_atomic_t = int;
    alias __socklen_t = uint;
    alias pthread_t = c_ulong;
    union pthread_mutexattr_t
    {
        char[4] __size;
        int __align;
    }
    union pthread_condattr_t
    {
        char[4] __size;
        int __align;
    }
    alias pthread_key_t = uint;
    alias pthread_once_t = int;
    union pthread_attr_t
    {
        char[56] __size;
        c_long __align;
    }
    union pthread_mutex_t
    {
        __pthread_mutex_s __data;
        char[40] __size;
        c_long __align;
    }
    union pthread_cond_t
    {
        __pthread_cond_s __data;
        char[48] __size;
        long __align;
    }
    union pthread_rwlock_t
    {
        __pthread_rwlock_arch_t __data;
        char[56] __size;
        c_long __align;
    }
    union pthread_rwlockattr_t
    {
        char[8] __size;
        c_long __align;
    }
    alias pthread_spinlock_t = int;
    union pthread_barrier_t
    {
        char[32] __size;
        c_long __align;
    }
    union pthread_barrierattr_t
    {
        char[4] __size;
        int __align;
    }
    alias __intptr_t = c_long;
    alias __caddr_t = char*;
    alias __loff_t = c_long;
    alias sa_family_t = ushort;
    alias __syscall_ulong_t = c_ulong;
    alias __syscall_slong_t = c_long;
    alias socklen_t = uint;
    alias __ssize_t = c_long;
    alias __fsword_t = c_long;
    alias __fsfilcnt64_t = c_ulong;
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
    alias __suseconds64_t = c_long;
    alias __suseconds_t = c_long;
    alias __useconds_t = uint;
    alias __time_t = c_long;
    alias __id_t = uint;
    alias __rlim64_t = c_ulong;
    alias __rlim_t = c_ulong;
    alias __clock_t = c_long;
    struct __fsid_t
    {
        int[2] __val;
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
    struct sockaddr
    {
        ushort sa_family;
        char[14] sa_data;
    }
    alias __u_long = c_ulong;
    alias __u_int = uint;
    struct sockaddr_storage
    {
        ushort ss_family;
        char[118] __ss_padding;
        c_ulong __ss_align;
    }
    enum _Anonymous_5
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
    enum MSG_OOB = _Anonymous_5.MSG_OOB;
    enum MSG_PEEK = _Anonymous_5.MSG_PEEK;
    enum MSG_DONTROUTE = _Anonymous_5.MSG_DONTROUTE;
    enum MSG_CTRUNC = _Anonymous_5.MSG_CTRUNC;
    enum MSG_PROXY = _Anonymous_5.MSG_PROXY;
    enum MSG_TRUNC = _Anonymous_5.MSG_TRUNC;
    enum MSG_DONTWAIT = _Anonymous_5.MSG_DONTWAIT;
    enum MSG_EOR = _Anonymous_5.MSG_EOR;
    enum MSG_WAITALL = _Anonymous_5.MSG_WAITALL;
    enum MSG_FIN = _Anonymous_5.MSG_FIN;
    enum MSG_SYN = _Anonymous_5.MSG_SYN;
    enum MSG_CONFIRM = _Anonymous_5.MSG_CONFIRM;
    enum MSG_RST = _Anonymous_5.MSG_RST;
    enum MSG_ERRQUEUE = _Anonymous_5.MSG_ERRQUEUE;
    enum MSG_NOSIGNAL = _Anonymous_5.MSG_NOSIGNAL;
    enum MSG_MORE = _Anonymous_5.MSG_MORE;
    enum MSG_WAITFORONE = _Anonymous_5.MSG_WAITFORONE;
    enum MSG_BATCH = _Anonymous_5.MSG_BATCH;
    enum MSG_ZEROCOPY = _Anonymous_5.MSG_ZEROCOPY;
    enum MSG_FASTOPEN = _Anonymous_5.MSG_FASTOPEN;
    enum MSG_CMSG_CLOEXEC = _Anonymous_5.MSG_CMSG_CLOEXEC;
    alias __u_short = ushort;
    alias __u_char = ubyte;
    struct __once_flag
    {
        int __data;
    }
    alias __thrd_t = c_ulong;
    alias __tss_t = uint;
    struct __pthread_cond_s
    {
        static union _Anonymous_6
        {
            ulong __wseq;
            static struct _Anonymous_7
            {
                uint __low;
                uint __high;
            }
            _Anonymous_7 __wseq32;
        }
        _Anonymous_6 _anonymous_8;
        ref auto __wseq() @property @nogc pure nothrow { return _anonymous_8.__wseq; }
        void __wseq(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_8.__wseq = val; }
        ref auto __wseq32() @property @nogc pure nothrow { return _anonymous_8.__wseq32; }
        void __wseq32(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_8.__wseq32 = val; }
        static union _Anonymous_9
        {
            ulong __g1_start;
            static struct _Anonymous_10
            {
                uint __low;
                uint __high;
            }
            _Anonymous_10 __g1_start32;
        }
        _Anonymous_9 _anonymous_11;
        ref auto __g1_start() @property @nogc pure nothrow { return _anonymous_11.__g1_start; }
        void __g1_start(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_11.__g1_start = val; }
        ref auto __g1_start32() @property @nogc pure nothrow { return _anonymous_11.__g1_start32; }
        void __g1_start32(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_11.__g1_start32 = val; }
        uint[2] __g_refs;
        uint[2] __g_size;
        uint __g1_orig_size;
        uint __wrefs;
        uint[2] __g_signals;
    }
    struct __pthread_internal_slist
    {
        __pthread_internal_slist* __next;
    }
    alias __pthread_slist_t = __pthread_internal_slist;
    struct __pthread_internal_list
    {
        __pthread_internal_list* __prev;
        __pthread_internal_list* __next;
    }
    alias __pthread_list_t = __pthread_internal_list;
    struct msghdr
    {
        void* msg_name;
        uint msg_namelen;
        iovec* msg_iov;
        c_ulong msg_iovlen;
        void* msg_control;
        c_ulong msg_controllen;
        int msg_flags;
    }
    struct cmsghdr
    {
        c_ulong cmsg_len;
        int cmsg_level;
        int cmsg_type;
        ubyte[0] __cmsg_data;
    }
    struct __pthread_rwlock_arch_t
    {
        uint __readers;
        uint __writers;
        uint __wrphase_futex;
        uint __writers_futex;
        uint __pad3;
        uint __pad4;
        int __cur_writer;
        int __shared;
        byte __rwelision;
        ubyte[7] __pad1;
        c_ulong __pad2;
        uint __flags;
    }
    cmsghdr* __cmsg_nxthdr(msghdr*, cmsghdr*) @nogc nothrow;
    enum _Anonymous_12
    {
        SCM_RIGHTS = 1,
    }
    enum SCM_RIGHTS = _Anonymous_12.SCM_RIGHTS;
    struct linger
    {
        int l_onoff;
        int l_linger;
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
    struct __pthread_mutex_s
    {
        int __lock;
        uint __count;
        int __owner;
        uint __nusers;
        int __kind;
        short __spins;
        short __elision;
        __pthread_internal_list __list;
    }
    alias uint64_t = ulong;
    alias uint32_t = uint;
    alias uint16_t = ushort;
    alias uint8_t = ubyte;
    alias int64_t = c_long;
    alias int32_t = int;
    alias int16_t = short;
    alias int8_t = byte;



    static if(!is(typeof(_BITS_STDINT_INTN_H))) {
        private enum enumMixinStr__BITS_STDINT_INTN_H = `enum _BITS_STDINT_INTN_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_STDINT_INTN_H); }))) {
            mixin(enumMixinStr__BITS_STDINT_INTN_H);
        }
    }




    static if(!is(typeof(SOCK_NONBLOCK))) {
        private enum enumMixinStr_SOCK_NONBLOCK = `enum SOCK_NONBLOCK = SOCK_NONBLOCK;`;
        static if(is(typeof({ mixin(enumMixinStr_SOCK_NONBLOCK); }))) {
            mixin(enumMixinStr_SOCK_NONBLOCK);
        }
    }




    static if(!is(typeof(SOCK_CLOEXEC))) {
        private enum enumMixinStr_SOCK_CLOEXEC = `enum SOCK_CLOEXEC = SOCK_CLOEXEC;`;
        static if(is(typeof({ mixin(enumMixinStr_SOCK_CLOEXEC); }))) {
            mixin(enumMixinStr_SOCK_CLOEXEC);
        }
    }




    static if(!is(typeof(SOCK_PACKET))) {
        private enum enumMixinStr_SOCK_PACKET = `enum SOCK_PACKET = SOCK_PACKET;`;
        static if(is(typeof({ mixin(enumMixinStr_SOCK_PACKET); }))) {
            mixin(enumMixinStr_SOCK_PACKET);
        }
    }




    static if(!is(typeof(_BITS_STDINT_UINTN_H))) {
        private enum enumMixinStr__BITS_STDINT_UINTN_H = `enum _BITS_STDINT_UINTN_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_STDINT_UINTN_H); }))) {
            mixin(enumMixinStr__BITS_STDINT_UINTN_H);
        }
    }




    static if(!is(typeof(SOCK_DCCP))) {
        private enum enumMixinStr_SOCK_DCCP = `enum SOCK_DCCP = SOCK_DCCP;`;
        static if(is(typeof({ mixin(enumMixinStr_SOCK_DCCP); }))) {
            mixin(enumMixinStr_SOCK_DCCP);
        }
    }




    static if(!is(typeof(SOCK_SEQPACKET))) {
        private enum enumMixinStr_SOCK_SEQPACKET = `enum SOCK_SEQPACKET = SOCK_SEQPACKET;`;
        static if(is(typeof({ mixin(enumMixinStr_SOCK_SEQPACKET); }))) {
            mixin(enumMixinStr_SOCK_SEQPACKET);
        }
    }




    static if(!is(typeof(SOCK_RDM))) {
        private enum enumMixinStr_SOCK_RDM = `enum SOCK_RDM = SOCK_RDM;`;
        static if(is(typeof({ mixin(enumMixinStr_SOCK_RDM); }))) {
            mixin(enumMixinStr_SOCK_RDM);
        }
    }




    static if(!is(typeof(SOCK_RAW))) {
        private enum enumMixinStr_SOCK_RAW = `enum SOCK_RAW = SOCK_RAW;`;
        static if(is(typeof({ mixin(enumMixinStr_SOCK_RAW); }))) {
            mixin(enumMixinStr_SOCK_RAW);
        }
    }




    static if(!is(typeof(SOCK_DGRAM))) {
        private enum enumMixinStr_SOCK_DGRAM = `enum SOCK_DGRAM = SOCK_DGRAM;`;
        static if(is(typeof({ mixin(enumMixinStr_SOCK_DGRAM); }))) {
            mixin(enumMixinStr_SOCK_DGRAM);
        }
    }




    static if(!is(typeof(_THREAD_MUTEX_INTERNAL_H))) {
        private enum enumMixinStr__THREAD_MUTEX_INTERNAL_H = `enum _THREAD_MUTEX_INTERNAL_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__THREAD_MUTEX_INTERNAL_H); }))) {
            mixin(enumMixinStr__THREAD_MUTEX_INTERNAL_H);
        }
    }




    static if(!is(typeof(SOCK_STREAM))) {
        private enum enumMixinStr_SOCK_STREAM = `enum SOCK_STREAM = SOCK_STREAM;`;
        static if(is(typeof({ mixin(enumMixinStr_SOCK_STREAM); }))) {
            mixin(enumMixinStr_SOCK_STREAM);
        }
    }




    static if(!is(typeof(SCM_RIGHTS))) {
        private enum enumMixinStr_SCM_RIGHTS = `enum SCM_RIGHTS = SCM_RIGHTS;`;
        static if(is(typeof({ mixin(enumMixinStr_SCM_RIGHTS); }))) {
            mixin(enumMixinStr_SCM_RIGHTS);
        }
    }






    static if(!is(typeof(__PTHREAD_MUTEX_HAVE_PREV))) {
        private enum enumMixinStr___PTHREAD_MUTEX_HAVE_PREV = `enum __PTHREAD_MUTEX_HAVE_PREV = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___PTHREAD_MUTEX_HAVE_PREV); }))) {
            mixin(enumMixinStr___PTHREAD_MUTEX_HAVE_PREV);
        }
    }
    static if(!is(typeof(__PTHREAD_RWLOCK_ELISION_EXTRA))) {
        private enum enumMixinStr___PTHREAD_RWLOCK_ELISION_EXTRA = `enum __PTHREAD_RWLOCK_ELISION_EXTRA = 0 , { 0 , 0 , 0 , 0 , 0 , 0 , 0 };`;
        static if(is(typeof({ mixin(enumMixinStr___PTHREAD_RWLOCK_ELISION_EXTRA); }))) {
            mixin(enumMixinStr___PTHREAD_RWLOCK_ELISION_EXTRA);
        }
    }
    static if(!is(typeof(_THREAD_SHARED_TYPES_H))) {
        private enum enumMixinStr__THREAD_SHARED_TYPES_H = `enum _THREAD_SHARED_TYPES_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__THREAD_SHARED_TYPES_H); }))) {
            mixin(enumMixinStr__THREAD_SHARED_TYPES_H);
        }
    }






    static if(!is(typeof(MSG_CMSG_CLOEXEC))) {
        private enum enumMixinStr_MSG_CMSG_CLOEXEC = `enum MSG_CMSG_CLOEXEC = MSG_CMSG_CLOEXEC;`;
        static if(is(typeof({ mixin(enumMixinStr_MSG_CMSG_CLOEXEC); }))) {
            mixin(enumMixinStr_MSG_CMSG_CLOEXEC);
        }
    }




    static if(!is(typeof(MSG_FASTOPEN))) {
        private enum enumMixinStr_MSG_FASTOPEN = `enum MSG_FASTOPEN = MSG_FASTOPEN;`;
        static if(is(typeof({ mixin(enumMixinStr_MSG_FASTOPEN); }))) {
            mixin(enumMixinStr_MSG_FASTOPEN);
        }
    }




    static if(!is(typeof(MSG_ZEROCOPY))) {
        private enum enumMixinStr_MSG_ZEROCOPY = `enum MSG_ZEROCOPY = MSG_ZEROCOPY;`;
        static if(is(typeof({ mixin(enumMixinStr_MSG_ZEROCOPY); }))) {
            mixin(enumMixinStr_MSG_ZEROCOPY);
        }
    }




    static if(!is(typeof(MSG_BATCH))) {
        private enum enumMixinStr_MSG_BATCH = `enum MSG_BATCH = MSG_BATCH;`;
        static if(is(typeof({ mixin(enumMixinStr_MSG_BATCH); }))) {
            mixin(enumMixinStr_MSG_BATCH);
        }
    }




    static if(!is(typeof(MSG_WAITFORONE))) {
        private enum enumMixinStr_MSG_WAITFORONE = `enum MSG_WAITFORONE = MSG_WAITFORONE;`;
        static if(is(typeof({ mixin(enumMixinStr_MSG_WAITFORONE); }))) {
            mixin(enumMixinStr_MSG_WAITFORONE);
        }
    }




    static if(!is(typeof(MSG_MORE))) {
        private enum enumMixinStr_MSG_MORE = `enum MSG_MORE = MSG_MORE;`;
        static if(is(typeof({ mixin(enumMixinStr_MSG_MORE); }))) {
            mixin(enumMixinStr_MSG_MORE);
        }
    }




    static if(!is(typeof(MSG_NOSIGNAL))) {
        private enum enumMixinStr_MSG_NOSIGNAL = `enum MSG_NOSIGNAL = MSG_NOSIGNAL;`;
        static if(is(typeof({ mixin(enumMixinStr_MSG_NOSIGNAL); }))) {
            mixin(enumMixinStr_MSG_NOSIGNAL);
        }
    }




    static if(!is(typeof(MSG_ERRQUEUE))) {
        private enum enumMixinStr_MSG_ERRQUEUE = `enum MSG_ERRQUEUE = MSG_ERRQUEUE;`;
        static if(is(typeof({ mixin(enumMixinStr_MSG_ERRQUEUE); }))) {
            mixin(enumMixinStr_MSG_ERRQUEUE);
        }
    }




    static if(!is(typeof(MSG_RST))) {
        private enum enumMixinStr_MSG_RST = `enum MSG_RST = MSG_RST;`;
        static if(is(typeof({ mixin(enumMixinStr_MSG_RST); }))) {
            mixin(enumMixinStr_MSG_RST);
        }
    }




    static if(!is(typeof(MSG_CONFIRM))) {
        private enum enumMixinStr_MSG_CONFIRM = `enum MSG_CONFIRM = MSG_CONFIRM;`;
        static if(is(typeof({ mixin(enumMixinStr_MSG_CONFIRM); }))) {
            mixin(enumMixinStr_MSG_CONFIRM);
        }
    }




    static if(!is(typeof(MSG_SYN))) {
        private enum enumMixinStr_MSG_SYN = `enum MSG_SYN = MSG_SYN;`;
        static if(is(typeof({ mixin(enumMixinStr_MSG_SYN); }))) {
            mixin(enumMixinStr_MSG_SYN);
        }
    }




    static if(!is(typeof(MSG_FIN))) {
        private enum enumMixinStr_MSG_FIN = `enum MSG_FIN = MSG_FIN;`;
        static if(is(typeof({ mixin(enumMixinStr_MSG_FIN); }))) {
            mixin(enumMixinStr_MSG_FIN);
        }
    }




    static if(!is(typeof(MSG_WAITALL))) {
        private enum enumMixinStr_MSG_WAITALL = `enum MSG_WAITALL = MSG_WAITALL;`;
        static if(is(typeof({ mixin(enumMixinStr_MSG_WAITALL); }))) {
            mixin(enumMixinStr_MSG_WAITALL);
        }
    }




    static if(!is(typeof(__ONCE_FLAG_INIT))) {
        private enum enumMixinStr___ONCE_FLAG_INIT = `enum __ONCE_FLAG_INIT = { 0 };`;
        static if(is(typeof({ mixin(enumMixinStr___ONCE_FLAG_INIT); }))) {
            mixin(enumMixinStr___ONCE_FLAG_INIT);
        }
    }




    static if(!is(typeof(MSG_EOR))) {
        private enum enumMixinStr_MSG_EOR = `enum MSG_EOR = MSG_EOR;`;
        static if(is(typeof({ mixin(enumMixinStr_MSG_EOR); }))) {
            mixin(enumMixinStr_MSG_EOR);
        }
    }




    static if(!is(typeof(_BITS_TIME64_H))) {
        private enum enumMixinStr__BITS_TIME64_H = `enum _BITS_TIME64_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_TIME64_H); }))) {
            mixin(enumMixinStr__BITS_TIME64_H);
        }
    }




    static if(!is(typeof(MSG_DONTWAIT))) {
        private enum enumMixinStr_MSG_DONTWAIT = `enum MSG_DONTWAIT = MSG_DONTWAIT;`;
        static if(is(typeof({ mixin(enumMixinStr_MSG_DONTWAIT); }))) {
            mixin(enumMixinStr_MSG_DONTWAIT);
        }
    }




    static if(!is(typeof(__TIME64_T_TYPE))) {
        private enum enumMixinStr___TIME64_T_TYPE = `enum __TIME64_T_TYPE = __TIME_T_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___TIME64_T_TYPE); }))) {
            mixin(enumMixinStr___TIME64_T_TYPE);
        }
    }




    static if(!is(typeof(MSG_TRUNC))) {
        private enum enumMixinStr_MSG_TRUNC = `enum MSG_TRUNC = MSG_TRUNC;`;
        static if(is(typeof({ mixin(enumMixinStr_MSG_TRUNC); }))) {
            mixin(enumMixinStr_MSG_TRUNC);
        }
    }




    static if(!is(typeof(__TIMESIZE))) {
        private enum enumMixinStr___TIMESIZE = `enum __TIMESIZE = __WORDSIZE;`;
        static if(is(typeof({ mixin(enumMixinStr___TIMESIZE); }))) {
            mixin(enumMixinStr___TIMESIZE);
        }
    }




    static if(!is(typeof(_BITS_TYPES_H))) {
        private enum enumMixinStr__BITS_TYPES_H = `enum _BITS_TYPES_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_TYPES_H); }))) {
            mixin(enumMixinStr__BITS_TYPES_H);
        }
    }




    static if(!is(typeof(MSG_PROXY))) {
        private enum enumMixinStr_MSG_PROXY = `enum MSG_PROXY = MSG_PROXY;`;
        static if(is(typeof({ mixin(enumMixinStr_MSG_PROXY); }))) {
            mixin(enumMixinStr_MSG_PROXY);
        }
    }




    static if(!is(typeof(MSG_CTRUNC))) {
        private enum enumMixinStr_MSG_CTRUNC = `enum MSG_CTRUNC = MSG_CTRUNC;`;
        static if(is(typeof({ mixin(enumMixinStr_MSG_CTRUNC); }))) {
            mixin(enumMixinStr_MSG_CTRUNC);
        }
    }




    static if(!is(typeof(MSG_DONTROUTE))) {
        private enum enumMixinStr_MSG_DONTROUTE = `enum MSG_DONTROUTE = MSG_DONTROUTE;`;
        static if(is(typeof({ mixin(enumMixinStr_MSG_DONTROUTE); }))) {
            mixin(enumMixinStr_MSG_DONTROUTE);
        }
    }




    static if(!is(typeof(MSG_PEEK))) {
        private enum enumMixinStr_MSG_PEEK = `enum MSG_PEEK = MSG_PEEK;`;
        static if(is(typeof({ mixin(enumMixinStr_MSG_PEEK); }))) {
            mixin(enumMixinStr_MSG_PEEK);
        }
    }




    static if(!is(typeof(MSG_OOB))) {
        private enum enumMixinStr_MSG_OOB = `enum MSG_OOB = MSG_OOB;`;
        static if(is(typeof({ mixin(enumMixinStr_MSG_OOB); }))) {
            mixin(enumMixinStr_MSG_OOB);
        }
    }




    static if(!is(typeof(_SS_PADSIZE))) {
        private enum enumMixinStr__SS_PADSIZE = `enum _SS_PADSIZE = ( _SS_SIZE - __SOCKADDR_COMMON_SIZE - ( __ss_aligntype ) .sizeof );`;
        static if(is(typeof({ mixin(enumMixinStr__SS_PADSIZE); }))) {
            mixin(enumMixinStr__SS_PADSIZE);
        }
    }




    static if(!is(typeof(__ss_aligntype))) {
        private enum enumMixinStr___ss_aligntype = `enum __ss_aligntype = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___ss_aligntype); }))) {
            mixin(enumMixinStr___ss_aligntype);
        }
    }




    static if(!is(typeof(SOMAXCONN))) {
        private enum enumMixinStr_SOMAXCONN = `enum SOMAXCONN = 4096;`;
        static if(is(typeof({ mixin(enumMixinStr_SOMAXCONN); }))) {
            mixin(enumMixinStr_SOMAXCONN);
        }
    }




    static if(!is(typeof(SOL_XDP))) {
        private enum enumMixinStr_SOL_XDP = `enum SOL_XDP = 283;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_XDP); }))) {
            mixin(enumMixinStr_SOL_XDP);
        }
    }




    static if(!is(typeof(SOL_TLS))) {
        private enum enumMixinStr_SOL_TLS = `enum SOL_TLS = 282;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_TLS); }))) {
            mixin(enumMixinStr_SOL_TLS);
        }
    }




    static if(!is(typeof(SOL_KCM))) {
        private enum enumMixinStr_SOL_KCM = `enum SOL_KCM = 281;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_KCM); }))) {
            mixin(enumMixinStr_SOL_KCM);
        }
    }




    static if(!is(typeof(SOL_NFC))) {
        private enum enumMixinStr_SOL_NFC = `enum SOL_NFC = 280;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_NFC); }))) {
            mixin(enumMixinStr_SOL_NFC);
        }
    }




    static if(!is(typeof(SOL_ALG))) {
        private enum enumMixinStr_SOL_ALG = `enum SOL_ALG = 279;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_ALG); }))) {
            mixin(enumMixinStr_SOL_ALG);
        }
    }




    static if(!is(typeof(SOL_CAIF))) {
        private enum enumMixinStr_SOL_CAIF = `enum SOL_CAIF = 278;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_CAIF); }))) {
            mixin(enumMixinStr_SOL_CAIF);
        }
    }




    static if(!is(typeof(SOL_IUCV))) {
        private enum enumMixinStr_SOL_IUCV = `enum SOL_IUCV = 277;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_IUCV); }))) {
            mixin(enumMixinStr_SOL_IUCV);
        }
    }




    static if(!is(typeof(SOL_RDS))) {
        private enum enumMixinStr_SOL_RDS = `enum SOL_RDS = 276;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_RDS); }))) {
            mixin(enumMixinStr_SOL_RDS);
        }
    }




    static if(!is(typeof(SOL_PNPIPE))) {
        private enum enumMixinStr_SOL_PNPIPE = `enum SOL_PNPIPE = 275;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_PNPIPE); }))) {
            mixin(enumMixinStr_SOL_PNPIPE);
        }
    }




    static if(!is(typeof(SOL_BLUETOOTH))) {
        private enum enumMixinStr_SOL_BLUETOOTH = `enum SOL_BLUETOOTH = 274;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_BLUETOOTH); }))) {
            mixin(enumMixinStr_SOL_BLUETOOTH);
        }
    }




    static if(!is(typeof(SOL_PPPOL2TP))) {
        private enum enumMixinStr_SOL_PPPOL2TP = `enum SOL_PPPOL2TP = 273;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_PPPOL2TP); }))) {
            mixin(enumMixinStr_SOL_PPPOL2TP);
        }
    }




    static if(!is(typeof(SOL_RXRPC))) {
        private enum enumMixinStr_SOL_RXRPC = `enum SOL_RXRPC = 272;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_RXRPC); }))) {
            mixin(enumMixinStr_SOL_RXRPC);
        }
    }




    static if(!is(typeof(SOL_TIPC))) {
        private enum enumMixinStr_SOL_TIPC = `enum SOL_TIPC = 271;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_TIPC); }))) {
            mixin(enumMixinStr_SOL_TIPC);
        }
    }




    static if(!is(typeof(SOL_NETLINK))) {
        private enum enumMixinStr_SOL_NETLINK = `enum SOL_NETLINK = 270;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_NETLINK); }))) {
            mixin(enumMixinStr_SOL_NETLINK);
        }
    }




    static if(!is(typeof(SOL_DCCP))) {
        private enum enumMixinStr_SOL_DCCP = `enum SOL_DCCP = 269;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_DCCP); }))) {
            mixin(enumMixinStr_SOL_DCCP);
        }
    }




    static if(!is(typeof(SOL_LLC))) {
        private enum enumMixinStr_SOL_LLC = `enum SOL_LLC = 268;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_LLC); }))) {
            mixin(enumMixinStr_SOL_LLC);
        }
    }




    static if(!is(typeof(SOL_NETBEUI))) {
        private enum enumMixinStr_SOL_NETBEUI = `enum SOL_NETBEUI = 267;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_NETBEUI); }))) {
            mixin(enumMixinStr_SOL_NETBEUI);
        }
    }




    static if(!is(typeof(SOL_IRDA))) {
        private enum enumMixinStr_SOL_IRDA = `enum SOL_IRDA = 266;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_IRDA); }))) {
            mixin(enumMixinStr_SOL_IRDA);
        }
    }




    static if(!is(typeof(SOL_AAL))) {
        private enum enumMixinStr_SOL_AAL = `enum SOL_AAL = 265;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_AAL); }))) {
            mixin(enumMixinStr_SOL_AAL);
        }
    }




    static if(!is(typeof(SOL_ATM))) {
        private enum enumMixinStr_SOL_ATM = `enum SOL_ATM = 264;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_ATM); }))) {
            mixin(enumMixinStr_SOL_ATM);
        }
    }




    static if(!is(typeof(SOL_PACKET))) {
        private enum enumMixinStr_SOL_PACKET = `enum SOL_PACKET = 263;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_PACKET); }))) {
            mixin(enumMixinStr_SOL_PACKET);
        }
    }




    static if(!is(typeof(SOL_X25))) {
        private enum enumMixinStr_SOL_X25 = `enum SOL_X25 = 262;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_X25); }))) {
            mixin(enumMixinStr_SOL_X25);
        }
    }




    static if(!is(typeof(__S16_TYPE))) {
        private enum enumMixinStr___S16_TYPE = `enum __S16_TYPE = short int;`;
        static if(is(typeof({ mixin(enumMixinStr___S16_TYPE); }))) {
            mixin(enumMixinStr___S16_TYPE);
        }
    }




    static if(!is(typeof(__U16_TYPE))) {
        private enum enumMixinStr___U16_TYPE = `enum __U16_TYPE = unsigned short int;`;
        static if(is(typeof({ mixin(enumMixinStr___U16_TYPE); }))) {
            mixin(enumMixinStr___U16_TYPE);
        }
    }




    static if(!is(typeof(__S32_TYPE))) {
        private enum enumMixinStr___S32_TYPE = `enum __S32_TYPE = int;`;
        static if(is(typeof({ mixin(enumMixinStr___S32_TYPE); }))) {
            mixin(enumMixinStr___S32_TYPE);
        }
    }




    static if(!is(typeof(__U32_TYPE))) {
        private enum enumMixinStr___U32_TYPE = `enum __U32_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___U32_TYPE); }))) {
            mixin(enumMixinStr___U32_TYPE);
        }
    }




    static if(!is(typeof(__SLONGWORD_TYPE))) {
        private enum enumMixinStr___SLONGWORD_TYPE = `enum __SLONGWORD_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SLONGWORD_TYPE); }))) {
            mixin(enumMixinStr___SLONGWORD_TYPE);
        }
    }




    static if(!is(typeof(__ULONGWORD_TYPE))) {
        private enum enumMixinStr___ULONGWORD_TYPE = `enum __ULONGWORD_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___ULONGWORD_TYPE); }))) {
            mixin(enumMixinStr___ULONGWORD_TYPE);
        }
    }




    static if(!is(typeof(SOL_DECNET))) {
        private enum enumMixinStr_SOL_DECNET = `enum SOL_DECNET = 261;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_DECNET); }))) {
            mixin(enumMixinStr_SOL_DECNET);
        }
    }




    static if(!is(typeof(SOL_RAW))) {
        private enum enumMixinStr_SOL_RAW = `enum SOL_RAW = 255;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_RAW); }))) {
            mixin(enumMixinStr_SOL_RAW);
        }
    }




    static if(!is(typeof(__SQUAD_TYPE))) {
        private enum enumMixinStr___SQUAD_TYPE = `enum __SQUAD_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SQUAD_TYPE); }))) {
            mixin(enumMixinStr___SQUAD_TYPE);
        }
    }




    static if(!is(typeof(__UQUAD_TYPE))) {
        private enum enumMixinStr___UQUAD_TYPE = `enum __UQUAD_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___UQUAD_TYPE); }))) {
            mixin(enumMixinStr___UQUAD_TYPE);
        }
    }




    static if(!is(typeof(__SWORD_TYPE))) {
        private enum enumMixinStr___SWORD_TYPE = `enum __SWORD_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SWORD_TYPE); }))) {
            mixin(enumMixinStr___SWORD_TYPE);
        }
    }




    static if(!is(typeof(__UWORD_TYPE))) {
        private enum enumMixinStr___UWORD_TYPE = `enum __UWORD_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___UWORD_TYPE); }))) {
            mixin(enumMixinStr___UWORD_TYPE);
        }
    }




    static if(!is(typeof(__SLONG32_TYPE))) {
        private enum enumMixinStr___SLONG32_TYPE = `enum __SLONG32_TYPE = int;`;
        static if(is(typeof({ mixin(enumMixinStr___SLONG32_TYPE); }))) {
            mixin(enumMixinStr___SLONG32_TYPE);
        }
    }




    static if(!is(typeof(__ULONG32_TYPE))) {
        private enum enumMixinStr___ULONG32_TYPE = `enum __ULONG32_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___ULONG32_TYPE); }))) {
            mixin(enumMixinStr___ULONG32_TYPE);
        }
    }




    static if(!is(typeof(__S64_TYPE))) {
        private enum enumMixinStr___S64_TYPE = `enum __S64_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___S64_TYPE); }))) {
            mixin(enumMixinStr___S64_TYPE);
        }
    }




    static if(!is(typeof(__U64_TYPE))) {
        private enum enumMixinStr___U64_TYPE = `enum __U64_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___U64_TYPE); }))) {
            mixin(enumMixinStr___U64_TYPE);
        }
    }




    static if(!is(typeof(__STD_TYPE))) {
        private enum enumMixinStr___STD_TYPE = `enum __STD_TYPE = typedef;`;
        static if(is(typeof({ mixin(enumMixinStr___STD_TYPE); }))) {
            mixin(enumMixinStr___STD_TYPE);
        }
    }




    static if(!is(typeof(AF_MAX))) {
        private enum enumMixinStr_AF_MAX = `enum AF_MAX = PF_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_MAX); }))) {
            mixin(enumMixinStr_AF_MAX);
        }
    }




    static if(!is(typeof(AF_XDP))) {
        private enum enumMixinStr_AF_XDP = `enum AF_XDP = PF_XDP;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_XDP); }))) {
            mixin(enumMixinStr_AF_XDP);
        }
    }




    static if(!is(typeof(AF_SMC))) {
        private enum enumMixinStr_AF_SMC = `enum AF_SMC = PF_SMC;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_SMC); }))) {
            mixin(enumMixinStr_AF_SMC);
        }
    }




    static if(!is(typeof(AF_QIPCRTR))) {
        private enum enumMixinStr_AF_QIPCRTR = `enum AF_QIPCRTR = PF_QIPCRTR;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_QIPCRTR); }))) {
            mixin(enumMixinStr_AF_QIPCRTR);
        }
    }




    static if(!is(typeof(AF_KCM))) {
        private enum enumMixinStr_AF_KCM = `enum AF_KCM = PF_KCM;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_KCM); }))) {
            mixin(enumMixinStr_AF_KCM);
        }
    }




    static if(!is(typeof(AF_VSOCK))) {
        private enum enumMixinStr_AF_VSOCK = `enum AF_VSOCK = PF_VSOCK;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_VSOCK); }))) {
            mixin(enumMixinStr_AF_VSOCK);
        }
    }




    static if(!is(typeof(AF_NFC))) {
        private enum enumMixinStr_AF_NFC = `enum AF_NFC = PF_NFC;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_NFC); }))) {
            mixin(enumMixinStr_AF_NFC);
        }
    }




    static if(!is(typeof(AF_ALG))) {
        private enum enumMixinStr_AF_ALG = `enum AF_ALG = PF_ALG;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_ALG); }))) {
            mixin(enumMixinStr_AF_ALG);
        }
    }




    static if(!is(typeof(AF_CAIF))) {
        private enum enumMixinStr_AF_CAIF = `enum AF_CAIF = PF_CAIF;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_CAIF); }))) {
            mixin(enumMixinStr_AF_CAIF);
        }
    }




    static if(!is(typeof(AF_IEEE802154))) {
        private enum enumMixinStr_AF_IEEE802154 = `enum AF_IEEE802154 = PF_IEEE802154;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_IEEE802154); }))) {
            mixin(enumMixinStr_AF_IEEE802154);
        }
    }




    static if(!is(typeof(AF_PHONET))) {
        private enum enumMixinStr_AF_PHONET = `enum AF_PHONET = PF_PHONET;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_PHONET); }))) {
            mixin(enumMixinStr_AF_PHONET);
        }
    }




    static if(!is(typeof(AF_ISDN))) {
        private enum enumMixinStr_AF_ISDN = `enum AF_ISDN = PF_ISDN;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_ISDN); }))) {
            mixin(enumMixinStr_AF_ISDN);
        }
    }




    static if(!is(typeof(AF_RXRPC))) {
        private enum enumMixinStr_AF_RXRPC = `enum AF_RXRPC = PF_RXRPC;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_RXRPC); }))) {
            mixin(enumMixinStr_AF_RXRPC);
        }
    }




    static if(!is(typeof(AF_IUCV))) {
        private enum enumMixinStr_AF_IUCV = `enum AF_IUCV = PF_IUCV;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_IUCV); }))) {
            mixin(enumMixinStr_AF_IUCV);
        }
    }




    static if(!is(typeof(AF_BLUETOOTH))) {
        private enum enumMixinStr_AF_BLUETOOTH = `enum AF_BLUETOOTH = PF_BLUETOOTH;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_BLUETOOTH); }))) {
            mixin(enumMixinStr_AF_BLUETOOTH);
        }
    }




    static if(!is(typeof(AF_TIPC))) {
        private enum enumMixinStr_AF_TIPC = `enum AF_TIPC = PF_TIPC;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_TIPC); }))) {
            mixin(enumMixinStr_AF_TIPC);
        }
    }




    static if(!is(typeof(AF_CAN))) {
        private enum enumMixinStr_AF_CAN = `enum AF_CAN = PF_CAN;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_CAN); }))) {
            mixin(enumMixinStr_AF_CAN);
        }
    }




    static if(!is(typeof(AF_MPLS))) {
        private enum enumMixinStr_AF_MPLS = `enum AF_MPLS = PF_MPLS;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_MPLS); }))) {
            mixin(enumMixinStr_AF_MPLS);
        }
    }




    static if(!is(typeof(AF_IB))) {
        private enum enumMixinStr_AF_IB = `enum AF_IB = PF_IB;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_IB); }))) {
            mixin(enumMixinStr_AF_IB);
        }
    }




    static if(!is(typeof(AF_LLC))) {
        private enum enumMixinStr_AF_LLC = `enum AF_LLC = PF_LLC;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_LLC); }))) {
            mixin(enumMixinStr_AF_LLC);
        }
    }




    static if(!is(typeof(AF_WANPIPE))) {
        private enum enumMixinStr_AF_WANPIPE = `enum AF_WANPIPE = PF_WANPIPE;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_WANPIPE); }))) {
            mixin(enumMixinStr_AF_WANPIPE);
        }
    }




    static if(!is(typeof(AF_PPPOX))) {
        private enum enumMixinStr_AF_PPPOX = `enum AF_PPPOX = PF_PPPOX;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_PPPOX); }))) {
            mixin(enumMixinStr_AF_PPPOX);
        }
    }




    static if(!is(typeof(AF_IRDA))) {
        private enum enumMixinStr_AF_IRDA = `enum AF_IRDA = PF_IRDA;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_IRDA); }))) {
            mixin(enumMixinStr_AF_IRDA);
        }
    }




    static if(!is(typeof(AF_SNA))) {
        private enum enumMixinStr_AF_SNA = `enum AF_SNA = PF_SNA;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_SNA); }))) {
            mixin(enumMixinStr_AF_SNA);
        }
    }




    static if(!is(typeof(AF_RDS))) {
        private enum enumMixinStr_AF_RDS = `enum AF_RDS = PF_RDS;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_RDS); }))) {
            mixin(enumMixinStr_AF_RDS);
        }
    }




    static if(!is(typeof(AF_ATMSVC))) {
        private enum enumMixinStr_AF_ATMSVC = `enum AF_ATMSVC = PF_ATMSVC;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_ATMSVC); }))) {
            mixin(enumMixinStr_AF_ATMSVC);
        }
    }




    static if(!is(typeof(AF_ECONET))) {
        private enum enumMixinStr_AF_ECONET = `enum AF_ECONET = PF_ECONET;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_ECONET); }))) {
            mixin(enumMixinStr_AF_ECONET);
        }
    }




    static if(!is(typeof(AF_ASH))) {
        private enum enumMixinStr_AF_ASH = `enum AF_ASH = PF_ASH;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_ASH); }))) {
            mixin(enumMixinStr_AF_ASH);
        }
    }




    static if(!is(typeof(AF_PACKET))) {
        private enum enumMixinStr_AF_PACKET = `enum AF_PACKET = PF_PACKET;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_PACKET); }))) {
            mixin(enumMixinStr_AF_PACKET);
        }
    }




    static if(!is(typeof(AF_ROUTE))) {
        private enum enumMixinStr_AF_ROUTE = `enum AF_ROUTE = PF_ROUTE;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_ROUTE); }))) {
            mixin(enumMixinStr_AF_ROUTE);
        }
    }




    static if(!is(typeof(AF_NETLINK))) {
        private enum enumMixinStr_AF_NETLINK = `enum AF_NETLINK = PF_NETLINK;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_NETLINK); }))) {
            mixin(enumMixinStr_AF_NETLINK);
        }
    }




    static if(!is(typeof(AF_KEY))) {
        private enum enumMixinStr_AF_KEY = `enum AF_KEY = PF_KEY;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_KEY); }))) {
            mixin(enumMixinStr_AF_KEY);
        }
    }




    static if(!is(typeof(AF_SECURITY))) {
        private enum enumMixinStr_AF_SECURITY = `enum AF_SECURITY = PF_SECURITY;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_SECURITY); }))) {
            mixin(enumMixinStr_AF_SECURITY);
        }
    }




    static if(!is(typeof(AF_NETBEUI))) {
        private enum enumMixinStr_AF_NETBEUI = `enum AF_NETBEUI = PF_NETBEUI;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_NETBEUI); }))) {
            mixin(enumMixinStr_AF_NETBEUI);
        }
    }




    static if(!is(typeof(AF_DECnet))) {
        private enum enumMixinStr_AF_DECnet = `enum AF_DECnet = PF_DECnet;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_DECnet); }))) {
            mixin(enumMixinStr_AF_DECnet);
        }
    }




    static if(!is(typeof(AF_ROSE))) {
        private enum enumMixinStr_AF_ROSE = `enum AF_ROSE = PF_ROSE;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_ROSE); }))) {
            mixin(enumMixinStr_AF_ROSE);
        }
    }




    static if(!is(typeof(AF_INET6))) {
        private enum enumMixinStr_AF_INET6 = `enum AF_INET6 = PF_INET6;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_INET6); }))) {
            mixin(enumMixinStr_AF_INET6);
        }
    }




    static if(!is(typeof(AF_X25))) {
        private enum enumMixinStr_AF_X25 = `enum AF_X25 = PF_X25;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_X25); }))) {
            mixin(enumMixinStr_AF_X25);
        }
    }




    static if(!is(typeof(AF_ATMPVC))) {
        private enum enumMixinStr_AF_ATMPVC = `enum AF_ATMPVC = PF_ATMPVC;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_ATMPVC); }))) {
            mixin(enumMixinStr_AF_ATMPVC);
        }
    }




    static if(!is(typeof(AF_BRIDGE))) {
        private enum enumMixinStr_AF_BRIDGE = `enum AF_BRIDGE = PF_BRIDGE;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_BRIDGE); }))) {
            mixin(enumMixinStr_AF_BRIDGE);
        }
    }




    static if(!is(typeof(AF_NETROM))) {
        private enum enumMixinStr_AF_NETROM = `enum AF_NETROM = PF_NETROM;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_NETROM); }))) {
            mixin(enumMixinStr_AF_NETROM);
        }
    }




    static if(!is(typeof(AF_APPLETALK))) {
        private enum enumMixinStr_AF_APPLETALK = `enum AF_APPLETALK = PF_APPLETALK;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_APPLETALK); }))) {
            mixin(enumMixinStr_AF_APPLETALK);
        }
    }




    static if(!is(typeof(AF_IPX))) {
        private enum enumMixinStr_AF_IPX = `enum AF_IPX = PF_IPX;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_IPX); }))) {
            mixin(enumMixinStr_AF_IPX);
        }
    }




    static if(!is(typeof(AF_AX25))) {
        private enum enumMixinStr_AF_AX25 = `enum AF_AX25 = PF_AX25;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_AX25); }))) {
            mixin(enumMixinStr_AF_AX25);
        }
    }




    static if(!is(typeof(AF_INET))) {
        private enum enumMixinStr_AF_INET = `enum AF_INET = PF_INET;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_INET); }))) {
            mixin(enumMixinStr_AF_INET);
        }
    }




    static if(!is(typeof(AF_FILE))) {
        private enum enumMixinStr_AF_FILE = `enum AF_FILE = PF_FILE;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_FILE); }))) {
            mixin(enumMixinStr_AF_FILE);
        }
    }




    static if(!is(typeof(AF_UNIX))) {
        private enum enumMixinStr_AF_UNIX = `enum AF_UNIX = PF_UNIX;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_UNIX); }))) {
            mixin(enumMixinStr_AF_UNIX);
        }
    }




    static if(!is(typeof(AF_LOCAL))) {
        private enum enumMixinStr_AF_LOCAL = `enum AF_LOCAL = PF_LOCAL;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_LOCAL); }))) {
            mixin(enumMixinStr_AF_LOCAL);
        }
    }




    static if(!is(typeof(AF_UNSPEC))) {
        private enum enumMixinStr_AF_UNSPEC = `enum AF_UNSPEC = PF_UNSPEC;`;
        static if(is(typeof({ mixin(enumMixinStr_AF_UNSPEC); }))) {
            mixin(enumMixinStr_AF_UNSPEC);
        }
    }




    static if(!is(typeof(PF_MAX))) {
        private enum enumMixinStr_PF_MAX = `enum PF_MAX = 45;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_MAX); }))) {
            mixin(enumMixinStr_PF_MAX);
        }
    }




    static if(!is(typeof(PF_XDP))) {
        private enum enumMixinStr_PF_XDP = `enum PF_XDP = 44;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_XDP); }))) {
            mixin(enumMixinStr_PF_XDP);
        }
    }




    static if(!is(typeof(PF_SMC))) {
        private enum enumMixinStr_PF_SMC = `enum PF_SMC = 43;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_SMC); }))) {
            mixin(enumMixinStr_PF_SMC);
        }
    }




    static if(!is(typeof(PF_QIPCRTR))) {
        private enum enumMixinStr_PF_QIPCRTR = `enum PF_QIPCRTR = 42;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_QIPCRTR); }))) {
            mixin(enumMixinStr_PF_QIPCRTR);
        }
    }




    static if(!is(typeof(PF_KCM))) {
        private enum enumMixinStr_PF_KCM = `enum PF_KCM = 41;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_KCM); }))) {
            mixin(enumMixinStr_PF_KCM);
        }
    }




    static if(!is(typeof(PF_VSOCK))) {
        private enum enumMixinStr_PF_VSOCK = `enum PF_VSOCK = 40;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_VSOCK); }))) {
            mixin(enumMixinStr_PF_VSOCK);
        }
    }




    static if(!is(typeof(PF_NFC))) {
        private enum enumMixinStr_PF_NFC = `enum PF_NFC = 39;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_NFC); }))) {
            mixin(enumMixinStr_PF_NFC);
        }
    }




    static if(!is(typeof(PF_ALG))) {
        private enum enumMixinStr_PF_ALG = `enum PF_ALG = 38;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_ALG); }))) {
            mixin(enumMixinStr_PF_ALG);
        }
    }




    static if(!is(typeof(PF_CAIF))) {
        private enum enumMixinStr_PF_CAIF = `enum PF_CAIF = 37;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_CAIF); }))) {
            mixin(enumMixinStr_PF_CAIF);
        }
    }




    static if(!is(typeof(PF_IEEE802154))) {
        private enum enumMixinStr_PF_IEEE802154 = `enum PF_IEEE802154 = 36;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_IEEE802154); }))) {
            mixin(enumMixinStr_PF_IEEE802154);
        }
    }




    static if(!is(typeof(PF_PHONET))) {
        private enum enumMixinStr_PF_PHONET = `enum PF_PHONET = 35;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_PHONET); }))) {
            mixin(enumMixinStr_PF_PHONET);
        }
    }




    static if(!is(typeof(PF_ISDN))) {
        private enum enumMixinStr_PF_ISDN = `enum PF_ISDN = 34;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_ISDN); }))) {
            mixin(enumMixinStr_PF_ISDN);
        }
    }




    static if(!is(typeof(PF_RXRPC))) {
        private enum enumMixinStr_PF_RXRPC = `enum PF_RXRPC = 33;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_RXRPC); }))) {
            mixin(enumMixinStr_PF_RXRPC);
        }
    }




    static if(!is(typeof(PF_IUCV))) {
        private enum enumMixinStr_PF_IUCV = `enum PF_IUCV = 32;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_IUCV); }))) {
            mixin(enumMixinStr_PF_IUCV);
        }
    }




    static if(!is(typeof(PF_BLUETOOTH))) {
        private enum enumMixinStr_PF_BLUETOOTH = `enum PF_BLUETOOTH = 31;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_BLUETOOTH); }))) {
            mixin(enumMixinStr_PF_BLUETOOTH);
        }
    }




    static if(!is(typeof(PF_TIPC))) {
        private enum enumMixinStr_PF_TIPC = `enum PF_TIPC = 30;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_TIPC); }))) {
            mixin(enumMixinStr_PF_TIPC);
        }
    }




    static if(!is(typeof(PF_CAN))) {
        private enum enumMixinStr_PF_CAN = `enum PF_CAN = 29;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_CAN); }))) {
            mixin(enumMixinStr_PF_CAN);
        }
    }




    static if(!is(typeof(PF_MPLS))) {
        private enum enumMixinStr_PF_MPLS = `enum PF_MPLS = 28;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_MPLS); }))) {
            mixin(enumMixinStr_PF_MPLS);
        }
    }




    static if(!is(typeof(PF_IB))) {
        private enum enumMixinStr_PF_IB = `enum PF_IB = 27;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_IB); }))) {
            mixin(enumMixinStr_PF_IB);
        }
    }




    static if(!is(typeof(PF_LLC))) {
        private enum enumMixinStr_PF_LLC = `enum PF_LLC = 26;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_LLC); }))) {
            mixin(enumMixinStr_PF_LLC);
        }
    }




    static if(!is(typeof(PF_WANPIPE))) {
        private enum enumMixinStr_PF_WANPIPE = `enum PF_WANPIPE = 25;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_WANPIPE); }))) {
            mixin(enumMixinStr_PF_WANPIPE);
        }
    }




    static if(!is(typeof(PF_PPPOX))) {
        private enum enumMixinStr_PF_PPPOX = `enum PF_PPPOX = 24;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_PPPOX); }))) {
            mixin(enumMixinStr_PF_PPPOX);
        }
    }




    static if(!is(typeof(PF_IRDA))) {
        private enum enumMixinStr_PF_IRDA = `enum PF_IRDA = 23;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_IRDA); }))) {
            mixin(enumMixinStr_PF_IRDA);
        }
    }




    static if(!is(typeof(PF_SNA))) {
        private enum enumMixinStr_PF_SNA = `enum PF_SNA = 22;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_SNA); }))) {
            mixin(enumMixinStr_PF_SNA);
        }
    }




    static if(!is(typeof(PF_RDS))) {
        private enum enumMixinStr_PF_RDS = `enum PF_RDS = 21;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_RDS); }))) {
            mixin(enumMixinStr_PF_RDS);
        }
    }




    static if(!is(typeof(PF_ATMSVC))) {
        private enum enumMixinStr_PF_ATMSVC = `enum PF_ATMSVC = 20;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_ATMSVC); }))) {
            mixin(enumMixinStr_PF_ATMSVC);
        }
    }




    static if(!is(typeof(PF_ECONET))) {
        private enum enumMixinStr_PF_ECONET = `enum PF_ECONET = 19;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_ECONET); }))) {
            mixin(enumMixinStr_PF_ECONET);
        }
    }




    static if(!is(typeof(PF_ASH))) {
        private enum enumMixinStr_PF_ASH = `enum PF_ASH = 18;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_ASH); }))) {
            mixin(enumMixinStr_PF_ASH);
        }
    }




    static if(!is(typeof(PF_PACKET))) {
        private enum enumMixinStr_PF_PACKET = `enum PF_PACKET = 17;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_PACKET); }))) {
            mixin(enumMixinStr_PF_PACKET);
        }
    }




    static if(!is(typeof(PF_ROUTE))) {
        private enum enumMixinStr_PF_ROUTE = `enum PF_ROUTE = PF_NETLINK;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_ROUTE); }))) {
            mixin(enumMixinStr_PF_ROUTE);
        }
    }




    static if(!is(typeof(PF_NETLINK))) {
        private enum enumMixinStr_PF_NETLINK = `enum PF_NETLINK = 16;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_NETLINK); }))) {
            mixin(enumMixinStr_PF_NETLINK);
        }
    }




    static if(!is(typeof(PF_KEY))) {
        private enum enumMixinStr_PF_KEY = `enum PF_KEY = 15;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_KEY); }))) {
            mixin(enumMixinStr_PF_KEY);
        }
    }




    static if(!is(typeof(PF_SECURITY))) {
        private enum enumMixinStr_PF_SECURITY = `enum PF_SECURITY = 14;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_SECURITY); }))) {
            mixin(enumMixinStr_PF_SECURITY);
        }
    }




    static if(!is(typeof(PF_NETBEUI))) {
        private enum enumMixinStr_PF_NETBEUI = `enum PF_NETBEUI = 13;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_NETBEUI); }))) {
            mixin(enumMixinStr_PF_NETBEUI);
        }
    }




    static if(!is(typeof(PF_DECnet))) {
        private enum enumMixinStr_PF_DECnet = `enum PF_DECnet = 12;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_DECnet); }))) {
            mixin(enumMixinStr_PF_DECnet);
        }
    }




    static if(!is(typeof(PF_ROSE))) {
        private enum enumMixinStr_PF_ROSE = `enum PF_ROSE = 11;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_ROSE); }))) {
            mixin(enumMixinStr_PF_ROSE);
        }
    }




    static if(!is(typeof(PF_INET6))) {
        private enum enumMixinStr_PF_INET6 = `enum PF_INET6 = 10;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_INET6); }))) {
            mixin(enumMixinStr_PF_INET6);
        }
    }




    static if(!is(typeof(PF_X25))) {
        private enum enumMixinStr_PF_X25 = `enum PF_X25 = 9;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_X25); }))) {
            mixin(enumMixinStr_PF_X25);
        }
    }




    static if(!is(typeof(PF_ATMPVC))) {
        private enum enumMixinStr_PF_ATMPVC = `enum PF_ATMPVC = 8;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_ATMPVC); }))) {
            mixin(enumMixinStr_PF_ATMPVC);
        }
    }




    static if(!is(typeof(PF_BRIDGE))) {
        private enum enumMixinStr_PF_BRIDGE = `enum PF_BRIDGE = 7;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_BRIDGE); }))) {
            mixin(enumMixinStr_PF_BRIDGE);
        }
    }




    static if(!is(typeof(PF_NETROM))) {
        private enum enumMixinStr_PF_NETROM = `enum PF_NETROM = 6;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_NETROM); }))) {
            mixin(enumMixinStr_PF_NETROM);
        }
    }




    static if(!is(typeof(PF_APPLETALK))) {
        private enum enumMixinStr_PF_APPLETALK = `enum PF_APPLETALK = 5;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_APPLETALK); }))) {
            mixin(enumMixinStr_PF_APPLETALK);
        }
    }




    static if(!is(typeof(PF_IPX))) {
        private enum enumMixinStr_PF_IPX = `enum PF_IPX = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_IPX); }))) {
            mixin(enumMixinStr_PF_IPX);
        }
    }




    static if(!is(typeof(PF_AX25))) {
        private enum enumMixinStr_PF_AX25 = `enum PF_AX25 = 3;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_AX25); }))) {
            mixin(enumMixinStr_PF_AX25);
        }
    }




    static if(!is(typeof(PF_INET))) {
        private enum enumMixinStr_PF_INET = `enum PF_INET = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_INET); }))) {
            mixin(enumMixinStr_PF_INET);
        }
    }




    static if(!is(typeof(PF_FILE))) {
        private enum enumMixinStr_PF_FILE = `enum PF_FILE = PF_LOCAL;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_FILE); }))) {
            mixin(enumMixinStr_PF_FILE);
        }
    }




    static if(!is(typeof(PF_UNIX))) {
        private enum enumMixinStr_PF_UNIX = `enum PF_UNIX = PF_LOCAL;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_UNIX); }))) {
            mixin(enumMixinStr_PF_UNIX);
        }
    }




    static if(!is(typeof(PF_LOCAL))) {
        private enum enumMixinStr_PF_LOCAL = `enum PF_LOCAL = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_LOCAL); }))) {
            mixin(enumMixinStr_PF_LOCAL);
        }
    }




    static if(!is(typeof(PF_UNSPEC))) {
        private enum enumMixinStr_PF_UNSPEC = `enum PF_UNSPEC = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_PF_UNSPEC); }))) {
            mixin(enumMixinStr_PF_UNSPEC);
        }
    }
    static if(!is(typeof(_SS_SIZE))) {
        private enum enumMixinStr__SS_SIZE = `enum _SS_SIZE = 128;`;
        static if(is(typeof({ mixin(enumMixinStr__SS_SIZE); }))) {
            mixin(enumMixinStr__SS_SIZE);
        }
    }




    static if(!is(typeof(__SOCKADDR_COMMON_SIZE))) {
        private enum enumMixinStr___SOCKADDR_COMMON_SIZE = `enum __SOCKADDR_COMMON_SIZE = ( ( unsigned short int ) .sizeof );`;
        static if(is(typeof({ mixin(enumMixinStr___SOCKADDR_COMMON_SIZE); }))) {
            mixin(enumMixinStr___SOCKADDR_COMMON_SIZE);
        }
    }






    static if(!is(typeof(_BITS_SOCKADDR_H))) {
        private enum enumMixinStr__BITS_SOCKADDR_H = `enum _BITS_SOCKADDR_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_SOCKADDR_H); }))) {
            mixin(enumMixinStr__BITS_SOCKADDR_H);
        }
    }
    static if(!is(typeof(__have_pthread_attr_t))) {
        private enum enumMixinStr___have_pthread_attr_t = `enum __have_pthread_attr_t = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___have_pthread_attr_t); }))) {
            mixin(enumMixinStr___have_pthread_attr_t);
        }
    }




    static if(!is(typeof(_BITS_PTHREADTYPES_COMMON_H))) {
        private enum enumMixinStr__BITS_PTHREADTYPES_COMMON_H = `enum _BITS_PTHREADTYPES_COMMON_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_PTHREADTYPES_COMMON_H); }))) {
            mixin(enumMixinStr__BITS_PTHREADTYPES_COMMON_H);
        }
    }
    static if(!is(typeof(__SIZEOF_PTHREAD_BARRIERATTR_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_BARRIERATTR_T = `enum __SIZEOF_PTHREAD_BARRIERATTR_T = 4;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_BARRIERATTR_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_BARRIERATTR_T);
        }
    }




    static if(!is(typeof(__SIZEOF_PTHREAD_RWLOCKATTR_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_RWLOCKATTR_T = `enum __SIZEOF_PTHREAD_RWLOCKATTR_T = 8;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_RWLOCKATTR_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_RWLOCKATTR_T);
        }
    }




    static if(!is(typeof(__SIZEOF_PTHREAD_CONDATTR_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_CONDATTR_T = `enum __SIZEOF_PTHREAD_CONDATTR_T = 4;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_CONDATTR_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_CONDATTR_T);
        }
    }




    static if(!is(typeof(_BITS_TYPES___LOCALE_T_H))) {
        private enum enumMixinStr__BITS_TYPES___LOCALE_T_H = `enum _BITS_TYPES___LOCALE_T_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_TYPES___LOCALE_T_H); }))) {
            mixin(enumMixinStr__BITS_TYPES___LOCALE_T_H);
        }
    }




    static if(!is(typeof(__SIZEOF_PTHREAD_COND_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_COND_T = `enum __SIZEOF_PTHREAD_COND_T = 48;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_COND_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_COND_T);
        }
    }




    static if(!is(typeof(__SIZEOF_PTHREAD_MUTEXATTR_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_MUTEXATTR_T = `enum __SIZEOF_PTHREAD_MUTEXATTR_T = 4;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_MUTEXATTR_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_MUTEXATTR_T);
        }
    }






    static if(!is(typeof(_SIGSET_NWORDS))) {
        private enum enumMixinStr__SIGSET_NWORDS = `enum _SIGSET_NWORDS = ( 1024 / ( 8 * ( unsigned long int ) .sizeof ) );`;
        static if(is(typeof({ mixin(enumMixinStr__SIGSET_NWORDS); }))) {
            mixin(enumMixinStr__SIGSET_NWORDS);
        }
    }




    static if(!is(typeof(__SIZEOF_PTHREAD_BARRIER_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_BARRIER_T = `enum __SIZEOF_PTHREAD_BARRIER_T = 32;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_BARRIER_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_BARRIER_T);
        }
    }




    static if(!is(typeof(__SIZEOF_PTHREAD_RWLOCK_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_RWLOCK_T = `enum __SIZEOF_PTHREAD_RWLOCK_T = 56;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_RWLOCK_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_RWLOCK_T);
        }
    }




    static if(!is(typeof(__SIZEOF_PTHREAD_ATTR_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_ATTR_T = `enum __SIZEOF_PTHREAD_ATTR_T = 56;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_ATTR_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_ATTR_T);
        }
    }




    static if(!is(typeof(__clock_t_defined))) {
        private enum enumMixinStr___clock_t_defined = `enum __clock_t_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___clock_t_defined); }))) {
            mixin(enumMixinStr___clock_t_defined);
        }
    }




    static if(!is(typeof(__SIZEOF_PTHREAD_MUTEX_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_MUTEX_T = `enum __SIZEOF_PTHREAD_MUTEX_T = 40;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_MUTEX_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_MUTEX_T);
        }
    }




    static if(!is(typeof(_BITS_PTHREADTYPES_ARCH_H))) {
        private enum enumMixinStr__BITS_PTHREADTYPES_ARCH_H = `enum _BITS_PTHREADTYPES_ARCH_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_PTHREADTYPES_ARCH_H); }))) {
            mixin(enumMixinStr__BITS_PTHREADTYPES_ARCH_H);
        }
    }




    static if(!is(typeof(__clockid_t_defined))) {
        private enum enumMixinStr___clockid_t_defined = `enum __clockid_t_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___clockid_t_defined); }))) {
            mixin(enumMixinStr___clockid_t_defined);
        }
    }




    static if(!is(typeof(__LDOUBLE_REDIRECTS_TO_FLOAT128_ABI))) {
        private enum enumMixinStr___LDOUBLE_REDIRECTS_TO_FLOAT128_ABI = `enum __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___LDOUBLE_REDIRECTS_TO_FLOAT128_ABI); }))) {
            mixin(enumMixinStr___LDOUBLE_REDIRECTS_TO_FLOAT128_ABI);
        }
    }




    static if(!is(typeof(__GLIBC_USE_IEC_60559_TYPES_EXT))) {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_TYPES_EXT = `enum __GLIBC_USE_IEC_60559_TYPES_EXT = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_IEC_60559_TYPES_EXT); }))) {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_TYPES_EXT);
        }
    }




    static if(!is(typeof(_BITS_TYPES_LOCALE_T_H))) {
        private enum enumMixinStr__BITS_TYPES_LOCALE_T_H = `enum _BITS_TYPES_LOCALE_T_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_TYPES_LOCALE_T_H); }))) {
            mixin(enumMixinStr__BITS_TYPES_LOCALE_T_H);
        }
    }




    static if(!is(typeof(__GLIBC_USE_IEC_60559_FUNCS_EXT_C2X))) {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT_C2X = `enum __GLIBC_USE_IEC_60559_FUNCS_EXT_C2X = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT_C2X); }))) {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT_C2X);
        }
    }




    static if(!is(typeof(__GLIBC_USE_IEC_60559_FUNCS_EXT))) {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT = `enum __GLIBC_USE_IEC_60559_FUNCS_EXT = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT); }))) {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT);
        }
    }




    static if(!is(typeof(__sigset_t_defined))) {
        private enum enumMixinStr___sigset_t_defined = `enum __sigset_t_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___sigset_t_defined); }))) {
            mixin(enumMixinStr___sigset_t_defined);
        }
    }




    static if(!is(typeof(__GLIBC_USE_IEC_60559_BFP_EXT_C2X))) {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT_C2X = `enum __GLIBC_USE_IEC_60559_BFP_EXT_C2X = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT_C2X); }))) {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT_C2X);
        }
    }




    static if(!is(typeof(__GLIBC_USE_IEC_60559_BFP_EXT))) {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT = `enum __GLIBC_USE_IEC_60559_BFP_EXT = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT); }))) {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT);
        }
    }




    static if(!is(typeof(__iovec_defined))) {
        private enum enumMixinStr___iovec_defined = `enum __iovec_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___iovec_defined); }))) {
            mixin(enumMixinStr___iovec_defined);
        }
    }




    static if(!is(typeof(__GLIBC_USE_LIB_EXT2))) {
        private enum enumMixinStr___GLIBC_USE_LIB_EXT2 = `enum __GLIBC_USE_LIB_EXT2 = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_LIB_EXT2); }))) {
            mixin(enumMixinStr___GLIBC_USE_LIB_EXT2);
        }
    }




    static if(!is(typeof(IPV6_RTHDR_TYPE_0))) {
        private enum enumMixinStr_IPV6_RTHDR_TYPE_0 = `enum IPV6_RTHDR_TYPE_0 = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_RTHDR_TYPE_0); }))) {
            mixin(enumMixinStr_IPV6_RTHDR_TYPE_0);
        }
    }




    static if(!is(typeof(__osockaddr_defined))) {
        private enum enumMixinStr___osockaddr_defined = `enum __osockaddr_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___osockaddr_defined); }))) {
            mixin(enumMixinStr___osockaddr_defined);
        }
    }




    static if(!is(typeof(IPV6_RTHDR_STRICT))) {
        private enum enumMixinStr_IPV6_RTHDR_STRICT = `enum IPV6_RTHDR_STRICT = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_RTHDR_STRICT); }))) {
            mixin(enumMixinStr_IPV6_RTHDR_STRICT);
        }
    }




    static if(!is(typeof(_STRUCT_TIMESPEC))) {
        private enum enumMixinStr__STRUCT_TIMESPEC = `enum _STRUCT_TIMESPEC = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__STRUCT_TIMESPEC); }))) {
            mixin(enumMixinStr__STRUCT_TIMESPEC);
        }
    }




    static if(!is(typeof(IPV6_RTHDR_LOOSE))) {
        private enum enumMixinStr_IPV6_RTHDR_LOOSE = `enum IPV6_RTHDR_LOOSE = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_RTHDR_LOOSE); }))) {
            mixin(enumMixinStr_IPV6_RTHDR_LOOSE);
        }
    }




    static if(!is(typeof(SOL_ICMPV6))) {
        private enum enumMixinStr_SOL_ICMPV6 = `enum SOL_ICMPV6 = 58;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_ICMPV6); }))) {
            mixin(enumMixinStr_SOL_ICMPV6);
        }
    }




    static if(!is(typeof(SOL_IPV6))) {
        private enum enumMixinStr_SOL_IPV6 = `enum SOL_IPV6 = 41;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_IPV6); }))) {
            mixin(enumMixinStr_SOL_IPV6);
        }
    }




    static if(!is(typeof(IPV6_PMTUDISC_OMIT))) {
        private enum enumMixinStr_IPV6_PMTUDISC_OMIT = `enum IPV6_PMTUDISC_OMIT = 5;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_PMTUDISC_OMIT); }))) {
            mixin(enumMixinStr_IPV6_PMTUDISC_OMIT);
        }
    }




    static if(!is(typeof(IPV6_PMTUDISC_INTERFACE))) {
        private enum enumMixinStr_IPV6_PMTUDISC_INTERFACE = `enum IPV6_PMTUDISC_INTERFACE = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_PMTUDISC_INTERFACE); }))) {
            mixin(enumMixinStr_IPV6_PMTUDISC_INTERFACE);
        }
    }




    static if(!is(typeof(IPV6_PMTUDISC_PROBE))) {
        private enum enumMixinStr_IPV6_PMTUDISC_PROBE = `enum IPV6_PMTUDISC_PROBE = 3;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_PMTUDISC_PROBE); }))) {
            mixin(enumMixinStr_IPV6_PMTUDISC_PROBE);
        }
    }




    static if(!is(typeof(IPV6_PMTUDISC_DO))) {
        private enum enumMixinStr_IPV6_PMTUDISC_DO = `enum IPV6_PMTUDISC_DO = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_PMTUDISC_DO); }))) {
            mixin(enumMixinStr_IPV6_PMTUDISC_DO);
        }
    }




    static if(!is(typeof(__timeval_defined))) {
        private enum enumMixinStr___timeval_defined = `enum __timeval_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___timeval_defined); }))) {
            mixin(enumMixinStr___timeval_defined);
        }
    }




    static if(!is(typeof(IPV6_PMTUDISC_WANT))) {
        private enum enumMixinStr_IPV6_PMTUDISC_WANT = `enum IPV6_PMTUDISC_WANT = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_PMTUDISC_WANT); }))) {
            mixin(enumMixinStr_IPV6_PMTUDISC_WANT);
        }
    }




    static if(!is(typeof(IPV6_PMTUDISC_DONT))) {
        private enum enumMixinStr_IPV6_PMTUDISC_DONT = `enum IPV6_PMTUDISC_DONT = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_PMTUDISC_DONT); }))) {
            mixin(enumMixinStr_IPV6_PMTUDISC_DONT);
        }
    }




    static if(!is(typeof(__time_t_defined))) {
        private enum enumMixinStr___time_t_defined = `enum __time_t_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___time_t_defined); }))) {
            mixin(enumMixinStr___time_t_defined);
        }
    }




    static if(!is(typeof(IPV6_RXDSTOPTS))) {
        private enum enumMixinStr_IPV6_RXDSTOPTS = `enum IPV6_RXDSTOPTS = IPV6_DSTOPTS;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_RXDSTOPTS); }))) {
            mixin(enumMixinStr_IPV6_RXDSTOPTS);
        }
    }




    static if(!is(typeof(IPV6_RXHOPOPTS))) {
        private enum enumMixinStr_IPV6_RXHOPOPTS = `enum IPV6_RXHOPOPTS = IPV6_HOPOPTS;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_RXHOPOPTS); }))) {
            mixin(enumMixinStr_IPV6_RXHOPOPTS);
        }
    }




    static if(!is(typeof(__timer_t_defined))) {
        private enum enumMixinStr___timer_t_defined = `enum __timer_t_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___timer_t_defined); }))) {
            mixin(enumMixinStr___timer_t_defined);
        }
    }




    static if(!is(typeof(IPV6_DROP_MEMBERSHIP))) {
        private enum enumMixinStr_IPV6_DROP_MEMBERSHIP = `enum IPV6_DROP_MEMBERSHIP = IPV6_LEAVE_GROUP;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_DROP_MEMBERSHIP); }))) {
            mixin(enumMixinStr_IPV6_DROP_MEMBERSHIP);
        }
    }




    static if(!is(typeof(IPV6_ADD_MEMBERSHIP))) {
        private enum enumMixinStr_IPV6_ADD_MEMBERSHIP = `enum IPV6_ADD_MEMBERSHIP = IPV6_JOIN_GROUP;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_ADD_MEMBERSHIP); }))) {
            mixin(enumMixinStr_IPV6_ADD_MEMBERSHIP);
        }
    }




    static if(!is(typeof(IPV6_FREEBIND))) {
        private enum enumMixinStr_IPV6_FREEBIND = `enum IPV6_FREEBIND = 78;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_FREEBIND); }))) {
            mixin(enumMixinStr_IPV6_FREEBIND);
        }
    }




    static if(!is(typeof(_BITS_TYPESIZES_H))) {
        private enum enumMixinStr__BITS_TYPESIZES_H = `enum _BITS_TYPESIZES_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_TYPESIZES_H); }))) {
            mixin(enumMixinStr__BITS_TYPESIZES_H);
        }
    }




    static if(!is(typeof(IPV6_RECVFRAGSIZE))) {
        private enum enumMixinStr_IPV6_RECVFRAGSIZE = `enum IPV6_RECVFRAGSIZE = 77;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_RECVFRAGSIZE); }))) {
            mixin(enumMixinStr_IPV6_RECVFRAGSIZE);
        }
    }




    static if(!is(typeof(__SYSCALL_SLONG_TYPE))) {
        private enum enumMixinStr___SYSCALL_SLONG_TYPE = `enum __SYSCALL_SLONG_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SYSCALL_SLONG_TYPE); }))) {
            mixin(enumMixinStr___SYSCALL_SLONG_TYPE);
        }
    }




    static if(!is(typeof(__SYSCALL_ULONG_TYPE))) {
        private enum enumMixinStr___SYSCALL_ULONG_TYPE = `enum __SYSCALL_ULONG_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SYSCALL_ULONG_TYPE); }))) {
            mixin(enumMixinStr___SYSCALL_ULONG_TYPE);
        }
    }




    static if(!is(typeof(__DEV_T_TYPE))) {
        private enum enumMixinStr___DEV_T_TYPE = `enum __DEV_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___DEV_T_TYPE); }))) {
            mixin(enumMixinStr___DEV_T_TYPE);
        }
    }




    static if(!is(typeof(__UID_T_TYPE))) {
        private enum enumMixinStr___UID_T_TYPE = `enum __UID_T_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___UID_T_TYPE); }))) {
            mixin(enumMixinStr___UID_T_TYPE);
        }
    }




    static if(!is(typeof(__GID_T_TYPE))) {
        private enum enumMixinStr___GID_T_TYPE = `enum __GID_T_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___GID_T_TYPE); }))) {
            mixin(enumMixinStr___GID_T_TYPE);
        }
    }




    static if(!is(typeof(__INO_T_TYPE))) {
        private enum enumMixinStr___INO_T_TYPE = `enum __INO_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___INO_T_TYPE); }))) {
            mixin(enumMixinStr___INO_T_TYPE);
        }
    }




    static if(!is(typeof(__INO64_T_TYPE))) {
        private enum enumMixinStr___INO64_T_TYPE = `enum __INO64_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___INO64_T_TYPE); }))) {
            mixin(enumMixinStr___INO64_T_TYPE);
        }
    }




    static if(!is(typeof(__MODE_T_TYPE))) {
        private enum enumMixinStr___MODE_T_TYPE = `enum __MODE_T_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___MODE_T_TYPE); }))) {
            mixin(enumMixinStr___MODE_T_TYPE);
        }
    }




    static if(!is(typeof(IPV6_UNICAST_IF))) {
        private enum enumMixinStr_IPV6_UNICAST_IF = `enum IPV6_UNICAST_IF = 76;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_UNICAST_IF); }))) {
            mixin(enumMixinStr_IPV6_UNICAST_IF);
        }
    }




    static if(!is(typeof(__NLINK_T_TYPE))) {
        private enum enumMixinStr___NLINK_T_TYPE = `enum __NLINK_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___NLINK_T_TYPE); }))) {
            mixin(enumMixinStr___NLINK_T_TYPE);
        }
    }




    static if(!is(typeof(__FSWORD_T_TYPE))) {
        private enum enumMixinStr___FSWORD_T_TYPE = `enum __FSWORD_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___FSWORD_T_TYPE); }))) {
            mixin(enumMixinStr___FSWORD_T_TYPE);
        }
    }




    static if(!is(typeof(__OFF_T_TYPE))) {
        private enum enumMixinStr___OFF_T_TYPE = `enum __OFF_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___OFF_T_TYPE); }))) {
            mixin(enumMixinStr___OFF_T_TYPE);
        }
    }




    static if(!is(typeof(__OFF64_T_TYPE))) {
        private enum enumMixinStr___OFF64_T_TYPE = `enum __OFF64_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___OFF64_T_TYPE); }))) {
            mixin(enumMixinStr___OFF64_T_TYPE);
        }
    }




    static if(!is(typeof(__PID_T_TYPE))) {
        private enum enumMixinStr___PID_T_TYPE = `enum __PID_T_TYPE = int;`;
        static if(is(typeof({ mixin(enumMixinStr___PID_T_TYPE); }))) {
            mixin(enumMixinStr___PID_T_TYPE);
        }
    }




    static if(!is(typeof(__RLIM_T_TYPE))) {
        private enum enumMixinStr___RLIM_T_TYPE = `enum __RLIM_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___RLIM_T_TYPE); }))) {
            mixin(enumMixinStr___RLIM_T_TYPE);
        }
    }




    static if(!is(typeof(__RLIM64_T_TYPE))) {
        private enum enumMixinStr___RLIM64_T_TYPE = `enum __RLIM64_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___RLIM64_T_TYPE); }))) {
            mixin(enumMixinStr___RLIM64_T_TYPE);
        }
    }




    static if(!is(typeof(__BLKCNT_T_TYPE))) {
        private enum enumMixinStr___BLKCNT_T_TYPE = `enum __BLKCNT_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___BLKCNT_T_TYPE); }))) {
            mixin(enumMixinStr___BLKCNT_T_TYPE);
        }
    }




    static if(!is(typeof(__BLKCNT64_T_TYPE))) {
        private enum enumMixinStr___BLKCNT64_T_TYPE = `enum __BLKCNT64_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___BLKCNT64_T_TYPE); }))) {
            mixin(enumMixinStr___BLKCNT64_T_TYPE);
        }
    }




    static if(!is(typeof(__FSBLKCNT_T_TYPE))) {
        private enum enumMixinStr___FSBLKCNT_T_TYPE = `enum __FSBLKCNT_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___FSBLKCNT_T_TYPE); }))) {
            mixin(enumMixinStr___FSBLKCNT_T_TYPE);
        }
    }




    static if(!is(typeof(__FSBLKCNT64_T_TYPE))) {
        private enum enumMixinStr___FSBLKCNT64_T_TYPE = `enum __FSBLKCNT64_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___FSBLKCNT64_T_TYPE); }))) {
            mixin(enumMixinStr___FSBLKCNT64_T_TYPE);
        }
    }




    static if(!is(typeof(__FSFILCNT_T_TYPE))) {
        private enum enumMixinStr___FSFILCNT_T_TYPE = `enum __FSFILCNT_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___FSFILCNT_T_TYPE); }))) {
            mixin(enumMixinStr___FSFILCNT_T_TYPE);
        }
    }




    static if(!is(typeof(__FSFILCNT64_T_TYPE))) {
        private enum enumMixinStr___FSFILCNT64_T_TYPE = `enum __FSFILCNT64_T_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___FSFILCNT64_T_TYPE); }))) {
            mixin(enumMixinStr___FSFILCNT64_T_TYPE);
        }
    }




    static if(!is(typeof(__ID_T_TYPE))) {
        private enum enumMixinStr___ID_T_TYPE = `enum __ID_T_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___ID_T_TYPE); }))) {
            mixin(enumMixinStr___ID_T_TYPE);
        }
    }




    static if(!is(typeof(__CLOCK_T_TYPE))) {
        private enum enumMixinStr___CLOCK_T_TYPE = `enum __CLOCK_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___CLOCK_T_TYPE); }))) {
            mixin(enumMixinStr___CLOCK_T_TYPE);
        }
    }




    static if(!is(typeof(__TIME_T_TYPE))) {
        private enum enumMixinStr___TIME_T_TYPE = `enum __TIME_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___TIME_T_TYPE); }))) {
            mixin(enumMixinStr___TIME_T_TYPE);
        }
    }




    static if(!is(typeof(__USECONDS_T_TYPE))) {
        private enum enumMixinStr___USECONDS_T_TYPE = `enum __USECONDS_T_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___USECONDS_T_TYPE); }))) {
            mixin(enumMixinStr___USECONDS_T_TYPE);
        }
    }




    static if(!is(typeof(__SUSECONDS_T_TYPE))) {
        private enum enumMixinStr___SUSECONDS_T_TYPE = `enum __SUSECONDS_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SUSECONDS_T_TYPE); }))) {
            mixin(enumMixinStr___SUSECONDS_T_TYPE);
        }
    }




    static if(!is(typeof(__SUSECONDS64_T_TYPE))) {
        private enum enumMixinStr___SUSECONDS64_T_TYPE = `enum __SUSECONDS64_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SUSECONDS64_T_TYPE); }))) {
            mixin(enumMixinStr___SUSECONDS64_T_TYPE);
        }
    }




    static if(!is(typeof(__DADDR_T_TYPE))) {
        private enum enumMixinStr___DADDR_T_TYPE = `enum __DADDR_T_TYPE = int;`;
        static if(is(typeof({ mixin(enumMixinStr___DADDR_T_TYPE); }))) {
            mixin(enumMixinStr___DADDR_T_TYPE);
        }
    }




    static if(!is(typeof(__KEY_T_TYPE))) {
        private enum enumMixinStr___KEY_T_TYPE = `enum __KEY_T_TYPE = int;`;
        static if(is(typeof({ mixin(enumMixinStr___KEY_T_TYPE); }))) {
            mixin(enumMixinStr___KEY_T_TYPE);
        }
    }




    static if(!is(typeof(__CLOCKID_T_TYPE))) {
        private enum enumMixinStr___CLOCKID_T_TYPE = `enum __CLOCKID_T_TYPE = int;`;
        static if(is(typeof({ mixin(enumMixinStr___CLOCKID_T_TYPE); }))) {
            mixin(enumMixinStr___CLOCKID_T_TYPE);
        }
    }




    static if(!is(typeof(__TIMER_T_TYPE))) {
        private enum enumMixinStr___TIMER_T_TYPE = `enum __TIMER_T_TYPE = void *;`;
        static if(is(typeof({ mixin(enumMixinStr___TIMER_T_TYPE); }))) {
            mixin(enumMixinStr___TIMER_T_TYPE);
        }
    }




    static if(!is(typeof(__BLKSIZE_T_TYPE))) {
        private enum enumMixinStr___BLKSIZE_T_TYPE = `enum __BLKSIZE_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___BLKSIZE_T_TYPE); }))) {
            mixin(enumMixinStr___BLKSIZE_T_TYPE);
        }
    }




    static if(!is(typeof(__FSID_T_TYPE))) {
        private enum enumMixinStr___FSID_T_TYPE = `enum __FSID_T_TYPE = { int __val [ 2 ] ; };`;
        static if(is(typeof({ mixin(enumMixinStr___FSID_T_TYPE); }))) {
            mixin(enumMixinStr___FSID_T_TYPE);
        }
    }




    static if(!is(typeof(__SSIZE_T_TYPE))) {
        private enum enumMixinStr___SSIZE_T_TYPE = `enum __SSIZE_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SSIZE_T_TYPE); }))) {
            mixin(enumMixinStr___SSIZE_T_TYPE);
        }
    }




    static if(!is(typeof(__CPU_MASK_TYPE))) {
        private enum enumMixinStr___CPU_MASK_TYPE = `enum __CPU_MASK_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___CPU_MASK_TYPE); }))) {
            mixin(enumMixinStr___CPU_MASK_TYPE);
        }
    }




    static if(!is(typeof(IPV6_TRANSPARENT))) {
        private enum enumMixinStr_IPV6_TRANSPARENT = `enum IPV6_TRANSPARENT = 75;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_TRANSPARENT); }))) {
            mixin(enumMixinStr_IPV6_TRANSPARENT);
        }
    }




    static if(!is(typeof(__OFF_T_MATCHES_OFF64_T))) {
        private enum enumMixinStr___OFF_T_MATCHES_OFF64_T = `enum __OFF_T_MATCHES_OFF64_T = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___OFF_T_MATCHES_OFF64_T); }))) {
            mixin(enumMixinStr___OFF_T_MATCHES_OFF64_T);
        }
    }




    static if(!is(typeof(__INO_T_MATCHES_INO64_T))) {
        private enum enumMixinStr___INO_T_MATCHES_INO64_T = `enum __INO_T_MATCHES_INO64_T = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___INO_T_MATCHES_INO64_T); }))) {
            mixin(enumMixinStr___INO_T_MATCHES_INO64_T);
        }
    }




    static if(!is(typeof(__RLIM_T_MATCHES_RLIM64_T))) {
        private enum enumMixinStr___RLIM_T_MATCHES_RLIM64_T = `enum __RLIM_T_MATCHES_RLIM64_T = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___RLIM_T_MATCHES_RLIM64_T); }))) {
            mixin(enumMixinStr___RLIM_T_MATCHES_RLIM64_T);
        }
    }




    static if(!is(typeof(__STATFS_MATCHES_STATFS64))) {
        private enum enumMixinStr___STATFS_MATCHES_STATFS64 = `enum __STATFS_MATCHES_STATFS64 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___STATFS_MATCHES_STATFS64); }))) {
            mixin(enumMixinStr___STATFS_MATCHES_STATFS64);
        }
    }




    static if(!is(typeof(__KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64))) {
        private enum enumMixinStr___KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 = `enum __KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64); }))) {
            mixin(enumMixinStr___KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64);
        }
    }




    static if(!is(typeof(__FD_SETSIZE))) {
        private enum enumMixinStr___FD_SETSIZE = `enum __FD_SETSIZE = 1024;`;
        static if(is(typeof({ mixin(enumMixinStr___FD_SETSIZE); }))) {
            mixin(enumMixinStr___FD_SETSIZE);
        }
    }




    static if(!is(typeof(IPV6_RECVORIGDSTADDR))) {
        private enum enumMixinStr_IPV6_RECVORIGDSTADDR = `enum IPV6_RECVORIGDSTADDR = IPV6_ORIGDSTADDR;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_RECVORIGDSTADDR); }))) {
            mixin(enumMixinStr_IPV6_RECVORIGDSTADDR);
        }
    }




    static if(!is(typeof(IPV6_ORIGDSTADDR))) {
        private enum enumMixinStr_IPV6_ORIGDSTADDR = `enum IPV6_ORIGDSTADDR = 74;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_ORIGDSTADDR); }))) {
            mixin(enumMixinStr_IPV6_ORIGDSTADDR);
        }
    }




    static if(!is(typeof(IPV6_MINHOPCOUNT))) {
        private enum enumMixinStr_IPV6_MINHOPCOUNT = `enum IPV6_MINHOPCOUNT = 73;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_MINHOPCOUNT); }))) {
            mixin(enumMixinStr_IPV6_MINHOPCOUNT);
        }
    }




    static if(!is(typeof(IPV6_ADDR_PREFERENCES))) {
        private enum enumMixinStr_IPV6_ADDR_PREFERENCES = `enum IPV6_ADDR_PREFERENCES = 72;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_ADDR_PREFERENCES); }))) {
            mixin(enumMixinStr_IPV6_ADDR_PREFERENCES);
        }
    }




    static if(!is(typeof(_BITS_UINTN_IDENTITY_H))) {
        private enum enumMixinStr__BITS_UINTN_IDENTITY_H = `enum _BITS_UINTN_IDENTITY_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_UINTN_IDENTITY_H); }))) {
            mixin(enumMixinStr__BITS_UINTN_IDENTITY_H);
        }
    }




    static if(!is(typeof(IPV6_AUTOFLOWLABEL))) {
        private enum enumMixinStr_IPV6_AUTOFLOWLABEL = `enum IPV6_AUTOFLOWLABEL = 70;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_AUTOFLOWLABEL); }))) {
            mixin(enumMixinStr_IPV6_AUTOFLOWLABEL);
        }
    }




    static if(!is(typeof(IPV6_TCLASS))) {
        private enum enumMixinStr_IPV6_TCLASS = `enum IPV6_TCLASS = 67;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_TCLASS); }))) {
            mixin(enumMixinStr_IPV6_TCLASS);
        }
    }




    static if(!is(typeof(IPV6_RECVTCLASS))) {
        private enum enumMixinStr_IPV6_RECVTCLASS = `enum IPV6_RECVTCLASS = 66;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_RECVTCLASS); }))) {
            mixin(enumMixinStr_IPV6_RECVTCLASS);
        }
    }




    static if(!is(typeof(IPV6_DONTFRAG))) {
        private enum enumMixinStr_IPV6_DONTFRAG = `enum IPV6_DONTFRAG = 62;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_DONTFRAG); }))) {
            mixin(enumMixinStr_IPV6_DONTFRAG);
        }
    }




    static if(!is(typeof(IPV6_PATHMTU))) {
        private enum enumMixinStr_IPV6_PATHMTU = `enum IPV6_PATHMTU = 61;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_PATHMTU); }))) {
            mixin(enumMixinStr_IPV6_PATHMTU);
        }
    }




    static if(!is(typeof(IPV6_RECVPATHMTU))) {
        private enum enumMixinStr_IPV6_RECVPATHMTU = `enum IPV6_RECVPATHMTU = 60;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_RECVPATHMTU); }))) {
            mixin(enumMixinStr_IPV6_RECVPATHMTU);
        }
    }




    static if(!is(typeof(IPV6_DSTOPTS))) {
        private enum enumMixinStr_IPV6_DSTOPTS = `enum IPV6_DSTOPTS = 59;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_DSTOPTS); }))) {
            mixin(enumMixinStr_IPV6_DSTOPTS);
        }
    }




    static if(!is(typeof(__WORDSIZE))) {
        private enum enumMixinStr___WORDSIZE = `enum __WORDSIZE = 64;`;
        static if(is(typeof({ mixin(enumMixinStr___WORDSIZE); }))) {
            mixin(enumMixinStr___WORDSIZE);
        }
    }




    static if(!is(typeof(IPV6_RECVDSTOPTS))) {
        private enum enumMixinStr_IPV6_RECVDSTOPTS = `enum IPV6_RECVDSTOPTS = 58;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_RECVDSTOPTS); }))) {
            mixin(enumMixinStr_IPV6_RECVDSTOPTS);
        }
    }




    static if(!is(typeof(IPV6_RTHDR))) {
        private enum enumMixinStr_IPV6_RTHDR = `enum IPV6_RTHDR = 57;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_RTHDR); }))) {
            mixin(enumMixinStr_IPV6_RTHDR);
        }
    }




    static if(!is(typeof(IPV6_RECVRTHDR))) {
        private enum enumMixinStr_IPV6_RECVRTHDR = `enum IPV6_RECVRTHDR = 56;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_RECVRTHDR); }))) {
            mixin(enumMixinStr_IPV6_RECVRTHDR);
        }
    }




    static if(!is(typeof(__WORDSIZE_TIME64_COMPAT32))) {
        private enum enumMixinStr___WORDSIZE_TIME64_COMPAT32 = `enum __WORDSIZE_TIME64_COMPAT32 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___WORDSIZE_TIME64_COMPAT32); }))) {
            mixin(enumMixinStr___WORDSIZE_TIME64_COMPAT32);
        }
    }




    static if(!is(typeof(__SYSCALL_WORDSIZE))) {
        private enum enumMixinStr___SYSCALL_WORDSIZE = `enum __SYSCALL_WORDSIZE = 64;`;
        static if(is(typeof({ mixin(enumMixinStr___SYSCALL_WORDSIZE); }))) {
            mixin(enumMixinStr___SYSCALL_WORDSIZE);
        }
    }




    static if(!is(typeof(_ENDIAN_H))) {
        private enum enumMixinStr__ENDIAN_H = `enum _ENDIAN_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__ENDIAN_H); }))) {
            mixin(enumMixinStr__ENDIAN_H);
        }
    }




    static if(!is(typeof(IPV6_RTHDRDSTOPTS))) {
        private enum enumMixinStr_IPV6_RTHDRDSTOPTS = `enum IPV6_RTHDRDSTOPTS = 55;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_RTHDRDSTOPTS); }))) {
            mixin(enumMixinStr_IPV6_RTHDRDSTOPTS);
        }
    }




    static if(!is(typeof(IPV6_HOPOPTS))) {
        private enum enumMixinStr_IPV6_HOPOPTS = `enum IPV6_HOPOPTS = 54;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_HOPOPTS); }))) {
            mixin(enumMixinStr_IPV6_HOPOPTS);
        }
    }




    static if(!is(typeof(IPV6_RECVHOPOPTS))) {
        private enum enumMixinStr_IPV6_RECVHOPOPTS = `enum IPV6_RECVHOPOPTS = 53;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_RECVHOPOPTS); }))) {
            mixin(enumMixinStr_IPV6_RECVHOPOPTS);
        }
    }




    static if(!is(typeof(LITTLE_ENDIAN))) {
        private enum enumMixinStr_LITTLE_ENDIAN = `enum LITTLE_ENDIAN = __LITTLE_ENDIAN;`;
        static if(is(typeof({ mixin(enumMixinStr_LITTLE_ENDIAN); }))) {
            mixin(enumMixinStr_LITTLE_ENDIAN);
        }
    }




    static if(!is(typeof(BIG_ENDIAN))) {
        private enum enumMixinStr_BIG_ENDIAN = `enum BIG_ENDIAN = __BIG_ENDIAN;`;
        static if(is(typeof({ mixin(enumMixinStr_BIG_ENDIAN); }))) {
            mixin(enumMixinStr_BIG_ENDIAN);
        }
    }




    static if(!is(typeof(PDP_ENDIAN))) {
        private enum enumMixinStr_PDP_ENDIAN = `enum PDP_ENDIAN = __PDP_ENDIAN;`;
        static if(is(typeof({ mixin(enumMixinStr_PDP_ENDIAN); }))) {
            mixin(enumMixinStr_PDP_ENDIAN);
        }
    }




    static if(!is(typeof(BYTE_ORDER))) {
        private enum enumMixinStr_BYTE_ORDER = `enum BYTE_ORDER = __BYTE_ORDER;`;
        static if(is(typeof({ mixin(enumMixinStr_BYTE_ORDER); }))) {
            mixin(enumMixinStr_BYTE_ORDER);
        }
    }




    static if(!is(typeof(IPV6_HOPLIMIT))) {
        private enum enumMixinStr_IPV6_HOPLIMIT = `enum IPV6_HOPLIMIT = 52;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_HOPLIMIT); }))) {
            mixin(enumMixinStr_IPV6_HOPLIMIT);
        }
    }




    static if(!is(typeof(IPV6_RECVHOPLIMIT))) {
        private enum enumMixinStr_IPV6_RECVHOPLIMIT = `enum IPV6_RECVHOPLIMIT = 51;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_RECVHOPLIMIT); }))) {
            mixin(enumMixinStr_IPV6_RECVHOPLIMIT);
        }
    }




    static if(!is(typeof(IPV6_PKTINFO))) {
        private enum enumMixinStr_IPV6_PKTINFO = `enum IPV6_PKTINFO = 50;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_PKTINFO); }))) {
            mixin(enumMixinStr_IPV6_PKTINFO);
        }
    }




    static if(!is(typeof(IPV6_RECVPKTINFO))) {
        private enum enumMixinStr_IPV6_RECVPKTINFO = `enum IPV6_RECVPKTINFO = 49;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_RECVPKTINFO); }))) {
            mixin(enumMixinStr_IPV6_RECVPKTINFO);
        }
    }




    static if(!is(typeof(IPV6_HDRINCL))) {
        private enum enumMixinStr_IPV6_HDRINCL = `enum IPV6_HDRINCL = 36;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_HDRINCL); }))) {
            mixin(enumMixinStr_IPV6_HDRINCL);
        }
    }
    static if(!is(typeof(_FEATURES_H))) {
        private enum enumMixinStr__FEATURES_H = `enum _FEATURES_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__FEATURES_H); }))) {
            mixin(enumMixinStr__FEATURES_H);
        }
    }






    static if(!is(typeof(IPV6_XFRM_POLICY))) {
        private enum enumMixinStr_IPV6_XFRM_POLICY = `enum IPV6_XFRM_POLICY = 35;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_XFRM_POLICY); }))) {
            mixin(enumMixinStr_IPV6_XFRM_POLICY);
        }
    }




    static if(!is(typeof(IPV6_IPSEC_POLICY))) {
        private enum enumMixinStr_IPV6_IPSEC_POLICY = `enum IPV6_IPSEC_POLICY = 34;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_IPSEC_POLICY); }))) {
            mixin(enumMixinStr_IPV6_IPSEC_POLICY);
        }
    }






    static if(!is(typeof(IPV6_RECVERR_RFC4884))) {
        private enum enumMixinStr_IPV6_RECVERR_RFC4884 = `enum IPV6_RECVERR_RFC4884 = 31;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_RECVERR_RFC4884); }))) {
            mixin(enumMixinStr_IPV6_RECVERR_RFC4884);
        }
    }




    static if(!is(typeof(IPV6_ROUTER_ALERT_ISOLATE))) {
        private enum enumMixinStr_IPV6_ROUTER_ALERT_ISOLATE = `enum IPV6_ROUTER_ALERT_ISOLATE = 30;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_ROUTER_ALERT_ISOLATE); }))) {
            mixin(enumMixinStr_IPV6_ROUTER_ALERT_ISOLATE);
        }
    }
    static if(!is(typeof(_DEFAULT_SOURCE))) {
        private enum enumMixinStr__DEFAULT_SOURCE = `enum _DEFAULT_SOURCE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__DEFAULT_SOURCE); }))) {
            mixin(enumMixinStr__DEFAULT_SOURCE);
        }
    }




    static if(!is(typeof(IPV6_MULTICAST_ALL))) {
        private enum enumMixinStr_IPV6_MULTICAST_ALL = `enum IPV6_MULTICAST_ALL = 29;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_MULTICAST_ALL); }))) {
            mixin(enumMixinStr_IPV6_MULTICAST_ALL);
        }
    }




    static if(!is(typeof(IPV6_LEAVE_ANYCAST))) {
        private enum enumMixinStr_IPV6_LEAVE_ANYCAST = `enum IPV6_LEAVE_ANYCAST = 28;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_LEAVE_ANYCAST); }))) {
            mixin(enumMixinStr_IPV6_LEAVE_ANYCAST);
        }
    }




    static if(!is(typeof(__GLIBC_USE_ISOC2X))) {
        private enum enumMixinStr___GLIBC_USE_ISOC2X = `enum __GLIBC_USE_ISOC2X = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_ISOC2X); }))) {
            mixin(enumMixinStr___GLIBC_USE_ISOC2X);
        }
    }




    static if(!is(typeof(IPV6_JOIN_ANYCAST))) {
        private enum enumMixinStr_IPV6_JOIN_ANYCAST = `enum IPV6_JOIN_ANYCAST = 27;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_JOIN_ANYCAST); }))) {
            mixin(enumMixinStr_IPV6_JOIN_ANYCAST);
        }
    }




    static if(!is(typeof(IPV6_V6ONLY))) {
        private enum enumMixinStr_IPV6_V6ONLY = `enum IPV6_V6ONLY = 26;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_V6ONLY); }))) {
            mixin(enumMixinStr_IPV6_V6ONLY);
        }
    }




    static if(!is(typeof(__USE_ISOC11))) {
        private enum enumMixinStr___USE_ISOC11 = `enum __USE_ISOC11 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_ISOC11); }))) {
            mixin(enumMixinStr___USE_ISOC11);
        }
    }




    static if(!is(typeof(IPV6_RECVERR))) {
        private enum enumMixinStr_IPV6_RECVERR = `enum IPV6_RECVERR = 25;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_RECVERR); }))) {
            mixin(enumMixinStr_IPV6_RECVERR);
        }
    }




    static if(!is(typeof(IPV6_MTU))) {
        private enum enumMixinStr_IPV6_MTU = `enum IPV6_MTU = 24;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_MTU); }))) {
            mixin(enumMixinStr_IPV6_MTU);
        }
    }




    static if(!is(typeof(__USE_ISOC99))) {
        private enum enumMixinStr___USE_ISOC99 = `enum __USE_ISOC99 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_ISOC99); }))) {
            mixin(enumMixinStr___USE_ISOC99);
        }
    }




    static if(!is(typeof(IPV6_MTU_DISCOVER))) {
        private enum enumMixinStr_IPV6_MTU_DISCOVER = `enum IPV6_MTU_DISCOVER = 23;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_MTU_DISCOVER); }))) {
            mixin(enumMixinStr_IPV6_MTU_DISCOVER);
        }
    }




    static if(!is(typeof(IPV6_ROUTER_ALERT))) {
        private enum enumMixinStr_IPV6_ROUTER_ALERT = `enum IPV6_ROUTER_ALERT = 22;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_ROUTER_ALERT); }))) {
            mixin(enumMixinStr_IPV6_ROUTER_ALERT);
        }
    }




    static if(!is(typeof(__USE_ISOC95))) {
        private enum enumMixinStr___USE_ISOC95 = `enum __USE_ISOC95 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_ISOC95); }))) {
            mixin(enumMixinStr___USE_ISOC95);
        }
    }




    static if(!is(typeof(IPV6_LEAVE_GROUP))) {
        private enum enumMixinStr_IPV6_LEAVE_GROUP = `enum IPV6_LEAVE_GROUP = 21;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_LEAVE_GROUP); }))) {
            mixin(enumMixinStr_IPV6_LEAVE_GROUP);
        }
    }




    static if(!is(typeof(__USE_POSIX_IMPLICITLY))) {
        private enum enumMixinStr___USE_POSIX_IMPLICITLY = `enum __USE_POSIX_IMPLICITLY = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX_IMPLICITLY); }))) {
            mixin(enumMixinStr___USE_POSIX_IMPLICITLY);
        }
    }




    static if(!is(typeof(_POSIX_SOURCE))) {
        private enum enumMixinStr__POSIX_SOURCE = `enum _POSIX_SOURCE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_SOURCE); }))) {
            mixin(enumMixinStr__POSIX_SOURCE);
        }
    }




    static if(!is(typeof(_POSIX_C_SOURCE))) {
        private enum enumMixinStr__POSIX_C_SOURCE = `enum _POSIX_C_SOURCE = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_C_SOURCE); }))) {
            mixin(enumMixinStr__POSIX_C_SOURCE);
        }
    }




    static if(!is(typeof(IPV6_JOIN_GROUP))) {
        private enum enumMixinStr_IPV6_JOIN_GROUP = `enum IPV6_JOIN_GROUP = 20;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_JOIN_GROUP); }))) {
            mixin(enumMixinStr_IPV6_JOIN_GROUP);
        }
    }




    static if(!is(typeof(IPV6_MULTICAST_LOOP))) {
        private enum enumMixinStr_IPV6_MULTICAST_LOOP = `enum IPV6_MULTICAST_LOOP = 19;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_MULTICAST_LOOP); }))) {
            mixin(enumMixinStr_IPV6_MULTICAST_LOOP);
        }
    }




    static if(!is(typeof(IPV6_MULTICAST_HOPS))) {
        private enum enumMixinStr_IPV6_MULTICAST_HOPS = `enum IPV6_MULTICAST_HOPS = 18;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_MULTICAST_HOPS); }))) {
            mixin(enumMixinStr_IPV6_MULTICAST_HOPS);
        }
    }




    static if(!is(typeof(IPV6_MULTICAST_IF))) {
        private enum enumMixinStr_IPV6_MULTICAST_IF = `enum IPV6_MULTICAST_IF = 17;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_MULTICAST_IF); }))) {
            mixin(enumMixinStr_IPV6_MULTICAST_IF);
        }
    }




    static if(!is(typeof(IPV6_UNICAST_HOPS))) {
        private enum enumMixinStr_IPV6_UNICAST_HOPS = `enum IPV6_UNICAST_HOPS = 16;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_UNICAST_HOPS); }))) {
            mixin(enumMixinStr_IPV6_UNICAST_HOPS);
        }
    }




    static if(!is(typeof(IPV6_AUTHHDR))) {
        private enum enumMixinStr_IPV6_AUTHHDR = `enum IPV6_AUTHHDR = 10;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_AUTHHDR); }))) {
            mixin(enumMixinStr_IPV6_AUTHHDR);
        }
    }




    static if(!is(typeof(IPV6_NEXTHOP))) {
        private enum enumMixinStr_IPV6_NEXTHOP = `enum IPV6_NEXTHOP = 9;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_NEXTHOP); }))) {
            mixin(enumMixinStr_IPV6_NEXTHOP);
        }
    }




    static if(!is(typeof(__USE_POSIX))) {
        private enum enumMixinStr___USE_POSIX = `enum __USE_POSIX = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX); }))) {
            mixin(enumMixinStr___USE_POSIX);
        }
    }




    static if(!is(typeof(SCM_SRCRT))) {
        private enum enumMixinStr_SCM_SRCRT = `enum SCM_SRCRT = IPV6_RXSRCRT;`;
        static if(is(typeof({ mixin(enumMixinStr_SCM_SRCRT); }))) {
            mixin(enumMixinStr_SCM_SRCRT);
        }
    }




    static if(!is(typeof(IPV6_2292HOPLIMIT))) {
        private enum enumMixinStr_IPV6_2292HOPLIMIT = `enum IPV6_2292HOPLIMIT = 8;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_2292HOPLIMIT); }))) {
            mixin(enumMixinStr_IPV6_2292HOPLIMIT);
        }
    }




    static if(!is(typeof(__USE_POSIX2))) {
        private enum enumMixinStr___USE_POSIX2 = `enum __USE_POSIX2 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX2); }))) {
            mixin(enumMixinStr___USE_POSIX2);
        }
    }




    static if(!is(typeof(IPV6_CHECKSUM))) {
        private enum enumMixinStr_IPV6_CHECKSUM = `enum IPV6_CHECKSUM = 7;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_CHECKSUM); }))) {
            mixin(enumMixinStr_IPV6_CHECKSUM);
        }
    }




    static if(!is(typeof(IPV6_2292PKTOPTIONS))) {
        private enum enumMixinStr_IPV6_2292PKTOPTIONS = `enum IPV6_2292PKTOPTIONS = 6;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_2292PKTOPTIONS); }))) {
            mixin(enumMixinStr_IPV6_2292PKTOPTIONS);
        }
    }




    static if(!is(typeof(__USE_POSIX199309))) {
        private enum enumMixinStr___USE_POSIX199309 = `enum __USE_POSIX199309 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX199309); }))) {
            mixin(enumMixinStr___USE_POSIX199309);
        }
    }




    static if(!is(typeof(IPV6_2292RTHDR))) {
        private enum enumMixinStr_IPV6_2292RTHDR = `enum IPV6_2292RTHDR = 5;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_2292RTHDR); }))) {
            mixin(enumMixinStr_IPV6_2292RTHDR);
        }
    }




    static if(!is(typeof(IPV6_2292DSTOPTS))) {
        private enum enumMixinStr_IPV6_2292DSTOPTS = `enum IPV6_2292DSTOPTS = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_2292DSTOPTS); }))) {
            mixin(enumMixinStr_IPV6_2292DSTOPTS);
        }
    }




    static if(!is(typeof(__USE_POSIX199506))) {
        private enum enumMixinStr___USE_POSIX199506 = `enum __USE_POSIX199506 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX199506); }))) {
            mixin(enumMixinStr___USE_POSIX199506);
        }
    }




    static if(!is(typeof(IPV6_2292HOPOPTS))) {
        private enum enumMixinStr_IPV6_2292HOPOPTS = `enum IPV6_2292HOPOPTS = 3;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_2292HOPOPTS); }))) {
            mixin(enumMixinStr_IPV6_2292HOPOPTS);
        }
    }




    static if(!is(typeof(IPV6_2292PKTINFO))) {
        private enum enumMixinStr_IPV6_2292PKTINFO = `enum IPV6_2292PKTINFO = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_2292PKTINFO); }))) {
            mixin(enumMixinStr_IPV6_2292PKTINFO);
        }
    }




    static if(!is(typeof(__USE_XOPEN2K))) {
        private enum enumMixinStr___USE_XOPEN2K = `enum __USE_XOPEN2K = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_XOPEN2K); }))) {
            mixin(enumMixinStr___USE_XOPEN2K);
        }
    }




    static if(!is(typeof(IPV6_ADDRFORM))) {
        private enum enumMixinStr_IPV6_ADDRFORM = `enum IPV6_ADDRFORM = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_IPV6_ADDRFORM); }))) {
            mixin(enumMixinStr_IPV6_ADDRFORM);
        }
    }




    static if(!is(typeof(IP_MAX_MEMBERSHIPS))) {
        private enum enumMixinStr_IP_MAX_MEMBERSHIPS = `enum IP_MAX_MEMBERSHIPS = 20;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_MAX_MEMBERSHIPS); }))) {
            mixin(enumMixinStr_IP_MAX_MEMBERSHIPS);
        }
    }




    static if(!is(typeof(__USE_XOPEN2K8))) {
        private enum enumMixinStr___USE_XOPEN2K8 = `enum __USE_XOPEN2K8 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_XOPEN2K8); }))) {
            mixin(enumMixinStr___USE_XOPEN2K8);
        }
    }




    static if(!is(typeof(_ATFILE_SOURCE))) {
        private enum enumMixinStr__ATFILE_SOURCE = `enum _ATFILE_SOURCE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__ATFILE_SOURCE); }))) {
            mixin(enumMixinStr__ATFILE_SOURCE);
        }
    }




    static if(!is(typeof(IP_DEFAULT_MULTICAST_LOOP))) {
        private enum enumMixinStr_IP_DEFAULT_MULTICAST_LOOP = `enum IP_DEFAULT_MULTICAST_LOOP = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_DEFAULT_MULTICAST_LOOP); }))) {
            mixin(enumMixinStr_IP_DEFAULT_MULTICAST_LOOP);
        }
    }




    static if(!is(typeof(__USE_MISC))) {
        private enum enumMixinStr___USE_MISC = `enum __USE_MISC = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_MISC); }))) {
            mixin(enumMixinStr___USE_MISC);
        }
    }




    static if(!is(typeof(IP_DEFAULT_MULTICAST_TTL))) {
        private enum enumMixinStr_IP_DEFAULT_MULTICAST_TTL = `enum IP_DEFAULT_MULTICAST_TTL = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_DEFAULT_MULTICAST_TTL); }))) {
            mixin(enumMixinStr_IP_DEFAULT_MULTICAST_TTL);
        }
    }




    static if(!is(typeof(__USE_ATFILE))) {
        private enum enumMixinStr___USE_ATFILE = `enum __USE_ATFILE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_ATFILE); }))) {
            mixin(enumMixinStr___USE_ATFILE);
        }
    }




    static if(!is(typeof(__USE_FORTIFY_LEVEL))) {
        private enum enumMixinStr___USE_FORTIFY_LEVEL = `enum __USE_FORTIFY_LEVEL = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_FORTIFY_LEVEL); }))) {
            mixin(enumMixinStr___USE_FORTIFY_LEVEL);
        }
    }




    static if(!is(typeof(SOL_IP))) {
        private enum enumMixinStr_SOL_IP = `enum SOL_IP = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_IP); }))) {
            mixin(enumMixinStr_SOL_IP);
        }
    }




    static if(!is(typeof(__GLIBC_USE_DEPRECATED_GETS))) {
        private enum enumMixinStr___GLIBC_USE_DEPRECATED_GETS = `enum __GLIBC_USE_DEPRECATED_GETS = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_DEPRECATED_GETS); }))) {
            mixin(enumMixinStr___GLIBC_USE_DEPRECATED_GETS);
        }
    }




    static if(!is(typeof(IP_UNICAST_IF))) {
        private enum enumMixinStr_IP_UNICAST_IF = `enum IP_UNICAST_IF = 50;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_UNICAST_IF); }))) {
            mixin(enumMixinStr_IP_UNICAST_IF);
        }
    }




    static if(!is(typeof(IP_MULTICAST_ALL))) {
        private enum enumMixinStr_IP_MULTICAST_ALL = `enum IP_MULTICAST_ALL = 49;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_MULTICAST_ALL); }))) {
            mixin(enumMixinStr_IP_MULTICAST_ALL);
        }
    }




    static if(!is(typeof(__GLIBC_USE_DEPRECATED_SCANF))) {
        private enum enumMixinStr___GLIBC_USE_DEPRECATED_SCANF = `enum __GLIBC_USE_DEPRECATED_SCANF = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_DEPRECATED_SCANF); }))) {
            mixin(enumMixinStr___GLIBC_USE_DEPRECATED_SCANF);
        }
    }




    static if(!is(typeof(IP_MSFILTER))) {
        private enum enumMixinStr_IP_MSFILTER = `enum IP_MSFILTER = 41;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_MSFILTER); }))) {
            mixin(enumMixinStr_IP_MSFILTER);
        }
    }




    static if(!is(typeof(__GNU_LIBRARY__))) {
        private enum enumMixinStr___GNU_LIBRARY__ = `enum __GNU_LIBRARY__ = 6;`;
        static if(is(typeof({ mixin(enumMixinStr___GNU_LIBRARY__); }))) {
            mixin(enumMixinStr___GNU_LIBRARY__);
        }
    }




    static if(!is(typeof(__GLIBC__))) {
        private enum enumMixinStr___GLIBC__ = `enum __GLIBC__ = 2;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC__); }))) {
            mixin(enumMixinStr___GLIBC__);
        }
    }




    static if(!is(typeof(__GLIBC_MINOR__))) {
        private enum enumMixinStr___GLIBC_MINOR__ = `enum __GLIBC_MINOR__ = 33;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_MINOR__); }))) {
            mixin(enumMixinStr___GLIBC_MINOR__);
        }
    }






    static if(!is(typeof(IP_DROP_SOURCE_MEMBERSHIP))) {
        private enum enumMixinStr_IP_DROP_SOURCE_MEMBERSHIP = `enum IP_DROP_SOURCE_MEMBERSHIP = 40;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_DROP_SOURCE_MEMBERSHIP); }))) {
            mixin(enumMixinStr_IP_DROP_SOURCE_MEMBERSHIP);
        }
    }




    static if(!is(typeof(IP_ADD_SOURCE_MEMBERSHIP))) {
        private enum enumMixinStr_IP_ADD_SOURCE_MEMBERSHIP = `enum IP_ADD_SOURCE_MEMBERSHIP = 39;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_ADD_SOURCE_MEMBERSHIP); }))) {
            mixin(enumMixinStr_IP_ADD_SOURCE_MEMBERSHIP);
        }
    }




    static if(!is(typeof(IP_BLOCK_SOURCE))) {
        private enum enumMixinStr_IP_BLOCK_SOURCE = `enum IP_BLOCK_SOURCE = 38;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_BLOCK_SOURCE); }))) {
            mixin(enumMixinStr_IP_BLOCK_SOURCE);
        }
    }




    static if(!is(typeof(IP_UNBLOCK_SOURCE))) {
        private enum enumMixinStr_IP_UNBLOCK_SOURCE = `enum IP_UNBLOCK_SOURCE = 37;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_UNBLOCK_SOURCE); }))) {
            mixin(enumMixinStr_IP_UNBLOCK_SOURCE);
        }
    }




    static if(!is(typeof(IP_DROP_MEMBERSHIP))) {
        private enum enumMixinStr_IP_DROP_MEMBERSHIP = `enum IP_DROP_MEMBERSHIP = 36;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_DROP_MEMBERSHIP); }))) {
            mixin(enumMixinStr_IP_DROP_MEMBERSHIP);
        }
    }




    static if(!is(typeof(IP_ADD_MEMBERSHIP))) {
        private enum enumMixinStr_IP_ADD_MEMBERSHIP = `enum IP_ADD_MEMBERSHIP = 35;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_ADD_MEMBERSHIP); }))) {
            mixin(enumMixinStr_IP_ADD_MEMBERSHIP);
        }
    }
    static if(!is(typeof(IP_MULTICAST_LOOP))) {
        private enum enumMixinStr_IP_MULTICAST_LOOP = `enum IP_MULTICAST_LOOP = 34;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_MULTICAST_LOOP); }))) {
            mixin(enumMixinStr_IP_MULTICAST_LOOP);
        }
    }




    static if(!is(typeof(IP_MULTICAST_TTL))) {
        private enum enumMixinStr_IP_MULTICAST_TTL = `enum IP_MULTICAST_TTL = 33;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_MULTICAST_TTL); }))) {
            mixin(enumMixinStr_IP_MULTICAST_TTL);
        }
    }




    static if(!is(typeof(IP_MULTICAST_IF))) {
        private enum enumMixinStr_IP_MULTICAST_IF = `enum IP_MULTICAST_IF = 32;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_MULTICAST_IF); }))) {
            mixin(enumMixinStr_IP_MULTICAST_IF);
        }
    }




    static if(!is(typeof(IP_PMTUDISC_OMIT))) {
        private enum enumMixinStr_IP_PMTUDISC_OMIT = `enum IP_PMTUDISC_OMIT = 5;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_PMTUDISC_OMIT); }))) {
            mixin(enumMixinStr_IP_PMTUDISC_OMIT);
        }
    }




    static if(!is(typeof(IP_PMTUDISC_INTERFACE))) {
        private enum enumMixinStr_IP_PMTUDISC_INTERFACE = `enum IP_PMTUDISC_INTERFACE = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_PMTUDISC_INTERFACE); }))) {
            mixin(enumMixinStr_IP_PMTUDISC_INTERFACE);
        }
    }






    static if(!is(typeof(IP_PMTUDISC_PROBE))) {
        private enum enumMixinStr_IP_PMTUDISC_PROBE = `enum IP_PMTUDISC_PROBE = 3;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_PMTUDISC_PROBE); }))) {
            mixin(enumMixinStr_IP_PMTUDISC_PROBE);
        }
    }




    static if(!is(typeof(IP_PMTUDISC_DO))) {
        private enum enumMixinStr_IP_PMTUDISC_DO = `enum IP_PMTUDISC_DO = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_PMTUDISC_DO); }))) {
            mixin(enumMixinStr_IP_PMTUDISC_DO);
        }
    }




    static if(!is(typeof(IP_PMTUDISC_WANT))) {
        private enum enumMixinStr_IP_PMTUDISC_WANT = `enum IP_PMTUDISC_WANT = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_PMTUDISC_WANT); }))) {
            mixin(enumMixinStr_IP_PMTUDISC_WANT);
        }
    }




    static if(!is(typeof(IP_PMTUDISC_DONT))) {
        private enum enumMixinStr_IP_PMTUDISC_DONT = `enum IP_PMTUDISC_DONT = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_PMTUDISC_DONT); }))) {
            mixin(enumMixinStr_IP_PMTUDISC_DONT);
        }
    }




    static if(!is(typeof(IP_RECVERR_RFC4884))) {
        private enum enumMixinStr_IP_RECVERR_RFC4884 = `enum IP_RECVERR_RFC4884 = 26;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_RECVERR_RFC4884); }))) {
            mixin(enumMixinStr_IP_RECVERR_RFC4884);
        }
    }




    static if(!is(typeof(IP_RECVFRAGSIZE))) {
        private enum enumMixinStr_IP_RECVFRAGSIZE = `enum IP_RECVFRAGSIZE = 25;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_RECVFRAGSIZE); }))) {
            mixin(enumMixinStr_IP_RECVFRAGSIZE);
        }
    }




    static if(!is(typeof(IP_BIND_ADDRESS_NO_PORT))) {
        private enum enumMixinStr_IP_BIND_ADDRESS_NO_PORT = `enum IP_BIND_ADDRESS_NO_PORT = 24;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_BIND_ADDRESS_NO_PORT); }))) {
            mixin(enumMixinStr_IP_BIND_ADDRESS_NO_PORT);
        }
    }




    static if(!is(typeof(IP_CHECKSUM))) {
        private enum enumMixinStr_IP_CHECKSUM = `enum IP_CHECKSUM = 23;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_CHECKSUM); }))) {
            mixin(enumMixinStr_IP_CHECKSUM);
        }
    }




    static if(!is(typeof(IP_NODEFRAG))) {
        private enum enumMixinStr_IP_NODEFRAG = `enum IP_NODEFRAG = 22;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_NODEFRAG); }))) {
            mixin(enumMixinStr_IP_NODEFRAG);
        }
    }




    static if(!is(typeof(_NETINET_IN_H))) {
        private enum enumMixinStr__NETINET_IN_H = `enum _NETINET_IN_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__NETINET_IN_H); }))) {
            mixin(enumMixinStr__NETINET_IN_H);
        }
    }




    static if(!is(typeof(IP_MINTTL))) {
        private enum enumMixinStr_IP_MINTTL = `enum IP_MINTTL = 21;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_MINTTL); }))) {
            mixin(enumMixinStr_IP_MINTTL);
        }
    }




    static if(!is(typeof(IP_RECVORIGDSTADDR))) {
        private enum enumMixinStr_IP_RECVORIGDSTADDR = `enum IP_RECVORIGDSTADDR = IP_ORIGDSTADDR;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_RECVORIGDSTADDR); }))) {
            mixin(enumMixinStr_IP_RECVORIGDSTADDR);
        }
    }




    static if(!is(typeof(IP_ORIGDSTADDR))) {
        private enum enumMixinStr_IP_ORIGDSTADDR = `enum IP_ORIGDSTADDR = 20;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_ORIGDSTADDR); }))) {
            mixin(enumMixinStr_IP_ORIGDSTADDR);
        }
    }




    static if(!is(typeof(IP_TRANSPARENT))) {
        private enum enumMixinStr_IP_TRANSPARENT = `enum IP_TRANSPARENT = 19;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_TRANSPARENT); }))) {
            mixin(enumMixinStr_IP_TRANSPARENT);
        }
    }




    static if(!is(typeof(IP_PASSSEC))) {
        private enum enumMixinStr_IP_PASSSEC = `enum IP_PASSSEC = 18;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_PASSSEC); }))) {
            mixin(enumMixinStr_IP_PASSSEC);
        }
    }




    static if(!is(typeof(IP_XFRM_POLICY))) {
        private enum enumMixinStr_IP_XFRM_POLICY = `enum IP_XFRM_POLICY = 17;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_XFRM_POLICY); }))) {
            mixin(enumMixinStr_IP_XFRM_POLICY);
        }
    }




    static if(!is(typeof(IP_IPSEC_POLICY))) {
        private enum enumMixinStr_IP_IPSEC_POLICY = `enum IP_IPSEC_POLICY = 16;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_IPSEC_POLICY); }))) {
            mixin(enumMixinStr_IP_IPSEC_POLICY);
        }
    }




    static if(!is(typeof(IP_FREEBIND))) {
        private enum enumMixinStr_IP_FREEBIND = `enum IP_FREEBIND = 15;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_FREEBIND); }))) {
            mixin(enumMixinStr_IP_FREEBIND);
        }
    }




    static if(!is(typeof(IPPROTO_IP))) {
        private enum enumMixinStr_IPPROTO_IP = `enum IPPROTO_IP = IPPROTO_IP;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_IP); }))) {
            mixin(enumMixinStr_IPPROTO_IP);
        }
    }




    static if(!is(typeof(IPPROTO_ICMP))) {
        private enum enumMixinStr_IPPROTO_ICMP = `enum IPPROTO_ICMP = IPPROTO_ICMP;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_ICMP); }))) {
            mixin(enumMixinStr_IPPROTO_ICMP);
        }
    }




    static if(!is(typeof(IPPROTO_IGMP))) {
        private enum enumMixinStr_IPPROTO_IGMP = `enum IPPROTO_IGMP = IPPROTO_IGMP;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_IGMP); }))) {
            mixin(enumMixinStr_IPPROTO_IGMP);
        }
    }




    static if(!is(typeof(IPPROTO_IPIP))) {
        private enum enumMixinStr_IPPROTO_IPIP = `enum IPPROTO_IPIP = IPPROTO_IPIP;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_IPIP); }))) {
            mixin(enumMixinStr_IPPROTO_IPIP);
        }
    }




    static if(!is(typeof(IPPROTO_TCP))) {
        private enum enumMixinStr_IPPROTO_TCP = `enum IPPROTO_TCP = IPPROTO_TCP;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_TCP); }))) {
            mixin(enumMixinStr_IPPROTO_TCP);
        }
    }




    static if(!is(typeof(IPPROTO_EGP))) {
        private enum enumMixinStr_IPPROTO_EGP = `enum IPPROTO_EGP = IPPROTO_EGP;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_EGP); }))) {
            mixin(enumMixinStr_IPPROTO_EGP);
        }
    }




    static if(!is(typeof(IPPROTO_PUP))) {
        private enum enumMixinStr_IPPROTO_PUP = `enum IPPROTO_PUP = IPPROTO_PUP;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_PUP); }))) {
            mixin(enumMixinStr_IPPROTO_PUP);
        }
    }




    static if(!is(typeof(IPPROTO_UDP))) {
        private enum enumMixinStr_IPPROTO_UDP = `enum IPPROTO_UDP = IPPROTO_UDP;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_UDP); }))) {
            mixin(enumMixinStr_IPPROTO_UDP);
        }
    }




    static if(!is(typeof(IPPROTO_IDP))) {
        private enum enumMixinStr_IPPROTO_IDP = `enum IPPROTO_IDP = IPPROTO_IDP;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_IDP); }))) {
            mixin(enumMixinStr_IPPROTO_IDP);
        }
    }




    static if(!is(typeof(IPPROTO_TP))) {
        private enum enumMixinStr_IPPROTO_TP = `enum IPPROTO_TP = IPPROTO_TP;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_TP); }))) {
            mixin(enumMixinStr_IPPROTO_TP);
        }
    }




    static if(!is(typeof(IPPROTO_DCCP))) {
        private enum enumMixinStr_IPPROTO_DCCP = `enum IPPROTO_DCCP = IPPROTO_DCCP;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_DCCP); }))) {
            mixin(enumMixinStr_IPPROTO_DCCP);
        }
    }




    static if(!is(typeof(IPPROTO_IPV6))) {
        private enum enumMixinStr_IPPROTO_IPV6 = `enum IPPROTO_IPV6 = IPPROTO_IPV6;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_IPV6); }))) {
            mixin(enumMixinStr_IPPROTO_IPV6);
        }
    }




    static if(!is(typeof(IPPROTO_RSVP))) {
        private enum enumMixinStr_IPPROTO_RSVP = `enum IPPROTO_RSVP = IPPROTO_RSVP;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_RSVP); }))) {
            mixin(enumMixinStr_IPPROTO_RSVP);
        }
    }




    static if(!is(typeof(IPPROTO_GRE))) {
        private enum enumMixinStr_IPPROTO_GRE = `enum IPPROTO_GRE = IPPROTO_GRE;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_GRE); }))) {
            mixin(enumMixinStr_IPPROTO_GRE);
        }
    }




    static if(!is(typeof(IPPROTO_ESP))) {
        private enum enumMixinStr_IPPROTO_ESP = `enum IPPROTO_ESP = IPPROTO_ESP;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_ESP); }))) {
            mixin(enumMixinStr_IPPROTO_ESP);
        }
    }




    static if(!is(typeof(IPPROTO_AH))) {
        private enum enumMixinStr_IPPROTO_AH = `enum IPPROTO_AH = IPPROTO_AH;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_AH); }))) {
            mixin(enumMixinStr_IPPROTO_AH);
        }
    }




    static if(!is(typeof(IPPROTO_MTP))) {
        private enum enumMixinStr_IPPROTO_MTP = `enum IPPROTO_MTP = IPPROTO_MTP;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_MTP); }))) {
            mixin(enumMixinStr_IPPROTO_MTP);
        }
    }




    static if(!is(typeof(IPPROTO_BEETPH))) {
        private enum enumMixinStr_IPPROTO_BEETPH = `enum IPPROTO_BEETPH = IPPROTO_BEETPH;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_BEETPH); }))) {
            mixin(enumMixinStr_IPPROTO_BEETPH);
        }
    }




    static if(!is(typeof(IPPROTO_ENCAP))) {
        private enum enumMixinStr_IPPROTO_ENCAP = `enum IPPROTO_ENCAP = IPPROTO_ENCAP;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_ENCAP); }))) {
            mixin(enumMixinStr_IPPROTO_ENCAP);
        }
    }




    static if(!is(typeof(IPPROTO_PIM))) {
        private enum enumMixinStr_IPPROTO_PIM = `enum IPPROTO_PIM = IPPROTO_PIM;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_PIM); }))) {
            mixin(enumMixinStr_IPPROTO_PIM);
        }
    }




    static if(!is(typeof(IPPROTO_COMP))) {
        private enum enumMixinStr_IPPROTO_COMP = `enum IPPROTO_COMP = IPPROTO_COMP;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_COMP); }))) {
            mixin(enumMixinStr_IPPROTO_COMP);
        }
    }




    static if(!is(typeof(IPPROTO_SCTP))) {
        private enum enumMixinStr_IPPROTO_SCTP = `enum IPPROTO_SCTP = IPPROTO_SCTP;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_SCTP); }))) {
            mixin(enumMixinStr_IPPROTO_SCTP);
        }
    }




    static if(!is(typeof(IPPROTO_UDPLITE))) {
        private enum enumMixinStr_IPPROTO_UDPLITE = `enum IPPROTO_UDPLITE = IPPROTO_UDPLITE;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_UDPLITE); }))) {
            mixin(enumMixinStr_IPPROTO_UDPLITE);
        }
    }




    static if(!is(typeof(IPPROTO_MPLS))) {
        private enum enumMixinStr_IPPROTO_MPLS = `enum IPPROTO_MPLS = IPPROTO_MPLS;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_MPLS); }))) {
            mixin(enumMixinStr_IPPROTO_MPLS);
        }
    }




    static if(!is(typeof(IPPROTO_ETHERNET))) {
        private enum enumMixinStr_IPPROTO_ETHERNET = `enum IPPROTO_ETHERNET = IPPROTO_ETHERNET;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_ETHERNET); }))) {
            mixin(enumMixinStr_IPPROTO_ETHERNET);
        }
    }




    static if(!is(typeof(IPPROTO_RAW))) {
        private enum enumMixinStr_IPPROTO_RAW = `enum IPPROTO_RAW = IPPROTO_RAW;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_RAW); }))) {
            mixin(enumMixinStr_IPPROTO_RAW);
        }
    }




    static if(!is(typeof(IPPROTO_MPTCP))) {
        private enum enumMixinStr_IPPROTO_MPTCP = `enum IPPROTO_MPTCP = IPPROTO_MPTCP;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_MPTCP); }))) {
            mixin(enumMixinStr_IPPROTO_MPTCP);
        }
    }




    static if(!is(typeof(IP_MTU))) {
        private enum enumMixinStr_IP_MTU = `enum IP_MTU = 14;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_MTU); }))) {
            mixin(enumMixinStr_IP_MTU);
        }
    }




    static if(!is(typeof(IP_RECVTOS))) {
        private enum enumMixinStr_IP_RECVTOS = `enum IP_RECVTOS = 13;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_RECVTOS); }))) {
            mixin(enumMixinStr_IP_RECVTOS);
        }
    }




    static if(!is(typeof(IPPROTO_HOPOPTS))) {
        private enum enumMixinStr_IPPROTO_HOPOPTS = `enum IPPROTO_HOPOPTS = IPPROTO_HOPOPTS;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_HOPOPTS); }))) {
            mixin(enumMixinStr_IPPROTO_HOPOPTS);
        }
    }




    static if(!is(typeof(IPPROTO_ROUTING))) {
        private enum enumMixinStr_IPPROTO_ROUTING = `enum IPPROTO_ROUTING = IPPROTO_ROUTING;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_ROUTING); }))) {
            mixin(enumMixinStr_IPPROTO_ROUTING);
        }
    }




    static if(!is(typeof(IPPROTO_FRAGMENT))) {
        private enum enumMixinStr_IPPROTO_FRAGMENT = `enum IPPROTO_FRAGMENT = IPPROTO_FRAGMENT;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_FRAGMENT); }))) {
            mixin(enumMixinStr_IPPROTO_FRAGMENT);
        }
    }




    static if(!is(typeof(IPPROTO_ICMPV6))) {
        private enum enumMixinStr_IPPROTO_ICMPV6 = `enum IPPROTO_ICMPV6 = IPPROTO_ICMPV6;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_ICMPV6); }))) {
            mixin(enumMixinStr_IPPROTO_ICMPV6);
        }
    }




    static if(!is(typeof(IPPROTO_NONE))) {
        private enum enumMixinStr_IPPROTO_NONE = `enum IPPROTO_NONE = IPPROTO_NONE;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_NONE); }))) {
            mixin(enumMixinStr_IPPROTO_NONE);
        }
    }




    static if(!is(typeof(IPPROTO_DSTOPTS))) {
        private enum enumMixinStr_IPPROTO_DSTOPTS = `enum IPPROTO_DSTOPTS = IPPROTO_DSTOPTS;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_DSTOPTS); }))) {
            mixin(enumMixinStr_IPPROTO_DSTOPTS);
        }
    }




    static if(!is(typeof(IPPROTO_MH))) {
        private enum enumMixinStr_IPPROTO_MH = `enum IPPROTO_MH = IPPROTO_MH;`;
        static if(is(typeof({ mixin(enumMixinStr_IPPROTO_MH); }))) {
            mixin(enumMixinStr_IPPROTO_MH);
        }
    }




    static if(!is(typeof(IP_RECVTTL))) {
        private enum enumMixinStr_IP_RECVTTL = `enum IP_RECVTTL = 12;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_RECVTTL); }))) {
            mixin(enumMixinStr_IP_RECVTTL);
        }
    }




    static if(!is(typeof(IP_RECVERR))) {
        private enum enumMixinStr_IP_RECVERR = `enum IP_RECVERR = 11;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_RECVERR); }))) {
            mixin(enumMixinStr_IP_RECVERR);
        }
    }






    static if(!is(typeof(IN_CLASSA_NET))) {
        private enum enumMixinStr_IN_CLASSA_NET = `enum IN_CLASSA_NET = 0xff000000;`;
        static if(is(typeof({ mixin(enumMixinStr_IN_CLASSA_NET); }))) {
            mixin(enumMixinStr_IN_CLASSA_NET);
        }
    }




    static if(!is(typeof(IN_CLASSA_NSHIFT))) {
        private enum enumMixinStr_IN_CLASSA_NSHIFT = `enum IN_CLASSA_NSHIFT = 24;`;
        static if(is(typeof({ mixin(enumMixinStr_IN_CLASSA_NSHIFT); }))) {
            mixin(enumMixinStr_IN_CLASSA_NSHIFT);
        }
    }




    static if(!is(typeof(IN_CLASSA_HOST))) {
        private enum enumMixinStr_IN_CLASSA_HOST = `enum IN_CLASSA_HOST = ( 0xffffffff & ~ 0xff000000 );`;
        static if(is(typeof({ mixin(enumMixinStr_IN_CLASSA_HOST); }))) {
            mixin(enumMixinStr_IN_CLASSA_HOST);
        }
    }




    static if(!is(typeof(IN_CLASSA_MAX))) {
        private enum enumMixinStr_IN_CLASSA_MAX = `enum IN_CLASSA_MAX = 128;`;
        static if(is(typeof({ mixin(enumMixinStr_IN_CLASSA_MAX); }))) {
            mixin(enumMixinStr_IN_CLASSA_MAX);
        }
    }






    static if(!is(typeof(IN_CLASSB_NET))) {
        private enum enumMixinStr_IN_CLASSB_NET = `enum IN_CLASSB_NET = 0xffff0000;`;
        static if(is(typeof({ mixin(enumMixinStr_IN_CLASSB_NET); }))) {
            mixin(enumMixinStr_IN_CLASSB_NET);
        }
    }




    static if(!is(typeof(IN_CLASSB_NSHIFT))) {
        private enum enumMixinStr_IN_CLASSB_NSHIFT = `enum IN_CLASSB_NSHIFT = 16;`;
        static if(is(typeof({ mixin(enumMixinStr_IN_CLASSB_NSHIFT); }))) {
            mixin(enumMixinStr_IN_CLASSB_NSHIFT);
        }
    }




    static if(!is(typeof(IN_CLASSB_HOST))) {
        private enum enumMixinStr_IN_CLASSB_HOST = `enum IN_CLASSB_HOST = ( 0xffffffff & ~ 0xffff0000 );`;
        static if(is(typeof({ mixin(enumMixinStr_IN_CLASSB_HOST); }))) {
            mixin(enumMixinStr_IN_CLASSB_HOST);
        }
    }




    static if(!is(typeof(IN_CLASSB_MAX))) {
        private enum enumMixinStr_IN_CLASSB_MAX = `enum IN_CLASSB_MAX = 65536;`;
        static if(is(typeof({ mixin(enumMixinStr_IN_CLASSB_MAX); }))) {
            mixin(enumMixinStr_IN_CLASSB_MAX);
        }
    }






    static if(!is(typeof(IN_CLASSC_NET))) {
        private enum enumMixinStr_IN_CLASSC_NET = `enum IN_CLASSC_NET = 0xffffff00;`;
        static if(is(typeof({ mixin(enumMixinStr_IN_CLASSC_NET); }))) {
            mixin(enumMixinStr_IN_CLASSC_NET);
        }
    }




    static if(!is(typeof(IN_CLASSC_NSHIFT))) {
        private enum enumMixinStr_IN_CLASSC_NSHIFT = `enum IN_CLASSC_NSHIFT = 8;`;
        static if(is(typeof({ mixin(enumMixinStr_IN_CLASSC_NSHIFT); }))) {
            mixin(enumMixinStr_IN_CLASSC_NSHIFT);
        }
    }




    static if(!is(typeof(IN_CLASSC_HOST))) {
        private enum enumMixinStr_IN_CLASSC_HOST = `enum IN_CLASSC_HOST = ( 0xffffffff & ~ 0xffffff00 );`;
        static if(is(typeof({ mixin(enumMixinStr_IN_CLASSC_HOST); }))) {
            mixin(enumMixinStr_IN_CLASSC_HOST);
        }
    }
    static if(!is(typeof(INADDR_ANY))) {
        private enum enumMixinStr_INADDR_ANY = `enum INADDR_ANY = ( cast( in_addr_t ) 0x00000000 );`;
        static if(is(typeof({ mixin(enumMixinStr_INADDR_ANY); }))) {
            mixin(enumMixinStr_INADDR_ANY);
        }
    }




    static if(!is(typeof(INADDR_BROADCAST))) {
        private enum enumMixinStr_INADDR_BROADCAST = `enum INADDR_BROADCAST = ( cast( in_addr_t ) 0xffffffff );`;
        static if(is(typeof({ mixin(enumMixinStr_INADDR_BROADCAST); }))) {
            mixin(enumMixinStr_INADDR_BROADCAST);
        }
    }




    static if(!is(typeof(INADDR_NONE))) {
        private enum enumMixinStr_INADDR_NONE = `enum INADDR_NONE = ( cast( in_addr_t ) 0xffffffff );`;
        static if(is(typeof({ mixin(enumMixinStr_INADDR_NONE); }))) {
            mixin(enumMixinStr_INADDR_NONE);
        }
    }




    static if(!is(typeof(IN_LOOPBACKNET))) {
        private enum enumMixinStr_IN_LOOPBACKNET = `enum IN_LOOPBACKNET = 127;`;
        static if(is(typeof({ mixin(enumMixinStr_IN_LOOPBACKNET); }))) {
            mixin(enumMixinStr_IN_LOOPBACKNET);
        }
    }




    static if(!is(typeof(INADDR_LOOPBACK))) {
        private enum enumMixinStr_INADDR_LOOPBACK = `enum INADDR_LOOPBACK = ( cast( in_addr_t ) 0x7f000001 );`;
        static if(is(typeof({ mixin(enumMixinStr_INADDR_LOOPBACK); }))) {
            mixin(enumMixinStr_INADDR_LOOPBACK);
        }
    }




    static if(!is(typeof(INADDR_UNSPEC_GROUP))) {
        private enum enumMixinStr_INADDR_UNSPEC_GROUP = `enum INADDR_UNSPEC_GROUP = ( cast( in_addr_t ) 0xe0000000 );`;
        static if(is(typeof({ mixin(enumMixinStr_INADDR_UNSPEC_GROUP); }))) {
            mixin(enumMixinStr_INADDR_UNSPEC_GROUP);
        }
    }




    static if(!is(typeof(INADDR_ALLHOSTS_GROUP))) {
        private enum enumMixinStr_INADDR_ALLHOSTS_GROUP = `enum INADDR_ALLHOSTS_GROUP = ( cast( in_addr_t ) 0xe0000001 );`;
        static if(is(typeof({ mixin(enumMixinStr_INADDR_ALLHOSTS_GROUP); }))) {
            mixin(enumMixinStr_INADDR_ALLHOSTS_GROUP);
        }
    }




    static if(!is(typeof(INADDR_ALLRTRS_GROUP))) {
        private enum enumMixinStr_INADDR_ALLRTRS_GROUP = `enum INADDR_ALLRTRS_GROUP = ( cast( in_addr_t ) 0xe0000002 );`;
        static if(is(typeof({ mixin(enumMixinStr_INADDR_ALLRTRS_GROUP); }))) {
            mixin(enumMixinStr_INADDR_ALLRTRS_GROUP);
        }
    }




    static if(!is(typeof(INADDR_ALLSNOOPERS_GROUP))) {
        private enum enumMixinStr_INADDR_ALLSNOOPERS_GROUP = `enum INADDR_ALLSNOOPERS_GROUP = ( cast( in_addr_t ) 0xe000006a );`;
        static if(is(typeof({ mixin(enumMixinStr_INADDR_ALLSNOOPERS_GROUP); }))) {
            mixin(enumMixinStr_INADDR_ALLSNOOPERS_GROUP);
        }
    }




    static if(!is(typeof(INADDR_MAX_LOCAL_GROUP))) {
        private enum enumMixinStr_INADDR_MAX_LOCAL_GROUP = `enum INADDR_MAX_LOCAL_GROUP = ( cast( in_addr_t ) 0xe00000ff );`;
        static if(is(typeof({ mixin(enumMixinStr_INADDR_MAX_LOCAL_GROUP); }))) {
            mixin(enumMixinStr_INADDR_MAX_LOCAL_GROUP);
        }
    }




    static if(!is(typeof(IP_MTU_DISCOVER))) {
        private enum enumMixinStr_IP_MTU_DISCOVER = `enum IP_MTU_DISCOVER = 10;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_MTU_DISCOVER); }))) {
            mixin(enumMixinStr_IP_MTU_DISCOVER);
        }
    }




    static if(!is(typeof(IP_PMTUDISC))) {
        private enum enumMixinStr_IP_PMTUDISC = `enum IP_PMTUDISC = 10;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_PMTUDISC); }))) {
            mixin(enumMixinStr_IP_PMTUDISC);
        }
    }




    static if(!is(typeof(s6_addr))) {
        private enum enumMixinStr_s6_addr = `enum s6_addr = __in6_u . __u6_addr8;`;
        static if(is(typeof({ mixin(enumMixinStr_s6_addr); }))) {
            mixin(enumMixinStr_s6_addr);
        }
    }




    static if(!is(typeof(IP_PKTOPTIONS))) {
        private enum enumMixinStr_IP_PKTOPTIONS = `enum IP_PKTOPTIONS = 9;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_PKTOPTIONS); }))) {
            mixin(enumMixinStr_IP_PKTOPTIONS);
        }
    }




    static if(!is(typeof(s6_addr16))) {
        private enum enumMixinStr_s6_addr16 = `enum s6_addr16 = __in6_u . __u6_addr16;`;
        static if(is(typeof({ mixin(enumMixinStr_s6_addr16); }))) {
            mixin(enumMixinStr_s6_addr16);
        }
    }




    static if(!is(typeof(s6_addr32))) {
        private enum enumMixinStr_s6_addr32 = `enum s6_addr32 = __in6_u . __u6_addr32;`;
        static if(is(typeof({ mixin(enumMixinStr_s6_addr32); }))) {
            mixin(enumMixinStr_s6_addr32);
        }
    }




    static if(!is(typeof(IP_PKTINFO))) {
        private enum enumMixinStr_IP_PKTINFO = `enum IP_PKTINFO = 8;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_PKTINFO); }))) {
            mixin(enumMixinStr_IP_PKTINFO);
        }
    }




    static if(!is(typeof(IP_ROUTER_ALERT))) {
        private enum enumMixinStr_IP_ROUTER_ALERT = `enum IP_ROUTER_ALERT = 5;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_ROUTER_ALERT); }))) {
            mixin(enumMixinStr_IP_ROUTER_ALERT);
        }
    }




    static if(!is(typeof(IN6ADDR_ANY_INIT))) {
        private enum enumMixinStr_IN6ADDR_ANY_INIT = `enum IN6ADDR_ANY_INIT = { { { 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 } } };`;
        static if(is(typeof({ mixin(enumMixinStr_IN6ADDR_ANY_INIT); }))) {
            mixin(enumMixinStr_IN6ADDR_ANY_INIT);
        }
    }




    static if(!is(typeof(IN6ADDR_LOOPBACK_INIT))) {
        private enum enumMixinStr_IN6ADDR_LOOPBACK_INIT = `enum IN6ADDR_LOOPBACK_INIT = { { { 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 } } };`;
        static if(is(typeof({ mixin(enumMixinStr_IN6ADDR_LOOPBACK_INIT); }))) {
            mixin(enumMixinStr_IN6ADDR_LOOPBACK_INIT);
        }
    }




    static if(!is(typeof(INET_ADDRSTRLEN))) {
        private enum enumMixinStr_INET_ADDRSTRLEN = `enum INET_ADDRSTRLEN = 16;`;
        static if(is(typeof({ mixin(enumMixinStr_INET_ADDRSTRLEN); }))) {
            mixin(enumMixinStr_INET_ADDRSTRLEN);
        }
    }




    static if(!is(typeof(INET6_ADDRSTRLEN))) {
        private enum enumMixinStr_INET6_ADDRSTRLEN = `enum INET6_ADDRSTRLEN = 46;`;
        static if(is(typeof({ mixin(enumMixinStr_INET6_ADDRSTRLEN); }))) {
            mixin(enumMixinStr_INET6_ADDRSTRLEN);
        }
    }




    static if(!is(typeof(MCAST_INCLUDE))) {
        private enum enumMixinStr_MCAST_INCLUDE = `enum MCAST_INCLUDE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_MCAST_INCLUDE); }))) {
            mixin(enumMixinStr_MCAST_INCLUDE);
        }
    }




    static if(!is(typeof(MCAST_EXCLUDE))) {
        private enum enumMixinStr_MCAST_EXCLUDE = `enum MCAST_EXCLUDE = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_MCAST_EXCLUDE); }))) {
            mixin(enumMixinStr_MCAST_EXCLUDE);
        }
    }




    static if(!is(typeof(MCAST_MSFILTER))) {
        private enum enumMixinStr_MCAST_MSFILTER = `enum MCAST_MSFILTER = 48;`;
        static if(is(typeof({ mixin(enumMixinStr_MCAST_MSFILTER); }))) {
            mixin(enumMixinStr_MCAST_MSFILTER);
        }
    }




    static if(!is(typeof(MCAST_LEAVE_SOURCE_GROUP))) {
        private enum enumMixinStr_MCAST_LEAVE_SOURCE_GROUP = `enum MCAST_LEAVE_SOURCE_GROUP = 47;`;
        static if(is(typeof({ mixin(enumMixinStr_MCAST_LEAVE_SOURCE_GROUP); }))) {
            mixin(enumMixinStr_MCAST_LEAVE_SOURCE_GROUP);
        }
    }




    static if(!is(typeof(MCAST_JOIN_SOURCE_GROUP))) {
        private enum enumMixinStr_MCAST_JOIN_SOURCE_GROUP = `enum MCAST_JOIN_SOURCE_GROUP = 46;`;
        static if(is(typeof({ mixin(enumMixinStr_MCAST_JOIN_SOURCE_GROUP); }))) {
            mixin(enumMixinStr_MCAST_JOIN_SOURCE_GROUP);
        }
    }




    static if(!is(typeof(MCAST_LEAVE_GROUP))) {
        private enum enumMixinStr_MCAST_LEAVE_GROUP = `enum MCAST_LEAVE_GROUP = 45;`;
        static if(is(typeof({ mixin(enumMixinStr_MCAST_LEAVE_GROUP); }))) {
            mixin(enumMixinStr_MCAST_LEAVE_GROUP);
        }
    }




    static if(!is(typeof(MCAST_UNBLOCK_SOURCE))) {
        private enum enumMixinStr_MCAST_UNBLOCK_SOURCE = `enum MCAST_UNBLOCK_SOURCE = 44;`;
        static if(is(typeof({ mixin(enumMixinStr_MCAST_UNBLOCK_SOURCE); }))) {
            mixin(enumMixinStr_MCAST_UNBLOCK_SOURCE);
        }
    }




    static if(!is(typeof(MCAST_BLOCK_SOURCE))) {
        private enum enumMixinStr_MCAST_BLOCK_SOURCE = `enum MCAST_BLOCK_SOURCE = 43;`;
        static if(is(typeof({ mixin(enumMixinStr_MCAST_BLOCK_SOURCE); }))) {
            mixin(enumMixinStr_MCAST_BLOCK_SOURCE);
        }
    }




    static if(!is(typeof(MCAST_JOIN_GROUP))) {
        private enum enumMixinStr_MCAST_JOIN_GROUP = `enum MCAST_JOIN_GROUP = 42;`;
        static if(is(typeof({ mixin(enumMixinStr_MCAST_JOIN_GROUP); }))) {
            mixin(enumMixinStr_MCAST_JOIN_GROUP);
        }
    }
    static if(!is(typeof(IP_RETOPTS))) {
        private enum enumMixinStr_IP_RETOPTS = `enum IP_RETOPTS = 7;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_RETOPTS); }))) {
            mixin(enumMixinStr_IP_RETOPTS);
        }
    }




    static if(!is(typeof(IP_RECVRETOPTS))) {
        private enum enumMixinStr_IP_RECVRETOPTS = `enum IP_RECVRETOPTS = 7;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_RECVRETOPTS); }))) {
            mixin(enumMixinStr_IP_RECVRETOPTS);
        }
    }




    static if(!is(typeof(IP_RECVOPTS))) {
        private enum enumMixinStr_IP_RECVOPTS = `enum IP_RECVOPTS = 6;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_RECVOPTS); }))) {
            mixin(enumMixinStr_IP_RECVOPTS);
        }
    }




    static if(!is(typeof(IP_TTL))) {
        private enum enumMixinStr_IP_TTL = `enum IP_TTL = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_TTL); }))) {
            mixin(enumMixinStr_IP_TTL);
        }
    }




    static if(!is(typeof(IP_TOS))) {
        private enum enumMixinStr_IP_TOS = `enum IP_TOS = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_TOS); }))) {
            mixin(enumMixinStr_IP_TOS);
        }
    }




    static if(!is(typeof(IP_HDRINCL))) {
        private enum enumMixinStr_IP_HDRINCL = `enum IP_HDRINCL = 3;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_HDRINCL); }))) {
            mixin(enumMixinStr_IP_HDRINCL);
        }
    }




    static if(!is(typeof(IP_OPTIONS))) {
        private enum enumMixinStr_IP_OPTIONS = `enum IP_OPTIONS = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_IP_OPTIONS); }))) {
            mixin(enumMixinStr_IP_OPTIONS);
        }
    }
    static if(!is(typeof(__USE_KERNEL_IPV6_DEFS))) {
        private enum enumMixinStr___USE_KERNEL_IPV6_DEFS = `enum __USE_KERNEL_IPV6_DEFS = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_KERNEL_IPV6_DEFS); }))) {
            mixin(enumMixinStr___USE_KERNEL_IPV6_DEFS);
        }
    }




    static if(!is(typeof(__BYTE_ORDER))) {
        private enum enumMixinStr___BYTE_ORDER = `enum __BYTE_ORDER = __LITTLE_ENDIAN;`;
        static if(is(typeof({ mixin(enumMixinStr___BYTE_ORDER); }))) {
            mixin(enumMixinStr___BYTE_ORDER);
        }
    }




    static if(!is(typeof(_BITS_ENDIANNESS_H))) {
        private enum enumMixinStr__BITS_ENDIANNESS_H = `enum _BITS_ENDIANNESS_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_ENDIANNESS_H); }))) {
            mixin(enumMixinStr__BITS_ENDIANNESS_H);
        }
    }






    static if(!is(typeof(__FLOAT_WORD_ORDER))) {
        private enum enumMixinStr___FLOAT_WORD_ORDER = `enum __FLOAT_WORD_ORDER = __LITTLE_ENDIAN;`;
        static if(is(typeof({ mixin(enumMixinStr___FLOAT_WORD_ORDER); }))) {
            mixin(enumMixinStr___FLOAT_WORD_ORDER);
        }
    }
    static if(!is(typeof(__PDP_ENDIAN))) {
        private enum enumMixinStr___PDP_ENDIAN = `enum __PDP_ENDIAN = 3412;`;
        static if(is(typeof({ mixin(enumMixinStr___PDP_ENDIAN); }))) {
            mixin(enumMixinStr___PDP_ENDIAN);
        }
    }




    static if(!is(typeof(_STDC_PREDEF_H))) {
        private enum enumMixinStr__STDC_PREDEF_H = `enum _STDC_PREDEF_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__STDC_PREDEF_H); }))) {
            mixin(enumMixinStr__STDC_PREDEF_H);
        }
    }




    static if(!is(typeof(_STRING_H))) {
        private enum enumMixinStr__STRING_H = `enum _STRING_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__STRING_H); }))) {
            mixin(enumMixinStr__STRING_H);
        }
    }






    static if(!is(typeof(__BIG_ENDIAN))) {
        private enum enumMixinStr___BIG_ENDIAN = `enum __BIG_ENDIAN = 4321;`;
        static if(is(typeof({ mixin(enumMixinStr___BIG_ENDIAN); }))) {
            mixin(enumMixinStr___BIG_ENDIAN);
        }
    }




    static if(!is(typeof(__LITTLE_ENDIAN))) {
        private enum enumMixinStr___LITTLE_ENDIAN = `enum __LITTLE_ENDIAN = 1234;`;
        static if(is(typeof({ mixin(enumMixinStr___LITTLE_ENDIAN); }))) {
            mixin(enumMixinStr___LITTLE_ENDIAN);
        }
    }






    static if(!is(typeof(_BITS_ENDIAN_H))) {
        private enum enumMixinStr__BITS_ENDIAN_H = `enum _BITS_ENDIAN_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_ENDIAN_H); }))) {
            mixin(enumMixinStr__BITS_ENDIAN_H);
        }
    }
    static if(!is(typeof(_BITS_BYTESWAP_H))) {
        private enum enumMixinStr__BITS_BYTESWAP_H = `enum _BITS_BYTESWAP_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_BYTESWAP_H); }))) {
            mixin(enumMixinStr__BITS_BYTESWAP_H);
        }
    }




    static if(!is(typeof(__kernel_old_dev_t))) {
        private enum enumMixinStr___kernel_old_dev_t = `enum __kernel_old_dev_t = __kernel_old_dev_t;`;
        static if(is(typeof({ mixin(enumMixinStr___kernel_old_dev_t); }))) {
            mixin(enumMixinStr___kernel_old_dev_t);
        }
    }




    static if(!is(typeof(__kernel_old_uid_t))) {
        private enum enumMixinStr___kernel_old_uid_t = `enum __kernel_old_uid_t = __kernel_old_uid_t;`;
        static if(is(typeof({ mixin(enumMixinStr___kernel_old_uid_t); }))) {
            mixin(enumMixinStr___kernel_old_uid_t);
        }
    }






    static if(!is(typeof(__BITS_PER_LONG))) {
        private enum enumMixinStr___BITS_PER_LONG = `enum __BITS_PER_LONG = 64;`;
        static if(is(typeof({ mixin(enumMixinStr___BITS_PER_LONG); }))) {
            mixin(enumMixinStr___BITS_PER_LONG);
        }
    }






    static if(!is(typeof(SIOCGSTAMPNS_OLD))) {
        private enum enumMixinStr_SIOCGSTAMPNS_OLD = `enum SIOCGSTAMPNS_OLD = 0x8907;`;
        static if(is(typeof({ mixin(enumMixinStr_SIOCGSTAMPNS_OLD); }))) {
            mixin(enumMixinStr_SIOCGSTAMPNS_OLD);
        }
    }




    static if(!is(typeof(SIOCGSTAMP_OLD))) {
        private enum enumMixinStr_SIOCGSTAMP_OLD = `enum SIOCGSTAMP_OLD = 0x8906;`;
        static if(is(typeof({ mixin(enumMixinStr_SIOCGSTAMP_OLD); }))) {
            mixin(enumMixinStr_SIOCGSTAMP_OLD);
        }
    }




    static if(!is(typeof(SIOCATMARK))) {
        private enum enumMixinStr_SIOCATMARK = `enum SIOCATMARK = 0x8905;`;
        static if(is(typeof({ mixin(enumMixinStr_SIOCATMARK); }))) {
            mixin(enumMixinStr_SIOCATMARK);
        }
    }




    static if(!is(typeof(SIOCGPGRP))) {
        private enum enumMixinStr_SIOCGPGRP = `enum SIOCGPGRP = 0x8904;`;
        static if(is(typeof({ mixin(enumMixinStr_SIOCGPGRP); }))) {
            mixin(enumMixinStr_SIOCGPGRP);
        }
    }




    static if(!is(typeof(FIOGETOWN))) {
        private enum enumMixinStr_FIOGETOWN = `enum FIOGETOWN = 0x8903;`;
        static if(is(typeof({ mixin(enumMixinStr_FIOGETOWN); }))) {
            mixin(enumMixinStr_FIOGETOWN);
        }
    }




    static if(!is(typeof(SIOCSPGRP))) {
        private enum enumMixinStr_SIOCSPGRP = `enum SIOCSPGRP = 0x8902;`;
        static if(is(typeof({ mixin(enumMixinStr_SIOCSPGRP); }))) {
            mixin(enumMixinStr_SIOCSPGRP);
        }
    }




    static if(!is(typeof(FIOSETOWN))) {
        private enum enumMixinStr_FIOSETOWN = `enum FIOSETOWN = 0x8901;`;
        static if(is(typeof({ mixin(enumMixinStr_FIOSETOWN); }))) {
            mixin(enumMixinStr_FIOSETOWN);
        }
    }






    static if(!is(typeof(SCM_TIMESTAMPING))) {
        private enum enumMixinStr_SCM_TIMESTAMPING = `enum SCM_TIMESTAMPING = SO_TIMESTAMPING;`;
        static if(is(typeof({ mixin(enumMixinStr_SCM_TIMESTAMPING); }))) {
            mixin(enumMixinStr_SCM_TIMESTAMPING);
        }
    }




    static if(!is(typeof(SCM_TIMESTAMPNS))) {
        private enum enumMixinStr_SCM_TIMESTAMPNS = `enum SCM_TIMESTAMPNS = SO_TIMESTAMPNS;`;
        static if(is(typeof({ mixin(enumMixinStr_SCM_TIMESTAMPNS); }))) {
            mixin(enumMixinStr_SCM_TIMESTAMPNS);
        }
    }




    static if(!is(typeof(SCM_TIMESTAMP))) {
        private enum enumMixinStr_SCM_TIMESTAMP = `enum SCM_TIMESTAMP = SO_TIMESTAMP;`;
        static if(is(typeof({ mixin(enumMixinStr_SCM_TIMESTAMP); }))) {
            mixin(enumMixinStr_SCM_TIMESTAMP);
        }
    }




    static if(!is(typeof(SO_SNDTIMEO))) {
        private enum enumMixinStr_SO_SNDTIMEO = `enum SO_SNDTIMEO = SO_SNDTIMEO_OLD;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_SNDTIMEO); }))) {
            mixin(enumMixinStr_SO_SNDTIMEO);
        }
    }




    static if(!is(typeof(SO_RCVTIMEO))) {
        private enum enumMixinStr_SO_RCVTIMEO = `enum SO_RCVTIMEO = SO_RCVTIMEO_OLD;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_RCVTIMEO); }))) {
            mixin(enumMixinStr_SO_RCVTIMEO);
        }
    }




    static if(!is(typeof(SO_TIMESTAMPING))) {
        private enum enumMixinStr_SO_TIMESTAMPING = `enum SO_TIMESTAMPING = SO_TIMESTAMPING_OLD;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_TIMESTAMPING); }))) {
            mixin(enumMixinStr_SO_TIMESTAMPING);
        }
    }




    static if(!is(typeof(SO_TIMESTAMPNS))) {
        private enum enumMixinStr_SO_TIMESTAMPNS = `enum SO_TIMESTAMPNS = SO_TIMESTAMPNS_OLD;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_TIMESTAMPNS); }))) {
            mixin(enumMixinStr_SO_TIMESTAMPNS);
        }
    }




    static if(!is(typeof(SO_TIMESTAMP))) {
        private enum enumMixinStr_SO_TIMESTAMP = `enum SO_TIMESTAMP = SO_TIMESTAMP_OLD;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_TIMESTAMP); }))) {
            mixin(enumMixinStr_SO_TIMESTAMP);
        }
    }




    static if(!is(typeof(SO_DETACH_REUSEPORT_BPF))) {
        private enum enumMixinStr_SO_DETACH_REUSEPORT_BPF = `enum SO_DETACH_REUSEPORT_BPF = 68;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_DETACH_REUSEPORT_BPF); }))) {
            mixin(enumMixinStr_SO_DETACH_REUSEPORT_BPF);
        }
    }




    static if(!is(typeof(SO_SNDTIMEO_NEW))) {
        private enum enumMixinStr_SO_SNDTIMEO_NEW = `enum SO_SNDTIMEO_NEW = 67;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_SNDTIMEO_NEW); }))) {
            mixin(enumMixinStr_SO_SNDTIMEO_NEW);
        }
    }




    static if(!is(typeof(SO_RCVTIMEO_NEW))) {
        private enum enumMixinStr_SO_RCVTIMEO_NEW = `enum SO_RCVTIMEO_NEW = 66;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_RCVTIMEO_NEW); }))) {
            mixin(enumMixinStr_SO_RCVTIMEO_NEW);
        }
    }




    static if(!is(typeof(SO_TIMESTAMPING_NEW))) {
        private enum enumMixinStr_SO_TIMESTAMPING_NEW = `enum SO_TIMESTAMPING_NEW = 65;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_TIMESTAMPING_NEW); }))) {
            mixin(enumMixinStr_SO_TIMESTAMPING_NEW);
        }
    }




    static if(!is(typeof(SO_TIMESTAMPNS_NEW))) {
        private enum enumMixinStr_SO_TIMESTAMPNS_NEW = `enum SO_TIMESTAMPNS_NEW = 64;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_TIMESTAMPNS_NEW); }))) {
            mixin(enumMixinStr_SO_TIMESTAMPNS_NEW);
        }
    }




    static if(!is(typeof(SO_TIMESTAMP_NEW))) {
        private enum enumMixinStr_SO_TIMESTAMP_NEW = `enum SO_TIMESTAMP_NEW = 63;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_TIMESTAMP_NEW); }))) {
            mixin(enumMixinStr_SO_TIMESTAMP_NEW);
        }
    }




    static if(!is(typeof(SO_TIMESTAMPING_OLD))) {
        private enum enumMixinStr_SO_TIMESTAMPING_OLD = `enum SO_TIMESTAMPING_OLD = 37;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_TIMESTAMPING_OLD); }))) {
            mixin(enumMixinStr_SO_TIMESTAMPING_OLD);
        }
    }




    static if(!is(typeof(SO_TIMESTAMPNS_OLD))) {
        private enum enumMixinStr_SO_TIMESTAMPNS_OLD = `enum SO_TIMESTAMPNS_OLD = 35;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_TIMESTAMPNS_OLD); }))) {
            mixin(enumMixinStr_SO_TIMESTAMPNS_OLD);
        }
    }




    static if(!is(typeof(SO_TIMESTAMP_OLD))) {
        private enum enumMixinStr_SO_TIMESTAMP_OLD = `enum SO_TIMESTAMP_OLD = 29;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_TIMESTAMP_OLD); }))) {
            mixin(enumMixinStr_SO_TIMESTAMP_OLD);
        }
    }




    static if(!is(typeof(SO_BINDTOIFINDEX))) {
        private enum enumMixinStr_SO_BINDTOIFINDEX = `enum SO_BINDTOIFINDEX = 62;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_BINDTOIFINDEX); }))) {
            mixin(enumMixinStr_SO_BINDTOIFINDEX);
        }
    }




    static if(!is(typeof(SCM_TXTIME))) {
        private enum enumMixinStr_SCM_TXTIME = `enum SCM_TXTIME = SO_TXTIME;`;
        static if(is(typeof({ mixin(enumMixinStr_SCM_TXTIME); }))) {
            mixin(enumMixinStr_SCM_TXTIME);
        }
    }




    static if(!is(typeof(SO_TXTIME))) {
        private enum enumMixinStr_SO_TXTIME = `enum SO_TXTIME = 61;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_TXTIME); }))) {
            mixin(enumMixinStr_SO_TXTIME);
        }
    }




    static if(!is(typeof(SO_ZEROCOPY))) {
        private enum enumMixinStr_SO_ZEROCOPY = `enum SO_ZEROCOPY = 60;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_ZEROCOPY); }))) {
            mixin(enumMixinStr_SO_ZEROCOPY);
        }
    }




    static if(!is(typeof(SO_PEERGROUPS))) {
        private enum enumMixinStr_SO_PEERGROUPS = `enum SO_PEERGROUPS = 59;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_PEERGROUPS); }))) {
            mixin(enumMixinStr_SO_PEERGROUPS);
        }
    }




    static if(!is(typeof(SCM_TIMESTAMPING_PKTINFO))) {
        private enum enumMixinStr_SCM_TIMESTAMPING_PKTINFO = `enum SCM_TIMESTAMPING_PKTINFO = 58;`;
        static if(is(typeof({ mixin(enumMixinStr_SCM_TIMESTAMPING_PKTINFO); }))) {
            mixin(enumMixinStr_SCM_TIMESTAMPING_PKTINFO);
        }
    }




    static if(!is(typeof(SO_COOKIE))) {
        private enum enumMixinStr_SO_COOKIE = `enum SO_COOKIE = 57;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_COOKIE); }))) {
            mixin(enumMixinStr_SO_COOKIE);
        }
    }




    static if(!is(typeof(SO_INCOMING_NAPI_ID))) {
        private enum enumMixinStr_SO_INCOMING_NAPI_ID = `enum SO_INCOMING_NAPI_ID = 56;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_INCOMING_NAPI_ID); }))) {
            mixin(enumMixinStr_SO_INCOMING_NAPI_ID);
        }
    }




    static if(!is(typeof(SO_MEMINFO))) {
        private enum enumMixinStr_SO_MEMINFO = `enum SO_MEMINFO = 55;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_MEMINFO); }))) {
            mixin(enumMixinStr_SO_MEMINFO);
        }
    }




    static if(!is(typeof(SCM_TIMESTAMPING_OPT_STATS))) {
        private enum enumMixinStr_SCM_TIMESTAMPING_OPT_STATS = `enum SCM_TIMESTAMPING_OPT_STATS = 54;`;
        static if(is(typeof({ mixin(enumMixinStr_SCM_TIMESTAMPING_OPT_STATS); }))) {
            mixin(enumMixinStr_SCM_TIMESTAMPING_OPT_STATS);
        }
    }




    static if(!is(typeof(SO_CNX_ADVICE))) {
        private enum enumMixinStr_SO_CNX_ADVICE = `enum SO_CNX_ADVICE = 53;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_CNX_ADVICE); }))) {
            mixin(enumMixinStr_SO_CNX_ADVICE);
        }
    }




    static if(!is(typeof(SO_ATTACH_REUSEPORT_EBPF))) {
        private enum enumMixinStr_SO_ATTACH_REUSEPORT_EBPF = `enum SO_ATTACH_REUSEPORT_EBPF = 52;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_ATTACH_REUSEPORT_EBPF); }))) {
            mixin(enumMixinStr_SO_ATTACH_REUSEPORT_EBPF);
        }
    }




    static if(!is(typeof(SO_ATTACH_REUSEPORT_CBPF))) {
        private enum enumMixinStr_SO_ATTACH_REUSEPORT_CBPF = `enum SO_ATTACH_REUSEPORT_CBPF = 51;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_ATTACH_REUSEPORT_CBPF); }))) {
            mixin(enumMixinStr_SO_ATTACH_REUSEPORT_CBPF);
        }
    }




    static if(!is(typeof(SO_DETACH_BPF))) {
        private enum enumMixinStr_SO_DETACH_BPF = `enum SO_DETACH_BPF = SO_DETACH_FILTER;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_DETACH_BPF); }))) {
            mixin(enumMixinStr_SO_DETACH_BPF);
        }
    }




    static if(!is(typeof(SO_ATTACH_BPF))) {
        private enum enumMixinStr_SO_ATTACH_BPF = `enum SO_ATTACH_BPF = 50;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_ATTACH_BPF); }))) {
            mixin(enumMixinStr_SO_ATTACH_BPF);
        }
    }




    static if(!is(typeof(SO_INCOMING_CPU))) {
        private enum enumMixinStr_SO_INCOMING_CPU = `enum SO_INCOMING_CPU = 49;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_INCOMING_CPU); }))) {
            mixin(enumMixinStr_SO_INCOMING_CPU);
        }
    }




    static if(!is(typeof(SO_BPF_EXTENSIONS))) {
        private enum enumMixinStr_SO_BPF_EXTENSIONS = `enum SO_BPF_EXTENSIONS = 48;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_BPF_EXTENSIONS); }))) {
            mixin(enumMixinStr_SO_BPF_EXTENSIONS);
        }
    }




    static if(!is(typeof(SO_MAX_PACING_RATE))) {
        private enum enumMixinStr_SO_MAX_PACING_RATE = `enum SO_MAX_PACING_RATE = 47;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_MAX_PACING_RATE); }))) {
            mixin(enumMixinStr_SO_MAX_PACING_RATE);
        }
    }




    static if(!is(typeof(SO_BUSY_POLL))) {
        private enum enumMixinStr_SO_BUSY_POLL = `enum SO_BUSY_POLL = 46;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_BUSY_POLL); }))) {
            mixin(enumMixinStr_SO_BUSY_POLL);
        }
    }




    static if(!is(typeof(SO_SELECT_ERR_QUEUE))) {
        private enum enumMixinStr_SO_SELECT_ERR_QUEUE = `enum SO_SELECT_ERR_QUEUE = 45;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_SELECT_ERR_QUEUE); }))) {
            mixin(enumMixinStr_SO_SELECT_ERR_QUEUE);
        }
    }




    static if(!is(typeof(SO_LOCK_FILTER))) {
        private enum enumMixinStr_SO_LOCK_FILTER = `enum SO_LOCK_FILTER = 44;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_LOCK_FILTER); }))) {
            mixin(enumMixinStr_SO_LOCK_FILTER);
        }
    }




    static if(!is(typeof(SO_NOFCS))) {
        private enum enumMixinStr_SO_NOFCS = `enum SO_NOFCS = 43;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_NOFCS); }))) {
            mixin(enumMixinStr_SO_NOFCS);
        }
    }




    static if(!is(typeof(SO_PEEK_OFF))) {
        private enum enumMixinStr_SO_PEEK_OFF = `enum SO_PEEK_OFF = 42;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_PEEK_OFF); }))) {
            mixin(enumMixinStr_SO_PEEK_OFF);
        }
    }




    static if(!is(typeof(SCM_WIFI_STATUS))) {
        private enum enumMixinStr_SCM_WIFI_STATUS = `enum SCM_WIFI_STATUS = SO_WIFI_STATUS;`;
        static if(is(typeof({ mixin(enumMixinStr_SCM_WIFI_STATUS); }))) {
            mixin(enumMixinStr_SCM_WIFI_STATUS);
        }
    }




    static if(!is(typeof(SO_WIFI_STATUS))) {
        private enum enumMixinStr_SO_WIFI_STATUS = `enum SO_WIFI_STATUS = 41;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_WIFI_STATUS); }))) {
            mixin(enumMixinStr_SO_WIFI_STATUS);
        }
    }




    static if(!is(typeof(SO_RXQ_OVFL))) {
        private enum enumMixinStr_SO_RXQ_OVFL = `enum SO_RXQ_OVFL = 40;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_RXQ_OVFL); }))) {
            mixin(enumMixinStr_SO_RXQ_OVFL);
        }
    }




    static if(!is(typeof(SO_DOMAIN))) {
        private enum enumMixinStr_SO_DOMAIN = `enum SO_DOMAIN = 39;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_DOMAIN); }))) {
            mixin(enumMixinStr_SO_DOMAIN);
        }
    }




    static if(!is(typeof(SO_PROTOCOL))) {
        private enum enumMixinStr_SO_PROTOCOL = `enum SO_PROTOCOL = 38;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_PROTOCOL); }))) {
            mixin(enumMixinStr_SO_PROTOCOL);
        }
    }




    static if(!is(typeof(SO_MARK))) {
        private enum enumMixinStr_SO_MARK = `enum SO_MARK = 36;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_MARK); }))) {
            mixin(enumMixinStr_SO_MARK);
        }
    }




    static if(!is(typeof(SO_PASSSEC))) {
        private enum enumMixinStr_SO_PASSSEC = `enum SO_PASSSEC = 34;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_PASSSEC); }))) {
            mixin(enumMixinStr_SO_PASSSEC);
        }
    }




    static if(!is(typeof(SO_PEERSEC))) {
        private enum enumMixinStr_SO_PEERSEC = `enum SO_PEERSEC = 31;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_PEERSEC); }))) {
            mixin(enumMixinStr_SO_PEERSEC);
        }
    }




    static if(!is(typeof(SO_ACCEPTCONN))) {
        private enum enumMixinStr_SO_ACCEPTCONN = `enum SO_ACCEPTCONN = 30;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_ACCEPTCONN); }))) {
            mixin(enumMixinStr_SO_ACCEPTCONN);
        }
    }




    static if(!is(typeof(SO_PEERNAME))) {
        private enum enumMixinStr_SO_PEERNAME = `enum SO_PEERNAME = 28;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_PEERNAME); }))) {
            mixin(enumMixinStr_SO_PEERNAME);
        }
    }




    static if(!is(typeof(SO_GET_FILTER))) {
        private enum enumMixinStr_SO_GET_FILTER = `enum SO_GET_FILTER = SO_ATTACH_FILTER;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_GET_FILTER); }))) {
            mixin(enumMixinStr_SO_GET_FILTER);
        }
    }




    static if(!is(typeof(SO_DETACH_FILTER))) {
        private enum enumMixinStr_SO_DETACH_FILTER = `enum SO_DETACH_FILTER = 27;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_DETACH_FILTER); }))) {
            mixin(enumMixinStr_SO_DETACH_FILTER);
        }
    }




    static if(!is(typeof(SO_ATTACH_FILTER))) {
        private enum enumMixinStr_SO_ATTACH_FILTER = `enum SO_ATTACH_FILTER = 26;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_ATTACH_FILTER); }))) {
            mixin(enumMixinStr_SO_ATTACH_FILTER);
        }
    }




    static if(!is(typeof(SO_BINDTODEVICE))) {
        private enum enumMixinStr_SO_BINDTODEVICE = `enum SO_BINDTODEVICE = 25;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_BINDTODEVICE); }))) {
            mixin(enumMixinStr_SO_BINDTODEVICE);
        }
    }




    static if(!is(typeof(SO_SECURITY_ENCRYPTION_NETWORK))) {
        private enum enumMixinStr_SO_SECURITY_ENCRYPTION_NETWORK = `enum SO_SECURITY_ENCRYPTION_NETWORK = 24;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_SECURITY_ENCRYPTION_NETWORK); }))) {
            mixin(enumMixinStr_SO_SECURITY_ENCRYPTION_NETWORK);
        }
    }




    static if(!is(typeof(SO_SECURITY_ENCRYPTION_TRANSPORT))) {
        private enum enumMixinStr_SO_SECURITY_ENCRYPTION_TRANSPORT = `enum SO_SECURITY_ENCRYPTION_TRANSPORT = 23;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_SECURITY_ENCRYPTION_TRANSPORT); }))) {
            mixin(enumMixinStr_SO_SECURITY_ENCRYPTION_TRANSPORT);
        }
    }




    static if(!is(typeof(SO_SECURITY_AUTHENTICATION))) {
        private enum enumMixinStr_SO_SECURITY_AUTHENTICATION = `enum SO_SECURITY_AUTHENTICATION = 22;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_SECURITY_AUTHENTICATION); }))) {
            mixin(enumMixinStr_SO_SECURITY_AUTHENTICATION);
        }
    }




    static if(!is(typeof(SO_SNDTIMEO_OLD))) {
        private enum enumMixinStr_SO_SNDTIMEO_OLD = `enum SO_SNDTIMEO_OLD = 21;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_SNDTIMEO_OLD); }))) {
            mixin(enumMixinStr_SO_SNDTIMEO_OLD);
        }
    }




    static if(!is(typeof(SO_RCVTIMEO_OLD))) {
        private enum enumMixinStr_SO_RCVTIMEO_OLD = `enum SO_RCVTIMEO_OLD = 20;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_RCVTIMEO_OLD); }))) {
            mixin(enumMixinStr_SO_RCVTIMEO_OLD);
        }
    }




    static if(!is(typeof(SO_SNDLOWAT))) {
        private enum enumMixinStr_SO_SNDLOWAT = `enum SO_SNDLOWAT = 19;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_SNDLOWAT); }))) {
            mixin(enumMixinStr_SO_SNDLOWAT);
        }
    }




    static if(!is(typeof(SO_RCVLOWAT))) {
        private enum enumMixinStr_SO_RCVLOWAT = `enum SO_RCVLOWAT = 18;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_RCVLOWAT); }))) {
            mixin(enumMixinStr_SO_RCVLOWAT);
        }
    }




    static if(!is(typeof(SO_PEERCRED))) {
        private enum enumMixinStr_SO_PEERCRED = `enum SO_PEERCRED = 17;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_PEERCRED); }))) {
            mixin(enumMixinStr_SO_PEERCRED);
        }
    }




    static if(!is(typeof(SO_PASSCRED))) {
        private enum enumMixinStr_SO_PASSCRED = `enum SO_PASSCRED = 16;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_PASSCRED); }))) {
            mixin(enumMixinStr_SO_PASSCRED);
        }
    }




    static if(!is(typeof(SO_REUSEPORT))) {
        private enum enumMixinStr_SO_REUSEPORT = `enum SO_REUSEPORT = 15;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_REUSEPORT); }))) {
            mixin(enumMixinStr_SO_REUSEPORT);
        }
    }




    static if(!is(typeof(SO_BSDCOMPAT))) {
        private enum enumMixinStr_SO_BSDCOMPAT = `enum SO_BSDCOMPAT = 14;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_BSDCOMPAT); }))) {
            mixin(enumMixinStr_SO_BSDCOMPAT);
        }
    }




    static if(!is(typeof(SO_LINGER))) {
        private enum enumMixinStr_SO_LINGER = `enum SO_LINGER = 13;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_LINGER); }))) {
            mixin(enumMixinStr_SO_LINGER);
        }
    }




    static if(!is(typeof(SO_PRIORITY))) {
        private enum enumMixinStr_SO_PRIORITY = `enum SO_PRIORITY = 12;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_PRIORITY); }))) {
            mixin(enumMixinStr_SO_PRIORITY);
        }
    }




    static if(!is(typeof(SO_NO_CHECK))) {
        private enum enumMixinStr_SO_NO_CHECK = `enum SO_NO_CHECK = 11;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_NO_CHECK); }))) {
            mixin(enumMixinStr_SO_NO_CHECK);
        }
    }




    static if(!is(typeof(SO_OOBINLINE))) {
        private enum enumMixinStr_SO_OOBINLINE = `enum SO_OOBINLINE = 10;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_OOBINLINE); }))) {
            mixin(enumMixinStr_SO_OOBINLINE);
        }
    }




    static if(!is(typeof(SO_KEEPALIVE))) {
        private enum enumMixinStr_SO_KEEPALIVE = `enum SO_KEEPALIVE = 9;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_KEEPALIVE); }))) {
            mixin(enumMixinStr_SO_KEEPALIVE);
        }
    }




    static if(!is(typeof(SO_RCVBUFFORCE))) {
        private enum enumMixinStr_SO_RCVBUFFORCE = `enum SO_RCVBUFFORCE = 33;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_RCVBUFFORCE); }))) {
            mixin(enumMixinStr_SO_RCVBUFFORCE);
        }
    }




    static if(!is(typeof(SO_SNDBUFFORCE))) {
        private enum enumMixinStr_SO_SNDBUFFORCE = `enum SO_SNDBUFFORCE = 32;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_SNDBUFFORCE); }))) {
            mixin(enumMixinStr_SO_SNDBUFFORCE);
        }
    }




    static if(!is(typeof(SO_RCVBUF))) {
        private enum enumMixinStr_SO_RCVBUF = `enum SO_RCVBUF = 8;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_RCVBUF); }))) {
            mixin(enumMixinStr_SO_RCVBUF);
        }
    }




    static if(!is(typeof(SO_SNDBUF))) {
        private enum enumMixinStr_SO_SNDBUF = `enum SO_SNDBUF = 7;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_SNDBUF); }))) {
            mixin(enumMixinStr_SO_SNDBUF);
        }
    }




    static if(!is(typeof(SO_BROADCAST))) {
        private enum enumMixinStr_SO_BROADCAST = `enum SO_BROADCAST = 6;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_BROADCAST); }))) {
            mixin(enumMixinStr_SO_BROADCAST);
        }
    }




    static if(!is(typeof(SO_DONTROUTE))) {
        private enum enumMixinStr_SO_DONTROUTE = `enum SO_DONTROUTE = 5;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_DONTROUTE); }))) {
            mixin(enumMixinStr_SO_DONTROUTE);
        }
    }




    static if(!is(typeof(SO_ERROR))) {
        private enum enumMixinStr_SO_ERROR = `enum SO_ERROR = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_ERROR); }))) {
            mixin(enumMixinStr_SO_ERROR);
        }
    }




    static if(!is(typeof(SO_TYPE))) {
        private enum enumMixinStr_SO_TYPE = `enum SO_TYPE = 3;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_TYPE); }))) {
            mixin(enumMixinStr_SO_TYPE);
        }
    }




    static if(!is(typeof(SO_REUSEADDR))) {
        private enum enumMixinStr_SO_REUSEADDR = `enum SO_REUSEADDR = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_REUSEADDR); }))) {
            mixin(enumMixinStr_SO_REUSEADDR);
        }
    }




    static if(!is(typeof(SO_DEBUG))) {
        private enum enumMixinStr_SO_DEBUG = `enum SO_DEBUG = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_SO_DEBUG); }))) {
            mixin(enumMixinStr_SO_DEBUG);
        }
    }




    static if(!is(typeof(SOL_SOCKET))) {
        private enum enumMixinStr_SOL_SOCKET = `enum SOL_SOCKET = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_SOL_SOCKET); }))) {
            mixin(enumMixinStr_SOL_SOCKET);
        }
    }
    static if(!is(typeof(_ARPA_INET_H))) {
        private enum enumMixinStr__ARPA_INET_H = `enum _ARPA_INET_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__ARPA_INET_H); }))) {
            mixin(enumMixinStr__ARPA_INET_H);
        }
    }






    static if(!is(typeof(UDT_API))) {
        private enum enumMixinStr_UDT_API = `enum UDT_API = __attribute__ ( ( visibility ( "default" ) ) );`;
        static if(is(typeof({ mixin(enumMixinStr_UDT_API); }))) {
            mixin(enumMixinStr_UDT_API);
        }
    }






    static if(!is(typeof(_STRINGS_H))) {
        private enum enumMixinStr__STRINGS_H = `enum _STRINGS_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__STRINGS_H); }))) {
            mixin(enumMixinStr__STRINGS_H);
        }
    }




    static if(!is(typeof(_SYS_CDEFS_H))) {
        private enum enumMixinStr__SYS_CDEFS_H = `enum _SYS_CDEFS_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__SYS_CDEFS_H); }))) {
            mixin(enumMixinStr__SYS_CDEFS_H);
        }
    }
    static if(!is(typeof(__THROW))) {
        private enum enumMixinStr___THROW = `enum __THROW = __attribute__ ( ( __nothrow__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___THROW); }))) {
            mixin(enumMixinStr___THROW);
        }
    }




    static if(!is(typeof(__THROWNL))) {
        private enum enumMixinStr___THROWNL = `enum __THROWNL = __attribute__ ( ( __nothrow__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___THROWNL); }))) {
            mixin(enumMixinStr___THROWNL);
        }
    }
    static if(!is(typeof(__ptr_t))) {
        private enum enumMixinStr___ptr_t = `enum __ptr_t = void *;`;
        static if(is(typeof({ mixin(enumMixinStr___ptr_t); }))) {
            mixin(enumMixinStr___ptr_t);
        }
    }
    static if(!is(typeof(__flexarr))) {
        private enum enumMixinStr___flexarr = `enum __flexarr = [ ];`;
        static if(is(typeof({ mixin(enumMixinStr___flexarr); }))) {
            mixin(enumMixinStr___flexarr);
        }
    }




    static if(!is(typeof(__glibc_c99_flexarr_available))) {
        private enum enumMixinStr___glibc_c99_flexarr_available = `enum __glibc_c99_flexarr_available = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___glibc_c99_flexarr_available); }))) {
            mixin(enumMixinStr___glibc_c99_flexarr_available);
        }
    }
    static if(!is(typeof(__attribute_malloc__))) {
        private enum enumMixinStr___attribute_malloc__ = `enum __attribute_malloc__ = __attribute__ ( ( __malloc__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_malloc__); }))) {
            mixin(enumMixinStr___attribute_malloc__);
        }
    }






    static if(!is(typeof(__attribute_pure__))) {
        private enum enumMixinStr___attribute_pure__ = `enum __attribute_pure__ = __attribute__ ( ( __pure__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_pure__); }))) {
            mixin(enumMixinStr___attribute_pure__);
        }
    }




    static if(!is(typeof(__attribute_const__))) {
        private enum enumMixinStr___attribute_const__ = `enum __attribute_const__ = __attribute__ ( cast( __const__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_const__); }))) {
            mixin(enumMixinStr___attribute_const__);
        }
    }




    static if(!is(typeof(__attribute_used__))) {
        private enum enumMixinStr___attribute_used__ = `enum __attribute_used__ = __attribute__ ( ( __used__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_used__); }))) {
            mixin(enumMixinStr___attribute_used__);
        }
    }




    static if(!is(typeof(__attribute_noinline__))) {
        private enum enumMixinStr___attribute_noinline__ = `enum __attribute_noinline__ = __attribute__ ( ( __noinline__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_noinline__); }))) {
            mixin(enumMixinStr___attribute_noinline__);
        }
    }




    static if(!is(typeof(__attribute_deprecated__))) {
        private enum enumMixinStr___attribute_deprecated__ = `enum __attribute_deprecated__ = __attribute__ ( ( __deprecated__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_deprecated__); }))) {
            mixin(enumMixinStr___attribute_deprecated__);
        }
    }
    static if(!is(typeof(__attribute_warn_unused_result__))) {
        private enum enumMixinStr___attribute_warn_unused_result__ = `enum __attribute_warn_unused_result__ = __attribute__ ( ( __warn_unused_result__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_warn_unused_result__); }))) {
            mixin(enumMixinStr___attribute_warn_unused_result__);
        }
    }






    static if(!is(typeof(__always_inline))) {
        private enum enumMixinStr___always_inline = `enum __always_inline = __inline __attribute__ ( ( __always_inline__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___always_inline); }))) {
            mixin(enumMixinStr___always_inline);
        }
    }






    static if(!is(typeof(__extern_inline))) {
        private enum enumMixinStr___extern_inline = `enum __extern_inline = extern __inline __attribute__ ( ( __gnu_inline__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___extern_inline); }))) {
            mixin(enumMixinStr___extern_inline);
        }
    }




    static if(!is(typeof(__extern_always_inline))) {
        private enum enumMixinStr___extern_always_inline = `enum __extern_always_inline = extern __inline __attribute__ ( ( __always_inline__ ) ) __attribute__ ( ( __gnu_inline__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___extern_always_inline); }))) {
            mixin(enumMixinStr___extern_always_inline);
        }
    }




    static if(!is(typeof(__fortify_function))) {
        private enum enumMixinStr___fortify_function = `enum __fortify_function = extern __inline __attribute__ ( ( __always_inline__ ) ) __attribute__ ( ( __gnu_inline__ ) ) ;`;
        static if(is(typeof({ mixin(enumMixinStr___fortify_function); }))) {
            mixin(enumMixinStr___fortify_function);
        }
    }




    static if(!is(typeof(__restrict_arr))) {
        private enum enumMixinStr___restrict_arr = `enum __restrict_arr = __restrict;`;
        static if(is(typeof({ mixin(enumMixinStr___restrict_arr); }))) {
            mixin(enumMixinStr___restrict_arr);
        }
    }
    static if(!is(typeof(__HAVE_GENERIC_SELECTION))) {
        private enum enumMixinStr___HAVE_GENERIC_SELECTION = `enum __HAVE_GENERIC_SELECTION = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_GENERIC_SELECTION); }))) {
            mixin(enumMixinStr___HAVE_GENERIC_SELECTION);
        }
    }






    static if(!is(typeof(__attribute_returns_twice__))) {
        private enum enumMixinStr___attribute_returns_twice__ = `enum __attribute_returns_twice__ = __attribute__ ( ( __returns_twice__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_returns_twice__); }))) {
            mixin(enumMixinStr___attribute_returns_twice__);
        }
    }




    static if(!is(typeof(_SYS_SELECT_H))) {
        private enum enumMixinStr__SYS_SELECT_H = `enum _SYS_SELECT_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__SYS_SELECT_H); }))) {
            mixin(enumMixinStr__SYS_SELECT_H);
        }
    }






    static if(!is(typeof(__NFDBITS))) {
        private enum enumMixinStr___NFDBITS = `enum __NFDBITS = ( 8 * cast( int ) ( __fd_mask ) .sizeof );`;
        static if(is(typeof({ mixin(enumMixinStr___NFDBITS); }))) {
            mixin(enumMixinStr___NFDBITS);
        }
    }
    static if(!is(typeof(FD_SETSIZE))) {
        private enum enumMixinStr_FD_SETSIZE = `enum FD_SETSIZE = 1024;`;
        static if(is(typeof({ mixin(enumMixinStr_FD_SETSIZE); }))) {
            mixin(enumMixinStr_FD_SETSIZE);
        }
    }




    static if(!is(typeof(NFDBITS))) {
        private enum enumMixinStr_NFDBITS = `enum NFDBITS = ( 8 * cast( int ) ( __fd_mask ) .sizeof );`;
        static if(is(typeof({ mixin(enumMixinStr_NFDBITS); }))) {
            mixin(enumMixinStr_NFDBITS);
        }
    }
    static if(!is(typeof(_SYS_SOCKET_H))) {
        private enum enumMixinStr__SYS_SOCKET_H = `enum _SYS_SOCKET_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__SYS_SOCKET_H); }))) {
            mixin(enumMixinStr__SYS_SOCKET_H);
        }
    }




    static if(!is(typeof(SHUT_RD))) {
        private enum enumMixinStr_SHUT_RD = `enum SHUT_RD = SHUT_RD;`;
        static if(is(typeof({ mixin(enumMixinStr_SHUT_RD); }))) {
            mixin(enumMixinStr_SHUT_RD);
        }
    }




    static if(!is(typeof(SHUT_WR))) {
        private enum enumMixinStr_SHUT_WR = `enum SHUT_WR = SHUT_WR;`;
        static if(is(typeof({ mixin(enumMixinStr_SHUT_WR); }))) {
            mixin(enumMixinStr_SHUT_WR);
        }
    }




    static if(!is(typeof(SHUT_RDWR))) {
        private enum enumMixinStr_SHUT_RDWR = `enum SHUT_RDWR = SHUT_RDWR;`;
        static if(is(typeof({ mixin(enumMixinStr_SHUT_RDWR); }))) {
            mixin(enumMixinStr_SHUT_RDWR);
        }
    }




    static if(!is(typeof(__SOCKADDR_ARG))) {
        private enum enumMixinStr___SOCKADDR_ARG = `enum __SOCKADDR_ARG = sockaddr * __restrict;`;
        static if(is(typeof({ mixin(enumMixinStr___SOCKADDR_ARG); }))) {
            mixin(enumMixinStr___SOCKADDR_ARG);
        }
    }




    static if(!is(typeof(__CONST_SOCKADDR_ARG))) {
        private enum enumMixinStr___CONST_SOCKADDR_ARG = `enum __CONST_SOCKADDR_ARG = const sockaddr *;`;
        static if(is(typeof({ mixin(enumMixinStr___CONST_SOCKADDR_ARG); }))) {
            mixin(enumMixinStr___CONST_SOCKADDR_ARG);
        }
    }




    static if(!is(typeof(_SYS_TYPES_H))) {
        private enum enumMixinStr__SYS_TYPES_H = `enum _SYS_TYPES_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__SYS_TYPES_H); }))) {
            mixin(enumMixinStr__SYS_TYPES_H);
        }
    }
    static if(!is(typeof(__BIT_TYPES_DEFINED__))) {
        private enum enumMixinStr___BIT_TYPES_DEFINED__ = `enum __BIT_TYPES_DEFINED__ = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___BIT_TYPES_DEFINED__); }))) {
            mixin(enumMixinStr___BIT_TYPES_DEFINED__);
        }
    }
    static if(!is(typeof(NULL))) {
        private enum enumMixinStr_NULL = `enum NULL = ( cast( void * ) 0 );`;
        static if(is(typeof({ mixin(enumMixinStr_NULL); }))) {
            mixin(enumMixinStr_NULL);
        }
    }

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

 @property char[] clientHost() return {
  return fromStringz(this.clienthost.ptr);
 }

 @property char[] clientService() return {
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
 sockaddr_in handle = sockaddr_in(2,9000,in_addr(( cast( in_addr_t ) 0x00000000 )));
 alias handle this;

 this(sa_family_t family, ushort port, string address= null)
 {
  if (address.length ==0)
  {
   this.handle = sockaddr_in(family,port,in_addr(( cast( in_addr_t ) 0x00000000 )));
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
