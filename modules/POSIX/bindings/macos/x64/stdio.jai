//
// This file was auto-generated using the following command:
//
// jai modules/POSIX/generate.jai - -x64
//



__SLBF :: 0x0001;
__SNBF :: 0x0002;
__SRD :: 0x0004;
__SWR :: 0x0008;

__SRW :: 0x0010;
__SEOF :: 0x0020;
__SERR :: 0x0040;
__SMBF :: 0x0080;
__SAPP :: 0x0100;
__SSTR :: 0x0200;
__SOPT :: 0x0400;
__SNPT :: 0x0800;
__SOFF :: 0x1000;
__SMOD :: 0x2000;
__SALC :: 0x4000;
__SIGN :: 0x8000;

_IOFBF :: 0;
_IOLBF :: 1;
_IONBF :: 2;

BUFSIZ :: 1024;
EOF :: -1;

FOPEN_MAX :: 20;
FILENAME_MAX :: 1024;

P_tmpdir :: "/var/tmp/";

L_tmpnam :: 1024;
TMP_MAX :: 308915776;

SEEK_SET :: 0;

SEEK_CUR :: 1;

SEEK_END :: 2;

L_ctermid :: 1024;

O_RDONLY :: 0x0000;
O_WRONLY :: 0x0001;
O_RDWR :: 0x0002;
O_ACCMODE :: 0x0003;

FREAD :: 0x0001;
FWRITE :: 0x0002;

O_NONBLOCK :: 0x0004;
O_APPEND :: 0x0008;

O_SYNC :: 0x0080;

O_SHLOCK :: 0x0010;
O_EXLOCK :: 0x0020;
O_ASYNC :: 0x0040;
O_FSYNC :: O_SYNC;
O_NOFOLLOW :: 0x0100;

O_CREAT :: 0x0200;
O_TRUNC :: 0x0400;
O_EXCL :: 0x0800;

AT_FDCWD :: -2;

AT_EACCESS :: 0x0010;
AT_SYMLINK_NOFOLLOW :: 0x0020;
AT_SYMLINK_FOLLOW :: 0x0040;
AT_REMOVEDIR :: 0x0080;

O_EVTONLY :: 0x8000;

O_NOCTTY :: 0x20000;

O_DIRECTORY :: 0x100000;
O_SYMLINK :: 0x200000;

O_CLOEXEC :: 0x1000000;

O_DP_GETRAWENCRYPTED :: 0x0001;
O_DP_GETRAWUNENCRYPTED :: 0x0002;

FAPPEND :: O_APPEND;
FASYNC :: O_ASYNC;
FFSYNC :: O_FSYNC;

FNONBLOCK :: O_NONBLOCK;
FNDELAY :: O_NONBLOCK;
O_NDELAY :: O_NONBLOCK;

CPF_OVERWRITE :: 0x0001;
CPF_IGNORE_MODE :: 0x0002;
CPF_MASK :: CPF_OVERWRITE|CPF_IGNORE_MODE;

F_DUPFD :: 0;
F_GETFD :: 1;
F_SETFD :: 2;
F_GETFL :: 3;
F_SETFL :: 4;
F_GETOWN :: 5;
F_SETOWN :: 6;
F_GETLK :: 7;
F_SETLK :: 8;
F_SETLKW :: 9;

F_SETLKWTIMEOUT :: 10;

F_FLUSH_DATA :: 40;
F_CHKCLEAN :: 41;
F_PREALLOCATE :: 42;
F_SETSIZE :: 43;
F_RDADVISE :: 44;
F_RDAHEAD :: 45;

F_NOCACHE :: 48;
F_LOG2PHYS :: 49;
F_GETPATH :: 50;
F_FULLFSYNC :: 51;
F_PATHPKG_CHECK :: 52;
F_FREEZE_FS :: 53;
F_THAW_FS :: 54;
F_GLOBAL_NOCACHE :: 55;

F_ADDSIGS :: 59;

F_ADDFILESIGS :: 61;

F_NODIRECT :: 62;

F_GETPROTECTIONCLASS :: 63;
F_SETPROTECTIONCLASS :: 64;

F_LOG2PHYS_EXT :: 65;

F_GETLKPID :: 66;

F_SETBACKINGSTORE :: 70;
F_GETPATH_MTMINFO :: 71;

F_GETCODEDIR :: 72;

F_SETNOSIGPIPE :: 73;
F_GETNOSIGPIPE :: 74;

F_TRANSCODEKEY :: 75;

F_SINGLE_WRITER :: 76;

F_GETPROTECTIONLEVEL :: 77;

F_FINDSIGS :: 78;

F_ADDFILESIGS_FOR_DYLD_SIM :: 83;

