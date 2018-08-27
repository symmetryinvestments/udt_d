


        import core.stdc.config;
        import core.stdc.stdarg: va_list;
        static import core.simd;

        struct __locale_data { int dummy; }

alias _Bool = bool;
struct dpp {
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
    struct __sigset_t
    {
        c_ulong[16] __val;
    }
    struct osockaddr
    {
        ushort sa_family;
        ubyte[14] sa_data;
    }


    alias sigset_t = __sigset_t;
    alias time_t = c_long;
    alias timer_t = void*;
    alias clockid_t = int;
    alias clock_t = c_long;




    struct timeval
    {
        __time_t tv_sec;
        __suseconds_t tv_usec;
    }
    struct timespec
    {
        __time_t tv_sec;
        __syscall_slong_t tv_nsec;
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
    alias int8_t = byte;
    alias locale_t = __locale_struct*;
    alias uint8_t = ubyte;






    alias uint16_t = ushort;
    alias int16_t = short;


    alias uint32_t = uint;




    alias int32_t = int;
    struct iovec
    {
        void* iov_base;
        size_t iov_len;
    }
    alias uint64_t = c_ulong;
    alias int64_t = c_long;
    alias pthread_t = c_ulong;
    alias sa_family_t = ushort;






    struct __locale_struct
    {
        __locale_data*[13] __locales;
        const(ushort)* __ctype_b;
        const(int)* __ctype_tolower;
        const(int)* __ctype_toupper;
        const(char)*[13] __names;
    }
    alias __u_char = ubyte;
    alias in_addr_t = uint;


    alias __u_short = ushort;



    struct in_addr
    {
        in_addr_t s_addr;
    }




    union pthread_mutexattr_t
    {
        char[4] __size;
        int __align;
    }
    static __uint16_t __uint16_identity(__uint16_t) @nogc nothrow;






    alias __u_int = uint;
    alias u_char = ubyte;
    alias socklen_t = uint;
    alias __u_long = c_ulong;




    alias u_short = ushort;
    int bcmp(const(void)*, const(void)*, size_t) @nogc nothrow;
    in_addr_t inet_addr(const(char)*) @nogc nothrow;







    alias u_int = uint;


    alias __int8_t = byte;



    alias u_long = c_ulong;
    alias __uint8_t = ubyte;


    in_addr_t inet_lnaof(in_addr) @nogc nothrow;




    alias quad_t = c_long;
    void bcopy(const(void)*, void*, size_t) @nogc nothrow;
    alias __int16_t = short;
    alias u_quad_t = c_ulong;




    static __uint32_t __uint32_identity(__uint32_t) @nogc nothrow;






    alias __uint16_t = ushort;
    alias fsid_t = __fsid_t;




    enum _Anonymous_0
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
    enum IPPROTO_IP = _Anonymous_0.IPPROTO_IP;
    enum IPPROTO_ICMP = _Anonymous_0.IPPROTO_ICMP;
    enum IPPROTO_IGMP = _Anonymous_0.IPPROTO_IGMP;
    enum IPPROTO_IPIP = _Anonymous_0.IPPROTO_IPIP;
    enum IPPROTO_TCP = _Anonymous_0.IPPROTO_TCP;
    enum IPPROTO_EGP = _Anonymous_0.IPPROTO_EGP;
    enum IPPROTO_PUP = _Anonymous_0.IPPROTO_PUP;
    enum IPPROTO_UDP = _Anonymous_0.IPPROTO_UDP;
    enum IPPROTO_IDP = _Anonymous_0.IPPROTO_IDP;
    enum IPPROTO_TP = _Anonymous_0.IPPROTO_TP;
    enum IPPROTO_DCCP = _Anonymous_0.IPPROTO_DCCP;
    enum IPPROTO_IPV6 = _Anonymous_0.IPPROTO_IPV6;
    enum IPPROTO_RSVP = _Anonymous_0.IPPROTO_RSVP;
    enum IPPROTO_GRE = _Anonymous_0.IPPROTO_GRE;
    enum IPPROTO_ESP = _Anonymous_0.IPPROTO_ESP;
    enum IPPROTO_AH = _Anonymous_0.IPPROTO_AH;
    enum IPPROTO_MTP = _Anonymous_0.IPPROTO_MTP;
    enum IPPROTO_BEETPH = _Anonymous_0.IPPROTO_BEETPH;
    enum IPPROTO_ENCAP = _Anonymous_0.IPPROTO_ENCAP;
    enum IPPROTO_PIM = _Anonymous_0.IPPROTO_PIM;
    enum IPPROTO_COMP = _Anonymous_0.IPPROTO_COMP;
    enum IPPROTO_SCTP = _Anonymous_0.IPPROTO_SCTP;
    enum IPPROTO_UDPLITE = _Anonymous_0.IPPROTO_UDPLITE;
    enum IPPROTO_MPLS = _Anonymous_0.IPPROTO_MPLS;
    enum IPPROTO_RAW = _Anonymous_0.IPPROTO_RAW;
    enum IPPROTO_MAX = _Anonymous_0.IPPROTO_MAX;




