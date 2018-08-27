


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


    alias timer_t = void*;
    alias sigset_t = __sigset_t;
    alias clockid_t = int;
    alias clock_t = c_long;




    alias time_t = c_long;
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
    alias uint8_t = ubyte;
    alias uint16_t = ushort;
    alias int16_t = short;
    alias int32_t = int;
    alias uint32_t = uint;


    struct iovec
    {
        void* iov_base;
        size_t iov_len;
    }
    struct netent
    {
        char* n_name;
        char** n_aliases;
        int n_addrtype;
        uint32_t n_net;
    }


    alias int64_t = c_long;
    alias pthread_t = c_ulong;
    alias uint64_t = c_ulong;




    alias sa_family_t = ushort;
    alias in_addr_t = uint;


    alias __u_char = ubyte;
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


    alias __u_int = uint;
    static __uint16_t __uint16_identity(__uint16_t) @nogc nothrow;
    alias __u_long = c_ulong;
    alias socklen_t = uint;




    alias u_char = ubyte;
    alias u_short = ushort;
    alias u_int = uint;



    alias u_long = c_ulong;
    alias __int8_t = byte;
    alias quad_t = c_long;
    alias __uint8_t = ubyte;




    alias __int16_t = short;
    static __uint32_t __uint32_identity(__uint32_t) @nogc nothrow;
    alias u_quad_t = c_ulong;
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




    alias __uint32_t = uint;






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
    alias __int64_t = c_long;


    alias suseconds_t = c_long;






    static __uint64_t __uint64_identity(__uint64_t) @nogc nothrow;
    alias loff_t = c_long;
    alias __uint64_t = c_ulong;
    struct rpcent
    {
        char* r_name;
        char** r_aliases;
        int r_number;
    }
    alias ino_t = c_ulong;
    alias __fd_mask = c_long;
    alias pthread_key_t = uint;
    alias __quad_t = c_long;
    alias pthread_once_t = int;


    void setrpcent(int) @nogc nothrow;






    alias __u_quad_t = c_ulong;
    void endrpcent() @nogc nothrow;
    rpcent* getrpcbyname(const(char)*) @nogc nothrow;
    union pthread_attr_t
    {
        char[56] __size;
        c_long __align;
    }


    rpcent* getrpcbynumber(int) @nogc nothrow;
    rpcent* getrpcent() @nogc nothrow;
    struct fd_set
    {
        __fd_mask[16] __fds_bits;
    }






    int* __h_errno_location() @nogc nothrow;






    alias dev_t = c_ulong;



    int getrpcbyname_r(const(char)*, rpcent*, char*, size_t, rpcent**) @nogc nothrow;
    alias __intmax_t = c_long;
    alias __uintmax_t = c_ulong;







    alias size_t = c_ulong;
    int getrpcbynumber_r(int, rpcent*, char*, size_t, rpcent**) @nogc nothrow;
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
    int getrpcent_r(rpcent*, char*, size_t, rpcent**) @nogc nothrow;
    alias mode_t = uint;
    uint gnu_dev_major(__dev_t) @nogc nothrow;
    uint gnu_dev_minor(__dev_t) @nogc nothrow;
    alias nlink_t = c_ulong;
    union pthread_cond_t
    {
        __pthread_cond_s __data;
        char[48] __size;
        long __align;
    }
    __dev_t gnu_dev_makedev(uint, uint) @nogc nothrow;
    alias fd_mask = c_long;
    alias uid_t = uint;
    alias __pthread_list_t = __pthread_internal_list;
    struct __pthread_internal_list
    {
        __pthread_internal_list* __prev;
        __pthread_internal_list* __next;
    }
    alias off_t = c_long;


    union pthread_rwlock_t
    {
        __pthread_rwlock_arch_t __data;
        char[56] __size;
        c_long __align;
    }
    void herror(const(char)*) @nogc nothrow;
    union pthread_rwlockattr_t
    {
        char[8] __size;
        c_long __align;
    }
    const(char)* hstrerror(int) @nogc nothrow;
    struct hostent
    {
        char* h_name;
        char** h_aliases;
        int h_addrtype;
        int h_length;
        char** h_addr_list;
    }


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
    int select(int, fd_set*, fd_set*, fd_set*, timeval*) @nogc nothrow;
    int socket(int, int, int) @nogc nothrow;
    alias pthread_spinlock_t = int;
    alias id_t = uint;
    union pthread_barrier_t
    {
        char[32] __size;
        c_long __align;
    }


    int socketpair(int, int, int, int*) @nogc nothrow;
    alias ssize_t = c_long;
    int bind(int, const(sockaddr)*, socklen_t) @nogc nothrow;






    int pselect(int, fd_set*, fd_set*, fd_set*, const(timespec)*, const(__sigset_t)*) @nogc nothrow;




    union pthread_barrierattr_t
    {
        char[4] __size;
        int __align;
    }
    alias daddr_t = int;
    void sethostent(int) @nogc nothrow;
    alias caddr_t = char*;


    int getsockname(int, sockaddr*, socklen_t*) @nogc nothrow;
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
    void endhostent() @nogc nothrow;




    alias key_t = int;
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
        //1024 = 1024,
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
    //enum 1024 = _Anonymous_3. 1024;
    enum IPPORT_USERRESERVED = _Anonymous_3.IPPORT_USERRESERVED;
    int connect(int, const(sockaddr)*, socklen_t) @nogc nothrow;




    hostent* gethostent() @nogc nothrow;
    int getpeername(int, sockaddr*, socklen_t*) @nogc nothrow;






    alias __dev_t = c_ulong;




    alias __uid_t = uint;




    alias __gid_t = uint;
    hostent* gethostbyaddr(const(void)*, __socklen_t, int) @nogc nothrow;


    alias __ino_t = c_ulong;






    alias __ino64_t = c_ulong;


    ssize_t send(int, const(void)*, size_t, int) @nogc nothrow;


    alias __mode_t = uint;


    alias __nlink_t = c_ulong;


    alias __off_t = c_long;
    alias __off64_t = c_long;
    hostent* gethostbyname(const(char)*) @nogc nothrow;
    alias __pid_t = int;
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




    ssize_t recv(int, void*, size_t, int) @nogc nothrow;
    alias __rlim_t = c_ulong;


    alias __rlim64_t = c_ulong;
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


    ssize_t sendto(int, const(void)*, size_t, int, const(sockaddr)*, socklen_t) @nogc nothrow;


    alias __daddr_t = int;


    hostent* gethostbyname2(const(char)*, int) @nogc nothrow;
    alias __key_t = int;




    alias __clockid_t = int;




    struct in_pktinfo
    {
        int ipi_ifindex;
        in_addr ipi_spec_dst;
        in_addr ipi_addr;
    }





    alias __timer_t = void*;
    alias __blksize_t = c_long;


    ssize_t recvfrom(int, void*, size_t, int, sockaddr*, socklen_t*) @nogc nothrow;


    int gethostent_r(hostent*, char*, size_t, hostent**, int*) @nogc nothrow;






    alias __blkcnt_t = c_long;




    alias __blkcnt64_t = c_long;
    int gethostbyaddr_r(const(void)*, __socklen_t, int, hostent*, char*, size_t, hostent**, int*) @nogc nothrow;


    alias __fsblkcnt_t = c_ulong;
    alias __fsblkcnt64_t = c_ulong;
    ssize_t sendmsg(int, const(msghdr)*, int) @nogc nothrow;
    struct sockaddr
    {
        sa_family_t sa_family;
        char[14] sa_data;
    }


    alias __fsfilcnt_t = c_ulong;







    alias __fsfilcnt64_t = c_ulong;
    int gethostbyname_r(const(char)*, hostent*, char*, size_t, hostent**, int*) @nogc nothrow;




    alias u_int8_t = ubyte;



    alias u_int16_t = ushort;


    alias __fsword_t = c_long;


    alias u_int32_t = uint;
    alias u_int64_t = c_ulong;
    alias __ssize_t = c_long;




    int gethostbyname2_r(const(char)*, int, hostent*, char*, size_t, hostent**, int*) @nogc nothrow;


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


    alias __caddr_t = char*;
    ssize_t recvmsg(int, msghdr*, int) @nogc nothrow;
    alias __intptr_t = c_long;






    void setnetent(int) @nogc nothrow;




    alias __socklen_t = uint;
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
    alias __sig_atomic_t = int;


    void endnetent() @nogc nothrow;
    int getsockopt(int, int, int, void*, socklen_t*) @nogc nothrow;


    netent* getnetent() @nogc nothrow;






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


    netent* getnetbyaddr(uint32_t, int) @nogc nothrow;
    alias blkcnt_t = c_long;
    netent* getnetbyname(const(char)*) @nogc nothrow;
    int listen(int, int) @nogc nothrow;


    alias fsblkcnt_t = c_ulong;
    extern __gshared const(in6_addr) in6addr_any;


    alias fsfilcnt_t = c_ulong;
    extern __gshared const(in6_addr) in6addr_loopback;
    int accept(int, sockaddr*, socklen_t*) @nogc nothrow;
    int getnetent_r(netent*, char*, size_t, netent**, int*) @nogc nothrow;






    struct sockaddr_in
    {
        sa_family_t sin_family;
        in_port_t sin_port;
        in_addr sin_addr;
        ubyte[8] sin_zero;
    }
    int getnetbyaddr_r(uint32_t, int, netent*, char*, size_t, netent**, int*) @nogc nothrow;
    int getnetbyname_r(const(char)*, netent*, char*, size_t, netent**, int*) @nogc nothrow;
    int shutdown(int, int) @nogc nothrow;
    struct sockaddr_in6
    {
        sa_family_t sin6_family;
        in_port_t sin6_port;
        uint32_t sin6_flowinfo;
        in6_addr sin6_addr;
        uint32_t sin6_scope_id;
    }




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
    struct servent
    {
        char* s_name;
        char** s_aliases;
        int s_port;
        char* s_proto;
    }
    int sockatmark(int) @nogc nothrow;
    int isfdtype(int, int) @nogc nothrow;
    struct ip_mreq
    {
        in_addr imr_multiaddr;
        in_addr imr_interface;
    }


    void setservent(int) @nogc nothrow;


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
    void endservent() @nogc nothrow;



    servent* getservent() @nogc nothrow;
    struct ipv6_mreq
    {
        in6_addr ipv6mr_multiaddr;
        uint ipv6mr_interface;
    }
    servent* getservbyname(const(char)*, const(char)*) @nogc nothrow;
    servent* getservbyport(int, const(char)*) @nogc nothrow;
    struct group_req
    {
        uint32_t gr_interface;
        sockaddr_storage gr_group;
    }
    cmsghdr* __cmsg_nxthdr(msghdr*, cmsghdr*) @nogc nothrow;




    int getservent_r(servent*, char*, size_t, servent**) @nogc nothrow;


    struct group_source_req
    {
        uint32_t gsr_interface;
        sockaddr_storage gsr_group;
        sockaddr_storage gsr_source;
    }
    int getservbyname_r(const(char)*, const(char)*, servent*, char*, size_t, servent**) @nogc nothrow;




    int getservbyport_r(int, const(char)*, servent*, char*, size_t, servent**) @nogc nothrow;


    struct ip_msfilter
    {
        in_addr imsf_multiaddr;
        in_addr imsf_interface;
        uint32_t imsf_fmode;
        uint32_t imsf_numsrc;
        in_addr[1] imsf_slist;
    }


    struct protoent
    {
        char* p_name;
        char** p_aliases;
        int p_proto;
    }




    enum _Anonymous_12
    {
        SCM_RIGHTS = 1,
    }
    enum SCM_RIGHTS = _Anonymous_12.SCM_RIGHTS;


    void setprotoent(int) @nogc nothrow;
    void endprotoent() @nogc nothrow;
    struct group_filter
    {
        uint32_t gf_interface;
        sockaddr_storage gf_group;
        uint32_t gf_fmode;
        uint32_t gf_numsrc;
        sockaddr_storage[1] gf_slist;
    }
    protoent* getprotoent() @nogc nothrow;


    protoent* getprotobyname(const(char)*) @nogc nothrow;





    protoent* getprotobynumber(int) @nogc nothrow;




    int getprotoent_r(protoent*, char*, size_t, protoent**) @nogc nothrow;
    uint32_t ntohl(uint32_t) @nogc nothrow;


    uint16_t ntohs(uint16_t) @nogc nothrow;
    int getprotobyname_r(const(char)*, protoent*, char*, size_t, protoent**) @nogc nothrow;


    uint32_t htonl(uint32_t) @nogc nothrow;


    uint16_t htons(uint16_t) @nogc nothrow;


    int getprotobynumber_r(int, protoent*, char*, size_t, protoent**) @nogc nothrow;
    int setnetgrent(const(char)*) @nogc nothrow;




    void endnetgrent() @nogc nothrow;
    int getnetgrent(char**, char**, char**) @nogc nothrow;
    int innetgr(const(char)*, const(char)*, const(char)*, const(char)*) @nogc nothrow;





    int getnetgrent_r(char**, char**, char**, char*, size_t) @nogc nothrow;
    struct linger
    {
        int l_onoff;
        int l_linger;
    }
    int rcmd(char**, ushort, const(char)*, const(char)*, const(char)*, int*) @nogc nothrow;
    int rcmd_af(char**, ushort, const(char)*, const(char)*, const(char)*, int*, sa_family_t) @nogc nothrow;





    int rexec(char**, int, const(char)*, const(char)*, const(char)*, int*) @nogc nothrow;


    int rexec_af(char**, int, const(char)*, const(char)*, const(char)*, int*, sa_family_t) @nogc nothrow;


    int bindresvport(int, sockaddr_in*) @nogc nothrow;
    int ruserok(const(char)*, int, const(char)*, const(char)*) @nogc nothrow;
    int bindresvport6(int, sockaddr_in6*) @nogc nothrow;




    int ruserok_af(const(char)*, int, const(char)*, const(char)*, sa_family_t) @nogc nothrow;
    int iruserok(uint32_t, int, const(char)*, const(char)*) @nogc nothrow;
    int iruserok_af(const(void)*, int, const(char)*, const(char)*, sa_family_t) @nogc nothrow;
    int rresvport(int*) @nogc nothrow;
    int rresvport_af(int*, sa_family_t) @nogc nothrow;
    struct addrinfo
    {
        int ai_flags;
        int ai_family;
        int ai_socktype;
        int ai_protocol;
        socklen_t ai_addrlen;
        sockaddr* ai_addr;
        char* ai_canonname;
        addrinfo* ai_next;
    }
    int getaddrinfo(const(char)*, const(char)*, const(addrinfo)*, addrinfo**) @nogc nothrow;
    void freeaddrinfo(addrinfo*) @nogc nothrow;
    const(char)* gai_strerror(int) @nogc nothrow;
    int getnameinfo(const(sockaddr)*, socklen_t, char*, socklen_t, char*, socklen_t, int) @nogc nothrow;
}