F_BARRIERFSYNC :: 85;

F_ADDFILESIGS_RETURN :: 97;
F_CHECK_LV :: 98;

F_PUNCHHOLE :: 99;

F_TRIM_ACTIVE_FILE :: 100;

FCNTL_FS_SPECIFIC_BASE :: 0x00010000;

F_DUPFD_CLOEXEC :: 67;

FD_CLOEXEC :: 1;

F_RDLCK :: 1;
F_UNLCK :: 2;
F_WRLCK :: 3;

S_IFMT :: 0xf000 /* 0170000 */;
S_IFIFO :: 0x1000 /* 0010000 */;
S_IFCHR :: 0x2000 /* 0020000 */;
S_IFDIR :: 0x4000 /* 0040000 */;
S_IFBLK :: 0x6000 /* 0060000 */;
S_IFREG :: 0x8000 /* 0100000 */;
S_IFLNK :: 0xa000 /* 0120000 */;
S_IFSOCK :: 0xc000 /* 0140000 */;

S_IFWHT :: 0xe000 /* 0160000 */;

S_IRWXU :: 0x1c0 /* 0000700 */;
S_IRUSR :: 0x100 /* 0000400 */;
S_IWUSR :: 0x80 /* 0000200 */;
S_IXUSR :: 0x40 /* 0000100 */;

S_IRWXG :: 0x38 /* 0000070 */;
S_IRGRP :: 0x20 /* 0000040 */;
S_IWGRP :: 0x10 /* 0000020 */;
S_IXGRP :: 0x8 /* 0000010 */;

S_IRWXO :: 0x7 /* 0000007 */;
S_IROTH :: 0x4 /* 0000004 */;
S_IWOTH :: 0x2 /* 0000002 */;
S_IXOTH :: 0x1 /* 0000001 */;

S_ISUID :: 0x800 /* 0004000 */;
S_ISGID :: 0x400 /* 0002000 */;
S_ISVTX :: 0x200 /* 0001000 */;

S_ISTXT :: S_ISVTX;
S_IREAD :: S_IRUSR;
S_IWRITE :: S_IWUSR;
S_IEXEC :: S_IXUSR;

F_ALLOCATECONTIG :: 0x00000002;
F_ALLOCATEALL :: 0x00000004;

F_PEOFPOSMODE :: 3;

F_VOLPOSMODE :: 4;

LOCK_SH :: 0x01;
LOCK_EX :: 0x02;
LOCK_NB :: 0x04;
LOCK_UN :: 0x08;

O_POPUP :: 0x80000000;
O_ALERT :: 0x20000000;

_FILESEC_UNSET_PROPERTY :: cast(*void) 0;
_FILESEC_REMOVE_ACL :: cast(*void) 1;

ACCESSPERMS :: S_IRWXU|S_IRWXG|S_IRWXO;

ALLPERMS :: S_ISUID|S_ISGID|S_ISTXT|S_IRWXU|S_IRWXG|S_IRWXO;

DEFFILEMODE :: S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH;

S_BLKSIZE :: 512;

UF_SETTABLE :: 0x0000ffff;
UF_NODUMP :: 0x00000001;
UF_IMMUTABLE :: 0x00000002;
UF_APPEND :: 0x00000004;
UF_OPAQUE :: 0x00000008;

UF_COMPRESSED :: 0x00000020;

UF_TRACKED :: 0x00000040;

UF_DATAVAULT :: 0x00000080;

UF_HIDDEN :: 0x00008000;

SF_SUPPORTED :: 0x001f0000;
SF_SETTABLE :: 0xffff0000;
SF_ARCHIVED :: 0x00010000;
SF_IMMUTABLE :: 0x00020000;
SF_APPEND :: 0x00040000;
SF_RESTRICTED :: 0x00080000;
SF_NOUNLINK :: 0x00100000;

UTIME_NOW :: -1;
UTIME_OMIT :: -2;

AIO_ALLDONE :: 0x1;

AIO_CANCELED :: 0x2;

AIO_NOTCANCELED :: 0x4;

LIO_NOP :: 0x0;
LIO_READ :: 0x1;
LIO_WRITE :: 0x2;

LIO_NOWAIT :: 0x1;

LIO_WAIT :: 0x2;

AIO_LISTIO_MAX :: 16;

fpos_t :: s64;

stdin: *FILE #elsewhere libc "__stdinp";
stdout: *FILE #elsewhere libc "__stdoutp";
stderr: *FILE #elsewhere libc "__stderrp";