    alias __int32_t = int;
    in_addr inet_makeaddr(in_addr_t, in_addr_t) @nogc nothrow;


    union pthread_condattr_t
    {
        char[4] __size;
        int __align;
    }






    enum _Anonymous_1
    {
        SHUT_RD = 0,
        SHUT_WR = 1,
        SHUT_RDWR = 2,
    }
    enum SHUT_RD = _Anonymous_1.SHUT_RD;
    enum SHUT_WR = _Anonymous_1.SHUT_WR;
    enum SHUT_RDWR = _Anonymous_1.SHUT_RDWR;




    alias __uint32_t = uint;






    alias __locale_t = __locale_struct*;
    void* memcpy(void*, const(void)*, size_t) @nogc nothrow;
    void bzero(void*, size_t) @nogc nothrow;


    alias suseconds_t = c_long;




    alias __int64_t = c_long;
    alias __uint64_t = c_ulong;
    alias loff_t = c_long;
    static __uint64_t __uint64_identity(__uint64_t) @nogc nothrow;




    in_addr_t inet_netof(in_addr) @nogc nothrow;
    void* memmove(void*, const(void)*, size_t) @nogc nothrow;
    alias ino_t = c_ulong;






    alias __fd_mask = c_long;






    in_addr_t inet_network(const(char)*) @nogc nothrow;
    alias pthread_key_t = uint;
    alias __quad_t = c_long;
    void* memccpy(void*, const(void)*, int, size_t) @nogc nothrow;




    alias __u_quad_t = c_ulong;
    char* inet_ntoa(in_addr) @nogc nothrow;


    alias pthread_once_t = int;
    union pthread_attr_t
    {
        char[56] __size;
        c_long __align;
    }
    int inet_pton(int, const(char)*, void*) @nogc nothrow;
    struct fd_set
    {
        __fd_mask[16] __fds_bits;
    }






    void* memset(void*, int, size_t) @nogc nothrow;





    alias dev_t = c_ulong;
    alias __intmax_t = c_long;
    alias __uintmax_t = c_ulong;




    alias size_t = c_ulong;
    int memcmp(const(void)*, const(void)*, size_t) @nogc nothrow;
    const(char)* inet_ntop(int, const(void)*, char*, socklen_t) @nogc nothrow;
    alias gid_t = uint;




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
    union pthread_mutex_t
    {
        __pthread_mutex_s __data;
        char[40] __size;
        c_long __align;
    }
    char* index(const(char)*, int) @nogc nothrow;
    alias mode_t = uint;
    int inet_aton(const(char)*, in_addr*) @nogc nothrow;
    uint gnu_dev_major(__dev_t) @nogc nothrow;




    uint gnu_dev_minor(__dev_t) @nogc nothrow;
    __dev_t gnu_dev_makedev(uint, uint) @nogc nothrow;


    alias nlink_t = c_ulong;
    union pthread_cond_t
    {
        __pthread_cond_s __data;
        char[48] __size;
        long __align;
    }
    char* inet_neta(in_addr_t, char*, size_t) @nogc nothrow;
    alias fd_mask = c_long;
    alias uid_t = uint;
    alias __pthread_list_t = __pthread_internal_list;


    struct __pthread_internal_list
    {
        __pthread_internal_list* __prev;
        __pthread_internal_list* __next;
    }




    char* inet_net_ntop(int, const(void)*, int, char*, size_t) @nogc nothrow;
    union pthread_rwlock_t
    {
        __pthread_rwlock_arch_t __data;
        char[56] __size;
        c_long __align;
    }


    alias off_t = c_long;
    int inet_net_pton(int, const(char)*, void*, size_t) @nogc nothrow;
    alias SYSSOCKET = int;




    void* memchr(const(void)*, int, size_t) @nogc nothrow;
    alias UDPSOCKET = int;
    union pthread_rwlockattr_t
    {
        char[8] __size;
        c_long __align;
    }






    uint inet_nsap_addr(const(char)*, ubyte*, int) @nogc nothrow;
    alias UDTSOCKET = int;




    char* rindex(const(char)*, int) @nogc nothrow;
    alias pid_t = int;


