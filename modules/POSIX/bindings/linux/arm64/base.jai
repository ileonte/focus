//
// This file was auto-generated using the following command:
//
// jai generate.jai - -arm64 -cross_compiler_sysroot /home/.../Apps/cross-pi-gcc-14.2.0-64
//



RTLD_LAZY :: 0x00001;
RTLD_NOW :: 0x00002;
RTLD_BINDING_MASK :: 0x3;
RTLD_NOLOAD :: 0x00004;
RTLD_DEEPBIND :: 0x00008;

RTLD_GLOBAL :: 0x00100;

RTLD_LOCAL :: 0;

RTLD_NODELETE :: 0x01000;

LM_ID_BASE :: 0;
LM_ID_NEWLM :: -1;

RTLD_NEXT :: cast,trunc(*void) -1;

RTLD_DEFAULT :: cast(*void) 0;

__S32_TYPE :: s32;

__SLONG32_TYPE :: s32;

_DIRENT_MATCHES_DIRENT64 :: 1;

EPERM :: 1;
ENOENT :: 2;
ESRCH :: 3;
EINTR :: 4;
EIO :: 5;
ENXIO :: 6;
E2BIG :: 7;
ENOEXEC :: 8;
EBADF :: 9;
ECHILD :: 10;
EAGAIN :: 11;
ENOMEM :: 12;
EACCES :: 13;
EFAULT :: 14;
ENOTBLK :: 15;
EBUSY :: 16;
EEXIST :: 17;
EXDEV :: 18;
ENODEV :: 19;
ENOTDIR :: 20;
EISDIR :: 21;
EINVAL :: 22;
ENFILE :: 23;
EMFILE :: 24;
ENOTTY :: 25;
ETXTBSY :: 26;
EFBIG :: 27;
ENOSPC :: 28;
ESPIPE :: 29;
EROFS :: 30;
EMLINK :: 31;
EPIPE :: 32;
EDOM :: 33;
ERANGE :: 34;

EDEADLK :: 35;
ENAMETOOLONG :: 36;
ENOLCK :: 37;

ENOSYS :: 38;

ENOTEMPTY :: 39;
ELOOP :: 40;
EWOULDBLOCK :: EAGAIN;
ENOMSG :: 42;
EIDRM :: 43;
ECHRNG :: 44;
EL2NSYNC :: 45;
EL3HLT :: 46;
EL3RST :: 47;
ELNRNG :: 48;
EUNATCH :: 49;
ENOCSI :: 50;
EL2HLT :: 51;
EBADE :: 52;
EBADR :: 53;
EXFULL :: 54;
ENOANO :: 55;
EBADRQC :: 56;
EBADSLT :: 57;

EDEADLOCK :: EDEADLK;

EBFONT :: 59;
ENOSTR :: 60;
ENODATA :: 61;
ETIME :: 62;
ENOSR :: 63;
ENONET :: 64;
ENOPKG :: 65;
EREMOTE :: 66;
ENOLINK :: 67;
EADV :: 68;
ESRMNT :: 69;
ECOMM :: 70;
EPROTO :: 71;
EMULTIHOP :: 72;
EDOTDOT :: 73;
EBADMSG :: 74;
EOVERFLOW :: 75;
ENOTUNIQ :: 76;
EBADFD :: 77;
EREMCHG :: 78;
ELIBACC :: 79;
ELIBBAD :: 80;
ELIBSCN :: 81;
ELIBMAX :: 82;
ELIBEXEC :: 83;
EILSEQ :: 84;
ERESTART :: 85;
ESTRPIPE :: 86;
EUSERS :: 87;
ENOTSOCK :: 88;
EDESTADDRREQ :: 89;
EMSGSIZE :: 90;
EPROTOTYPE :: 91;
ENOPROTOOPT :: 92;
EPROTONOSUPPORT :: 93;
ESOCKTNOSUPPORT :: 94;
EOPNOTSUPP :: 95;
EPFNOSUPPORT :: 96;
EAFNOSUPPORT :: 97;
EADDRINUSE :: 98;
EADDRNOTAVAIL :: 99;
ENETDOWN :: 100;
ENETUNREACH :: 101;
ENETRESET :: 102;
ECONNABORTED :: 103;
ECONNRESET :: 104;
ENOBUFS :: 105;
EISCONN :: 106;
ENOTCONN :: 107;
ESHUTDOWN :: 108;
ETOOMANYREFS :: 109;
ETIMEDOUT :: 110;
ECONNREFUSED :: 111;
EHOSTDOWN :: 112;
EHOSTUNREACH :: 113;
EALREADY :: 114;
EINPROGRESS :: 115;
ESTALE :: 116;
EUCLEAN :: 117;
ENOTNAM :: 118;
ENAVAIL :: 119;
EISNAM :: 120;
EREMOTEIO :: 121;
EDQUOT :: 122;

ENOMEDIUM :: 123;
EMEDIUMTYPE :: 124;
ECANCELED :: 125;
ENOKEY :: 126;
EKEYEXPIRED :: 127;
EKEYREVOKED :: 128;
EKEYREJECTED :: 129;

EOWNERDEAD :: 130;
ENOTRECOVERABLE :: 131;

ERFKILL :: 132;

EHWPOISON :: 133;

ENOTSUP :: EOPNOTSUPP;

FNM_PATHNAME :: 1 << 0;
FNM_NOESCAPE :: 1 << 1;
FNM_PERIOD :: 1 << 2;

FNM_FILE_NAME :: FNM_PATHNAME;
FNM_LEADING_DIR :: 1 << 3;
FNM_CASEFOLD :: 1 << 4;
FNM_EXTMATCH :: 1 << 5;

FNM_NOMATCH :: 1;

FNM_NOSYS :: -1;

NSS_BUFLEN_PASSWD :: 1024;

