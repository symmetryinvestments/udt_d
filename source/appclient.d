


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


    alias clockid_t = int;
    alias clock_t = c_long;
    alias timer_t = void*;
    alias time_t = c_long;


    alias sigset_t = __sigset_t;
    struct tm
    {
        int tm_sec;
        int tm_min;
        int tm_hour;
        int tm_mday;
        int tm_mon;
        int tm_year;
        int tm_wday;
        int tm_yday;
        int tm_isdst;
        c_long tm_gmtoff;
        const(char)* tm_zone;
    }


    struct timespec
    {
        __time_t tv_sec;
        __syscall_slong_t tv_nsec;
    }




    struct timeval
    {
        __time_t tv_sec;
        __suseconds_t tv_usec;
    }
    struct itimerspec
    {
        timespec it_interval;
        timespec it_value;
    }
    alias locale_t = __locale_struct*;
    alias uint8_t = ubyte;




    alias int8_t = byte;
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
    alias int16_t = short;




    alias uint16_t = ushort;


    struct iovec
    {
        void* iov_base;
        size_t iov_len;
    }
    alias int32_t = int;


    alias uint32_t = uint;
    alias pthread_t = c_ulong;
    alias int64_t = c_long;
    alias uint64_t = c_ulong;
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


    alias __jmp_buf = c_long[8];







    alias __u_short = ushort;
    struct in_addr
    {
        in_addr_t s_addr;
    }
    static __uint16_t __uint16_identity(__uint16_t) @nogc nothrow;
    union pthread_mutexattr_t
    {
        char[4] __size;
        int __align;
    }




    alias __u_int = uint;
    alias __cpu_mask = c_ulong;
    alias u_char = ubyte;
    alias __u_long = c_ulong;
    enum _Anonymous_0
    {
        PTHREAD_CREATE_JOINABLE = 0,
        PTHREAD_CREATE_DETACHED = 1,
    }
    enum PTHREAD_CREATE_JOINABLE = _Anonymous_0.PTHREAD_CREATE_JOINABLE;
    enum PTHREAD_CREATE_DETACHED = _Anonymous_0.PTHREAD_CREATE_DETACHED;


    alias socklen_t = uint;







    in_addr_t inet_addr(const(char)*) @nogc nothrow;


    alias u_short = ushort;






    alias u_int = uint;







    alias __int8_t = byte;
    alias u_long = c_ulong;




    alias __uint8_t = ubyte;


    in_addr_t inet_lnaof(in_addr) @nogc nothrow;
    alias quad_t = c_long;


    alias __int16_t = short;
    alias u_quad_t = c_ulong;
    static __uint32_t __uint32_identity(__uint32_t) @nogc nothrow;
    alias fsid_t = __fsid_t;
    alias __uint16_t = ushort;


    struct cpu_set_t
    {
        __cpu_mask[16] __bits;
    }


    enum _Anonymous_1
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
    enum IPPROTO_IP = _Anonymous_1.IPPROTO_IP;
    enum IPPROTO_ICMP = _Anonymous_1.IPPROTO_ICMP;
    enum IPPROTO_IGMP = _Anonymous_1.IPPROTO_IGMP;
    enum IPPROTO_IPIP = _Anonymous_1.IPPROTO_IPIP;
    enum IPPROTO_TCP = _Anonymous_1.IPPROTO_TCP;
    enum IPPROTO_EGP = _Anonymous_1.IPPROTO_EGP;
    enum IPPROTO_PUP = _Anonymous_1.IPPROTO_PUP;
    enum IPPROTO_UDP = _Anonymous_1.IPPROTO_UDP;
    enum IPPROTO_IDP = _Anonymous_1.IPPROTO_IDP;
    enum IPPROTO_TP = _Anonymous_1.IPPROTO_TP;
    enum IPPROTO_DCCP = _Anonymous_1.IPPROTO_DCCP;
    enum IPPROTO_IPV6 = _Anonymous_1.IPPROTO_IPV6;
    enum IPPROTO_RSVP = _Anonymous_1.IPPROTO_RSVP;
    enum IPPROTO_GRE = _Anonymous_1.IPPROTO_GRE;
    enum IPPROTO_ESP = _Anonymous_1.IPPROTO_ESP;
    enum IPPROTO_AH = _Anonymous_1.IPPROTO_AH;
    enum IPPROTO_MTP = _Anonymous_1.IPPROTO_MTP;
    enum IPPROTO_BEETPH = _Anonymous_1.IPPROTO_BEETPH;
    enum IPPROTO_ENCAP = _Anonymous_1.IPPROTO_ENCAP;
    enum IPPROTO_PIM = _Anonymous_1.IPPROTO_PIM;
    enum IPPROTO_COMP = _Anonymous_1.IPPROTO_COMP;
    enum IPPROTO_SCTP = _Anonymous_1.IPPROTO_SCTP;
    enum IPPROTO_UDPLITE = _Anonymous_1.IPPROTO_UDPLITE;
    enum IPPROTO_MPLS = _Anonymous_1.IPPROTO_MPLS;
    enum IPPROTO_RAW = _Anonymous_1.IPPROTO_RAW;
    enum IPPROTO_MAX = _Anonymous_1.IPPROTO_MAX;
    alias __int32_t = int;






    union pthread_condattr_t
    {
        char[4] __size;
        int __align;
    }






    alias __uint32_t = uint;


    in_addr inet_makeaddr(in_addr_t, in_addr_t) @nogc nothrow;


    enum _Anonymous_2
    {
        SHUT_RD = 0,
        SHUT_WR = 1,
        SHUT_RDWR = 2,
    }
    enum SHUT_RD = _Anonymous_2.SHUT_RD;
    enum SHUT_WR = _Anonymous_2.SHUT_WR;
    enum SHUT_RDWR = _Anonymous_2.SHUT_RDWR;


    alias __locale_t = __locale_struct*;


    alias suseconds_t = c_long;


    enum _Anonymous_3
    {
        PTHREAD_MUTEX_TIMED_NP = 0,
        PTHREAD_MUTEX_RECURSIVE_NP = 1,
        PTHREAD_MUTEX_ERRORCHECK_NP = 2,
        PTHREAD_MUTEX_ADAPTIVE_NP = 3,
        PTHREAD_MUTEX_NORMAL = 0,
        PTHREAD_MUTEX_RECURSIVE = 1,
        PTHREAD_MUTEX_ERRORCHECK = 2,
        PTHREAD_MUTEX_DEFAULT = 0,
    }
    enum PTHREAD_MUTEX_TIMED_NP = _Anonymous_3.PTHREAD_MUTEX_TIMED_NP;
    enum PTHREAD_MUTEX_RECURSIVE_NP = _Anonymous_3.PTHREAD_MUTEX_RECURSIVE_NP;
    enum PTHREAD_MUTEX_ERRORCHECK_NP = _Anonymous_3.PTHREAD_MUTEX_ERRORCHECK_NP;
    enum PTHREAD_MUTEX_ADAPTIVE_NP = _Anonymous_3.PTHREAD_MUTEX_ADAPTIVE_NP;
    enum PTHREAD_MUTEX_NORMAL = _Anonymous_3.PTHREAD_MUTEX_NORMAL;
    enum PTHREAD_MUTEX_RECURSIVE = _Anonymous_3.PTHREAD_MUTEX_RECURSIVE;
    enum PTHREAD_MUTEX_ERRORCHECK = _Anonymous_3.PTHREAD_MUTEX_ERRORCHECK;
    enum PTHREAD_MUTEX_DEFAULT = _Anonymous_3.PTHREAD_MUTEX_DEFAULT;


    alias __int64_t = c_long;






    alias loff_t = c_long;






    static __uint64_t __uint64_identity(__uint64_t) @nogc nothrow;
    alias __uint64_t = c_ulong;
    in_addr_t inet_netof(in_addr) @nogc nothrow;
    alias ino_t = c_ulong;
    struct sigevent;




    alias __fd_mask = c_long;
    alias pthread_key_t = uint;
    in_addr_t inet_network(const(char)*) @nogc nothrow;
    alias __quad_t = c_long;
    alias __u_quad_t = c_ulong;
    alias pthread_once_t = int;


    char* inet_ntoa(in_addr) @nogc nothrow;






    int sched_setparam(__pid_t, const(sched_param)*) @nogc nothrow;
    union pthread_attr_t
    {
        char[56] __size;
        c_long __align;
    }
    int sched_getparam(__pid_t, sched_param*) @nogc nothrow;





    int inet_pton(int, const(char)*, void*) @nogc nothrow;
    struct fd_set
    {
        __fd_mask[16] __fds_bits;
    }
    alias dev_t = c_ulong;
    alias __intmax_t = c_long;






    int sched_setscheduler(__pid_t, int, const(sched_param)*) @nogc nothrow;
    alias __uintmax_t = c_ulong;
    alias size_t = c_ulong;
    const(char)* inet_ntop(int, const(void)*, char*, socklen_t) @nogc nothrow;






    enum _Anonymous_4
    {
        PTHREAD_MUTEX_STALLED = 0,
        PTHREAD_MUTEX_STALLED_NP = 0,
        PTHREAD_MUTEX_ROBUST = 1,
        PTHREAD_MUTEX_ROBUST_NP = 1,
    }
    enum PTHREAD_MUTEX_STALLED = _Anonymous_4.PTHREAD_MUTEX_STALLED;
    enum PTHREAD_MUTEX_STALLED_NP = _Anonymous_4.PTHREAD_MUTEX_STALLED_NP;
    enum PTHREAD_MUTEX_ROBUST = _Anonymous_4.PTHREAD_MUTEX_ROBUST;
    enum PTHREAD_MUTEX_ROBUST_NP = _Anonymous_4.PTHREAD_MUTEX_ROBUST_NP;




    alias gid_t = uint;
    int sched_getscheduler(__pid_t) @nogc nothrow;
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






    int sched_yield() @nogc nothrow;
    alias mode_t = uint;
    int sched_get_priority_max(int) @nogc nothrow;
    clock_t clock() @nogc nothrow;


    uint gnu_dev_major(__dev_t) @nogc nothrow;
    int inet_aton(const(char)*, in_addr*) @nogc nothrow;
    int sched_get_priority_min(int) @nogc nothrow;






    uint gnu_dev_minor(__dev_t) @nogc nothrow;


    struct sched_param
    {
        int sched_priority;
    }




    time_t time(time_t*) @nogc nothrow;
    __dev_t gnu_dev_makedev(uint, uint) @nogc nothrow;
    union pthread_cond_t
    {
        __pthread_cond_s __data;
        char[48] __size;
        long __align;
    }
    alias nlink_t = c_ulong;
    alias fd_mask = c_long;




    char* inet_neta(in_addr_t, char*, size_t) @nogc nothrow;


    enum _Anonymous_5
    {
        PTHREAD_PRIO_NONE = 0,
        PTHREAD_PRIO_INHERIT = 1,
        PTHREAD_PRIO_PROTECT = 2,
    }
    enum PTHREAD_PRIO_NONE = _Anonymous_5.PTHREAD_PRIO_NONE;
    enum PTHREAD_PRIO_INHERIT = _Anonymous_5.PTHREAD_PRIO_INHERIT;
    enum PTHREAD_PRIO_PROTECT = _Anonymous_5.PTHREAD_PRIO_PROTECT;
    int sched_rr_get_interval(__pid_t, timespec*) @nogc nothrow;
    double difftime(time_t, time_t) @nogc nothrow;
    alias uid_t = uint;
    char* inet_net_ntop(int, const(void)*, int, char*, size_t) @nogc nothrow;
    struct __pthread_internal_list
    {
        __pthread_internal_list* __prev;
        __pthread_internal_list* __next;
    }
    alias __pthread_list_t = __pthread_internal_list;
    time_t mktime(tm*) @nogc nothrow;
    union pthread_rwlock_t
    {
        __pthread_rwlock_arch_t __data;
        char[56] __size;
        c_long __align;
    }




    alias off_t = c_long;
    size_t strftime(char*, size_t, const(char)*, const(tm)*) @nogc nothrow;


    int inet_net_pton(int, const(char)*, void*, size_t) @nogc nothrow;
    union pthread_rwlockattr_t
    {
        char[8] __size;
        c_long __align;
    }






    uint inet_nsap_addr(const(char)*, ubyte*, int) @nogc nothrow;
    alias pid_t = int;


    char* inet_nsap_ntoa(int, const(ubyte)*, char*) @nogc nothrow;
    enum _Anonymous_6
    {
        IPPROTO_HOPOPTS = 0,
        IPPROTO_ROUTING = 43,
        IPPROTO_FRAGMENT = 44,
        IPPROTO_ICMPV6 = 58,
        IPPROTO_NONE = 59,
        IPPROTO_DSTOPTS = 60,
        IPPROTO_MH = 135,
    }
    enum IPPROTO_HOPOPTS = _Anonymous_6.IPPROTO_HOPOPTS;
    enum IPPROTO_ROUTING = _Anonymous_6.IPPROTO_ROUTING;
    enum IPPROTO_FRAGMENT = _Anonymous_6.IPPROTO_FRAGMENT;
    enum IPPROTO_ICMPV6 = _Anonymous_6.IPPROTO_ICMPV6;
    enum IPPROTO_NONE = _Anonymous_6.IPPROTO_NONE;
    enum IPPROTO_DSTOPTS = _Anonymous_6.IPPROTO_DSTOPTS;
    enum IPPROTO_MH = _Anonymous_6.IPPROTO_MH;
    int select(int, fd_set*, fd_set*, fd_set*, timeval*) @nogc nothrow;
    int socket(int, int, int) @nogc nothrow;
    alias pthread_spinlock_t = int;


    alias id_t = uint;






    size_t strftime_l(char*, size_t, const(char)*, const(tm)*, locale_t) @nogc nothrow;
    int socketpair(int, int, int, int*) @nogc nothrow;
    union pthread_barrier_t
    {
        char[32] __size;
        c_long __align;
    }
    alias ssize_t = c_long;
    int bind(int, const(sockaddr)*, socklen_t) @nogc nothrow;






    int pselect(int, fd_set*, fd_set*, fd_set*, const(timespec)*, const(__sigset_t)*) @nogc nothrow;




    union pthread_barrierattr_t
    {
        char[4] __size;
        int __align;
    }
    alias daddr_t = int;
    enum _Anonymous_7
    {
        PTHREAD_RWLOCK_PREFER_READER_NP = 0,
        PTHREAD_RWLOCK_PREFER_WRITER_NP = 1,
        PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP = 2,
        PTHREAD_RWLOCK_DEFAULT_NP = 0,
    }
    enum PTHREAD_RWLOCK_PREFER_READER_NP = _Anonymous_7.PTHREAD_RWLOCK_PREFER_READER_NP;
    enum PTHREAD_RWLOCK_PREFER_WRITER_NP = _Anonymous_7.PTHREAD_RWLOCK_PREFER_WRITER_NP;
    enum PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP = _Anonymous_7.PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP;
    enum PTHREAD_RWLOCK_DEFAULT_NP = _Anonymous_7.PTHREAD_RWLOCK_DEFAULT_NP;


    int getsockname(int, sockaddr*, socklen_t*) @nogc nothrow;


    alias caddr_t = char*;
    int __sched_cpucount(size_t, const(cpu_set_t)*) @nogc nothrow;






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
    tm* gmtime(const(time_t)*) @nogc nothrow;


    cpu_set_t* __sched_cpualloc(size_t) @nogc nothrow;


    alias in_port_t = ushort;






    void __sched_cpufree(cpu_set_t*) @nogc nothrow;




    enum _Anonymous_8
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
    enum IPPORT_ECHO = _Anonymous_8.IPPORT_ECHO;
    enum IPPORT_DISCARD = _Anonymous_8.IPPORT_DISCARD;
    enum IPPORT_SYSTAT = _Anonymous_8.IPPORT_SYSTAT;
    enum IPPORT_DAYTIME = _Anonymous_8.IPPORT_DAYTIME;
    enum IPPORT_NETSTAT = _Anonymous_8.IPPORT_NETSTAT;
    enum IPPORT_FTP = _Anonymous_8.IPPORT_FTP;
    enum IPPORT_TELNET = _Anonymous_8.IPPORT_TELNET;
    enum IPPORT_SMTP = _Anonymous_8.IPPORT_SMTP;
    enum IPPORT_TIMESERVER = _Anonymous_8.IPPORT_TIMESERVER;
    enum IPPORT_NAMESERVER = _Anonymous_8.IPPORT_NAMESERVER;
    enum IPPORT_WHOIS = _Anonymous_8.IPPORT_WHOIS;
    enum IPPORT_MTP = _Anonymous_8.IPPORT_MTP;
    enum IPPORT_TFTP = _Anonymous_8.IPPORT_TFTP;
    enum IPPORT_RJE = _Anonymous_8.IPPORT_RJE;
    enum IPPORT_FINGER = _Anonymous_8.IPPORT_FINGER;
    enum IPPORT_TTYLINK = _Anonymous_8.IPPORT_TTYLINK;
    enum IPPORT_SUPDUP = _Anonymous_8.IPPORT_SUPDUP;
    enum IPPORT_EXECSERVER = _Anonymous_8.IPPORT_EXECSERVER;
    enum IPPORT_LOGINSERVER = _Anonymous_8.IPPORT_LOGINSERVER;
    enum IPPORT_CMDSERVER = _Anonymous_8.IPPORT_CMDSERVER;
    enum IPPORT_EFSSERVER = _Anonymous_8.IPPORT_EFSSERVER;
    enum IPPORT_BIFFUDP = _Anonymous_8.IPPORT_BIFFUDP;
    enum IPPORT_WHOSERVER = _Anonymous_8.IPPORT_WHOSERVER;
    enum IPPORT_ROUTESERVER = _Anonymous_8.IPPORT_ROUTESERVER;
    enum IPPORT_RESERVED = _Anonymous_8.IPPORT_RESERVED;
    enum IPPORT_USERRESERVED = _Anonymous_8.IPPORT_USERRESERVED;




    alias key_t = int;


    tm* localtime(const(time_t)*) @nogc nothrow;
    int connect(int, const(sockaddr)*, socklen_t) @nogc nothrow;
    tm* gmtime_r(const(time_t)*, tm*) @nogc nothrow;






    int getpeername(int, sockaddr*, socklen_t*) @nogc nothrow;
    alias __dev_t = c_ulong;


    tm* localtime_r(const(time_t)*, tm*) @nogc nothrow;







    alias __uid_t = uint;




    alias __gid_t = uint;






    alias __ino_t = c_ulong;


    alias __ino64_t = c_ulong;
    ssize_t send(int, const(void)*, size_t, int) @nogc nothrow;
    alias __mode_t = uint;




    alias __nlink_t = c_ulong;


    char* asctime(const(tm)*) @nogc nothrow;
    alias __off_t = c_long;
    alias __off64_t = c_long;
    alias __pid_t = int;
    char* ctime(const(time_t)*) @nogc nothrow;
    struct ip_opts
    {
        in_addr ip_dst;
        char[40] ip_opts_;
    }
    struct __fsid_t
    {
        int[2] __val;
    }


    alias __clock_t = c_long;
    alias __rlim_t = c_ulong;
    ssize_t recv(int, void*, size_t, int) @nogc nothrow;




    alias __rlim64_t = c_ulong;




    alias __id_t = uint;


    alias __time_t = c_long;
    struct ip_mreqn
    {
        in_addr imr_multiaddr;
        in_addr imr_address;
        int imr_ifindex;
    }


    alias __useconds_t = uint;
    char* asctime_r(const(tm)*, char*) @nogc nothrow;
    alias __suseconds_t = c_long;




    struct __pthread_cond_s
    {
        static union _Anonymous_9
        {
            ulong __wseq;
            static struct _Anonymous_10
            {
                uint __low;
                uint __high;
            }
            _Anonymous_10 __wseq32;
        }
        _Anonymous_9 _anonymous_11;
        auto __wseq() @property @nogc pure nothrow { return _anonymous_11.__wseq; }
        void __wseq(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_11.__wseq = val; }
        auto __wseq32() @property @nogc pure nothrow { return _anonymous_11.__wseq32; }
        void __wseq32(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_11.__wseq32 = val; }
        static union _Anonymous_12
        {
            ulong __g1_start;
            static struct _Anonymous_13
            {
                uint __low;
                uint __high;
            }
            _Anonymous_13 __g1_start32;
        }
        _Anonymous_12 _anonymous_14;
        auto __g1_start() @property @nogc pure nothrow { return _anonymous_14.__g1_start; }
        void __g1_start(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_14.__g1_start = val; }
        auto __g1_start32() @property @nogc pure nothrow { return _anonymous_14.__g1_start32; }
        void __g1_start32(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_14.__g1_start32 = val; }
        uint[2] __g_refs;
        uint[2] __g_size;
        uint __g1_orig_size;
        uint __wrefs;
        uint[2] __g_signals;
    }
    alias __daddr_t = int;
    ssize_t sendto(int, const(void)*, size_t, int, const(sockaddr)*, socklen_t) @nogc nothrow;


    alias __key_t = int;
    char* ctime_r(const(time_t)*, char*) @nogc nothrow;






    alias __clockid_t = int;


    enum _Anonymous_15
    {
        PTHREAD_INHERIT_SCHED = 0,
        PTHREAD_EXPLICIT_SCHED = 1,
    }
    enum PTHREAD_INHERIT_SCHED = _Anonymous_15.PTHREAD_INHERIT_SCHED;
    enum PTHREAD_EXPLICIT_SCHED = _Anonymous_15.PTHREAD_EXPLICIT_SCHED;
    struct in_pktinfo
    {
        int ipi_ifindex;
        in_addr ipi_spec_dst;
        in_addr ipi_addr;
    }







    extern __gshared char*[2] __tzname;


    alias __timer_t = void*;




    extern __gshared int __daylight;




    extern __gshared c_long __timezone;


    alias __blksize_t = c_long;
    ssize_t recvfrom(int, void*, size_t, int, sockaddr*, socklen_t*) @nogc nothrow;
    enum _Anonymous_16
    {
        PTHREAD_SCOPE_SYSTEM = 0,
        PTHREAD_SCOPE_PROCESS = 1,
    }
    enum PTHREAD_SCOPE_SYSTEM = _Anonymous_16.PTHREAD_SCOPE_SYSTEM;
    enum PTHREAD_SCOPE_PROCESS = _Anonymous_16.PTHREAD_SCOPE_PROCESS;


    extern __gshared char*[2] tzname;
    alias __blkcnt_t = c_long;






    alias __blkcnt64_t = c_long;
    void tzset() @nogc nothrow;




    alias __fsblkcnt_t = c_ulong;






    alias __fsblkcnt64_t = c_ulong;


    ssize_t sendmsg(int, const(msghdr)*, int) @nogc nothrow;






    extern __gshared int daylight;


    alias __fsfilcnt_t = c_ulong;
    struct sockaddr
    {
        sa_family_t sa_family;
        char[14] sa_data;
    }







    extern __gshared c_long timezone;
    enum _Anonymous_17
    {
        PTHREAD_PROCESS_PRIVATE = 0,
        PTHREAD_PROCESS_SHARED = 1,
    }
    enum PTHREAD_PROCESS_PRIVATE = _Anonymous_17.PTHREAD_PROCESS_PRIVATE;
    enum PTHREAD_PROCESS_SHARED = _Anonymous_17.PTHREAD_PROCESS_SHARED;


    alias __fsfilcnt64_t = c_ulong;







    alias u_int8_t = ubyte;







    alias u_int16_t = ushort;


    alias __fsword_t = c_long;


    alias u_int32_t = uint;






    int stime(const(time_t)*) @nogc nothrow;




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


    struct _pthread_cleanup_buffer
    {
        void function(void*) __routine;
        void* __arg;
        int __canceltype;
        _pthread_cleanup_buffer* __prev;
    }


    alias __caddr_t = char*;
    ssize_t recvmsg(int, msghdr*, int) @nogc nothrow;
    alias __intptr_t = c_long;


    time_t timegm(tm*) @nogc nothrow;




    enum _Anonymous_18
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
    enum MSG_OOB = _Anonymous_18.MSG_OOB;
    enum MSG_PEEK = _Anonymous_18.MSG_PEEK;
    enum MSG_DONTROUTE = _Anonymous_18.MSG_DONTROUTE;
    enum MSG_CTRUNC = _Anonymous_18.MSG_CTRUNC;
    enum MSG_PROXY = _Anonymous_18.MSG_PROXY;
    enum MSG_TRUNC = _Anonymous_18.MSG_TRUNC;
    enum MSG_DONTWAIT = _Anonymous_18.MSG_DONTWAIT;
    enum MSG_EOR = _Anonymous_18.MSG_EOR;
    enum MSG_WAITALL = _Anonymous_18.MSG_WAITALL;
    enum MSG_FIN = _Anonymous_18.MSG_FIN;
    enum MSG_SYN = _Anonymous_18.MSG_SYN;
    enum MSG_CONFIRM = _Anonymous_18.MSG_CONFIRM;
    enum MSG_RST = _Anonymous_18.MSG_RST;
    enum MSG_ERRQUEUE = _Anonymous_18.MSG_ERRQUEUE;
    enum MSG_NOSIGNAL = _Anonymous_18.MSG_NOSIGNAL;
    enum MSG_MORE = _Anonymous_18.MSG_MORE;
    enum MSG_WAITFORONE = _Anonymous_18.MSG_WAITFORONE;
    enum MSG_BATCH = _Anonymous_18.MSG_BATCH;
    enum MSG_ZEROCOPY = _Anonymous_18.MSG_ZEROCOPY;
    enum MSG_FASTOPEN = _Anonymous_18.MSG_FASTOPEN;
    enum MSG_CMSG_CLOEXEC = _Anonymous_18.MSG_CMSG_CLOEXEC;
    alias __socklen_t = uint;
    time_t timelocal(tm*) @nogc nothrow;






    enum _Anonymous_19
    {
        PTHREAD_CANCEL_ENABLE = 0,
        PTHREAD_CANCEL_DISABLE = 1,
    }
    enum PTHREAD_CANCEL_ENABLE = _Anonymous_19.PTHREAD_CANCEL_ENABLE;
    enum PTHREAD_CANCEL_DISABLE = _Anonymous_19.PTHREAD_CANCEL_DISABLE;




    alias __sig_atomic_t = int;


    int dysize(int) @nogc nothrow;
    enum _Anonymous_20
    {
        PTHREAD_CANCEL_DEFERRED = 0,
        PTHREAD_CANCEL_ASYNCHRONOUS = 1,
    }
    enum PTHREAD_CANCEL_DEFERRED = _Anonymous_20.PTHREAD_CANCEL_DEFERRED;
    enum PTHREAD_CANCEL_ASYNCHRONOUS = _Anonymous_20.PTHREAD_CANCEL_ASYNCHRONOUS;






    int getsockopt(int, int, int, void*, socklen_t*) @nogc nothrow;






    int nanosleep(const(timespec)*, timespec*) @nogc nothrow;


    struct in6_addr
    {
        static union _Anonymous_21
        {
            uint8_t[16] __u6_addr8;
            uint16_t[8] __u6_addr16;
            uint32_t[4] __u6_addr32;
        }
        _Anonymous_21 __in6_u;
    }






    alias blksize_t = c_long;
    int setsockopt(int, int, int, const(void)*, socklen_t) @nogc nothrow;
    int clock_getres(clockid_t, timespec*) @nogc nothrow;
    alias blkcnt_t = c_long;
    int clock_gettime(clockid_t, timespec*) @nogc nothrow;
    int listen(int, int) @nogc nothrow;


    int clock_settime(clockid_t, const(timespec)*) @nogc nothrow;
    alias fsblkcnt_t = c_ulong;
    alias fsfilcnt_t = c_ulong;


    extern __gshared const(in6_addr) in6addr_any;
    extern __gshared const(in6_addr) in6addr_loopback;
    int clock_nanosleep(clockid_t, int, const(timespec)*, timespec*) @nogc nothrow;


    int accept(int, sockaddr*, socklen_t*) @nogc nothrow;
    int pthread_create(pthread_t*, const(pthread_attr_t)*, void* function(void*), void*) @nogc nothrow;




    int clock_getcpuclockid(pid_t, clockid_t*) @nogc nothrow;






    struct sockaddr_in
    {
        sa_family_t sin_family;
        in_port_t sin_port;
        in_addr sin_addr;
        ubyte[8] sin_zero;
    }
    int timer_create(clockid_t, sigevent*, timer_t*) @nogc nothrow;
    void pthread_exit(void*) @nogc nothrow;






    int timer_delete(timer_t) @nogc nothrow;




    int timer_settime(timer_t, int, const(itimerspec)*, itimerspec*) @nogc nothrow;






    int shutdown(int, int) @nogc nothrow;
    int pthread_join(pthread_t, void**) @nogc nothrow;
    struct sockaddr_in6
    {
        sa_family_t sin6_family;
        in_port_t sin6_port;
        uint32_t sin6_flowinfo;
        in6_addr sin6_addr;
        uint32_t sin6_scope_id;
    }
    int timer_gettime(timer_t, itimerspec*) @nogc nothrow;




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





    int timer_getoverrun(timer_t) @nogc nothrow;




    int timespec_get(timespec*, int) @nogc nothrow;
    int isfdtype(int, int) @nogc nothrow;
    struct ip_mreq
    {
        in_addr imr_multiaddr;
        in_addr imr_interface;
    }




    int pthread_detach(pthread_t) @nogc nothrow;
    struct cmsghdr
    {
        size_t cmsg_len;
        int cmsg_level;
        int cmsg_type;
        ubyte[0] __cmsg_data;
    }
    struct ip_mreq_source
    {
        in_addr imr_multiaddr;
        in_addr imr_interface;
        in_addr imr_sourceaddr;
    }
    pthread_t pthread_self() @nogc nothrow;
    int pthread_equal(pthread_t, pthread_t) @nogc nothrow;



    struct ipv6_mreq
    {
        in6_addr ipv6mr_multiaddr;
        uint ipv6mr_interface;
    }




    int pthread_attr_init(pthread_attr_t*) @nogc nothrow;
    int pthread_attr_destroy(pthread_attr_t*) @nogc nothrow;






    int pthread_attr_getdetachstate(const(pthread_attr_t)*, int*) @nogc nothrow;
    int pthread_attr_setdetachstate(pthread_attr_t*, int) @nogc nothrow;
    struct group_req
    {
        uint32_t gr_interface;
        sockaddr_storage gr_group;
    }


    cmsghdr* __cmsg_nxthdr(msghdr*, cmsghdr*) @nogc nothrow;




    int pthread_attr_getguardsize(const(pthread_attr_t)*, size_t*) @nogc nothrow;


    struct group_source_req
    {
        uint32_t gsr_interface;
        sockaddr_storage gsr_group;
        sockaddr_storage gsr_source;
    }
    int pthread_attr_setguardsize(pthread_attr_t*, size_t) @nogc nothrow;






    int pthread_attr_getschedparam(const(pthread_attr_t)*, sched_param*) @nogc nothrow;
    int pthread_attr_setschedparam(pthread_attr_t*, const(sched_param)*) @nogc nothrow;
    struct ip_msfilter
    {
        in_addr imsf_multiaddr;
        in_addr imsf_interface;
        uint32_t imsf_fmode;
        uint32_t imsf_numsrc;
        in_addr[1] imsf_slist;
    }






    int pthread_attr_getschedpolicy(const(pthread_attr_t)*, int*) @nogc nothrow;
    enum _Anonymous_22
    {
        SCM_RIGHTS = 1,
    }
    enum SCM_RIGHTS = _Anonymous_22.SCM_RIGHTS;
    int pthread_attr_setschedpolicy(pthread_attr_t*, int) @nogc nothrow;


    int pthread_attr_getinheritsched(const(pthread_attr_t)*, int*) @nogc nothrow;






    int pthread_attr_setinheritsched(pthread_attr_t*, int) @nogc nothrow;



    struct group_filter
    {
        uint32_t gf_interface;
        sockaddr_storage gf_group;
        uint32_t gf_fmode;
        uint32_t gf_numsrc;
        sockaddr_storage[1] gf_slist;
    }
    int pthread_attr_getscope(const(pthread_attr_t)*, int*) @nogc nothrow;


    int pthread_attr_setscope(pthread_attr_t*, int) @nogc nothrow;
    int pthread_attr_getstackaddr(const(pthread_attr_t)*, void**) @nogc nothrow;





    int pthread_attr_setstackaddr(pthread_attr_t*, void*) @nogc nothrow;


    int pthread_attr_getstacksize(const(pthread_attr_t)*, size_t*) @nogc nothrow;


    uint32_t ntohl(uint32_t) @nogc nothrow;


    uint16_t ntohs(uint16_t) @nogc nothrow;
    int pthread_attr_setstacksize(pthread_attr_t*, size_t) @nogc nothrow;
    uint32_t htonl(uint32_t) @nogc nothrow;




    uint16_t htons(uint16_t) @nogc nothrow;


    int pthread_attr_getstack(const(pthread_attr_t)*, void**, size_t*) @nogc nothrow;






    int pthread_attr_setstack(pthread_attr_t*, void*, size_t) @nogc nothrow;
    int pthread_setschedparam(pthread_t, int, const(sched_param)*) @nogc nothrow;





    int pthread_getschedparam(pthread_t, int*, sched_param*) @nogc nothrow;







    int pthread_setschedprio(pthread_t, int) @nogc nothrow;
    struct linger
    {
        int l_onoff;
        int l_linger;
    }
    int pthread_once(pthread_once_t*, void function()) @nogc nothrow;


    int bindresvport(int, sockaddr_in*) @nogc nothrow;
    int bindresvport6(int, sockaddr_in6*) @nogc nothrow;
    int pthread_setcancelstate(int, int*) @nogc nothrow;




    int pthread_setcanceltype(int, int*) @nogc nothrow;
    int pthread_cancel(pthread_t) @nogc nothrow;
    void pthread_testcancel() @nogc nothrow;




    struct __pthread_unwind_buf_t
    {
        static struct _Anonymous_23
        {
            __jmp_buf __cancel_jmp_buf;
            int __mask_was_saved;
        }
        _Anonymous_23[1] __cancel_jmp_buf;
        void*[4] __pad;
    }






    struct __pthread_cleanup_frame
    {
        void function(void*) __cancel_routine;
        void* __cancel_arg;
        int __do_it;
        int __cancel_type;
    }
    void __pthread_register_cancel(__pthread_unwind_buf_t*) @nogc nothrow;
    void __pthread_unregister_cancel(__pthread_unwind_buf_t*) @nogc nothrow;
    void __pthread_unwind_next(__pthread_unwind_buf_t*) @nogc nothrow;
    struct __jmp_buf_tag;
    int __sigsetjmp(__jmp_buf_tag*, int) @nogc nothrow;
    int pthread_mutex_init(pthread_mutex_t*, const(pthread_mutexattr_t)*) @nogc nothrow;
    int pthread_mutex_destroy(pthread_mutex_t*) @nogc nothrow;
    int pthread_mutex_trylock(pthread_mutex_t*) @nogc nothrow;
    int pthread_mutex_lock(pthread_mutex_t*) @nogc nothrow;
    int pthread_mutex_timedlock(pthread_mutex_t*, const(timespec)*) @nogc nothrow;
    int pthread_mutex_unlock(pthread_mutex_t*) @nogc nothrow;
    int pthread_mutex_getprioceiling(const(pthread_mutex_t)*, int*) @nogc nothrow;
    int pthread_mutex_setprioceiling(pthread_mutex_t*, int, int*) @nogc nothrow;
    int pthread_mutex_consistent(pthread_mutex_t*) @nogc nothrow;
    int pthread_mutexattr_init(pthread_mutexattr_t*) @nogc nothrow;
    int pthread_mutexattr_destroy(pthread_mutexattr_t*) @nogc nothrow;
    int pthread_mutexattr_getpshared(const(pthread_mutexattr_t)*, int*) @nogc nothrow;
    int pthread_mutexattr_setpshared(pthread_mutexattr_t*, int) @nogc nothrow;
    int pthread_mutexattr_gettype(const(pthread_mutexattr_t)*, int*) @nogc nothrow;
    int pthread_mutexattr_settype(pthread_mutexattr_t*, int) @nogc nothrow;
    int pthread_mutexattr_getprotocol(const(pthread_mutexattr_t)*, int*) @nogc nothrow;
    int pthread_mutexattr_setprotocol(pthread_mutexattr_t*, int) @nogc nothrow;
    int pthread_mutexattr_getprioceiling(const(pthread_mutexattr_t)*, int*) @nogc nothrow;
    int pthread_mutexattr_setprioceiling(pthread_mutexattr_t*, int) @nogc nothrow;
    int pthread_mutexattr_getrobust(const(pthread_mutexattr_t)*, int*) @nogc nothrow;
    int pthread_mutexattr_setrobust(pthread_mutexattr_t*, int) @nogc nothrow;
    int pthread_rwlock_init(pthread_rwlock_t*, const(pthread_rwlockattr_t)*) @nogc nothrow;
    int pthread_rwlock_destroy(pthread_rwlock_t*) @nogc nothrow;
    int pthread_rwlock_rdlock(pthread_rwlock_t*) @nogc nothrow;
    int pthread_rwlock_tryrdlock(pthread_rwlock_t*) @nogc nothrow;
    int pthread_rwlock_timedrdlock(pthread_rwlock_t*, const(timespec)*) @nogc nothrow;
    int pthread_rwlock_wrlock(pthread_rwlock_t*) @nogc nothrow;
    int pthread_rwlock_trywrlock(pthread_rwlock_t*) @nogc nothrow;
    int pthread_rwlock_timedwrlock(pthread_rwlock_t*, const(timespec)*) @nogc nothrow;
    int pthread_rwlock_unlock(pthread_rwlock_t*) @nogc nothrow;
    int pthread_rwlockattr_init(pthread_rwlockattr_t*) @nogc nothrow;
    int pthread_rwlockattr_destroy(pthread_rwlockattr_t*) @nogc nothrow;
    int pthread_rwlockattr_getpshared(const(pthread_rwlockattr_t)*, int*) @nogc nothrow;
    int pthread_rwlockattr_setpshared(pthread_rwlockattr_t*, int) @nogc nothrow;
    int pthread_rwlockattr_getkind_np(const(pthread_rwlockattr_t)*, int*) @nogc nothrow;
    int pthread_rwlockattr_setkind_np(pthread_rwlockattr_t*, int) @nogc nothrow;
    int pthread_cond_init(pthread_cond_t*, const(pthread_condattr_t)*) @nogc nothrow;
    int pthread_cond_destroy(pthread_cond_t*) @nogc nothrow;
    int pthread_cond_signal(pthread_cond_t*) @nogc nothrow;
    int pthread_cond_broadcast(pthread_cond_t*) @nogc nothrow;
    int pthread_cond_wait(pthread_cond_t*, pthread_mutex_t*) @nogc nothrow;
    int pthread_cond_timedwait(pthread_cond_t*, pthread_mutex_t*, const(timespec)*) @nogc nothrow;
    int pthread_condattr_init(pthread_condattr_t*) @nogc nothrow;
    int pthread_condattr_destroy(pthread_condattr_t*) @nogc nothrow;
    int pthread_condattr_getpshared(const(pthread_condattr_t)*, int*) @nogc nothrow;
    int pthread_condattr_setpshared(pthread_condattr_t*, int) @nogc nothrow;
    int pthread_condattr_getclock(const(pthread_condattr_t)*, __clockid_t*) @nogc nothrow;
    int pthread_condattr_setclock(pthread_condattr_t*, __clockid_t) @nogc nothrow;
    int pthread_spin_init(pthread_spinlock_t*, int) @nogc nothrow;
    int pthread_spin_destroy(pthread_spinlock_t*) @nogc nothrow;
    int pthread_spin_lock(pthread_spinlock_t*) @nogc nothrow;
    int pthread_spin_trylock(pthread_spinlock_t*) @nogc nothrow;
    int pthread_spin_unlock(pthread_spinlock_t*) @nogc nothrow;
    int pthread_barrier_init(pthread_barrier_t*, const(pthread_barrierattr_t)*, uint) @nogc nothrow;
    int pthread_barrier_destroy(pthread_barrier_t*) @nogc nothrow;
    int pthread_barrier_wait(pthread_barrier_t*) @nogc nothrow;
    int pthread_barrierattr_init(pthread_barrierattr_t*) @nogc nothrow;
    int pthread_barrierattr_destroy(pthread_barrierattr_t*) @nogc nothrow;
    int pthread_barrierattr_getpshared(const(pthread_barrierattr_t)*, int*) @nogc nothrow;
    int pthread_barrierattr_setpshared(pthread_barrierattr_t*, int) @nogc nothrow;
    int pthread_key_create(pthread_key_t*, void function(void*)) @nogc nothrow;
    int pthread_key_delete(pthread_key_t) @nogc nothrow;
    void* pthread_getspecific(pthread_key_t) @nogc nothrow;
    int pthread_setspecific(pthread_key_t, const(void)*) @nogc nothrow;
    int pthread_getcpuclockid(pthread_t, __clockid_t*) @nogc nothrow;
    int pthread_atfork(void function(), void function(), void function()) @nogc nothrow;
}