    enum _Anonymous_2
    {
        IPPROTO_HOPOPTS = 0,
        IPPROTO_ROUTING = 43,
        IPPROTO_FRAGMENT = 44,
        IPPROTO_ICMPV6 = 58,
        IPPROTO_NONE = 59,
        IPPROTO_DSTOPTS = 60,
        IPPROTO_MH = 135,
    }
    enum IPPROTO_HOPOPTS = _Anonymous_2.IPPROTO_HOPOPTS;
    enum IPPROTO_ROUTING = _Anonymous_2.IPPROTO_ROUTING;
    enum IPPROTO_FRAGMENT = _Anonymous_2.IPPROTO_FRAGMENT;
    enum IPPROTO_ICMPV6 = _Anonymous_2.IPPROTO_ICMPV6;
    enum IPPROTO_NONE = _Anonymous_2.IPPROTO_NONE;
    enum IPPROTO_DSTOPTS = _Anonymous_2.IPPROTO_DSTOPTS;
    enum IPPROTO_MH = _Anonymous_2.IPPROTO_MH;
    char* inet_nsap_ntoa(int, const(ubyte)*, char*) @nogc nothrow;
    int select(int, fd_set*, fd_set*, fd_set*, timeval*) @nogc nothrow;






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
    int socket(int, int, int) @nogc nothrow;
    alias pthread_spinlock_t = int;
    alias id_t = uint;
    int ffs(int) @nogc nothrow;
    union pthread_barrier_t
    {
        char[32] __size;
        c_long __align;
    }
    int socketpair(int, int, int, int*) @nogc nothrow;


    alias ssize_t = c_long;
    int ffsl(c_long) @nogc nothrow;


    int ffsll(long) @nogc nothrow;
    int bind(int, const(sockaddr)*, socklen_t) @nogc nothrow;
    int pselect(int, fd_set*, fd_set*, fd_set*, const(timespec)*, const(__sigset_t)*) @nogc nothrow;






    union pthread_barrierattr_t
    {
        char[4] __size;
        int __align;
    }
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
    alias daddr_t = int;






    int getsockname(int, sockaddr*, socklen_t*) @nogc nothrow;
    alias caddr_t = char*;
    int strcasecmp(const(char)*, const(char)*) @nogc nothrow;
    struct __pthread_mutex_s
    {
        int __lock;
        uint __count;
        int __owner;
        uint __nusers;
        int __kind;
        short __spins;
        short __elision;
        __pthread_list_t __list;
    }
    alias in_port_t = ushort;
    int strncasecmp(const(char)*, const(char)*, size_t) @nogc nothrow;
    char* strcpy(char*, const(char)*) @nogc nothrow;
    enum _Anonymous_3
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
    enum IPPORT_ECHO = _Anonymous_3.IPPORT_ECHO;
    enum IPPORT_DISCARD = _Anonymous_3.IPPORT_DISCARD;
    enum IPPORT_SYSTAT = _Anonymous_3.IPPORT_SYSTAT;
    enum IPPORT_DAYTIME = _Anonymous_3.IPPORT_DAYTIME;
    enum IPPORT_NETSTAT = _Anonymous_3.IPPORT_NETSTAT;
    enum IPPORT_FTP = _Anonymous_3.IPPORT_FTP;
    enum IPPORT_TELNET = _Anonymous_3.IPPORT_TELNET;
    enum IPPORT_SMTP = _Anonymous_3.IPPORT_SMTP;
    enum IPPORT_TIMESERVER = _Anonymous_3.IPPORT_TIMESERVER;
    enum IPPORT_NAMESERVER = _Anonymous_3.IPPORT_NAMESERVER;
    enum IPPORT_WHOIS = _Anonymous_3.IPPORT_WHOIS;
    enum IPPORT_MTP = _Anonymous_3.IPPORT_MTP;
    enum IPPORT_TFTP = _Anonymous_3.IPPORT_TFTP;
    enum IPPORT_RJE = _Anonymous_3.IPPORT_RJE;
    enum IPPORT_FINGER = _Anonymous_3.IPPORT_FINGER;
    enum IPPORT_TTYLINK = _Anonymous_3.IPPORT_TTYLINK;
    enum IPPORT_SUPDUP = _Anonymous_3.IPPORT_SUPDUP;
    enum IPPORT_EXECSERVER = _Anonymous_3.IPPORT_EXECSERVER;
    enum IPPORT_LOGINSERVER = _Anonymous_3.IPPORT_LOGINSERVER;
    enum IPPORT_CMDSERVER = _Anonymous_3.IPPORT_CMDSERVER;
    enum IPPORT_EFSSERVER = _Anonymous_3.IPPORT_EFSSERVER;
    enum IPPORT_BIFFUDP = _Anonymous_3.IPPORT_BIFFUDP;
    enum IPPORT_WHOSERVER = _Anonymous_3.IPPORT_WHOSERVER;
    enum IPPORT_ROUTESERVER = _Anonymous_3.IPPORT_ROUTESERVER;
    enum IPPORT_RESERVED = _Anonymous_3.IPPORT_RESERVED;
    enum IPPORT_USERRESERVED = _Anonymous_3.IPPORT_USERRESERVED;