SIG_ERR :: cast(#type (unknown0: s32) -> void #c_call) -1;
SIG_DFL :: cast(#type (unknown0: s32) -> void #c_call) 0;
SIG_IGN :: cast(#type (unknown0: s32) -> void #c_call) 1;

SIG_HOLD :: cast(#type (unknown0: s32) -> void #c_call) 2;

SIGINT :: 2;
SIGILL :: 4;
SIGABRT :: 6;
SIGFPE :: 8;
SIGSEGV :: 11;
SIGTERM :: 15;

SIGHUP :: 1;
SIGQUIT :: 3;
SIGTRAP :: 5;
SIGKILL :: 9;
SIGPIPE :: 13;
SIGALRM :: 14;

SIGIOT :: SIGABRT;

_STRUCT_TIMESPEC :: 1;

__SIGEV_MAX_SIZE :: 64;

SA_NOCLDSTOP :: 1;
SA_NOCLDWAIT :: 2;
SA_SIGINFO :: 4;

SA_ONSTACK :: 0x08000000;

SA_RESTART :: 0x10000000;
SA_NODEFER :: 0x40000000;

SA_RESETHAND :: 0x80000000;

SA_INTERRUPT :: 0x20000000;

SA_NOMASK :: SA_NODEFER;
SA_ONESHOT :: SA_RESETHAND;
SA_STACK :: SA_ONSTACK;

SIG_BLOCK :: 0;
SIG_UNBLOCK :: 1;
SIG_SETMASK :: 2;

__FD_SETSIZE :: 1024;

__BIT_TYPES_DEFINED__ :: 1;

__POSIX2_THIS_VERSION :: 200809;

_XOPEN_VERSION :: 700;

_XOPEN_XCU_VERSION :: 4;

_XOPEN_XPG2 :: 1;
_XOPEN_XPG3 :: 1;
_XOPEN_XPG4 :: 1;

_XOPEN_UNIX :: 1;

_XOPEN_ENH_I18N :: 1;

_XOPEN_LEGACY :: 1;

STDIN_FILENO :: 0;
STDOUT_FILENO :: 1;
STDERR_FILENO :: 2;

L_SET :: SEEK_SET;
L_INCR :: SEEK_CUR;
L_XTND :: SEEK_END;

IPC_CREAT :: 0x200 /* 01000 */;
IPC_EXCL :: 0x400 /* 02000 */;
IPC_NOWAIT :: 0x800 /* 04000 */;

IPC_RMID :: 0;
IPC_SET :: 1;
IPC_STAT :: 2;

IPC_INFO :: 3;

IPC_PRIVATE :: cast(s32) 0;

PROT_BTI :: 0x10;
PROT_MTE :: 0x20;

PROT_READ :: 0x1;
PROT_WRITE :: 0x2;
PROT_EXEC :: 0x4;
PROT_NONE :: 0x0;
PROT_GROWSDOWN :: 0x01000000;

PROT_GROWSUP :: 0x02000000;

MAP_SHARED :: 0x01;
MAP_PRIVATE :: 0x02;

MAP_SHARED_VALIDATE :: 0x03;

MAP_TYPE :: 0x0f;

MAP_FIXED :: 0x10;

MAP_FILE :: 0;

MAP_ANONYMOUS :: 0x20;

MAP_ANON :: MAP_ANONYMOUS;

MAP_HUGE_SHIFT :: 26;
MAP_HUGE_MASK :: 0x3f;

MAP_POPULATE :: 0x008000;

MS_ASYNC :: 1;
MS_SYNC :: 4;
MS_INVALIDATE :: 2;

MADV_NORMAL :: 0;
MADV_RANDOM :: 1;
MADV_SEQUENTIAL :: 2;
MADV_WILLNEED :: 3;
MADV_DONTNEED :: 4;
MADV_FREE :: 8;
MADV_REMOVE :: 9;
MADV_DONTFORK :: 10;
MADV_DOFORK :: 11;
MADV_MERGEABLE :: 12;
MADV_UNMERGEABLE :: 13;
MADV_HUGEPAGE :: 14;
MADV_NOHUGEPAGE :: 15;
MADV_DONTDUMP :: 16;

MADV_DODUMP :: 17;
MADV_WIPEONFORK :: 18;
MADV_KEEPONFORK :: 19;
MADV_COLD :: 20;
MADV_PAGEOUT :: 21;
MADV_POPULATE_READ :: 22;

MADV_POPULATE_WRITE :: 23;

MADV_DONTNEED_LOCKED :: 24;

MADV_HWPOISON :: 100;

MCL_CURRENT :: 1;
MCL_FUTURE :: 2;

MCL_ONFAULT :: 4;

MAP_FAILED :: cast,trunc(*void) -1;

POLLIN :: 0x001;
POLLPRI :: 0x002;
POLLOUT :: 0x004;

POLLRDNORM :: 0x040;
POLLRDBAND :: 0x080;
POLLWRNORM :: 0x100;
POLLWRBAND :: 0x200;

POLLMSG :: 0x400;
POLLREMOVE :: 0x1000;
POLLRDHUP :: 0x2000;

POLLERR :: 0x008;
POLLHUP :: 0x010;
POLLNVAL :: 0x020;

SHM_R :: 0x100 /* 0400 */;
SHM_W :: 0x80 /* 0200 */;

SHM_RDONLY :: 0x1000 /* 010000 */;
SHM_RND :: 0x2000 /* 020000 */;
SHM_REMAP :: 0x4000 /* 040000 */;
SHM_EXEC :: 0x8000 /* 0100000 */;

SHM_LOCK :: 11;
SHM_UNLOCK :: 12;

SHM_STAT :: 13;
SHM_INFO :: 14;
SHM_STAT_ANY :: 15;

SHM_DEST :: 0x200 /* 01000 */;
SHM_LOCKED :: 0x400 /* 02000 */;
SHM_HUGETLB :: 0x800 /* 04000 */;
SHM_NORESERVE :: 0x1000 /* 010000 */;

WNOHANG :: 1;
WUNTRACED :: 2;

WSTOPPED :: 2;
WEXITED :: 4;
WCONTINUED :: 8;
WNOWAIT :: 0x01000000;

__WNOTHREAD :: 0x20000000;

__WALL :: 0x40000000;
__WCLONE :: 0x80000000;

WAIT_ANY :: -1;
WAIT_MYPGRP :: 0;

CLOCKS_PER_SEC :: cast(s64) 1000000;

clockid_t :: enum u32 {
    REALTIME           :: 0;

    MONOTONIC          :: 1;

    PROCESS_CPUTIME_ID :: 2;

    THREAD_CPUTIME_ID  :: 3;

    MONOTONIC_RAW      :: 4;

    REALTIME_COARSE    :: 5;

    MONOTONIC_COARSE   :: 6;

    BOOTTIME           :: 7;

    REALTIME_ALARM     :: 8;

    BOOTTIME_ALARM     :: 9;

    TAI                :: 11;

    CLOCK_REALTIME           :: REALTIME;

    CLOCK_MONOTONIC          :: MONOTONIC;

    CLOCK_PROCESS_CPUTIME_ID :: PROCESS_CPUTIME_ID;

    CLOCK_THREAD_CPUTIME_ID  :: THREAD_CPUTIME_ID;

    CLOCK_MONOTONIC_RAW      :: MONOTONIC_RAW;

    CLOCK_REALTIME_COARSE    :: REALTIME_COARSE;

    CLOCK_MONOTONIC_COARSE   :: MONOTONIC_COARSE;

    CLOCK_BOOTTIME           :: BOOTTIME;

    CLOCK_REALTIME_ALARM     :: REALTIME_ALARM;

    CLOCK_BOOTTIME_ALARM     :: BOOTTIME_ALARM;

    CLOCK_TAI                :: TAI;
}

TIMER_ABSTIME :: 1;

TIME_UTC :: 1;

_dl_mcount_wrapper_check :: (__selfpc: *void) -> void #foreign libc;

/* Type for namespace indices.  */
Lmid_t :: s64;

/* Open the shared object FILE and map it in; return a handle that can be
passed to `dlsym' to get symbol values from it.  */
dlopen :: (__file: *u8, __mode: s32) -> *void #foreign libc;

/* Unmap and close a shared object opened by `dlopen'.
The handle cannot be used again after calling `dlclose'.  */
dlclose :: (__handle: *void) -> s32 #foreign libc;

/* Find the run-time address in the shared object HANDLE refers to
of the symbol called NAME.  */
dlsym :: (__handle: *void, __name: *u8) -> *void #foreign libc;

/* Like `dlopen', but request object to be allocated in a new namespace.  */
dlmopen :: (__nsid: Lmid_t, __file: *u8, __mode: s32) -> *void #foreign libc;

/* Find the run-time address in the shared object HANDLE refers to
of the symbol called NAME with VERSION.  */
dlvsym :: (__handle: *void, __name: *u8, __version: *u8) -> *void #foreign libc;

/* When any of the above functions fails, call this function
to return a string describing the error.  Each call resets
the error string so that a following call returns null.  */
dlerror :: () -> *u8 #foreign libc;

/* Structure containing information about object searched using
`dladdr'.  */
Dl_info :: struct {
    dli_fname: *u8; /* File name of defining object.  */
    dli_fbase: *void; /* Load address of that object.  */
    dli_sname: *u8; /* Name of nearest symbol.  */
    dli_saddr: *void; /* Exact value of nearest symbol.  */
}

/* Fill in *INFO with the following information about ADDRESS.
Returns 0 iff no shared object's segments contain that address.  */
dladdr :: (__address: *void, __info: *Dl_info) -> s32 #foreign libc;

/* Same as `dladdr', but additionally sets *EXTRA_INFO according to FLAGS.  */
dladdr1 :: (__address: *void, __info: *Dl_info, __extra_info: **void, __flags: s32) -> s32 #foreign libc;

/* These are the possible values for the FLAGS argument to `dladdr1'.
This indicates what extra information is stored at *EXTRA_INFO.
It may also be zero, in which case the EXTRA_INFO argument is not used.  */
RTLD_DL :: enum u32 {
    SYMENT  :: 1;

    LINKMAP :: 2;

    RTLD_DL_SYMENT  :: SYMENT;

    RTLD_DL_LINKMAP :: LINKMAP;
}

/* Get information about the shared object HANDLE refers to.
REQUEST is from among the values below, and determines the use of ARG.

On success, returns zero.  On failure, returns -1 and records an error
message to be fetched with `dlerror'.  */
dlinfo :: (__handle: *void, __request: s32, __arg: *void) -> s32 #foreign libc;

/* These are the possible values for the REQUEST argument to `dlinfo'.  */
RTLD_DI :: enum u32 {
    LMID        :: 1;

    LINKMAP     :: 2;

    CONFIGADDR  :: 3;

    SERINFO     :: 4;
    SERINFOSIZE :: 5;

    ORIGIN      :: 6;

    PROFILENAME :: 7;
    PROFILEOUT  :: 8;

    TLS_MODID   :: 9;

    TLS_DATA    :: 10;

    PHDR        :: 11;

    MAX         :: 11;

    RTLD_DI_LMID        :: LMID;

    RTLD_DI_LINKMAP     :: LINKMAP;

    RTLD_DI_CONFIGADDR  :: CONFIGADDR;

    RTLD_DI_SERINFO     :: SERINFO;
    RTLD_DI_SERINFOSIZE :: SERINFOSIZE;

    RTLD_DI_ORIGIN      :: ORIGIN;

    RTLD_DI_PROFILENAME :: PROFILENAME;
    RTLD_DI_PROFILEOUT  :: PROFILEOUT;

    RTLD_DI_TLS_MODID   :: TLS_MODID;

    RTLD_DI_TLS_DATA    :: TLS_DATA;

    RTLD_DI_PHDR        :: PHDR;

    RTLD_DI_MAX         :: MAX;
}

/* This is the type of elements in `Dl_serinfo', below.
The `dls_name' member points to space in the buffer passed to `dlinfo'.  */
Dl_serpath :: struct {
    dls_name:  *u8; /* Name of library search path directory.  */
    dls_flags: u32; /* Indicates where this directory came from. */
}

/* This is the structure that must be passed (by reference) to `dlinfo' for
the RTLD_DI_SERINFO and RTLD_DI_SERINFOSIZE requests.  */
Dl_serinfo :: struct {
    dls_size: u64; /* Size in bytes of the whole buffer.  */
    dls_cnt:  u32; /* Number of elements in `dls_serpath'.  */

    /* The zero-length array avoids an unwanted array subscript check by
    the compiler, while the surrounding anonymous union preserves the
    historic size of the type.  At the time of writing, GNU C does
    not support structs with flexible array members in unions.  */
    union {
        dls_serpath:       [0] Dl_serpath; /* Actually longer, dls_cnt elements.  */
        __dls_serpath_pad: [1] Dl_serpath;
    }
}

dl_find_object :: struct {
    dlfo_flags:      u64;
    dlfo_map_start:  *void; /* Beginning of mapping containing address.  */
    dlfo_map_end:    *void; /* End of mapping.  */
    link_map :: struct {}
    dlfo_link_map:   *link_map;
    dlfo_eh_frame:   *void; /* Exception handling data of the object.  */

    __dflo_reserved: [7] u64;
}

/* If ADDRESS is found in an object, fill in *RESULT and return 0.
Otherwise, return -1.  */
_dl_find_object :: (__address: *void, __result: *dl_find_object) -> s32 #foreign libc;

__fsid_t :: struct {
    __val: [2] s32;
}

ino64_t :: u64;

dirent :: struct {
    d_ino:    u64;
    d_off:    s64;

    d_reclen: u16;
    d_type:   DT;
    d_name:   [256] u8;
}

dirent64 :: struct {
    d_ino:    u64;
    d_off:    s64;
    d_reclen: u16;
    d_type:   DT;
    d_name:   [256] u8;
}

/* File types for `d_type'.  */
DT :: enum u8 {
    UNKNOWN :: 0;

    FIFO    :: 1;

    CHR     :: 2;

    DIR     :: 4;

    BLK     :: 6;

    REG     :: 8;

    LNK     :: 10;

    SOCK    :: 12;

    WHT     :: 14;
}

__dirstream :: struct {}
/* This is the data type of directory stream objects.
The actual structure is opaque to users.  */
DIR :: __dirstream;

/* Close the directory stream DIRP.
Return 0 if successful, -1 if not.

This function is a possible cancellation point and therefore not
marked with __THROW.  */
closedir :: (__dirp: *DIR) -> s32 #foreign libc;

/* Open a directory stream on NAME.
Return a DIR stream on the directory, or NULL if it could not be opened.

This function is a possible cancellation point and therefore not
marked with __THROW.  */
opendir :: (__name: *u8) -> *DIR #foreign libc;

/* Same as opendir, but open the stream on the file descriptor FD.

This function is a possible cancellation point and therefore not
marked with __THROW.  */
fdopendir :: (__fd: s32) -> *DIR #foreign libc;

readdir :: (__dirp: *DIR) -> *dirent #foreign libc;

readdir64 :: (__dirp: *DIR) -> *dirent64 #foreign libc;

readdir_r :: (__dirp: *DIR, __entry: *dirent, __result: **dirent) -> s32 #foreign libc;

readdir64_r :: (__dirp: *DIR, __entry: *dirent64, __result: **dirent64) -> s32 #foreign libc;

/* Rewind DIRP to the beginning of the directory.  */
rewinddir :: (__dirp: *DIR) -> void #foreign libc;

/* Seek to position POS on DIRP.  */
seekdir :: (__dirp: *DIR, __pos: s64) -> void #foreign libc;

/* Return the current position of DIRP.  */
telldir :: (__dirp: *DIR) -> s64 #foreign libc;

/* Return the file descriptor used by DIRP.  */
dirfd :: (__dirp: *DIR) -> s32 #foreign libc;

scandir :: (__dir: *u8, __namelist: ***dirent, __selector: #type (unknown0: *dirent) -> s32 #c_call, __cmp: #type (unknown0: **dirent, unknown1: **dirent) -> s32 #c_call) -> s32 #foreign libc;

/* This function is like `scandir' but it uses the 64bit dirent structure.
Please note that the CMP function must now work with struct dirent64 **.  */
scandir64 :: (__dir: *u8, __namelist: ***dirent64, __selector: #type (unknown0: *dirent64) -> s32 #c_call, __cmp: #type (unknown0: **dirent64, unknown1: **dirent64) -> s32 #c_call) -> s32 #foreign libc;

scandirat :: (__dfd: s32, __dir: *u8, __namelist: ***dirent, __selector: #type (unknown0: *dirent) -> s32 #c_call, __cmp: #type (unknown0: **dirent, unknown1: **dirent) -> s32 #c_call) -> s32 #foreign libc;

/* This function is like `scandir' but it uses the 64bit dirent structure.
Please note that the CMP function must now work with struct dirent64 **.  */
scandirat64 :: (__dfd: s32, __dir: *u8, __namelist: ***dirent64, __selector: #type (unknown0: *dirent64) -> s32 #c_call, __cmp: #type (unknown0: **dirent64, unknown1: **dirent64) -> s32 #c_call) -> s32 #foreign libc;

alphasort :: (__e1: **dirent, __e2: **dirent) -> s32 #foreign libc;

alphasort64 :: (__e1: **dirent64, __e2: **dirent64) -> s32 #foreign libc;

getdirentries :: (__fd: s32, __buf: *u8, __nbytes: u64, __basep: *s64) -> s64 #foreign libc;

getdirentries64 :: (__fd: s32, __buf: *u8, __nbytes: u64, __basep: *s64) -> s64 #foreign libc;

versionsort :: (__e1: **dirent, __e2: **dirent) -> s32 #foreign libc;

versionsort64 :: (__e1: **dirent64, __e2: **dirent64) -> s32 #foreign libc;

/* The error code set by various library functions.  */
__errno_location :: () -> *OS_Error_Code #foreign libc;

/* The full and simple forms of the name with which the program was
invoked.  These variables are set up automatically at startup based on
the value of argv[0].  */
program_invocation_name: *u8 #elsewhere libc;
program_invocation_short_name: *u8 #elsewhere libc;

/* Store up to SIZE return address of the current program state in
ARRAY and return the exact number of values stored.  */
backtrace :: (__array: **void, __size: s32) -> s32 #foreign libc;

/* Return names of functions from the backtrace list in ARRAY in a newly
malloc()ed memory block.  */
backtrace_symbols :: (__array: **void, __size: s32) -> **u8 #foreign libc;

/* This function is similar to backtrace_symbols() but it writes the result
immediately to a file.  */
backtrace_symbols_fd :: (__array: **void, __size: s32, __fd: s32) -> void #foreign libc;

/* Match NAME against the filename pattern PATTERN,
returning zero if it matches, FNM_NOMATCH if not.  */
fnmatch :: (__pattern: *u8, __name: *u8, __flags: s32) -> s32 #foreign libc;

/* A record in the user database.  */
passwd :: struct {
    pw_name:   *u8; /* Username.  */
    /* Hashed passphrase, if shadow database
    not in use (see shadow.h).  */
    pw_passwd: *u8;

    pw_uid:    u32; /* User ID.  */
    pw_gid:    u32; /* Group ID.  */
    pw_gecos:  *u8; /* Real name.  */
    pw_dir:    *u8; /* Home directory.  */
    pw_shell:  *u8; /* Shell program.  */
}

/* Rewind the user database stream.

This function is a possible cancellation point and therefore not
marked with __THROW.  */
setpwent :: () -> void #foreign libc;

/* Close the user database stream.

This function is a possible cancellation point and therefore not
marked with __THROW.  */
endpwent :: () -> void #foreign libc;

/* Read an entry from the user database stream, opening it if necessary.

This function is a possible cancellation point and therefore not
marked with __THROW.  */
getpwent :: () -> *passwd #foreign libc;

/* Read a user database entry from STREAM.

This function is not part of POSIX and therefore no official
cancellation point.  But due to similarity with an POSIX interface
or due to the implementation it is a cancellation point and
therefore not marked with __THROW.  */
fgetpwent :: (__stream: *FILE) -> *passwd #foreign libc;

/* Write a given user database entry onto the given stream.

This function is not part of POSIX and therefore no official
cancellation point.  But due to similarity with an POSIX interface
or due to the implementation it is a cancellation point and
therefore not marked with __THROW.  */
putpwent :: (__p: *passwd, __f: *FILE) -> s32 #foreign libc;

/* Retrieve the user database entry for the given user ID.

This function is a possible cancellation point and therefore not
marked with __THROW.  */
getpwuid :: (__uid: u32) -> *passwd #foreign libc;

/* Retrieve the user database entry for the given username.

This function is a possible cancellation point and therefore not
marked with __THROW.  */
getpwnam :: (__name: *u8) -> *passwd #foreign libc;

/* This function is not part of POSIX and therefore no official
cancellation point.  But due to similarity with an POSIX interface
or due to the implementation it is a cancellation point and
therefore not marked with __THROW.  */
getpwent_r :: (__resultbuf: *passwd, __buffer: *u8, __buflen: u64, __result: **passwd) -> s32 #foreign libc;

getpwuid_r :: (__uid: u32, __resultbuf: *passwd, __buffer: *u8, __buflen: u64, __result: **passwd) -> s32 #foreign libc;

getpwnam_r :: (__name: *u8, __resultbuf: *passwd, __buffer: *u8, __buflen: u64, __result: **passwd) -> s32 #foreign libc;

/* Read a user database entry from STREAM.  This function is not
standardized and probably never will.

This function is not part of POSIX and therefore no official
cancellation point.  But due to similarity with an POSIX interface
or due to the implementation it is a cancellation point and
therefore not marked with __THROW.  */
fgetpwent_r :: (__stream: *FILE, __resultbuf: *passwd, __buffer: *u8, __buflen: u64, __result: **passwd) -> s32 #foreign libc;

/* Write a traditional /etc/passwd line, based on the user database
entry for the given UID, to BUFFER; space for BUFFER must be
allocated by the caller.

This function is not part of POSIX and therefore no official
cancellation point.  But due to similarity with an POSIX interface
or due to the implementation it is a cancellation point and
therefore not marked with __THROW.  */
getpw :: (__uid: u32, __buffer: *u8) -> s32 #foreign libc;

sigset_t :: __sigset_t;

time_t :: s64;

timespec :: struct {
    tv_sec:  s64;

    tv_nsec: s64;
}

sigval :: union {
    sival_int: s32;
    sival_ptr: *void;
}

siginfo_t :: struct {
    si_signo:  s32;

    si_errno:  s32;

    si_code:   s32;

    __pad0:    s32;

    _sifields: union {
        _pad:      [28] s32;

        _kill:     struct {
            si_pid: s32;
            si_uid: u32;
        };

        _timer:    struct {
            si_tid:     s32;
            si_overrun: s32;
            si_sigval:  sigval;
        };

        _rt:       struct {
            si_pid:    s32;
            si_uid:    u32;
            si_sigval: sigval;
        };

        _sigchld:  struct {
            si_pid:    s32;
            si_uid:    u32;
            si_status: s32;
            si_utime:  s64;
            si_stime:  s64;
        };

        _sigfault: struct {
            si_addr:     *void;

            si_addr_lsb: s16;
            _bounds:     union {
                _addr_bnd: struct {
                    _lower: *void;
                    _upper: *void;
                };

                _pkey:     u32;
            };
        };

        _sigpoll:  struct {
            si_band: s64;
            si_fd:   s32;
        };

        _sigsys:   struct {
            _call_addr: *void;
            _syscall:   s32;
            _arch:      u32;
        };
    };
}

sigevent :: struct {
    sigev_value:  sigval;
    sigev_signo:  s32;
    sigev_notify: s32;

    _sigev_un:    union {
        _pad:          [12] s32;

        _tid:          s32;

        _sigev_thread: struct {
            _function:  #type (unknown0: sigval) -> void #c_call;
            _attribute: *pthread_attr_t;
        };
    };
}

sigevent_t :: sigevent;

/* The X/Open definition of `signal' specifies the SVID semantic.  Use
the additional function `sysv_signal' when X/Open compatibility is
requested.  */
__sysv_signal :: (__sig: s32, __handler: #type (unknown0: s32) -> void #c_call) -> ((unknown0: s32) -> void #c_call) #foreign libc;

sysv_signal :: (__sig: s32, __handler: #type (unknown0: s32) -> void #c_call) -> ((unknown0: s32) -> void #c_call) #foreign libc;

signal :: (__sig: s32, __handler: #type (unknown0: s32) -> void #c_call) -> ((unknown0: s32) -> void #c_call) #foreign libc;

kill :: (__pid: s32, __sig: s32) -> s32 #foreign libc;

/* Send SIG to all processes in process group PGRP.
If PGRP is zero, send SIG to all processes in
the current process's process group.  */
killpg :: (__pgrp: s32, __sig: s32) -> s32 #foreign libc;

/* Raise signal SIG, i.e., send SIG to yourself.  */
raise :: (__sig: s32) -> s32 #foreign libc;

/* SVID names for the same things.  */
ssignal :: (__sig: s32, __handler: #type (unknown0: s32) -> void #c_call) -> ((unknown0: s32) -> void #c_call) #foreign libc;

gsignal :: (__sig: s32) -> s32 #foreign libc;

/* Print a message describing the meaning of the given signal number.  */
psignal :: (__sig: s32, __s: *u8) -> void #foreign libc;

/* Print a message describing the meaning of the given signal information.  */
psiginfo :: (__pinfo: *siginfo_t, __s: *u8) -> void #foreign libc;

sigpause :: (__sig: s32) -> s32 #foreign libc "__xpg_sigpause";

/* Block signals in MASK, returning the old mask.  */
sigblock :: (__mask: s32) -> s32 #foreign libc;

/* Set the mask of blocked signals to MASK, returning the old mask.  */
sigsetmask :: (__mask: s32) -> s32 #foreign libc;

/* Return currently selected signal mask.  */
siggetmask :: () -> s32 #foreign libc;

sighandler_t :: #type (unknown0: s32) -> void #c_call;

sig_t :: #type (unknown0: s32) -> void #c_call;

/* Clear all signals from SET.  */
sigemptyset :: (__set: *sigset_t) -> s32 #foreign libc;

/* Set all signals in SET.  */
sigfillset :: (__set: *sigset_t) -> s32 #foreign libc;

/* Add SIGNO to SET.  */
sigaddset :: (__set: *sigset_t, __signo: s32) -> s32 #foreign libc;

/* Remove SIGNO from SET.  */
sigdelset :: (__set: *sigset_t, __signo: s32) -> s32 #foreign libc;

/* Return 1 if SIGNO is in SET, 0 if not.  */
sigismember :: (__set: *sigset_t, __signo: s32) -> s32 #foreign libc;

/* Return non-empty value is SET is not empty.  */
sigisemptyset :: (__set: *sigset_t) -> s32 #foreign libc;

/* Build new signal set by combining the two inputs set using logical AND.  */
sigandset :: (__set: *sigset_t, __left: *sigset_t, __right: *sigset_t) -> s32 #foreign libc;

/* Build new signal set by combining the two inputs set using logical OR.  */
sigorset :: (__set: *sigset_t, __left: *sigset_t, __right: *sigset_t) -> s32 #foreign libc;

sigaction_t :: struct {
    using __sigaction_handler: union {
        sa_handler:   #type (unknown0: s32) -> void #c_call;

        sa_sigaction: #type (unknown0: s32, unknown1: *siginfo_t, unknown2: *void) -> void #c_call;
    };

    sa_mask:             __sigset_t;

    sa_flags:            s32;

    sa_restorer:         #type () -> void #c_call;
}

/* Get and/or change the set of blocked signals.  */
sigprocmask :: (__how: s32, __set: *sigset_t, __oset: *sigset_t) -> s32 #foreign libc;

/* Change the set of blocked signals to SET,
wait until a signal arrives, and restore the set of blocked signals.

This function is a cancellation point and therefore not marked with
__THROW.  */
sigsuspend :: (__set: *sigset_t) -> s32 #foreign libc;

/* Get and/or set the action for signal SIG.  */
sigaction :: (__sig: s32, __act: *sigaction_t, __oact: *sigaction_t) -> s32 #foreign libc;

/* Put in SET all signals that are blocked and waiting to be delivered.  */
sigpending :: (__set: *sigset_t) -> s32 #foreign libc;

/* Select any of pending signals from SET or wait for any to arrive.

This function is a cancellation point and therefore not marked with
__THROW.  */
sigwait :: (__set: *sigset_t, __sig: *s32) -> s32 #foreign libc;

/* Select any of pending signals from SET and place information in INFO.

This function is a cancellation point and therefore not marked with
__THROW.  */
sigwaitinfo :: (__set: *sigset_t, __info: *siginfo_t) -> s32 #foreign libc;

sigtimedwait :: (__set: *sigset_t, __info: *siginfo_t, __timeout: *timespec) -> s32 #foreign libc;

/* Send signal SIG to the process PID.  Associate data in VAL with the
signal.  */
sigqueue :: (__pid: s32, __sig: s32, __val: sigval) -> s32 #foreign libc;

__kernel_fd_set :: struct {
    fds_bits: [16] u64;
}

__kernel_fsid_t :: struct {
    val: [2] s32;
}

sigcontext :: struct {
    fault_address: u64;

    regs:          [31] u64;
    sp:            u64;
    pc:            u64;
    pstate:        u64;

    __reserved:    [4096] u8 #align 9;
}

/* Restore the state saved in SCP.  */
sigreturn :: (__scp: *sigcontext) -> s32 #foreign libc;

stack_t :: struct {
    ss_sp:    *void;
    ss_flags: s32;
    ss_size:  u64;
}

timeval :: struct {
    tv_sec:  s64;
    tv_usec: s64;
}

suseconds_t :: s64;

timezone :: struct {
    tz_minuteswest: s32;
    tz_dsttime:     s32;
}

gettimeofday :: (__tv: *timeval, __tz: *void) -> s32 #foreign libc;

settimeofday :: (__tv: *timeval, __tz: *timezone) -> s32 #foreign libc;

adjtime :: (__delta: *timeval, __olddelta: *timeval) -> s32 #foreign libc;

__itimer_which :: enum u32 {
    REAL    :: 0;

    VIRTUAL :: 1;

    PROF    :: 2;

    ITIMER_REAL    :: REAL;

    ITIMER_VIRTUAL :: VIRTUAL;

    ITIMER_PROF    :: PROF;
}

itimerval :: struct {
    it_interval: timeval;

    it_value:    timeval;
}

getitimer :: (__which: __itimer_which, __value: *itimerval) -> s32 #foreign libc;

setitimer :: (__which: __itimer_which, __new: *itimerval, __old: *itimerval) -> s32 #foreign libc;

utimes :: (__file: *u8, __tvp: *[2] timeval) -> s32 #foreign libc;

lutimes :: (__file: *u8, __tvp: *[2] timeval) -> s32 #foreign libc;

futimes :: (__fd: s32, __tvp: *[2] timeval) -> s32 #foreign libc;

futimesat :: (__fd: s32, __file: *u8, __tvp: *[2] timeval) -> s32 #foreign libc;

fsid_t :: __fsid_t;

key_t :: s32;

clock_t :: s64;

timer_t :: *void;

useconds_t :: u32;

register_t :: s64;

fsblkcnt_t :: u64;

fsfilcnt_t :: u64;

blkcnt64_t :: s64;
fsblkcnt64_t :: u64;
fsfilcnt64_t :: u64;

user_regs_struct :: struct {
    regs:   [31] u64;
    sp:     u64;
    pc:     u64;
    pstate: u64;
}

user_fpsimd_struct :: struct {
    vregs: [32] U128;
    fpsr:  u32;
    fpcr:  u32;
}

elf_greg_t :: u64;

elf_gregset_t :: [34] elf_greg_t;

elf_fpregset_t :: user_fpsimd_struct;

greg_t :: elf_greg_t;

gregset_t :: elf_gregset_t;

fpregset_t :: elf_fpregset_t;

mcontext_t :: struct {
    fault_address: u64;
    regs:          [31] u64;
    sp:            u64;
    pc:            u64;
    pstate:        u64;

    __reserved:    [4096] u8 #align 9;
}

ucontext_t :: struct {
    uc_flags:    u64;
    uc_link:     *ucontext_t;
    uc_stack:    stack_t;
    uc_sigmask:  sigset_t;
    uc_mcontext: mcontext_t #align 16;
}

/* If INTERRUPT is nonzero, make signal SIG interrupt system calls
(causing them to fail with EINTR); if INTERRUPT is zero, make system
calls be restarted after signal SIG.  */
siginterrupt :: (__sig: s32, __interrupt: s32) -> s32 #foreign libc;

access :: (__name: *u8, __type: s32) -> s32 #foreign libc;

euidaccess :: (__name: *u8, __type: s32) -> s32 #foreign libc;

eaccess :: (__name: *u8, __type: s32) -> s32 #foreign libc;

execveat :: (__fd: s32, __path: *u8, __argv: **u8, __envp: **u8, __flags: s32) -> s32 #foreign libc;

faccessat :: (__fd: s32, __file: *u8, __type: s32, __flag: s32) -> s32 #foreign libc;

lseek :: (__fd: s32, __offset: s64, __whence: s32) -> s64 #foreign libc;

lseek64 :: (__fd: s32, __offset: s64, __whence: s32) -> s64 #foreign libc;

close :: (__fd: s32) -> s32 #foreign libc;

closefrom :: (__lowfd: s32) -> void #foreign libc;

read :: (__fd: s32, __buf: *void, __nbytes: u64) -> s64 #foreign libc;

write :: (__fd: s32, __buf: *void, __n: u64) -> s64 #foreign libc;

pread :: (__fd: s32, __buf: *void, __nbytes: u64, __offset: s64) -> s64 #foreign libc;

pwrite :: (__fd: s32, __buf: *void, __n: u64, __offset: s64) -> s64 #foreign libc;

pread64 :: (__fd: s32, __buf: *void, __nbytes: u64, __offset: s64) -> s64 #foreign libc;

pwrite64 :: (__fd: s32, __buf: *void, __n: u64, __offset: s64) -> s64 #foreign libc;

pipe :: (__pipedes: *[2] s32) -> s32 #foreign libc;

pipe2 :: (__pipedes: *[2] s32, __flags: s32) -> s32 #foreign libc;

alarm :: (__seconds: u32) -> u32 #foreign libc;

sleep :: (__seconds: u32) -> u32 #foreign libc;

ualarm :: (__value: u32, __interval: u32) -> u32 #foreign libc;

usleep :: (__useconds: u32) -> s32 #foreign libc;

pause :: () -> s32 #foreign libc;

chown :: (__file: *u8, __owner: u32, __group: u32) -> s32 #foreign libc;

fchown :: (__fd: s32, __owner: u32, __group: u32) -> s32 #foreign libc;

lchown :: (__file: *u8, __owner: u32, __group: u32) -> s32 #foreign libc;

fchownat :: (__fd: s32, __file: *u8, __owner: u32, __group: u32, __flag: s32) -> s32 #foreign libc;

chdir :: (__path: *u8) -> s32 #foreign libc;

fchdir :: (__fd: s32) -> s32 #foreign libc;

getcwd :: (__buf: *u8, __size: u64) -> *u8 #foreign libc;

get_current_dir_name :: () -> *u8 #foreign libc;

getwd :: (__buf: *u8) -> *u8 #foreign libc;

dup :: (__fd: s32) -> s32 #foreign libc;

dup2 :: (__fd: s32, __fd2: s32) -> s32 #foreign libc;

dup3 :: (__fd: s32, __fd2: s32, __flags: s32) -> s32 #foreign libc;

__environ: **u8 #elsewhere libc;

environ: **u8 #elsewhere libc;

execve :: (__path: *u8, __argv: **u8, __envp: **u8) -> s32 #foreign libc;

fexecve :: (__fd: s32, __argv: **u8, __envp: **u8) -> s32 #foreign libc;

execv :: (__path: *u8, __argv: **u8) -> s32 #foreign libc;

execle :: (__path: *u8, __arg: *u8, __args: ..Any) -> s32 #foreign libc;

execl :: (__path: *u8, __arg: *u8, __args: ..Any) -> s32 #foreign libc;

execvp :: (__file: *u8, __argv: **u8) -> s32 #foreign libc;

execlp :: (__file: *u8, __arg: *u8, __args: ..Any) -> s32 #foreign libc;

execvpe :: (__file: *u8, __argv: **u8, __envp: **u8) -> s32 #foreign libc;

nice :: (__inc: s32) -> s32 #foreign libc;

_exit :: (__status: s32) -> void #foreign libc;

PC :: enum u32 {
    LINK_MAX           :: 0;

    MAX_CANON          :: 1;

    MAX_INPUT          :: 2;

    NAME_MAX           :: 3;

    PATH_MAX           :: 4;

    PIPE_BUF           :: 5;

    CHOWN_RESTRICTED   :: 6;

    NO_TRUNC           :: 7;

    VDISABLE           :: 8;

    SYNC_IO            :: 9;

    ASYNC_IO           :: 10;

    PRIO_IO            :: 11;

    SOCK_MAXBUF        :: 12;

    FILESIZEBITS       :: 13;

    REC_INCR_XFER_SIZE :: 14;

    REC_MAX_XFER_SIZE  :: 15;

    REC_MIN_XFER_SIZE  :: 16;

    REC_XFER_ALIGN     :: 17;

    ALLOC_SIZE_MIN     :: 18;

    SYMLINK_MAX        :: 19;

    _2_SYMLINKS        :: 20;

    _PC_LINK_MAX           :: LINK_MAX;

    _PC_MAX_CANON          :: MAX_CANON;

    _PC_MAX_INPUT          :: MAX_INPUT;

    _PC_NAME_MAX           :: NAME_MAX;

    _PC_PATH_MAX           :: PATH_MAX;

    _PC_PIPE_BUF           :: PIPE_BUF;

    _PC_CHOWN_RESTRICTED   :: CHOWN_RESTRICTED;

    _PC_NO_TRUNC           :: NO_TRUNC;

    _PC_VDISABLE           :: VDISABLE;

    _PC_SYNC_IO            :: SYNC_IO;

    _PC_ASYNC_IO           :: ASYNC_IO;

    _PC_PRIO_IO            :: PRIO_IO;

    _PC_SOCK_MAXBUF        :: SOCK_MAXBUF;

    _PC_FILESIZEBITS       :: FILESIZEBITS;

    _PC_REC_INCR_XFER_SIZE :: REC_INCR_XFER_SIZE;

    _PC_REC_MAX_XFER_SIZE  :: REC_MAX_XFER_SIZE;

    _PC_REC_MIN_XFER_SIZE  :: REC_MIN_XFER_SIZE;

    _PC_REC_XFER_ALIGN     :: REC_XFER_ALIGN;

    _PC_ALLOC_SIZE_MIN     :: ALLOC_SIZE_MIN;

    _PC_SYMLINK_MAX        :: SYMLINK_MAX;

    _PC_2_SYMLINKS         :: _2_SYMLINKS;
}

using _SC_definitions :: enum s32 {
    _SC_ARG_MAX                      :: 0;

    _SC_CHILD_MAX                    :: 1;

    _SC_CLK_TCK                      :: 2;

    _SC_NGROUPS_MAX                  :: 3;

    _SC_OPEN_MAX                     :: 4;

    _SC_STREAM_MAX                   :: 5;

    _SC_TZNAME_MAX                   :: 6;

    _SC_JOB_CONTROL                  :: 7;

    _SC_SAVED_IDS                    :: 8;

    _SC_REALTIME_SIGNALS             :: 9;

    _SC_PRIORITY_SCHEDULING          :: 10;

    _SC_TIMERS                       :: 11;

    _SC_ASYNCHRONOUS_IO              :: 12;

    _SC_PRIORITIZED_IO               :: 13;

    _SC_SYNCHRONIZED_IO              :: 14;

    _SC_FSYNC                        :: 15;

    _SC_MAPPED_FILES                 :: 16;

    _SC_MEMLOCK                      :: 17;

    _SC_MEMLOCK_RANGE                :: 18;

    _SC_MEMORY_PROTECTION            :: 19;

    _SC_MESSAGE_PASSING              :: 20;

    _SC_SEMAPHORES                   :: 21;

    _SC_SHARED_MEMORY_OBJECTS        :: 22;

    _SC_AIO_LISTIO_MAX               :: 23;

    _SC_AIO_MAX                      :: 24;

    _SC_AIO_PRIO_DELTA_MAX           :: 25;

    _SC_DELAYTIMER_MAX               :: 26;

    _SC_MQ_OPEN_MAX                  :: 27;

    _SC_MQ_PRIO_MAX                  :: 28;

    _SC_VERSION                      :: 29;

    _SC_PAGESIZE                     :: 30;

    _SC_RTSIG_MAX                    :: 31;

    _SC_SEM_NSEMS_MAX                :: 32;

    _SC_SEM_VALUE_MAX                :: 33;

    _SC_SIGQUEUE_MAX                 :: 34;

    _SC_TIMER_MAX                    :: 35;

    _SC_BC_BASE_MAX                  :: 36;

    _SC_BC_DIM_MAX                   :: 37;

    _SC_BC_SCALE_MAX                 :: 38;

    _SC_BC_STRING_MAX                :: 39;

    _SC_COLL_WEIGHTS_MAX             :: 40;

    _SC_EQUIV_CLASS_MAX              :: 41;

    _SC_EXPR_NEST_MAX                :: 42;

    _SC_LINE_MAX                     :: 43;

    _SC_RE_DUP_MAX                   :: 44;

    _SC_CHARCLASS_NAME_MAX           :: 45;

    _SC_2_VERSION                    :: 46;

    _SC_2_C_BIND                     :: 47;

    _SC_2_C_DEV                      :: 48;

    _SC_2_FORT_DEV                   :: 49;

    _SC_2_FORT_RUN                   :: 50;

    _SC_2_SW_DEV                     :: 51;

    _SC_2_LOCALEDEF                  :: 52;

    _SC_PII                          :: 53;

    _SC_PII_XTI                      :: 54;

    _SC_PII_SOCKET                   :: 55;

    _SC_PII_INTERNET                 :: 56;

    _SC_PII_OSI                      :: 57;

    _SC_POLL                         :: 58;

    _SC_SELECT                       :: 59;

    _SC_UIO_MAXIOV                   :: 60;

    _SC_IOV_MAX                      :: 60;

    _SC_PII_INTERNET_STREAM          :: 61;

    _SC_PII_INTERNET_DGRAM           :: 62;

    _SC_PII_OSI_COTS                 :: 63;

    _SC_PII_OSI_CLTS                 :: 64;

    _SC_PII_OSI_M                    :: 65;

    _SC_T_IOV_MAX                    :: 66;

    _SC_THREADS                      :: 67;

    _SC_THREAD_SAFE_FUNCTIONS        :: 68;

    _SC_GETGR_R_SIZE_MAX             :: 69;

    _SC_GETPW_R_SIZE_MAX             :: 70;

    _SC_LOGIN_NAME_MAX               :: 71;

    _SC_TTY_NAME_MAX                 :: 72;

    _SC_THREAD_DESTRUCTOR_ITERATIONS :: 73;

    _SC_THREAD_KEYS_MAX              :: 74;

    _SC_THREAD_STACK_MIN             :: 75;

    _SC_THREAD_THREADS_MAX           :: 76;

    _SC_THREAD_ATTR_STACKADDR        :: 77;

    _SC_THREAD_ATTR_STACKSIZE        :: 78;

    _SC_THREAD_PRIORITY_SCHEDULING   :: 79;

    _SC_THREAD_PRIO_INHERIT          :: 80;

    _SC_THREAD_PRIO_PROTECT          :: 81;

    _SC_THREAD_PROCESS_SHARED        :: 82;

    _SC_NPROCESSORS_CONF             :: 83;

    _SC_NPROCESSORS_ONLN             :: 84;

    _SC_PHYS_PAGES                   :: 85;

    _SC_AVPHYS_PAGES                 :: 86;

    _SC_ATEXIT_MAX                   :: 87;

    _SC_PASS_MAX                     :: 88;

    _SC_XOPEN_VERSION                :: 89;

    _SC_XOPEN_XCU_VERSION            :: 90;

    _SC_XOPEN_UNIX                   :: 91;

    _SC_XOPEN_CRYPT                  :: 92;

    _SC_XOPEN_ENH_I18N               :: 93;

    _SC_XOPEN_SHM                    :: 94;

    _SC_2_CHAR_TERM                  :: 95;

    _SC_2_C_VERSION                  :: 96;

    _SC_2_UPE                        :: 97;

    _SC_XOPEN_XPG2                   :: 98;

    _SC_XOPEN_XPG3                   :: 99;

    _SC_XOPEN_XPG4                   :: 100;

    _SC_CHAR_BIT                     :: 101;

    _SC_CHAR_MAX                     :: 102;

    _SC_CHAR_MIN                     :: 103;

    _SC_INT_MAX                      :: 104;

    _SC_INT_MIN                      :: 105;

    _SC_LONG_BIT                     :: 106;

    _SC_WORD_BIT                     :: 107;

    _SC_MB_LEN_MAX                   :: 108;

    _SC_NZERO                        :: 109;

    _SC_SSIZE_MAX                    :: 110;

    _SC_SCHAR_MAX                    :: 111;

    _SC_SCHAR_MIN                    :: 112;

    _SC_SHRT_MAX                     :: 113;

    _SC_SHRT_MIN                     :: 114;

    _SC_UCHAR_MAX                    :: 115;

    _SC_UINT_MAX                     :: 116;

    _SC_ULONG_MAX                    :: 117;

    _SC_USHRT_MAX                    :: 118;

    _SC_NL_ARGMAX                    :: 119;

    _SC_NL_LANGMAX                   :: 120;

    _SC_NL_MSGMAX                    :: 121;

    _SC_NL_NMAX                      :: 122;

    _SC_NL_SETMAX                    :: 123;

    _SC_NL_TEXTMAX                   :: 124;

    _SC_XBS5_ILP32_OFF32             :: 125;

    _SC_XBS5_ILP32_OFFBIG            :: 126;

    _SC_XBS5_LP64_OFF64              :: 127;

    _SC_XBS5_LPBIG_OFFBIG            :: 128;

    _SC_XOPEN_LEGACY                 :: 129;

    _SC_XOPEN_REALTIME               :: 130;

    _SC_XOPEN_REALTIME_THREADS       :: 131;

    _SC_ADVISORY_INFO                :: 132;

    _SC_BARRIERS                     :: 133;

    _SC_BASE                         :: 134;

    _SC_C_LANG_SUPPORT               :: 135;

    _SC_C_LANG_SUPPORT_R             :: 136;

    _SC_CLOCK_SELECTION              :: 137;

    _SC_CPUTIME                      :: 138;

    _SC_THREAD_CPUTIME               :: 139;

    _SC_DEVICE_IO                    :: 140;

    _SC_DEVICE_SPECIFIC              :: 141;

    _SC_DEVICE_SPECIFIC_R            :: 142;

    _SC_FD_MGMT                      :: 143;

    _SC_FIFO                         :: 144;

    _SC_PIPE                         :: 145;

    _SC_FILE_ATTRIBUTES              :: 146;

    _SC_FILE_LOCKING                 :: 147;

    _SC_FILE_SYSTEM                  :: 148;

    _SC_MONOTONIC_CLOCK              :: 149;

    _SC_MULTI_PROCESS                :: 150;

    _SC_SINGLE_PROCESS               :: 151;

    _SC_NETWORKING                   :: 152;

    _SC_READER_WRITER_LOCKS          :: 153;

    _SC_SPIN_LOCKS                   :: 154;

    _SC_REGEXP                       :: 155;

    _SC_REGEX_VERSION                :: 156;

    _SC_SHELL                        :: 157;

    _SC_SIGNALS                      :: 158;

    _SC_SPAWN                        :: 159;

    _SC_SPORADIC_SERVER              :: 160;

    _SC_THREAD_SPORADIC_SERVER       :: 161;

    _SC_SYSTEM_DATABASE              :: 162;

    _SC_SYSTEM_DATABASE_R            :: 163;

    _SC_TIMEOUTS                     :: 164;

    _SC_TYPED_MEMORY_OBJECTS         :: 165;

    _SC_USER_GROUPS                  :: 166;

    _SC_USER_GROUPS_R                :: 167;

    _SC_2_PBS                        :: 168;

    _SC_2_PBS_ACCOUNTING             :: 169;

    _SC_2_PBS_LOCATE                 :: 170;

    _SC_2_PBS_MESSAGE                :: 171;

    _SC_2_PBS_TRACK                  :: 172;

    _SC_SYMLOOP_MAX                  :: 173;

    _SC_STREAMS                      :: 174;

    _SC_2_PBS_CHECKPOINT             :: 175;

    _SC_V6_ILP32_OFF32               :: 176;

    _SC_V6_ILP32_OFFBIG              :: 177;

    _SC_V6_LP64_OFF64                :: 178;

    _SC_V6_LPBIG_OFFBIG              :: 179;

    _SC_HOST_NAME_MAX                :: 180;

    _SC_TRACE                        :: 181;

    _SC_TRACE_EVENT_FILTER           :: 182;

    _SC_TRACE_INHERIT                :: 183;

    _SC_TRACE_LOG                    :: 184;

    _SC_LEVEL1_ICACHE_SIZE           :: 185;

    _SC_LEVEL1_ICACHE_ASSOC          :: 186;

    _SC_LEVEL1_ICACHE_LINESIZE       :: 187;

    _SC_LEVEL1_DCACHE_SIZE           :: 188;

    _SC_LEVEL1_DCACHE_ASSOC          :: 189;

    _SC_LEVEL1_DCACHE_LINESIZE       :: 190;

    _SC_LEVEL2_CACHE_SIZE            :: 191;

    _SC_LEVEL2_CACHE_ASSOC           :: 192;

    _SC_LEVEL2_CACHE_LINESIZE        :: 193;

    _SC_LEVEL3_CACHE_SIZE            :: 194;

    _SC_LEVEL3_CACHE_ASSOC           :: 195;

    _SC_LEVEL3_CACHE_LINESIZE        :: 196;

    _SC_LEVEL4_CACHE_SIZE            :: 197;

    _SC_LEVEL4_CACHE_ASSOC           :: 198;

    _SC_LEVEL4_CACHE_LINESIZE        :: 199;

    _SC_IPV6                         :: 235;

    _SC_RAW_SOCKETS                  :: 236;

    _SC_V7_ILP32_OFF32               :: 237;

    _SC_V7_ILP32_OFFBIG              :: 238;

    _SC_V7_LP64_OFF64                :: 239;

    _SC_V7_LPBIG_OFFBIG              :: 240;

    _SC_SS_REPL_MAX                  :: 241;

    _SC_TRACE_EVENT_NAME_MAX         :: 242;

    _SC_TRACE_NAME_MAX               :: 243;

    _SC_TRACE_SYS_MAX                :: 244;

    _SC_TRACE_USER_EVENT_MAX         :: 245;

    _SC_XOPEN_STREAMS                :: 246;

    _SC_THREAD_ROBUST_PRIO_INHERIT   :: 247;

    _SC_THREAD_ROBUST_PRIO_PROTECT   :: 248;

    _SC_MINSIGSTKSZ                  :: 249;

    _SC_SIGSTKSZ                     :: 250;
}

CS :: enum u32 {
    PATH                            :: 0;

    V6_WIDTH_RESTRICTED_ENVS        :: 1;

    GNU_LIBC_VERSION                :: 2;

    GNU_LIBPTHREAD_VERSION          :: 3;

    V5_WIDTH_RESTRICTED_ENVS        :: 4;

    V7_WIDTH_RESTRICTED_ENVS        :: 5;

    LFS_CFLAGS                      :: 1000;

    LFS_LDFLAGS                     :: 1001;

    LFS_LIBS                        :: 1002;

    LFS_LINTFLAGS                   :: 1003;

    LFS64_CFLAGS                    :: 1004;

    LFS64_LDFLAGS                   :: 1005;

    LFS64_LIBS                      :: 1006;

    LFS64_LINTFLAGS                 :: 1007;

    XBS5_ILP32_OFF32_CFLAGS         :: 1100;

    XBS5_ILP32_OFF32_LDFLAGS        :: 1101;

    XBS5_ILP32_OFF32_LIBS           :: 1102;

    XBS5_ILP32_OFF32_LINTFLAGS      :: 1103;

    XBS5_ILP32_OFFBIG_CFLAGS        :: 1104;

    XBS5_ILP32_OFFBIG_LDFLAGS       :: 1105;

    XBS5_ILP32_OFFBIG_LIBS          :: 1106;

    XBS5_ILP32_OFFBIG_LINTFLAGS     :: 1107;

    XBS5_LP64_OFF64_CFLAGS          :: 1108;

    XBS5_LP64_OFF64_LDFLAGS         :: 1109;

    XBS5_LP64_OFF64_LIBS            :: 1110;

    XBS5_LP64_OFF64_LINTFLAGS       :: 1111;

    XBS5_LPBIG_OFFBIG_CFLAGS        :: 1112;

    XBS5_LPBIG_OFFBIG_LDFLAGS       :: 1113;

    XBS5_LPBIG_OFFBIG_LIBS          :: 1114;

    XBS5_LPBIG_OFFBIG_LINTFLAGS     :: 1115;

    POSIX_V6_ILP32_OFF32_CFLAGS     :: 1116;

    POSIX_V6_ILP32_OFF32_LDFLAGS    :: 1117;

    POSIX_V6_ILP32_OFF32_LIBS       :: 1118;

    POSIX_V6_ILP32_OFF32_LINTFLAGS  :: 1119;

    POSIX_V6_ILP32_OFFBIG_CFLAGS    :: 1120;

    POSIX_V6_ILP32_OFFBIG_LDFLAGS   :: 1121;

    POSIX_V6_ILP32_OFFBIG_LIBS      :: 1122;

    POSIX_V6_ILP32_OFFBIG_LINTFLAGS :: 1123;

    POSIX_V6_LP64_OFF64_CFLAGS      :: 1124;

    POSIX_V6_LP64_OFF64_LDFLAGS     :: 1125;

    POSIX_V6_LP64_OFF64_LIBS        :: 1126;

    POSIX_V6_LP64_OFF64_LINTFLAGS   :: 1127;

    POSIX_V6_LPBIG_OFFBIG_CFLAGS    :: 1128;

    POSIX_V6_LPBIG_OFFBIG_LDFLAGS   :: 1129;

    POSIX_V6_LPBIG_OFFBIG_LIBS      :: 1130;

    POSIX_V6_LPBIG_OFFBIG_LINTFLAGS :: 1131;

    POSIX_V7_ILP32_OFF32_CFLAGS     :: 1132;

    POSIX_V7_ILP32_OFF32_LDFLAGS    :: 1133;

    POSIX_V7_ILP32_OFF32_LIBS       :: 1134;

    POSIX_V7_ILP32_OFF32_LINTFLAGS  :: 1135;

    POSIX_V7_ILP32_OFFBIG_CFLAGS    :: 1136;

    POSIX_V7_ILP32_OFFBIG_LDFLAGS   :: 1137;

    POSIX_V7_ILP32_OFFBIG_LIBS      :: 1138;

    POSIX_V7_ILP32_OFFBIG_LINTFLAGS :: 1139;

    POSIX_V7_LP64_OFF64_CFLAGS      :: 1140;

    POSIX_V7_LP64_OFF64_LDFLAGS     :: 1141;

    POSIX_V7_LP64_OFF64_LIBS        :: 1142;

    POSIX_V7_LP64_OFF64_LINTFLAGS   :: 1143;

    POSIX_V7_LPBIG_OFFBIG_CFLAGS    :: 1144;

    POSIX_V7_LPBIG_OFFBIG_LDFLAGS   :: 1145;

    POSIX_V7_LPBIG_OFFBIG_LIBS      :: 1146;

    POSIX_V7_LPBIG_OFFBIG_LINTFLAGS :: 1147;

    V6_ENV                          :: 1148;

    V7_ENV                          :: 1149;

    _CS_PATH                            :: PATH;

    _CS_V6_WIDTH_RESTRICTED_ENVS        :: V6_WIDTH_RESTRICTED_ENVS;

    _CS_GNU_LIBC_VERSION                :: GNU_LIBC_VERSION;

    _CS_GNU_LIBPTHREAD_VERSION          :: GNU_LIBPTHREAD_VERSION;

    _CS_V5_WIDTH_RESTRICTED_ENVS        :: V5_WIDTH_RESTRICTED_ENVS;

    _CS_V7_WIDTH_RESTRICTED_ENVS        :: V7_WIDTH_RESTRICTED_ENVS;

    _CS_LFS_CFLAGS                      :: LFS_CFLAGS;

    _CS_LFS_LDFLAGS                     :: LFS_LDFLAGS;

    _CS_LFS_LIBS                        :: LFS_LIBS;

    _CS_LFS_LINTFLAGS                   :: LFS_LINTFLAGS;

    _CS_LFS64_CFLAGS                    :: LFS64_CFLAGS;

    _CS_LFS64_LDFLAGS                   :: LFS64_LDFLAGS;

    _CS_LFS64_LIBS                      :: LFS64_LIBS;

    _CS_LFS64_LINTFLAGS                 :: LFS64_LINTFLAGS;

    _CS_XBS5_ILP32_OFF32_CFLAGS         :: XBS5_ILP32_OFF32_CFLAGS;

    _CS_XBS5_ILP32_OFF32_LDFLAGS        :: XBS5_ILP32_OFF32_LDFLAGS;

    _CS_XBS5_ILP32_OFF32_LIBS           :: XBS5_ILP32_OFF32_LIBS;

    _CS_XBS5_ILP32_OFF32_LINTFLAGS      :: XBS5_ILP32_OFF32_LINTFLAGS;

    _CS_XBS5_ILP32_OFFBIG_CFLAGS        :: XBS5_ILP32_OFFBIG_CFLAGS;

    _CS_XBS5_ILP32_OFFBIG_LDFLAGS       :: XBS5_ILP32_OFFBIG_LDFLAGS;

    _CS_XBS5_ILP32_OFFBIG_LIBS          :: XBS5_ILP32_OFFBIG_LIBS;

    _CS_XBS5_ILP32_OFFBIG_LINTFLAGS     :: XBS5_ILP32_OFFBIG_LINTFLAGS;

    _CS_XBS5_LP64_OFF64_CFLAGS          :: XBS5_LP64_OFF64_CFLAGS;

    _CS_XBS5_LP64_OFF64_LDFLAGS         :: XBS5_LP64_OFF64_LDFLAGS;

    _CS_XBS5_LP64_OFF64_LIBS            :: XBS5_LP64_OFF64_LIBS;

    _CS_XBS5_LP64_OFF64_LINTFLAGS       :: XBS5_LP64_OFF64_LINTFLAGS;

    _CS_XBS5_LPBIG_OFFBIG_CFLAGS        :: XBS5_LPBIG_OFFBIG_CFLAGS;

    _CS_XBS5_LPBIG_OFFBIG_LDFLAGS       :: XBS5_LPBIG_OFFBIG_LDFLAGS;

    _CS_XBS5_LPBIG_OFFBIG_LIBS          :: XBS5_LPBIG_OFFBIG_LIBS;

    _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS     :: XBS5_LPBIG_OFFBIG_LINTFLAGS;

    _CS_POSIX_V6_ILP32_OFF32_CFLAGS     :: POSIX_V6_ILP32_OFF32_CFLAGS;

    _CS_POSIX_V6_ILP32_OFF32_LDFLAGS    :: POSIX_V6_ILP32_OFF32_LDFLAGS;

    _CS_POSIX_V6_ILP32_OFF32_LIBS       :: POSIX_V6_ILP32_OFF32_LIBS;

    _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS  :: POSIX_V6_ILP32_OFF32_LINTFLAGS;

    _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS    :: POSIX_V6_ILP32_OFFBIG_CFLAGS;

    _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS   :: POSIX_V6_ILP32_OFFBIG_LDFLAGS;

    _CS_POSIX_V6_ILP32_OFFBIG_LIBS      :: POSIX_V6_ILP32_OFFBIG_LIBS;

    _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS :: POSIX_V6_ILP32_OFFBIG_LINTFLAGS;

    _CS_POSIX_V6_LP64_OFF64_CFLAGS      :: POSIX_V6_LP64_OFF64_CFLAGS;

    _CS_POSIX_V6_LP64_OFF64_LDFLAGS     :: POSIX_V6_LP64_OFF64_LDFLAGS;

    _CS_POSIX_V6_LP64_OFF64_LIBS        :: POSIX_V6_LP64_OFF64_LIBS;

    _CS_POSIX_V6_LP64_OFF64_LINTFLAGS   :: POSIX_V6_LP64_OFF64_LINTFLAGS;

    _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS    :: POSIX_V6_LPBIG_OFFBIG_CFLAGS;

    _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS   :: POSIX_V6_LPBIG_OFFBIG_LDFLAGS;

    _CS_POSIX_V6_LPBIG_OFFBIG_LIBS      :: POSIX_V6_LPBIG_OFFBIG_LIBS;

    _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS :: POSIX_V6_LPBIG_OFFBIG_LINTFLAGS;

    _CS_POSIX_V7_ILP32_OFF32_CFLAGS     :: POSIX_V7_ILP32_OFF32_CFLAGS;

    _CS_POSIX_V7_ILP32_OFF32_LDFLAGS    :: POSIX_V7_ILP32_OFF32_LDFLAGS;

    _CS_POSIX_V7_ILP32_OFF32_LIBS       :: POSIX_V7_ILP32_OFF32_LIBS;

    _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS  :: POSIX_V7_ILP32_OFF32_LINTFLAGS;

    _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS    :: POSIX_V7_ILP32_OFFBIG_CFLAGS;

    _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS   :: POSIX_V7_ILP32_OFFBIG_LDFLAGS;

    _CS_POSIX_V7_ILP32_OFFBIG_LIBS      :: POSIX_V7_ILP32_OFFBIG_LIBS;

    _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS :: POSIX_V7_ILP32_OFFBIG_LINTFLAGS;

    _CS_POSIX_V7_LP64_OFF64_CFLAGS      :: POSIX_V7_LP64_OFF64_CFLAGS;

    _CS_POSIX_V7_LP64_OFF64_LDFLAGS     :: POSIX_V7_LP64_OFF64_LDFLAGS;

    _CS_POSIX_V7_LP64_OFF64_LIBS        :: POSIX_V7_LP64_OFF64_LIBS;

    _CS_POSIX_V7_LP64_OFF64_LINTFLAGS   :: POSIX_V7_LP64_OFF64_LINTFLAGS;

    _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS    :: POSIX_V7_LPBIG_OFFBIG_CFLAGS;

    _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS   :: POSIX_V7_LPBIG_OFFBIG_LDFLAGS;

    _CS_POSIX_V7_LPBIG_OFFBIG_LIBS      :: POSIX_V7_LPBIG_OFFBIG_LIBS;

    _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS :: POSIX_V7_LPBIG_OFFBIG_LINTFLAGS;

    _CS_V6_ENV                          :: V6_ENV;

    _CS_V7_ENV                          :: V7_ENV;
}

pathconf :: (__path: *u8, __name: PC) -> s64 #foreign libc;

fpathconf :: (__fd: s32, __name: PC) -> s64 #foreign libc;

sysconf :: (name: _SC_definitions) -> s64 #foreign libc;

confstr :: (__name: s32, __buf: *u8, __len: u64) -> u64 #foreign libc;

getpid :: () -> s32 #foreign libc;

getppid :: () -> s32 #foreign libc;

getpgrp :: () -> s32 #foreign libc;

__getpgid :: (__pid: s32) -> s32 #foreign libc;

getpgid :: (__pid: s32) -> s32 #foreign libc;

setpgid :: (__pid: s32, __pgid: s32) -> s32 #foreign libc;

setpgrp :: () -> s32 #foreign libc;

setsid :: () -> s32 #foreign libc;

getsid :: (__pid: s32) -> s32 #foreign libc;

getuid :: () -> u32 #foreign libc;

geteuid :: () -> u32 #foreign libc;

getgid :: () -> u32 #foreign libc;

getegid :: () -> u32 #foreign libc;

getgroups :: (__size: s32, __list: *u32) -> s32 #foreign libc;

group_member :: (__gid: u32) -> s32 #foreign libc;

setuid :: (__uid: u32) -> s32 #foreign libc;

setreuid :: (__ruid: u32, __euid: u32) -> s32 #foreign libc;

seteuid :: (__uid: u32) -> s32 #foreign libc;

setgid :: (__gid: u32) -> s32 #foreign libc;

setregid :: (__rgid: u32, __egid: u32) -> s32 #foreign libc;

setegid :: (__gid: u32) -> s32 #foreign libc;

getresuid :: (__ruid: *u32, __euid: *u32, __suid: *u32) -> s32 #foreign libc;

getresgid :: (__rgid: *u32, __egid: *u32, __sgid: *u32) -> s32 #foreign libc;

setresuid :: (__ruid: u32, __euid: u32, __suid: u32) -> s32 #foreign libc;

setresgid :: (__rgid: u32, __egid: u32, __sgid: u32) -> s32 #foreign libc;

fork :: () -> s32 #foreign libc;

vfork :: () -> s32 #foreign libc;

_Fork :: () -> s32 #foreign libc;

ttyname :: (__fd: s32) -> *u8 #foreign libc;

ttyname_r :: (__fd: s32, __buf: *u8, __buflen: u64) -> s32 #foreign libc;

isatty :: (__fd: s32) -> s32 #foreign libc;

ttyslot :: () -> s32 #foreign libc;

link :: (__from: *u8, __to: *u8) -> s32 #foreign libc;

linkat :: (__fromfd: s32, __from: *u8, __tofd: s32, __to: *u8, __flags: s32) -> s32 #foreign libc;

symlink :: (__from: *u8, __to: *u8) -> s32 #foreign libc;

readlink :: (__path: *u8, __buf: *u8, __len: u64) -> s64 #foreign libc;

symlinkat :: (__from: *u8, __tofd: s32, __to: *u8) -> s32 #foreign libc;

readlinkat :: (__fd: s32, __path: *u8, __buf: *u8, __len: u64) -> s64 #foreign libc;

unlink :: (__name: *u8) -> s32 #foreign libc;

unlinkat :: (__fd: s32, __name: *u8, __flag: s32) -> s32 #foreign libc;

rmdir :: (__path: *u8) -> s32 #foreign libc;

tcgetpgrp :: (__fd: s32) -> s32 #foreign libc;

tcsetpgrp :: (__fd: s32, __pgrp_id: s32) -> s32 #foreign libc;

getlogin :: () -> *u8 #foreign libc;

getlogin_r :: (__name: *u8, __name_len: u64) -> s32 #foreign libc;

setlogin :: (__name: *u8) -> s32 #foreign libc;

gethostname :: (__name: *u8, __len: u64) -> s32 #foreign libc;

sethostname :: (__name: *u8, __len: u64) -> s32 #foreign libc;

sethostid :: (__id: s64) -> s32 #foreign libc;

getdomainname :: (__name: *u8, __len: u64) -> s32 #foreign libc;

setdomainname :: (__name: *u8, __len: u64) -> s32 #foreign libc;

vhangup :: () -> s32 #foreign libc;

revoke :: (__file: *u8) -> s32 #foreign libc;

profil :: (__sample_buffer: *u16, __size: u64, __offset: u64, __scale: u32) -> s32 #foreign libc;

acct :: (__name: *u8) -> s32 #foreign libc;

getusershell :: () -> *u8 #foreign libc;
endusershell :: () -> void #foreign libc;
setusershell :: () -> void #foreign libc;

daemon :: (__nochdir: s32, __noclose: s32) -> s32 #foreign libc;

chroot :: (__path: *u8) -> s32 #foreign libc;

getpass :: (__prompt: *u8) -> *u8 #foreign libc;

fsync :: (__fd: s32) -> s32 #foreign libc;

syncfs :: (__fd: s32) -> s32 #foreign libc;

gethostid :: () -> s64 #foreign libc;

sync :: () -> void #foreign libc;

getpagesize :: () -> s32 #foreign libc;

getdtablesize :: () -> s32 #foreign libc;

truncate :: (__file: *u8, __length: s64) -> s32 #foreign libc;

truncate64 :: (__file: *u8, __length: s64) -> s32 #foreign libc;

ftruncate :: (__fd: s32, __length: s64) -> s32 #foreign libc;

ftruncate64 :: (__fd: s32, __length: s64) -> s32 #foreign libc;

brk :: (__addr: *void) -> s32 #foreign libc;

sbrk :: (__delta: s64) -> *void #foreign libc;

copy_file_range :: (__infd: s32, __pinoff: *s64, __outfd: s32, __poutoff: *s64, __length: u64, __flags: u32) -> s64 #foreign libc;

fdatasync :: (__fildes: s32) -> s32 #foreign libc;

swab :: (__from: *void, __to: *void, __n: s64) -> void #foreign libc;

getentropy :: (__buffer: *void, __length: u64) -> s32 #foreign libc;

close_range :: (__fd: u32, __max_fd: u32, __flags: s32) -> s32 #foreign libc;

/* Alternate signal handler stack interface.
This interface should always be preferred over `sigstack'.  */
sigaltstack :: (__ss: *stack_t, __oss: *stack_t) -> s32 #foreign libc;

/* Add SIG to the calling process' signal mask.  */
sighold :: (__sig: s32) -> s32 #foreign libc;

/* Remove SIG from the calling process' signal mask.  */
sigrelse :: (__sig: s32) -> s32 #foreign libc;

/* Set the disposition of SIG to SIG_IGN.  */
sigignore :: (__sig: s32) -> s32 #foreign libc;

/* Set the disposition of SIG.  */
sigset :: (__sig: s32, __disp: #type (unknown0: s32) -> void #c_call) -> ((unknown0: s32) -> void #c_call) #foreign libc;

/* Return number of available real-time signal with highest priority.  */
__libc_current_sigrtmin :: () -> s32 #foreign libc;

/* Return number of available real-time signal with lowest priority.  */
__libc_current_sigrtmax :: () -> s32 #foreign libc;

ipc_perm :: struct {
    __key:             s32;
    uid:               u32;
    gid:               u32;
    cuid:              u32;
    cgid:              u32;
    mode:              u32;
    __seq:             u16;
    __pad2:            u16;
    __glibc_reserved1: u64;
    __glibc_reserved2: u64;
}

/* Generates key for System V style IPC.  */
ftok :: (__pathname: *u8, __proj_id: s32) -> key_t #foreign libc;

mmap :: (__addr: *void, __len: u64, __prot: s32, __flags: s32, __fd: s32, __offset: s64) -> *void #foreign libc;

mmap64 :: (__addr: *void, __len: u64, __prot: s32, __flags: s32, __fd: s32, __offset: s64) -> *void #foreign libc;

/* Deallocate any mapping for the region starting at ADDR and extending LEN
bytes.  Returns 0 if successful, -1 for errors (and sets errno).  */
munmap :: (__addr: *void, __len: u64) -> s32 #foreign libc;

/* Change the memory protection of the region starting at ADDR and
extending LEN bytes to PROT.  Returns 0 if successful, -1 for errors
(and sets errno).  */
mprotect :: (__addr: *void, __len: u64, __prot: s32) -> s32 #foreign libc;

/* Synchronize the region starting at ADDR and extending LEN bytes with the
file it maps.  Filesystem operations on a file being mapped are
unpredictable before this is done.  Flags are from the MS_* set.

This function is a cancellation point and therefore not marked with
__THROW.  */
msync :: (__addr: *void, __len: u64, __flags: s32) -> s32 #foreign libc;

/* Advise the system about particular usage patterns the program follows
for the region starting at ADDR and extending LEN bytes.  */
madvise :: (__addr: *void, __len: u64, __advice: s32) -> s32 #foreign libc;

/* This is the POSIX name for this function.  */
posix_madvise :: (__addr: *void, __len: u64, __advice: s32) -> s32 #foreign libc;

/* Guarantee all whole pages mapped by the range [ADDR,ADDR+LEN) to
be memory resident.  */
mlock :: (__addr: *void, __len: u64) -> s32 #foreign libc;

/* Unlock whole pages previously mapped by the range [ADDR,ADDR+LEN).  */
munlock :: (__addr: *void, __len: u64) -> s32 #foreign libc;

/* Cause all currently mapped pages of the process to be memory resident
until unlocked by a call to the `munlockall', until the process exits,
or until the process calls `execve'.  */
mlockall :: (__flags: s32) -> s32 #foreign libc;

/* All currently mapped pages of the process' address space become
unlocked.  */
munlockall :: () -> s32 #foreign libc;

/* mincore returns the memory residency status of the pages in the
current process's address space specified by [start, start + len).
The status is returned in a vector of bytes.  The least significant
bit of each byte is 1 if the referenced page is in memory, otherwise
it is zero.  */
mincore :: (__start: *void, __len: u64, __vec: *u8) -> s32 #foreign libc;

/* Remap pages mapped by the range [ADDR,ADDR+OLD_LEN) to new length
NEW_LEN.  If MREMAP_MAYMOVE is set in FLAGS the returned address
may differ from ADDR.  If MREMAP_FIXED is set in FLAGS the function
takes another parameter which is a fixed address at which the block
resides after a successful call.  */
mremap :: (__addr: *void, __old_len: u64, __new_len: u64, __flags: s32, __args: ..Any) -> *void #foreign libc;

/* Remap arbitrary pages of a shared backing store within an existing
VMA.  */
remap_file_pages :: (__start: *void, __size: u64, __prot: s32, __pgoff: u64, __flags: s32) -> s32 #foreign libc;

/* Open shared memory segment.  */
shm_open :: (__name: *u8, __oflag: s32, __mode: mode_t) -> s32 #foreign libc;

/* Remove shared memory segment.  */
shm_unlink :: (__name: *u8) -> s32 #foreign libc;

/* Type used for the number of file descriptors.  */
nfds_t :: u64;

/* Data structure describing a polling request.  */
pollfd :: struct {
    fd:      s32; /* File descriptor to poll.  */
    events:  s16; /* Types of events poller cares about.  */
    revents: s16; /* Types of events that actually occurred.  */
}

/* Poll the file descriptors described by the NFDS structures starting at
FDS.  If TIMEOUT is nonzero and not -1, allow TIMEOUT milliseconds for
an event to occur; if TIMEOUT is -1, block until an event occurs.
Returns the number of file descriptors with events, zero if timed out,
or -1 for errors.

This function is a cancellation point and therefore not marked with
__THROW.  */
poll :: (__fds: *pollfd, __nfds: nfds_t, __timeout: s32) -> s32 #foreign libc;

/* Like poll, but before waiting the threads signal mask is replaced
with that specified in the fourth parameter.  For better usability,
the timeout value is specified using a TIMESPEC object.

This function is a cancellation point and therefore not marked with
__THROW.  */
ppoll :: (__fds: *pollfd, __nfds: nfds_t, __timeout: *timespec, __ss: *__sigset_t) -> s32 #foreign libc;

shmatt_t :: u64;

shmid_ds :: struct {
    shm_perm:          ipc_perm;
    shm_segsz:         u64;

    shm_atime:         s64;
    shm_dtime:         s64;
    shm_ctime:         s64;

    shm_cpid:          s32;
    shm_lpid:          s32;
    shm_nattch:        shmatt_t;
    __glibc_reserved5: u64;
    __glibc_reserved6: u64;
}

shminfo :: struct {
    shmmax:            u64;
    shmmin:            u64;
    shmmni:            u64;
    shmseg:            u64;
    shmall:            u64;
    __glibc_reserved1: u64;
    __glibc_reserved2: u64;
    __glibc_reserved3: u64;
    __glibc_reserved4: u64;
}

shm_info :: struct {
    used_ids:       s32;
    shm_tot:        u64;
    shm_rss:        u64;
    shm_swp:        u64;
    swap_attempts:  u64;
    swap_successes: u64;
}

shmctl :: (__shmid: s32, __cmd: s32, __buf: *shmid_ds) -> s32 #foreign libc;

/* Get shared memory segment.  */
shmget :: (__key: key_t, __size: u64, __shmflg: s32) -> s32 #foreign libc;

/* Attach shared memory segment.  */
shmat :: (__shmid: s32, __shmaddr: *void, __shmflg: s32) -> *void #foreign libc;

/* Detach shared memory segment.  */
shmdt :: (__shmaddr: *void) -> s32 #foreign libc;

/* Structure describing the system and machine.  */
utsname :: struct {
    /* Name of the implementation of the operating system.  */
    sysname:    [65] u8;

    /* Name of this node on the network.  */
    nodename:   [65] u8;

    /* Current release level of this implementation.  */
    release:    [65] u8;

    /* Current version level of this release.  */
    version:    [65] u8;

    /* Name of the hardware type the system is running on.  */
    machine:    [65] u8;

    domainname: [65] u8;
}

/* Put information about the system in NAME.  */
uname :: (__name: *utsname) -> s32 #foreign libc;

idtype_t :: enum u32 {
    ALL   :: 0;
    PID   :: 1;
    PGID  :: 2;
    PIDFD :: 3;

    P_ALL   :: ALL;
    P_PID   :: PID;
    P_PGID  :: PGID;
    P_PIDFD :: PIDFD;
}

/* Wait for a child to die.  When one does, put its status in *STAT_LOC
and return its process ID.  For errors, return (pid_t) -1.

This function is a cancellation point and therefore not marked with
__THROW.  */
wait :: (__stat_loc: *s32) -> s32 #foreign libc;

/* Wait for a child matching PID to die.
If PID is greater than 0, match any process whose process ID is PID.
If PID is (pid_t) -1, match any process.
If PID is (pid_t) 0, match any process with the
same process group as the current process.
If PID is less than -1, match any process whose
process group is the absolute value of PID.
If the WNOHANG bit is set in OPTIONS, and that child
is not already dead, return (pid_t) 0.  If successful,
return PID and store the dead child's status in STAT_LOC.
Return (pid_t) -1 for errors.  If the WUNTRACED bit is
set in OPTIONS, return status for stopped children; otherwise don't.

This function is a cancellation point and therefore not marked with
__THROW.  */
waitpid :: (__pid: s32, __stat_loc: *s32, __options: s32) -> s32 #foreign libc;

/* Wait for a childing matching IDTYPE and ID to change the status and
place appropriate information in *INFOP.
If IDTYPE is P_PID, match any process whose process ID is ID.
If IDTYPE is P_PGID, match any process whose process group is ID.
If IDTYPE is P_ALL, match any process.
If the WNOHANG bit is set in OPTIONS, and that child
is not already dead, clear *INFOP and return 0.  If successful, store
exit code and status in *INFOP.

This function is a cancellation point and therefore not marked with
__THROW.  */
waitid :: (__idtype: idtype_t, __id: u32, __infop: *siginfo_t, __options: s32) -> s32 #foreign libc;

wait3 :: (__stat_loc: *s32, __options: s32, __usage: *rusage) -> s32 #foreign libc;

/* PID is like waitpid.  Other args are like wait3.  */
wait4 :: (__pid: s32, __stat_loc: *s32, __options: s32, __usage: *rusage) -> s32 #foreign libc;

timex :: struct {
    modes:        u32;
    offset:       s64;
    freq:         s64;
    maxerror:     s64;
    esterror:     s64;
    status:       s32;
    constant:     s64;
    precision:    s64;
    tolerance:    s64;
    time:         timeval;
    tick:         s64;
    ppsfreq:      s64;
    jitter:       s64;
    shift:        s32;
    stabil:       s64;
    jitcnt:       s64;
    calcnt:       s64;
    errcnt:       s64;
    stbcnt:       s64;

    tai:          s32;

    anon_decl:    s32;
    anon_decl_1:  s32;
    anon_decl_2:  s32;
    anon_decl_3:  s32;
    anon_decl_4:  s32;
    anon_decl_5:  s32;
    anon_decl_6:  s32;
    anon_decl_7:  s32;
    anon_decl_8:  s32;
    anon_decl_9:  s32;
    anon_decl_10: s32;
}

clock_adjtime :: (__clock_id: s32, __utx: *timex) -> s32 #foreign libc;

tm :: struct {
    tm_sec:    s32;
    tm_min:    s32;
    tm_hour:   s32;
    tm_mday:   s32;
    tm_mon:    s32;
    tm_year:   s32;
    tm_wday:   s32;
    tm_yday:   s32;
    tm_isdst:  s32;

    tm_gmtoff: s64;
    tm_zone:   *u8;
}

itimerspec :: struct {
    it_interval: timespec;
    it_value:    timespec;
}

__locale_struct :: struct {
    __locale_data :: struct {}
    __locales:       [13] *__locale_data;

    __ctype_b:       *u16;
    __ctype_tolower: *s32;
    __ctype_toupper: *s32;

    __names:         [13] *u8;
}

locale_t :: *__locale_struct;

/* Time used by the program so far (user time + system time).
The result / CLOCKS_PER_SEC is program time in seconds.  */
clock :: () -> clock_t #foreign libc;

/* Return the current time and put it in *TIMER if TIMER is not NULL.  */
time :: (__timer: *time_t) -> time_t #foreign libc;

/* Return the difference between TIME1 and TIME0.  */
difftime :: (__time1: time_t, __time0: time_t) -> float64 #foreign libc;

/* Return the `time_t' representation of TP and normalize TP.  */
mktime :: (__tp: *tm) -> time_t #foreign libc;

/* Format TP into S according to FORMAT.
Write no more than MAXSIZE characters and return the number
of characters written, or 0 if it would exceed MAXSIZE.  */
strftime :: (__s: *u8, __maxsize: u64, __format: *u8, __tp: *tm) -> u64 #foreign libc;

/* Parse S according to FORMAT and store binary time information in TP.
The return value is a pointer to the first unparsed character in S.  */
strptime :: (__s: *u8, __fmt: *u8, __tp: *tm) -> *u8 #foreign libc;

/* Similar to the two functions above but take the information from
the provided locale and not the global locale.  */
strftime_l :: (__s: *u8, __maxsize: u64, __format: *u8, __tp: *tm, __loc: locale_t) -> u64 #foreign libc;

strptime_l :: (__s: *u8, __fmt: *u8, __tp: *tm, __loc: locale_t) -> *u8 #foreign libc;

/* Return the `struct tm' representation of *TIMER
in Universal Coordinated Time (aka Greenwich Mean Time).  */
gmtime :: (__timer: *time_t) -> *tm #foreign libc;

/* Return the `struct tm' representation
of *TIMER in the local timezone.  */
localtime :: (__timer: *time_t) -> *tm #foreign libc;

/* Return the `struct tm' representation of *TIMER in UTC,
using *TP to store the result.  */
gmtime_r :: (__timer: *time_t, __tp: *tm) -> *tm #foreign libc;

/* Return the `struct tm' representation of *TIMER in local time,
using *TP to store the result.  */
localtime_r :: (__timer: *time_t, __tp: *tm) -> *tm #foreign libc;

/* Return a string of the form "Day Mon dd hh:mm:ss yyyy\n"
that is the representation of TP in this format.  */
asctime :: (__tp: *tm) -> *u8 #foreign libc;

ctime :: (__timer: *time_t) -> *u8 #foreign libc;

/* Return in BUF a string of the form "Day Mon dd hh:mm:ss yyyy\n"
that is the representation of TP in this format.  */
asctime_r :: (__tp: *tm, __buf: *u8) -> *u8 #foreign libc;

ctime_r :: (__timer: *time_t, __buf: *u8) -> *u8 #foreign libc;

__tzname: [2] *u8 #elsewhere libc; /* Current timezone names.  */
__daylight: s32 #elsewhere libc; /* If daylight-saving time is ever in use.  */
__timezone: s64 #elsewhere libc; /* Seconds west of UTC.  */

/* Same as above.  */
tzname: [2] *u8 #elsewhere libc;

/* Set time conversion information from the TZ environment variable.
If TZ is not defined, a locale-dependent default is used.  */
tzset :: () -> void #foreign libc;

daylight: s32 #elsewhere libc;

/* Like `mktime', but for TP represents Universal Time, not local time.  */
timegm :: (__tp: *tm) -> time_t #foreign libc;

/* Another name for `mktime'.  */
timelocal :: (__tp: *tm) -> time_t #foreign libc;

/* Return the number of days in YEAR.  */
dysize :: (__year: s32) -> s32 #foreign libc;

/* Pause execution for a number of nanoseconds.

This function is a cancellation point and therefore not marked with
__THROW.  */
nanosleep :: (__requested_time: *timespec, __remaining: *timespec) -> s32 #foreign libc;

/* Get resolution of clock CLOCK_ID.  */
clock_getres :: (__clock_id: clockid_t, __res: *timespec) -> s32 #foreign libc;

/* Get current value of clock CLOCK_ID and store it in TP.  */
clock_gettime :: (__clock_id: clockid_t, __tp: *timespec) -> s32 #foreign libc;

/* Set clock CLOCK_ID to value TP.  */
clock_settime :: (__clock_id: clockid_t, __tp: *timespec) -> s32 #foreign libc;

clock_nanosleep :: (__clock_id: clockid_t, __flags: s32, __req: *timespec, __rem: *timespec) -> s32 #foreign libc;

/* Return clock ID for CPU-time clock.  */
clock_getcpuclockid :: (__pid: pid_t, __clock_id: *clockid_t) -> s32 #foreign libc;

/* Create new per-process timer using CLOCK_ID.  */
timer_create :: (__clock_id: clockid_t, __evp: *sigevent, __timerid: *timer_t) -> s32 #foreign libc;

/* Delete timer TIMERID.  */
timer_delete :: (__timerid: timer_t) -> s32 #foreign libc;

timer_settime :: (__timerid: timer_t, __flags: s32, __value: *itimerspec, __ovalue: *itimerspec) -> s32 #foreign libc;

/* Get current value of timer TIMERID and store it in VALUE.  */
timer_gettime :: (__timerid: timer_t, __value: *itimerspec) -> s32 #foreign libc;

/* Get expiration overrun for timer TIMERID.  */
timer_getoverrun :: (__timerid: timer_t) -> s32 #foreign libc;

/* Set TS to calendar time based in time base BASE.  */
timespec_get :: (__ts: *timespec, __base: s32) -> s32 #foreign libc;

/* Set TS to resolution of time base BASE.  */
timespec_getres :: (__ts: *timespec, __base: s32) -> s32 #foreign libc;

/* Set to one of the following values to indicate an error.
1  the DATEMSK environment variable is null or undefined,
2  the template file cannot be opened for reading,
3  failed to get file status information,
4  the template file is not a regular file,
5  an error is encountered while reading the template file,
6  memory allication failed (not enough memory available),
7  there is no line in the template that matches the input,
8  invalid input specification Example: February 31 or a time is
specified that can not be represented in a time_t (representing
the time in seconds since 00:00:00 UTC, January 1, 1970) */
getdate_err: s32 #elsewhere libc;

/* Parse the given string as a date specification and return a value
representing the value.  The templates from the file identified by
the environment variable DATEMSK are used.  In case of an error
`getdate_err' is set.

This function is a possible cancellation point and therefore not
marked with __THROW.  */
getdate :: (__string: *u8) -> *tm #foreign libc;

/* Since `getdate' is not reentrant because of the use of `getdate_err'
and the static buffer to return the result in, we provide a thread-safe
variant.  The functionality is the same.  The result is returned in
the buffer pointed to by RESBUFP and in case of an error the return
value is != 0 with the same values as given above for `getdate_err'.

This function is not part of POSIX and therefore no official
cancellation point.  But due to similarity with an POSIX interface
or due to the implementation it is a cancellation point and
therefore not marked with __THROW.  */
getdate_r :: (__string: *u8, __resbufp: *tm) -> s32 #foreign libc;

iovec :: struct {
    iov_base: *void;
    iov_len:  u64;
}

/* Read data from file descriptor FD, and put the result in the
buffers described by IOVEC, which is a vector of COUNT 'struct iovec's.
The buffers are filled in the order specified.
Operates just like 'read' (see <unistd.h>) except that data are
put in IOVEC instead of a contiguous buffer.

This function is a cancellation point and therefore not marked with
__THROW.  */
readv :: (__fd: s32, __iovec: *iovec, __count: s32) -> s64 #foreign libc;

/* Write data pointed by the buffers described by IOVEC, which
is a vector of COUNT 'struct iovec's, to file descriptor FD.
The data is written in the order specified.
Operates just like 'write' (see <unistd.h>) except that the data
are taken from IOVEC instead of a contiguous buffer.

This function is a cancellation point and therefore not marked with
__THROW.  */
writev :: (__fd: s32, __iovec: *iovec, __count: s32) -> s64 #foreign libc;

/* Read data from file descriptor FD at the given position OFFSET
without change the file pointer, and put the result in the buffers
described by IOVEC, which is a vector of COUNT 'struct iovec's.
The buffers are filled in the order specified.  Operates just like
'pread' (see <unistd.h>) except that data are put in IOVEC instead
of a contiguous buffer.

This function is a cancellation point and therefore not marked with
__THROW.  */
preadv :: (__fd: s32, __iovec: *iovec, __count: s32, __offset: s64) -> s64 #foreign libc;

/* Write data pointed by the buffers described by IOVEC, which is a
vector of COUNT 'struct iovec's, to file descriptor FD at the given
position OFFSET without change the file pointer.  The data is
written in the order specified.  Operates just like 'pwrite' (see
<unistd.h>) except that the data are taken from IOVEC instead of a
contiguous buffer.

This function is a cancellation point and therefore not marked with
__THROW.  */
pwritev :: (__fd: s32, __iovec: *iovec, __count: s32, __offset: s64) -> s64 #foreign libc;

/* Read data from file descriptor FD at the given position OFFSET
without change the file pointer, and put the result in the buffers
described by IOVEC, which is a vector of COUNT 'struct iovec's.
The buffers are filled in the order specified.  Operates just like
'pread' (see <unistd.h>) except that data are put in IOVEC instead
of a contiguous buffer.

This function is a cancellation point and therefore not marked with
__THROW.  */
preadv64 :: (__fd: s32, __iovec: *iovec, __count: s32, __offset: s64) -> s64 #foreign libc;

/* Write data pointed by the buffers described by IOVEC, which is a
vector of COUNT 'struct iovec's, to file descriptor FD at the given
position OFFSET without change the file pointer.  The data is
written in the order specified.  Operates just like 'pwrite' (see
<unistd.h>) except that the data are taken from IOVEC instead of a
contiguous buffer.

This function is a cancellation point and therefore not marked with
__THROW.  */
pwritev64 :: (__fd: s32, __iovec: *iovec, __count: s32, __offset: s64) -> s64 #foreign libc;

/* Same as preadv but with an additional flag argumenti defined at uio.h.  */
preadv2 :: (__fp: s32, __iovec: *iovec, __count: s32, __offset: s64, ___flags: s32) -> s64 #foreign libc;

/* Same as preadv but with an additional flag argument defined at uio.h.  */
pwritev2 :: (__fd: s32, __iodev: *iovec, __count: s32, __offset: s64, __flags: s32) -> s64 #foreign libc;

/* Same as preadv but with an additional flag argumenti defined at uio.h.  */
preadv64v2 :: (__fp: s32, __iovec: *iovec, __count: s32, __offset: s64, ___flags: s32) -> s64 #foreign libc;

/* Same as preadv but with an additional flag argument defined at uio.h.  */
pwritev64v2 :: (__fd: s32, __iodev: *iovec, __count: s32, __offset: s64, __flags: s32) -> s64 #foreign libc;

#scope_file

#import "Basic"; // For U128/S128

libc :: #library,system "libc";
libdl :: #library,system "libdl";
librt :: #library,system "librt";