/* ANSI-C */
clearerr :: (unknown0: *FILE) -> void #foreign libc;
fclose :: (unknown0: *FILE) -> s32 #foreign libc;
feof :: (unknown0: *FILE) -> s32 #foreign libc;
ferror :: (unknown0: *FILE) -> s32 #foreign libc;
fflush :: (unknown0: *FILE) -> s32 #foreign libc;
fgetc :: (unknown0: *FILE) -> s32 #foreign libc;
fgetpos :: (unknown0: *FILE, unknown1: *fpos_t) -> s32 #foreign libc;
fgets :: (unknown0: *u8, unknown1: s32, unknown2: *FILE) -> *u8 #foreign libc;

fopen :: (__filename: *u8, __mode: *u8) -> *FILE #foreign libc;

fprintf :: (unknown0: *FILE, unknown1: *u8, __args: ..Any) -> s32 #foreign libc;
fputc :: (unknown0: s32, unknown1: *FILE) -> s32 #foreign libc;
fputs :: (unknown0: *u8, unknown1: *FILE) -> s32 #foreign libc;
fread :: (__ptr: *void, __size: u64, __nitems: u64, __stream: *FILE) -> u64 #foreign libc;
freopen :: (unknown0: *u8, unknown1: *u8, unknown2: *FILE) -> *FILE #foreign libc;

fscanf :: (unknown0: *FILE, unknown1: *u8, __args: ..Any) -> s32 #foreign libc;
fseek :: (unknown0: *FILE, unknown1: s64, unknown2: s32) -> s32 #foreign libc;
fsetpos :: (unknown0: *FILE, unknown1: *fpos_t) -> s32 #foreign libc;
ftell :: (unknown0: *FILE) -> s64 #foreign libc;
fwrite :: (__ptr: *void, __size: u64, __nitems: u64, __stream: *FILE) -> u64 #foreign libc;
getc :: (unknown0: *FILE) -> s32 #foreign libc;
getchar :: () -> s32 #foreign libc;
gets :: (unknown0: *u8) -> *u8 #foreign libc;
perror :: (unknown0: *u8) -> void #foreign libc;
printf :: (unknown0: *u8, __args: ..Any) -> s32 #foreign libc;
putc :: (unknown0: s32, unknown1: *FILE) -> s32 #foreign libc;
putchar :: (unknown0: s32) -> s32 #foreign libc;
puts :: (unknown0: *u8) -> s32 #foreign libc;
_remove :: (unknown0: *u8) -> s32 #foreign libc "remove";
rename :: (__old: *u8, __new: *u8) -> s32 #foreign libc;
rewind :: (unknown0: *FILE) -> void #foreign libc;
scanf :: (unknown0: *u8, __args: ..Any) -> s32 #foreign libc;
setbuf :: (unknown0: *FILE, unknown1: *u8) -> void #foreign libc;
setvbuf :: (unknown0: *FILE, unknown1: *u8, unknown2: s32, unknown3: u64) -> s32 #foreign libc;
sprintf :: (unknown0: *u8, unknown1: *u8, __args: ..Any) -> s32 #foreign libc;
sscanf :: (unknown0: *u8, unknown1: *u8, __args: ..Any) -> s32 #foreign libc;
tmpfile :: () -> *FILE #foreign libc;

tmpnam :: (unknown0: *u8) -> *u8 #foreign libc;
ungetc :: (unknown0: s32, unknown1: *FILE) -> s32 #foreign libc;

ctermid :: (unknown0: *u8) -> *u8 #foreign libc;

fdopen :: (unknown0: s32, unknown1: *u8) -> *FILE #foreign libc;

fileno :: (unknown0: *FILE) -> s32 #foreign libc;

pclose :: (unknown0: *FILE) -> s32 #foreign libc;

popen :: (unknown0: *u8, unknown1: *u8) -> *FILE #foreign libc;

/* Functions internal to the implementation. */
__srget :: (unknown0: *FILE) -> s32 #foreign libc;

__swbuf :: (unknown0: s32, unknown1: *FILE) -> s32 #foreign libc;

flockfile :: (unknown0: *FILE) -> void #foreign libc;
ftrylockfile :: (unknown0: *FILE) -> s32 #foreign libc;
funlockfile :: (unknown0: *FILE) -> void #foreign libc;
getc_unlocked :: (unknown0: *FILE) -> s32 #foreign libc;
getchar_unlocked :: () -> s32 #foreign libc;
putc_unlocked :: (unknown0: s32, unknown1: *FILE) -> s32 #foreign libc;
putchar_unlocked :: (unknown0: s32) -> s32 #foreign libc;

getw :: (unknown0: *FILE) -> s32 #foreign libc;
putw :: (unknown0: s32, unknown1: *FILE) -> s32 #foreign libc;

tempnam :: (__dir: *u8, __prefix: *u8) -> *u8 #foreign libc;