    alias key_t = int;
    char* strncpy(char*, const(char)*, size_t) @nogc nothrow;






    int connect(int, const(sockaddr)*, socklen_t) @nogc nothrow;






    int strcasecmp_l(const(char)*, const(char)*, locale_t) @nogc nothrow;
    char* strcat(char*, const(char)*) @nogc nothrow;






    int getpeername(int, sockaddr*, socklen_t*) @nogc nothrow;




    char* strncat(char*, const(char)*, size_t) @nogc nothrow;




    int strncasecmp_l(const(char)*, const(char)*, size_t, locale_t) @nogc nothrow;


    alias __dev_t = c_ulong;




    alias __uid_t = uint;


    alias __gid_t = uint;


    alias __ino_t = c_ulong;




    int strcmp(const(char)*, const(char)*) @nogc nothrow;




    alias __ino64_t = c_ulong;


    ssize_t send(int, const(void)*, size_t, int) @nogc nothrow;
    alias __mode_t = uint;




    int strncmp(const(char)*, const(char)*, size_t) @nogc nothrow;
    alias __nlink_t = c_ulong;
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
    alias __off_t = c_long;
    alias __off64_t = c_long;
    struct ip_opts
    {
        in_addr ip_dst;
        char[40] ip_opts_;
    }
    alias __pid_t = int;
    struct __fsid_t
    {
        int[2] __val;
    }
    int strcoll(const(char)*, const(char)*) @nogc nothrow;
    alias __clock_t = c_long;


    alias __rlim_t = c_ulong;
    ssize_t recv(int, void*, size_t, int) @nogc nothrow;


    alias __rlim64_t = c_ulong;
    c_ulong strxfrm(char*, const(char)*, size_t) @nogc nothrow;


    alias __id_t = uint;




    alias __time_t = c_long;


    alias __useconds_t = uint;


    struct ip_mreqn
    {
        in_addr imr_multiaddr;
        in_addr imr_address;
        int imr_ifindex;
    }


    alias __suseconds_t = c_long;


    struct __pthread_cond_s
    {
        static union _Anonymous_4
        {
            ulong __wseq;
            static struct _Anonymous_5
            {
                uint __low;
                uint __high;
            }
            _Anonymous_5 __wseq32;
        }
        _Anonymous_4 _anonymous_6;
        auto __wseq() @property @nogc pure nothrow { return _anonymous_6.__wseq; }
        void __wseq(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_6.__wseq = val; }
        auto __wseq32() @property @nogc pure nothrow { return _anonymous_6.__wseq32; }
        void __wseq32(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_6.__wseq32 = val; }
        static union _Anonymous_7
        {
            ulong __g1_start;
            static struct _Anonymous_8
            {
                uint __low;
                uint __high;
            }
            _Anonymous_8 __g1_start32;
        }
        _Anonymous_7 _anonymous_9;
        auto __g1_start() @property @nogc pure nothrow { return _anonymous_9.__g1_start; }
        void __g1_start(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_9.__g1_start = val; }
        auto __g1_start32() @property @nogc pure nothrow { return _anonymous_9.__g1_start32; }
        void __g1_start32(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_9.__g1_start32 = val; }
        uint[2] __g_refs;
        uint[2] __g_size;
        uint __g1_orig_size;
        uint __wrefs;
        uint[2] __g_signals;
    }


    alias __daddr_t = int;
    ssize_t sendto(int, const(void)*, size_t, int, const(sockaddr)*, socklen_t) @nogc nothrow;


    alias __key_t = int;




    int strcoll_l(const(char)*, const(char)*, locale_t) @nogc nothrow;
    alias __clockid_t = int;


    struct in_pktinfo
    {
        int ipi_ifindex;
        in_addr ipi_spec_dst;
        in_addr ipi_addr;
    }







    size_t strxfrm_l(char*, const(char)*, size_t, locale_t) @nogc nothrow;


    alias __timer_t = void*;






    alias __blksize_t = c_long;
    ssize_t recvfrom(int, void*, size_t, int, sockaddr*, socklen_t*) @nogc nothrow;
    char* strdup(const(char)*) @nogc nothrow;