import udtwrap;
import core.thread;
import core.time;
import std.string;
import std.stdio;
import std.experimental.all;


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

extern (C) int getaddrinfo (const char *name,
                        const char *service,
                        const addrinfo *req,
                        addrinfo **pai);

extern (C) void freeaddrinfo (addrinfo *__ai);

int main(string[] args)
{
 if (args.length !=3 || args[2].isNumeric)
 {
  stderr.writefln("usage: appclient server_ip server_port");
  return 0;
 }




 addrinfo hints;
 addrinfo* local, peer;

 memset(&hints, 0, addrinfo.sizeof);

 hints.ai_flags = AI_PASSIVE;
 hints.ai_family = 2;
 hints.ai_socktype = SOCK_STREAM;


 if (0 != getaddrinfo(null, "9000", &hints, &local))
 {
  writeln("incorrect network address.");
  return 0;
 }

 auto client = UdtSocket.create(cast(AddressFamily)local.ai_family, SocketType.STREAM, local.ai_protocol);
 freeaddrinfo(local);

 if (0 != getaddrinfo(args[1].toStringz, args[2].toStringz, &hints, &peer))
 {
  writefln("incorrect server/peer address. %s:%s",args[1],args[2]);
  return 0;
 }


 client.connect(peer.ai_addr);
 freeaddrinfo(peer);
 int size = 100000;
 auto data = new char[size];

 pthread_create(new pthread_t, null, monitor, &client);

 foreach(i;0.. 1000000)
 {
  int ssize = 0;
  int ss;
  while (ssize < size)
  {
   ss = client.send(data + ssize, size - ssize, 0);
   ssize += ss;
  }

  if (ssize < size)
   break;
 }

 client.close();
 return 0;
}

void* monitor(void* s)
{
 UDTSOCKET u = *cast (UDTSOCKET*)s;



 writefln( [ "SendRate(Mb/s)",
    "RTT(ms)",
    "CWnd",
    "PktSndPeriod(us)",
    "RecvACK",
    "RecvNAK",
   ].join("\t")
 );

 while (true)
 {
  Thread.sleep(1.seconds);


 }

 return null;
}