fseeko :: (__stream: *FILE, __offset: s64, __whence: s32) -> s32 #foreign libc;
ftello :: (__stream: *FILE) -> s64 #foreign libc;

snprintf :: (__str: *u8, __size: u64, __format: *u8, __args: ..Any) -> s32 #foreign libc;

dprintf :: (unknown0: s32, unknown1: *u8, __args: ..Any) -> s32 #foreign libc;

getdelim :: (__linep: **u8, __linecapp: *u64, __delimiter: s32, __stream: *FILE) -> s64 #foreign libc;
getline :: (__linep: **u8, __linecapp: *u64, __stream: *FILE) -> s64 #foreign libc;
fmemopen :: (__buf: *void, __size: u64, __mode: *u8) -> *FILE #foreign libc;
open_memstream :: (__bufp: **u8, __sizep: *u64) -> *FILE #foreign libc;

sys_nerr: s32 #elsewhere libc; /* perror(3) external variables */
sys_errlist: **u8 #elsewhere libc;

asprintf :: (unknown0: **u8, unknown1: *u8, __args: ..Any) -> s32 #foreign libc;
ctermid_r :: (unknown0: *u8) -> *u8 #foreign libc;
fgetln :: (unknown0: *FILE, unknown1: *u64) -> *u8 #foreign libc;
fmtcheck :: (unknown0: *u8, unknown1: *u8) -> *u8 #foreign libc;
fpurge :: (unknown0: *FILE) -> s32 #foreign libc;
setbuffer :: (unknown0: *FILE, unknown1: *u8, unknown2: s32) -> void #foreign libc;
setlinebuf :: (unknown0: *FILE) -> s32 #foreign libc;