    alias __blkcnt_t = c_long;
    alias __blkcnt64_t = c_long;
    alias __fsblkcnt_t = c_ulong;






    alias __fsblkcnt64_t = c_ulong;
    ssize_t sendmsg(int, const(msghdr)*, int) @nogc nothrow;




    char* strndup(const(char)*, size_t) @nogc nothrow;






    struct sockaddr
    {
        sa_family_t sa_family;
        char[14] sa_data;
    }
    alias __fsfilcnt_t = c_ulong;
    alias __fsfilcnt64_t = c_ulong;







    alias u_int8_t = ubyte;



    alias u_int16_t = ushort;
    alias __fsword_t = c_long;




    alias u_int32_t = uint;
    alias UDT_TRACEINFO = UDT_CPerfMon_;
    struct UDT_CPerfMon_
    {
        int64_t msTimeStamp;
        int64_t pktSentTotal;
        int64_t pktRecvTotal;
        int pktSndLossTotal;
        int pktRcvLossTotal;
        int pktRetransTotal;
        int pktSentACKTotal;
        int pktRecvACKTotal;
        int pktSentNAKTotal;
        int pktRecvNAKTotal;
        int64_t usSndDurationTotal;
        int64_t pktSent;
        int64_t pktRecv;
        int pktSndLoss;
        int pktRcvLoss;
        int pktRetrans;
        int pktSentACK;
        int pktRecvACK;
        int pktSentNAK;
        int pktRecvNAK;
        double mbpsSendRate;
        double mbpsRecvRate;
        int64_t usSndDuration;
        double usPktSndPeriod;
        int pktFlowWindow;
        int pktCongestionWindow;
        int pktFlightSize;
        double msRTT;
        double mbpsBandwidth;
        int byteAvailSndBuf;
        int byteAvailRcvBuf;
    }






    alias u_int64_t = c_ulong;
    alias __ssize_t = c_long;
    alias register_t = c_long;


    alias __syscall_slong_t = c_long;
    alias __syscall_ulong_t = c_ulong;
    struct sockaddr_storage
    {
        sa_family_t ss_family;
        char[118] __ss_padding;
        c_ulong __ss_align;
    }
    alias __loff_t = c_long;
    ssize_t recvmsg(int, msghdr*, int) @nogc nothrow;


    alias __caddr_t = char*;
    alias __intptr_t = c_long;




    enum _Anonymous_10
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
    enum MSG_OOB = _Anonymous_10.MSG_OOB;
    enum MSG_PEEK = _Anonymous_10.MSG_PEEK;
    enum MSG_DONTROUTE = _Anonymous_10.MSG_DONTROUTE;
    enum MSG_CTRUNC = _Anonymous_10.MSG_CTRUNC;
    enum MSG_PROXY = _Anonymous_10.MSG_PROXY;
    enum MSG_TRUNC = _Anonymous_10.MSG_TRUNC;
    enum MSG_DONTWAIT = _Anonymous_10.MSG_DONTWAIT;
    enum MSG_EOR = _Anonymous_10.MSG_EOR;
    enum MSG_WAITALL = _Anonymous_10.MSG_WAITALL;
    enum MSG_FIN = _Anonymous_10.MSG_FIN;
    enum MSG_SYN = _Anonymous_10.MSG_SYN;
    enum MSG_CONFIRM = _Anonymous_10.MSG_CONFIRM;
    enum MSG_RST = _Anonymous_10.MSG_RST;
    enum MSG_ERRQUEUE = _Anonymous_10.MSG_ERRQUEUE;
    enum MSG_NOSIGNAL = _Anonymous_10.MSG_NOSIGNAL;
    enum MSG_MORE = _Anonymous_10.MSG_MORE;
    enum MSG_WAITFORONE = _Anonymous_10.MSG_WAITFORONE;
    enum MSG_BATCH = _Anonymous_10.MSG_BATCH;
    enum MSG_ZEROCOPY = _Anonymous_10.MSG_ZEROCOPY;
    enum MSG_FASTOPEN = _Anonymous_10.MSG_FASTOPEN;
    enum MSG_CMSG_CLOEXEC = _Anonymous_10.MSG_CMSG_CLOEXEC;


    alias __socklen_t = uint;
    alias __sig_atomic_t = int;
    int getsockopt(int, int, int, void*, socklen_t*) @nogc nothrow;




    struct in6_addr
    {
        static union _Anonymous_11
        {
            uint8_t[16] __u6_addr8;
            uint16_t[8] __u6_addr16;
            uint32_t[4] __u6_addr32;
        }
        _Anonymous_11 __in6_u;
    }




    alias blksize_t = c_long;
    int setsockopt(int, int, int, const(void)*, socklen_t) @nogc nothrow;
    extern __gshared const(UDTSOCKET) UDT_INVALID_SOCK;




    alias blkcnt_t = c_long;
    extern __gshared const(int) UDT_ERROR;






    int listen(int, int) @nogc nothrow;


    alias fsblkcnt_t = c_ulong;


    int udt_startup() @nogc nothrow;




    char* strchr(const(char)*, int) @nogc nothrow;
    int udt_cleanup() @nogc nothrow;




    alias fsfilcnt_t = c_ulong;




    extern __gshared const(in6_addr) in6addr_any;




    extern __gshared const(in6_addr) in6addr_loopback;
    UDTSOCKET udt_socket(int, int, int) @nogc nothrow;




    int udt_bind(UDTSOCKET, const(sockaddr)*, int) @nogc nothrow;




    int udt_bind2(UDTSOCKET, UDPSOCKET) @nogc nothrow;






    int udt_listen(UDTSOCKET, int) @nogc nothrow;
    UDTSOCKET udt_accept(UDTSOCKET, sockaddr*, int*) @nogc nothrow;
    int accept(int, sockaddr*, socklen_t*) @nogc nothrow;




    int udt_connect(UDTSOCKET, const(sockaddr)*, int) @nogc nothrow;






    int udt_close(UDTSOCKET) @nogc nothrow;




    int udt_getpeername(UDTSOCKET, sockaddr*, int*) @nogc nothrow;
    int udt_getsockname(UDTSOCKET, sockaddr*, int*) @nogc nothrow;
    struct sockaddr_in
    {
        sa_family_t sin_family;
        in_port_t sin_port;
        in_addr sin_addr;
        ubyte[8] sin_zero;
    }


    int udt_getsockopt(UDTSOCKET, int, int, void*, int*) @nogc nothrow;
    int udt_setsockopt(UDTSOCKET, int, int, const(void)*, int) @nogc nothrow;
    int udt_send(UDTSOCKET, const(char)*, int, int) @nogc nothrow;




    int udt_recv(UDTSOCKET, char*, int, int) @nogc nothrow;
    int udt_sendmsg(UDTSOCKET, const(char)*, int, int, int) @nogc nothrow;




    int udt_recvmsg(UDTSOCKET, char*, int) @nogc nothrow;
    int64_t udt_sendfile2(UDTSOCKET, const(char)*, int64_t*, int64_t, int) @nogc nothrow;


    int64_t udt_recvfile2(UDTSOCKET, const(char)*, int64_t*, int64_t, int) @nogc nothrow;




    const(char)* udt_getlasterror_desc() @nogc nothrow;


    int udt_getlasterror_code() @nogc nothrow;
    int shutdown(int, int) @nogc nothrow;


    void udt_clearlasterror() @nogc nothrow;
    char* strrchr(const(char)*, int) @nogc nothrow;
    struct sockaddr_in6
    {
        sa_family_t sin6_family;
        in_port_t sin6_port;
        uint32_t sin6_flowinfo;
        in6_addr sin6_addr;
        uint32_t sin6_scope_id;
    }


    int udt_perfmon(UDTSOCKET, UDT_TRACEINFO*, int) @nogc nothrow;
    struct msghdr
    {
        void* msg_name;
        socklen_t msg_namelen;
        iovec* msg_iov;
        size_t msg_iovlen;
        void* msg_control;
        size_t msg_controllen;
        int msg_flags;
    }


    int sockatmark(int) @nogc nothrow;





    int udt_getsockstate(UDTSOCKET) @nogc nothrow;


    enum UDT_EPOLLOpt
    {
        UDT_UDT_EPOLL_IN = 1,
        UDT_UDT_EPOLL_OUT = 4,
        UDT_UDT_EPOLL_ERR = 8,
    }
    enum UDT_UDT_EPOLL_IN = UDT_EPOLLOpt.UDT_UDT_EPOLL_IN;
    enum UDT_UDT_EPOLL_OUT = UDT_EPOLLOpt.UDT_UDT_EPOLL_OUT;
    enum UDT_UDT_EPOLL_ERR = UDT_EPOLLOpt.UDT_UDT_EPOLL_ERR;


    int isfdtype(int, int) @nogc nothrow;
    struct ip_mreq
    {
        in_addr imr_multiaddr;
        in_addr imr_interface;
    }