/*
* Stdio function-access interface.
*/
funopen :: (unknown0: *void, unknown1: #type (unknown0: *void, unknown1: *u8, unknown2: s32) -> s32 #c_call, unknown2: #type (unknown0: *void, unknown1: *u8, unknown2: s32) -> s32 #c_call, unknown3: #type (unknown0: *void, unknown1: fpos_t, unknown2: s32) -> fpos_t #c_call, unknown4: #type (unknown0: *void) -> s32 #c_call) -> *FILE #foreign libc;

/*
* Advisory file segment locking data type -
* information passed to system by user
*/
flock :: struct {
    l_start:  s64; /* starting offset */
    l_len:    s64; /* len = 0 means until end of file */
    l_pid:    pid_t; /* lock owner */
    l_type:   s16; /* lock type: read/write, etc. */
    l_whence: s16; /* type of l_start */
}

/*
* Advisory file segment locking with time out -
* Information passed to system by user for F_SETLKWTIMEOUT
*/
flocktimeout :: struct {
    fl:      flock; /* flock passed for file locking */
    timeout: timespec; /* timespec struct for timeout */
}

/*
* advisory file read data type -
* information passed by user to system
*/
radvisory :: struct {
    ra_offset: s64;
    ra_count:  s32;
}

/** Information the user passes in to get the codeblobs out of the kernel */
fcodeblobs :: struct {
    f_cd_hash:   *void;
    f_hash_size: u64;
    f_cd_buffer: *void;
    f_cd_size:   u64;
    f_out_size:  *u32;
    f_arch:      s32;
    __padding:   s32;
}

/** Information the user passes in to get the codeblobs out of the kernel */
fcodeblobs_t :: fcodeblobs;

/*
* detached code signatures data type -
* information passed by user to system used by F_ADDSIGS and F_ADDFILESIGS.
* F_ADDFILESIGS is a shortcut for files that contain their own signature and
* doesn't require mapping of the file in order to load the signature.
*/
fsignatures :: struct {
    fs_file_start: s64;
    fs_blob_start: *void;
    fs_blob_size:  u64;
}

/*
* detached code signatures data type -
* information passed by user to system used by F_ADDSIGS and F_ADDFILESIGS.
* F_ADDFILESIGS is a shortcut for files that contain their own signature and
* doesn't require mapping of the file in order to load the signature.
*/
fsignatures_t :: fsignatures;

/*
* DYLD needs to check if the object is allowed to be combined
* into the main binary. This is done between the code signature
* is loaded and dyld is doing all the work to process the LOAD commands.
*
* While this could be done in F_ADDFILESIGS.* family the hook into
* the MAC module doesn't say no when LV isn't enabled and then that
* is cached on the vnode, and the MAC module never gets change once
* a process that library validation enabled.
*/
fchecklv :: struct {
    lv_file_start:         s64;
    lv_error_message_size: u64;
    lv_error_message:      *void;
}

/*
* DYLD needs to check if the object is allowed to be combined
* into the main binary. This is done between the code signature
* is loaded and dyld is doing all the work to process the LOAD commands.
*
* While this could be done in F_ADDFILESIGS.* family the hook into
* the MAC module doesn't say no when LV isn't enabled and then that
* is cached on the vnode, and the MAC module never gets change once
* a process that library validation enabled.
*/
fchecklv_t :: fchecklv;

/* fstore_t type used by F_PREALLOCATE command */
fstore :: struct {
    fst_flags:      u32; /* IN: flags word */
    fst_posmode:    s32; /* IN: indicates use of offset field */
    fst_offset:     s64; /* IN: start of the region */
    fst_length:     s64; /* IN: size of the region */
    fst_bytesalloc: s64; /* OUT: number of bytes allocated */
}

/* fstore_t type used by F_PREALLOCATE command */
fstore_t :: fstore;

/* fpunchhole_t used by F_PUNCHHOLE */
fpunchhole :: struct {
    fp_flags:  u32; /* unused */
    reserved:  u32; /* (to maintain 8-byte alignment) */
    fp_offset: s64; /* IN: start of the region */
    fp_length: s64; /* IN: size of the region */
}

/* fpunchhole_t used by F_PUNCHHOLE */
fpunchhole_t :: fpunchhole;

/* factive_file_trim_t used by F_TRIM_ACTIVE_FILE */
ftrimactivefile :: struct {
    fta_offset: s64; /* IN: start of the region */
    fta_length: s64; /* IN: size of the region */
}

/* factive_file_trim_t used by F_TRIM_ACTIVE_FILE */
ftrimactivefile_t :: ftrimactivefile;

/* fbootstraptransfer_t used by F_READBOOTSTRAP and F_WRITEBOOTSTRAP commands */
fbootstraptransfer :: struct {
    fbt_offset: s64; /* IN: offset to start read/write */
    fbt_length: u64; /* IN: number of bytes to transfer */
    fbt_buffer: *void; /* IN: buffer to be read/written */
}

/* fbootstraptransfer_t used by F_READBOOTSTRAP and F_WRITEBOOTSTRAP commands */
fbootstraptransfer_t :: fbootstraptransfer;

log2phys :: struct {
    l2p_flags:       u32; /* unused so far */
    l2p_contigbytes: s64 #align 4; /* F_LOG2PHYS:     unused so far */

    l2p_devoffset:   s64 #align 4; /* F_LOG2PHYS:     OUT: bytes into device */
}

_filesec :: struct {}
filesec_t :: *_filesec;

filesec_property_t :: enum u32 {
    OWNER         :: 1;
    GROUP         :: 2;
    UUID          :: 3;
    MODE          :: 4;
    ACL           :: 5;
    GRPUUID       :: 6;

    ACL_RAW       :: 100;
    ACL_ALLOCSIZE :: 101;

    FILESEC_OWNER         :: OWNER;
    FILESEC_GROUP         :: GROUP;
    FILESEC_UUID          :: UUID;
    FILESEC_MODE          :: MODE;
    FILESEC_ACL           :: ACL;
    FILESEC_GRPUUID       :: GRPUUID;

    FILESEC_ACL_RAW       :: ACL_RAW;
    FILESEC_ACL_ALLOCSIZE :: ACL_ALLOCSIZE;
}

open :: (unknown0: *u8, unknown1: s32, __args: ..Any) -> s32 #foreign libc;

openat :: (unknown0: s32, unknown1: *u8, unknown2: s32, __args: ..Any) -> s32 #foreign libc;

creat :: (unknown0: *u8, unknown1: mode_t) -> s32 #foreign libc;
fcntl :: (unknown0: s32, unknown1: s32, __args: ..Any) -> s32 #foreign libc;

openx_np :: (unknown0: *u8, unknown1: s32, unknown2: filesec_t) -> s32 #foreign libc;

/*
* data-protected non-portable open(2) :
int open_dprotected_np(user_addr_t path, int flags, int class, int dpflags, int mode)
*/
open_dprotected_np :: (unknown0: *u8, unknown1: s32, unknown2: s32, unknown3: s32, __args: ..Any) -> s32 #foreign libc;
flock_ :: (unknown0: s32, unknown1: s32) -> s32 #foreign libc "flock";
filesec_init :: () -> filesec_t #foreign libc;
filesec_dup :: (unknown0: filesec_t) -> filesec_t #foreign libc;
filesec_free :: (unknown0: filesec_t) -> void #foreign libc;
filesec_get_property :: (unknown0: filesec_t, unknown1: filesec_property_t, unknown2: *void) -> s32 #foreign libc;
filesec_query_property :: (unknown0: filesec_t, unknown1: filesec_property_t, unknown2: *s32) -> s32 #foreign libc;
filesec_set_property :: (unknown0: filesec_t, unknown1: filesec_property_t, unknown2: *void) -> s32 #foreign libc;
filesec_unset_property :: (unknown0: filesec_t, unknown1: filesec_property_t) -> s32 #foreign libc;

/*
* XXX So deprecated, it would make your head spin
*
* The old stat structure.  In fact, this is not used by the kernel at all,
* and should not be used by user space, and should be removed from this
* header file entirely (along with the unused cvtstat() prototype in
* vnode_internal.h).
*/
ostat :: struct {
    st_dev:       u16; /* inode's device */
    st_ino:       ino_t; /* inode's number */
    st_mode:      mode_t; /* inode protection mode */
    st_nlink:     nlink_t; /* number of hard links */
    st_uid:       u16; /* user ID of the file's owner */
    st_gid:       u16; /* group ID of the file's group */
    st_rdev:      u16; /* device type */
    st_size:      s32; /* file size, in bytes */
    st_atimespec: timespec; /* time of last access */
    st_mtimespec: timespec; /* time of last data modification */
    st_ctimespec: timespec; /* time of last file status change */
    st_blksize:   s32; /* optimal blocksize for I/O */
    st_blocks:    s32; /* blocks allocated for file */
    st_flags:     u32; /* user defined flags for file */
    st_gen:       u32; /* file generation number */
}

stat_t :: struct {
    /* [XSI] ID of device containing file */
    st_dev:       dev_t;
    /* [XSI] Mode of file (see below) */
    st_mode:      mode_t;
    /* [XSI] Number of hard links */
    st_nlink:     nlink_t;
    /* [XSI] File serial number */
    st_ino:       u64;
    /* [XSI] User ID of the file */
    st_uid:       uid_t;
    /* [XSI] Group ID of the file */
    st_gid:       gid_t;
    /* [XSI] Device ID */
    st_rdev:      dev_t;
    /* time of last access */
    st_atime:     timespec;
    /* time of last data modification */
    st_mtime:     timespec;
    /* time of last status change */
    st_ctime:     timespec;
    /* time of file creation(birth) */
    st_birthtime: timespec;
    /* [XSI] file size, in bytes */
    st_size:      s64;
    /* [XSI] blocks allocated for file */
    st_blocks:    blkcnt_t;
    /* [XSI] optimal blocksize for I/O */
    st_blksize:   blksize_t;
    /* user defined flags for file */
    st_flags:     u32;
    /* file generation number */
    st_gen:       u32;
    /* RESERVED: DO NOT USE! */
    st_lspare:    s32;
    /* RESERVED: DO NOT USE! */
    st_qspare:    [2] s64;
}

stat64_t :: struct {
    /* [XSI] ID of device containing file */
    st_dev:       dev_t;
    /* [XSI] Mode of file (see below) */
    st_mode:      mode_t;
    /* [XSI] Number of hard links */
    st_nlink:     nlink_t;
    /* [XSI] File serial number */
    st_ino:       u64;
    /* [XSI] User ID of the file */
    st_uid:       uid_t;
    /* [XSI] Group ID of the file */
    st_gid:       gid_t;
    /* [XSI] Device ID */
    st_rdev:      dev_t;
    /* time of last access */
    st_atime:     timespec;
    /* time of last data modification */
    st_mtime:     timespec;
    /* time of last status change */
    st_ctime:     timespec;
    /* time of file creation(birth) */
    st_birthtime: timespec;
    /* [XSI] file size, in bytes */
    st_size:      s64;
    /* [XSI] blocks allocated for file */
    st_blocks:    blkcnt_t;
    /* [XSI] optimal blocksize for I/O */
    st_blksize:   blksize_t;
    /* user defined flags for file */
    st_flags:     u32;
    /* file generation number */
    st_gen:       u32;
    /* RESERVED: DO NOT USE! */
    st_lspare:    s32;
    /* RESERVED: DO NOT USE! */
    st_qspare:    [2] s64;
}

/* [XSI] */
chmod :: (unknown0: *u8, unknown1: mode_t) -> s32 #foreign libc;
fchmod :: (unknown0: s32, unknown1: mode_t) -> s32 #foreign libc;
fstat :: (unknown0: s32, unknown1: *stat_t) -> s32 #foreign libc "fstat$INODE64";
lstat :: (unknown0: *u8, unknown1: *stat_t) -> s32 #foreign libc "lstat$INODE64";
mkdir :: (unknown0: *u8, unknown1: mode_t) -> s32 #foreign libc;
mkfifo :: (unknown0: *u8, unknown1: mode_t) -> s32 #foreign libc;
stat :: (unknown0: *u8, unknown1: *stat_t) -> s32 #foreign libc "stat$INODE64";
mknod :: (unknown0: *u8, unknown1: mode_t, unknown2: dev_t) -> s32 #foreign libc;
umask :: (unknown0: mode_t) -> mode_t #foreign libc;

fchmodat :: (unknown0: s32, unknown1: *u8, unknown2: mode_t, unknown3: s32) -> s32 #foreign libc;
fstatat :: (unknown0: s32, unknown1: *u8, unknown2: *stat_t, unknown3: s32) -> s32 #foreign libc "fstatat$INODE64";
mkdirat :: (unknown0: s32, unknown1: *u8, unknown2: mode_t) -> s32 #foreign libc;

futimens :: (__fd: s32, __times: *[2] timespec) -> s32 #foreign libc;
utimensat :: (__fd: s32, __path: *u8, __times: *[2] timespec, __flag: s32) -> s32 #foreign libc;

chflags :: (unknown0: *u8, unknown1: u32) -> s32 #foreign libc;
chmodx_np :: (unknown0: *u8, unknown1: filesec_t) -> s32 #foreign libc;
fchflags :: (unknown0: s32, unknown1: u32) -> s32 #foreign libc;
fchmodx_np :: (unknown0: s32, unknown1: filesec_t) -> s32 #foreign libc;
fstatx_np :: (unknown0: s32, unknown1: *stat_t, unknown2: filesec_t) -> s32 #foreign libc "fstatx_np$INODE64";
lchflags :: (unknown0: *u8, unknown1: u32) -> s32 #foreign libc;
lchmod :: (unknown0: *u8, unknown1: mode_t) -> s32 #foreign libc;
lstatx_np :: (unknown0: *u8, unknown1: *stat_t, unknown2: filesec_t) -> s32 #foreign libc "lstatx_np$INODE64";
mkdirx_np :: (unknown0: *u8, unknown1: filesec_t) -> s32 #foreign libc;
mkfifox_np :: (unknown0: *u8, unknown1: filesec_t) -> s32 #foreign libc;
statx_np :: (unknown0: *u8, unknown1: *stat_t, unknown2: filesec_t) -> s32 #foreign libc "statx_np$INODE64";
umaskx_np :: (unknown0: filesec_t) -> s32 #foreign libc;

/* The following deprecated routines are simillar to stat and friends except provide struct stat64 instead of struct stat  */
fstatx64_np :: (unknown0: s32, unknown1: *stat64_t, unknown2: filesec_t) -> s32 #foreign libc;
lstatx64_np :: (unknown0: *u8, unknown1: *stat64_t, unknown2: filesec_t) -> s32 #foreign libc;
statx64_np :: (unknown0: *u8, unknown1: *stat64_t, unknown2: filesec_t) -> s32 #foreign libc;
fstat64 :: (unknown0: s32, unknown1: *stat64_t) -> s32 #foreign libc;
lstat64 :: (unknown0: *u8, unknown1: *stat64_t) -> s32 #foreign libc;
stat64 :: (unknown0: *u8, unknown1: *stat64_t) -> s32 #foreign libc;

/*
* Pun for SunOS prior to 3.2.  SunOS 3.2 and later support TIOCGWINSZ
* and TIOCSWINSZ (yes, even 3.2-3.5, the fact that it wasn't documented
* nonwithstanding).
*/
ttysize :: struct {
    ts_lines: u16;
    ts_cols:  u16;
    ts_xxx:   u16;
    ts_yyy:   u16;
}

ioctl :: (unknown0: s32, unknown1: u64, __args: ..Any) -> s32 #foreign libc;

aiocb :: struct {
    aio_fildes:     s32; /* File descriptor */
    aio_offset:     s64; /* File offset */
    aio_buf:        *void; /* Location of buffer */
    aio_nbytes:     u64; /* Length of transfer */
    aio_reqprio:    s32; /* Request priority offset */
    aio_sigevent:   sigevent; /* Signal number and value */
    aio_lio_opcode: s32; /* Operation to be performed */
}

/*
* Attempt to cancel one or more asynchronous I/O requests currently outstanding
* against file descriptor fd. The aiocbp argument points to the asynchronous I/O
* control block for a particular request to be canceled.  If aiocbp is NULL, then
* all outstanding cancelable asynchronous I/O requests against fd shall be canceled.
*/
aio_cancel :: (fd: s32, aiocbp: *aiocb) -> s32 #foreign libc;

/*
* Return the error status associated with the aiocb structure referenced by the
* aiocbp argument. The error status for an asynchronous I/O operation is the errno
* value that would be set by the corresponding read(), write(),  or fsync()
* operation.  If the operation has not yet completed, then the error status shall
* be equal to [EINPROGRESS].
*/
aio_error :: (aiocbp: *aiocb) -> s32 #foreign libc;

/*
* Asynchronously force all I/O operations associated with the file indicated by
* the file descriptor aio_fildes member of the aiocb structure referenced by the
* aiocbp argument and queued at the time of the call to aio_fsync() to the
* synchronized I/O completion state.  The function call shall return when the
* synchronization request has been initiated or queued.  op O_SYNC is the only
* supported opertation at this time.
* The aiocbp argument refers to an asynchronous I/O control block. The aiocbp
* value may be used as an argument to aio_error() and aio_return() in order to
* determine the error status and return status, respectively, of the asynchronous
* operation while it is proceeding.  When the request is queued, the error status
* for the operation is [EINPROGRESS]. When all data has been successfully
* transferred, the error status shall be reset to reflect the success or failure
* of the operation.
*/
aio_fsync :: (op: s32, aiocbp: *aiocb) -> s32 #foreign libc;

/*
* Read aiocbp->aio_nbytes from the file associated with aiocbp->aio_fildes into
* the buffer pointed to by aiocbp->aio_buf.  The function call shall return when
* the read request has been initiated or queued.
* The aiocbp value may be used as an argument to aio_error() and aio_return() in
* order to determine the error status and return status, respectively, of the
* asynchronous operation while it is proceeding. If an error condition is
* encountered during queuing, the function call shall return without having
* initiated or queued the request. The requested operation takes place at the
* absolute position in the file as given by aio_offset, as if lseek() were called
* immediately prior to the operation with an offset equal to aio_offset and a
* whence equal to SEEK_SET.  After a successful call to enqueue an asynchronous
* I/O operation, the value of the file offset for the file is unspecified.
*/
aio_read :: (aiocbp: *aiocb) -> s32 #foreign libc;

/*
* Return the return status associated with the aiocb structure referenced by
* the aiocbp argument.  The return status for an asynchronous I/O operation is
* the value that would be returned by the corresponding read(), write(), or
* fsync() function call.  If the error status for the operation is equal to
* [EINPROGRESS], then the return status for the operation is undefined.  The
* aio_return() function may be called exactly once to retrieve the return status
* of a given asynchronous operation; thereafter, if the same aiocb structure
* is used in a call to aio_return() or aio_error(), an error may be returned.
* When the aiocb structure referred to by aiocbp is used to submit another
* asynchronous operation, then aio_return() may be successfully used to
* retrieve the return status of that operation.
*/
aio_return :: (aiocbp: *aiocb) -> s64 #foreign libc;

/*
* Suspend the calling thread until at least one of the asynchronous I/O
* operations referenced by the aiocblist argument has completed, until a signal
* interrupts the function, or, if timeout is not NULL, until the time
* interval specified by timeout has passed.  If any of the aiocb structures
* in the aiocblist correspond to completed asynchronous I/O operations (that is,
* the error status for the operation is not equal to [EINPROGRESS]) at the
* time of the call, the function shall return without suspending the calling
* thread.  The aiocblist argument is an array of pointers to asynchronous I/O
* control blocks.  The nent argument indicates the number of elements in the
* array.  Each aiocb structure pointed to has been used in initiating an
* asynchronous I/O request via aio_read(), aio_write(), or lio_listio(). This
* array may contain NULL pointers, which are ignored.
*/
aio_suspend :: (aiocblist: **aiocb, nent: s32, timeoutp: *timespec) -> s32 #foreign libc;

/*
* Write aiocbp->aio_nbytes to the file associated with aiocbp->aio_fildes from
* the buffer pointed to by aiocbp->aio_buf.  The function shall return when the
* write request has been initiated or, at a minimum, queued.
* The aiocbp argument may be used as an argument to aio_error() and aio_return()
* in order to determine the error status and return status, respectively, of the
* asynchronous operation while it is proceeding.
*/
aio_write :: (aiocbp: *aiocb) -> s32 #foreign libc;

/*
* Initiate a list of I/O requests with a single function call.  The mode
* argument takes one of the values LIO_WAIT or LIO_NOWAIT and determines whether
* the function returns when the I/O operations have been completed, or as soon
* as the operations have been queued.  If the mode argument is LIO_WAIT, the
* function shall wait until all I/O is complete and the sig argument shall be
* ignored.
* If the mode argument is LIO_NOWAIT, the function shall return immediately, and
* asynchronous notification shall occur, according to the sig argument, when all
* the I/O operations complete.  If sig is NULL, then no asynchronous notification
* shall occur.
*/
lio_listio :: (mode: s32, aiocblist: **aiocb, nent: s32, sigp: *sigevent) -> s32 #foreign libc;

#scope_file

libc :: #library,system "libc";

#scope_export

FILE :: struct {};

ftello64 :: ftello;