    int udt_epoll_create() @nogc nothrow;
    int udt_epoll_add_usock(int, UDTSOCKET, const(int)*) @nogc nothrow;
    int udt_epoll_add_ssock(int, SYSSOCKET, const(int)*) @nogc nothrow;
    struct cmsghdr
    {
        size_t cmsg_len;
        int cmsg_level;
        int cmsg_type;
        ubyte[0] __cmsg_data;
    }
    c_ulong strcspn(const(char)*, const(char)*) @nogc nothrow;
    struct ip_mreq_source
    {
        in_addr imr_multiaddr;
        in_addr imr_interface;
        in_addr imr_sourceaddr;
    }
    int udt_epoll_remove_usock(int, UDTSOCKET) @nogc nothrow;
    int udt_epoll_remove_ssock(int, SYSSOCKET) @nogc nothrow;
    c_ulong strspn(const(char)*, const(char)*) @nogc nothrow;
    int udt_epoll_wait2(int, UDTSOCKET*, int*, UDTSOCKET*, int*, int64_t, SYSSOCKET*, int*, SYSSOCKET*, int*) @nogc nothrow;



    int udt_epoll_release(int) @nogc nothrow;
    struct ipv6_mreq
    {
        in6_addr ipv6mr_multiaddr;
        uint ipv6mr_interface;
    }
    struct group_req
    {
        uint32_t gr_interface;
        sockaddr_storage gr_group;
    }




    char* strpbrk(const(char)*, const(char)*) @nogc nothrow;
    cmsghdr* __cmsg_nxthdr(msghdr*, cmsghdr*) @nogc nothrow;






    struct group_source_req
    {
        uint32_t gsr_interface;
        sockaddr_storage gsr_group;
        sockaddr_storage gsr_source;
    }






    struct ip_msfilter
    {
        in_addr imsf_multiaddr;
        in_addr imsf_interface;
        uint32_t imsf_fmode;
        uint32_t imsf_numsrc;
        in_addr[1] imsf_slist;
    }






    char* strstr(const(char)*, const(char)*) @nogc nothrow;
    enum _Anonymous_12
    {
        SCM_RIGHTS = 1,
    }
    enum SCM_RIGHTS = _Anonymous_12.SCM_RIGHTS;


    char* strtok(char*, const(char)*) @nogc nothrow;




    char* __strtok_r(char*, const(char)*, char**) @nogc nothrow;





    struct group_filter
    {
        uint32_t gf_interface;
        sockaddr_storage gf_group;
        uint32_t gf_fmode;
        uint32_t gf_numsrc;
        sockaddr_storage[1] gf_slist;
    }
    char* strtok_r(char*, const(char)*, char**) @nogc nothrow;
    uint32_t ntohl(uint32_t) @nogc nothrow;
    uint16_t ntohs(uint16_t) @nogc nothrow;


    uint32_t htonl(uint32_t) @nogc nothrow;


    uint16_t htons(uint16_t) @nogc nothrow;




    c_ulong strlen(const(char)*) @nogc nothrow;




    size_t strnlen(const(char)*, size_t) @nogc nothrow;






    char* strerror(int) @nogc nothrow;
    int strerror_r(int, char*, size_t) @nogc nothrow;
    char* strerror_l(int, locale_t) @nogc nothrow;





    void explicit_bzero(void*, size_t) @nogc nothrow;







    char* strsep(char**, const(char)*) @nogc nothrow;
    struct linger
    {
        int l_onoff;
        int l_linger;
    }
    char* strsignal(int) @nogc nothrow;
    char* __stpcpy(char*, const(char)*) @nogc nothrow;




    char* stpcpy(char*, const(char)*) @nogc nothrow;
    char* __stpncpy(char*, const(char)*, size_t) @nogc nothrow;





    char* stpncpy(char*, const(char)*, size_t) @nogc nothrow;
    int bindresvport(int, sockaddr_in*) @nogc nothrow;
    int bindresvport6(int, sockaddr_in6*) @nogc nothrow;
}



import core.time:Duration,msecs;
import std.string:toStringz,fromStringz;
import std.conv:to;
import std.exception:enforce;
import std.format:format;

mixin dpp.EnumD!("SocketType",__socket_type,"SOCK_");
mixin dpp.EnumD!("Status",UDT_UDTSTATUS,"UDT_");
mixin dpp.EnumD!("Option",UDT_UDTOpt,"UDT_");
mixin dpp.EnumD!("ErrNo",UDT_ERRNO,"UDT_");
mixin dpp.EnumD!("EpollOption",UDT_EPOLLOpt,"UDT_UDT_");

alias AddressFamily = typeof(2);
struct SocketAddress
{
 sockaddr handle;
 alias handle this;
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
 uint retSize;
 int result = getsockopt(socket,0,option,cast(void*)&ret,&retSize);
 enforce(result != UDT_ERROR, format!"error getting socket option %s for %s: %s"(option,socket,getLastError()));
 return ret;
}

private void setSocketOptionHelper(T)(UDTSOCKET socket, UDT_UDTOpt option, T value)
{
 T temp = value;
 int result = setsockopt(socket,0,option,cast(void*)&temp,temp.sizeof.to!int);
 enforce(result != UDT_ERROR, format!"error setting socket option %s for %s: %s"(option,socket,getLastError()));
}







struct SocketOptions
{
 @disable this(this);
 UdtSocket socket;

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


struct UdtSocket
{
 UDTSOCKET handle = -1;
 alias handle this;


 int state()
 {
  return udt_getsockstate(this.handle);
 }

 string toString()
 {
  return "";
 }

 SocketAddress peerName()
 {
  SocketAddress ret;
  int retLength;
  int result = udt_getpeername(this.handle,&ret.handle,&retLength);
  enforce(result != UDT_ERROR, format!"unable to get peername info: %s"(getLastError()));
  return SocketAddress(ret.handle);
 }

 SocketAddress socketName()
 {
  SocketAddress ret;
  int retLength;
  int result = udt_getsockname(this.handle,&ret.handle,&retLength);
  return SocketAddress(ret.handle);
 }
 auto ref options()
 {
  return SocketOptions(UdtSocket(this.handle));
 }

 static auto create(AddressFamily addressFamily, SocketType socketType, int something)
 {
  return UdtSocket(udt_socket(addressFamily.to!int, socketType.to!int,something));
 }

 void bind(ref SocketAddress socketAddress)
 {
  int result = udt_bind(this.handle, &socketAddress.handle,socketAddress.handle.sizeof);
  enforce(result != UDT_ERROR, format!"unable to bind to %s: %s"(socketAddress,getLastError()));
 }

 void bind2(ref UdtSocket socket)
 {
  int result = udt_bind2(this.handle, socket.handle);
  enforce(result != UDT_ERROR, format!"unable to bind to UDP Socket %s: %s"(socket,getLastError()));
 }

 void connect(ref SocketAddress socketAddress)
 {
  int result = udt_connect(this.handle,&socketAddress.handle,socketAddress.handle.sizeof);
  enforce(result != UDT_ERROR, format!"unable to connect to %s: %s"(socketAddress,getLastError()));
 }

 void listen(int something)
 {
  enforce(udt_listen(this.handle,something) != UDT_ERROR,format!"unable to bind to listen to %s: %s"(something,getLastError()));
 }

 void accept(ref SocketAddress socketAddress)
 {
  int retLength;
  int result = udt_accept(this.handle, &socketAddress.handle,&retLength);
  enforce(result != UDT_ERROR, format!"unable to bind to %s: %s"(socketAddress,getLastError()));
 }

 auto receive(out ubyte[] data, int something)
 {
  int result = udt_recv(this.handle,cast(char*)data.ptr,data.length.to!int,something);
  enforce(result != UDT_ERROR, format!"unable to receive data to buffer of length %s: %s"(data.length,getLastError()));
  return result;
 }

 auto send (scope ubyte[] data, int something)
 {
  int result = udt_send(this.handle,cast(char*)data.ptr,data.length.to!int,something);
  enforce(result != UDT_ERROR, format!"unable to send data of length %s: %s"(data.length,getLastError()));
  return result;
 }

 auto receiveMessage(out ubyte[] data)
 {
  int result = udt_recvmsg(this.handle,cast(char*)data.ptr,data.length.to!int);
  enforce(result != UDT_ERROR, format!"unable to receive message to buffer of length %s: %s"(data.length,getLastError()));
  return result;
 }

 auto sendMessage(scope ubyte[] data, int something1,int something2)
 {
  int result = udt_sendmsg(this.handle,cast(char*)data.ptr,data.length.to!int,something1,something2);
  enforce(result != UDT_ERROR, format!"unable to send message of length %s: %s"(data.length,getLastError()));
  return result;
 }

 auto receiveFile(out ubyte[] data, ref long offset, int block)
 {
  long result = udt_recvfile2(this.handle,cast(char*)data.ptr,&offset, data.length.to!long,block);
  enforce(result != UDT_ERROR, format!"unable to receive data to buffer of length %s: %s"(data.length,getLastError()));
  data.length = result;
  return result;
 }

 auto sendFile(scope ubyte[] data, ref long offset, int block)
 {
  long result = udt_sendfile2(this.handle,cast(char*)data.ptr,&offset,data.length.to!long,block);
  enforce(result != UDT_ERROR, format!"unable to send file of length %s: %s"(data.length,getLastError()));
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
