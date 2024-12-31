// Bindings to io_uring. Based on a combination of system headers and liburing's headers (MIT License)

// This is new and untested. Use at your own risk.    -17 June 2022

#if CPU == .X64 {
    // @header statx.h
    // Timestamp structure for the timestamps in struct statx.
    statx_timestamp_t :: struct {
        tv_sec:     s64; // number of seconds before (negative) or after (positive) 00:00:00 1st January 1970 UTC.
        tv_nsec:    u32; // number of nanoseconds (0..999,999,999) after the tv_sec time.
        __reserved: s32; // in case we need a yet finer resolution.
    }

    /*
    Structures for the extended file attribute retrieval system call (statx()).

    The caller passes a mask of what they're specifically interested in as a parameter
    to statx().  What statx() actually got will be indicated in st_mask upon return.

    For each bit in the mask argument:

    - if the datum is not supported:

    - the bit will be cleared, and

    - the datum will be set to an appropriate fabricated value if one
    is available (eg. CIFS can take a default uid and gid), otherwise

    - the field will be cleared;

    - otherwise, if explicitly requested:

    - the datum will be synchronised to the server if AT_STATX_FORCE_SYNC
    is set or if the datum is considered out of date, and

    - the field will be filled in and the bit will be set;

    - otherwise, if not requested, but available in approximate form without any effort, it
    will be filled in anyway, and the bit will be set upon return (it might not be up to
    date, however, and no attempt will be made to synchronise the internal state first);

    - otherwise the field and the bit will be cleared before returning.

    Items in STATX_BASIC_STATS may be marked unavailable on return, but they will have values
    installed for compatibility purposes so that stat() and co. can be emulated in userspace.
    */
    statx_t :: struct {
        // 0x00
        stx_mask:       u32; // What results were written [uncond]
        stx_blksize:    u32; // Preferred general I/O size [uncond]
        stx_attributes: u64; // Flags conveying information about the file [uncond]
        // 0x10
        stx_nlink:    u32; // Number of hard links
        stx_uid:      u32; // User ID of owner
        stx_gid:      u32; // Group ID of owner
        stx_mode:     u16; // File mode
        __spare0: [1] u16;
        // 0x20
        stx_ino:             u64; // Inode number
        stx_size:            u64; // File size
        stx_blocks:          u64; // Number of 512-byte blocks allocated
        stx_attributes_mask: u64; // Mask to show what's supported in stx_attributes
        // 0x40
        stx_atime: statx_timestamp_t; // Last access time
        stx_btime: statx_timestamp_t; // File creation time
        stx_ctime: statx_timestamp_t; // Last attribute change time
        stx_mtime: statx_timestamp_t; // Last data modification time
        // 0x80
        stx_rdev_major: u32; // Device ID of special file [if bdev/cdev]
        stx_rdev_minor: u32;
        stx_dev_major:  u32; // ID of device containing file [uncond]
        stx_dev_minor:  u32;
        // 0x90
        stx_mnt_id: u64;
        __spare2:   u64;
        // 0xa0
        __spare3: [12] u64; // Spare space for future expansion
        // 0x100
    };

    // Flags to be stx_mask. Query request/result mask for statx() and struct statx::stx_mask. These bits
    // should be set in the mask argument of statx() to request particular items when calling statx().
    STATX_TYPE:        u32: 0x00000001; // Want/got stx_mode & S_IFMT
    STATX_MODE:        u32: 0x00000002; // Want/got stx_mode & ~S_IFMT
    STATX_NLINK:       u32: 0x00000004; // Want/got stx_nlink
    STATX_UID:         u32: 0x00000008; // Want/got stx_uid
    STATX_GID:         u32: 0x00000010; // Want/got stx_gid
    STATX_ATIME:       u32: 0x00000020; // Want/got stx_atime
    STATX_MTIME:       u32: 0x00000040; // Want/got stx_mtime
    STATX_CTIME:       u32: 0x00000080; // Want/got stx_ctime
    STATX_INO:         u32: 0x00000100; // Want/got stx_ino
    STATX_SIZE:        u32: 0x00000200; // Want/got stx_size
    STATX_BLOCKS:      u32: 0x00000400; // Want/got stx_blocks
    STATX_BASIC_STATS: u32: 0x000007ff; // The stuff in the normal stat struct
    STATX_BTIME:       u32: 0x00000800; // Want/got stx_btime
    STATX_MNT_ID:      u32: 0x00001000; // Got stx_mnt_id

    STATX__RESERVED:   u32: 0x80000000; // Reserved for future struct statx expansion

    /*
    Attributes to be found in stx_attributes and masked in stx_attributes_mask.

    These give information about the features or the state of a file that might
    be of use to ordinary userspace programs such as GUIs or ls rather than
    specialised tools.

    Note that the flags marked [I] correspond to the FS_IOC_SETFLAGS flags
    semantically.  Where possible, the numerical value is picked to correspond
    also.  Note that the DAX attribute indicates that the file is in the CPU
    direct access state.  It does not correspond to the per-inode flag that
    some filesystems support.
    */
    STATX_ATTR_COMPRESSED ::  0x00000004; // [I] File is compressed by the fs
    STATX_ATTR_IMMUTABLE  ::  0x00000010; // [I] File is marked immutable
    STATX_ATTR_APPEND     ::  0x00000020; // [I] File is append-only
    STATX_ATTR_NODUMP     ::  0x00000040; // [I] File is not to be dumped
    STATX_ATTR_ENCRYPTED  ::  0x00000800; // [I] File requires key to decrypt in fs
    STATX_ATTR_AUTOMOUNT  ::  0x00001000; // Dir: Automount trigger
    STATX_ATTR_MOUNT_ROOT ::  0x00002000; // Root of a mount
    STATX_ATTR_VERITY     ::  0x00100000; // [I] Verity protected file
    STATX_ATTR_DAX        ::  0x00200000; // File is currently in DAX state


    AT_STATX_SYNC_TYPE    :: 0x6000; // Type of synchronisation required from statx()
    AT_STATX_SYNC_AS_STAT :: 0x0000; // - Do whatever stat() does
    AT_STATX_FORCE_SYNC   :: 0x2000; // - Force the attributes to be sync'd with the server
    AT_STATX_DONT_SYNC    :: 0x4000; // - Don't sync attributes with the server

    SYS_io_uring_setup         :: 425;
    SYS_io_uring_enter         :: 426;
    SYS_io_uring_register      :: 427;
}

// Wrappers for syscalls since glibc doesn't have them yet. These could be replaced with #asm syscalls to avoid libc
io_uring_setup :: inline (entries: u32, p: *io_uring_params) -> s32 {
    return cast(s32)syscall(SYS_io_uring_setup, entries, p);
}
io_uring_enter :: inline (fd: s32, to_submit: u32, min_complete: u32, flags: u32) -> s32 {
    return cast(s32)syscall(SYS_io_uring_enter, fd, to_submit, min_complete, flags, null);
}
io_uring_enter :: inline (fd: s32, to_submit: u32, min_complete: u32, flags: u32, sig: *sigset_t) -> s32 {
    return cast(s32)syscall(SYS_io_uring_enter, fd, to_submit, min_complete, flags, sig);
}
io_uring_enter :: inline (fd: s32, to_submit: u32, min_complete: u32, flags: u32, arg: *io_uring_getevents_arg) -> s32 {
    return cast(s32)syscall(SYS_io_uring_enter, fd, to_submit, min_complete, flags | xx IORING_ENTER_EXT_ARG, arg, size_of(io_uring_getevents_arg));
}
io_uring_register :: inline (fd: s32, opcode: u32, arg: *void, nr_args: u32) -> s32 {
    return cast(s32)syscall(SYS_io_uring_register, fd, opcode, arg, nr_args);
}

// @header linux/fs.h

using __kernel_rwf_t :: enum_flags s32 {
    RWF_HIPRI  :: 0x00000001; // high priority request, poll if possible
    RWF_DSYNC  :: 0x00000002; // per-IO O_DSYNC
    RWF_SYNC   :: 0x00000004; // per-IO O_SYNC
    RWF_NOWAIT :: 0x00000008; // per-IO, return -EAGAIN if operation would block
    RWF_APPEND :: 0x00000010; // per-IO O_APPEND

    RWF_SUPPORTED :: RWF_HIPRI | RWF_DSYNC | RWF_SYNC | RWF_NOWAIT | RWF_APPEND; // mask of flags supported by the kernel
}

// @header linux/io_uring.h

// <~> io_uring_setup <~>

// Passed in for io_uring_setup(2). Copied back with updated info on success
io_uring_params :: struct {
    sq_entries:     u32;
    cq_entries:     u32;
    flags:          IORING_Setup_Flags;
    sq_thread_cpu:  u32;
    sq_thread_idle: u32;
    features:       IORING_FEAT_Flags;
    wq_fd:          s32;
    resv:       [3] u32;
    sq_off: io_sqring_offsets;
    cq_off: io_cqring_offsets;
};

// io_uring_setup() flags
using IORING_Setup_Flags :: enum_flags u32 {
    IORING_SETUP_IOPOLL     :: 1 << 0; // io_context is polled
    IORING_SETUP_SQPOLL     :: 1 << 1; // SQ poll thread
    IORING_SETUP_SQ_AFF     :: 1 << 2; // sq_thread_cpu is valid
    IORING_SETUP_CQSIZE     :: 1 << 3; // app defines CQ size
    IORING_SETUP_CLAMP      :: 1 << 4; // clamp SQ/CQ ring sizes
    IORING_SETUP_ATTACH_WQ  :: 1 << 5; // attach to existing wq
    IORING_SETUP_R_DISABLED :: 1 << 6; // start with ring disabled
    IORING_SETUP_SUBMIT_ALL :: 1 << 7; // continue submit on error

    // Cooperative task running. When requests complete, they often require forcing the submitter to transition to the
    // kernel to complete. If this flag is set, work will be done when the task transitions anyway, rather than force
    // an inter-processor interrupt reschedule. This avoids interrupting a task running in userspace, and saves an IPI.
    IORING_SETUP_COOP_TASKRUN :: 1 << 8;

    // If COOP_TASKRUN is set, the kernel will notify you that task work is needed (and
    // thus you should enter the kernel) by setting IORING_SQ_TASKRUN in the sq ring flags.
    IORING_SETUP_TASKRUN_FLAG :: 1 << 9;

    IORING_SETUP_SQE128 :: 1 << 10; // SQEs are 128 byte
    IORING_SETUP_CQE32  :: 1 << 11; // CQEs are 32 byte
}

// io_uring_params.features flags
using IORING_FEAT_Flags :: enum_flags u32 {
    IORING_FEAT_SINGLE_MMAP     :: 1 << 0;
    IORING_FEAT_NODROP          :: 1 << 1;
    IORING_FEAT_SUBMIT_STABLE   :: 1 << 2;
    IORING_FEAT_RW_CUR_POS      :: 1 << 3;
    IORING_FEAT_CUR_PERSONALITY :: 1 << 4;
    IORING_FEAT_FAST_POLL       :: 1 << 5;
    IORING_FEAT_POLL_32BITS     :: 1 << 6;
    IORING_FEAT_SQPOLL_NONFIXED :: 1 << 7;
    IORING_FEAT_EXT_ARG         :: 1 << 8;
    IORING_FEAT_NATIVE_WORKERS  :: 1 << 9;
    IORING_FEAT_RSRC_TAGS       :: 1 << 10;
    IORING_FEAT_CQE_SKIP        :: 1 << 11;
    IORING_FEAT_LINKED_FILE     :: 1 << 12;
}

// Offsets into the submission queue mmap
io_sqring_offsets :: struct {
    head:         u32;
    tail:         u32;
    ring_mask:    u32;
    ring_entries: u32;
    flags:        u32;
    dropped:      u32;
    array:        u32;
    resv1:        u32;
    resv2:        u64;
};

// Submission queue flags
using IORING_SQ_Flags :: enum_flags u32 {
    IORING_SQ_NEED_WAKEUP :: 1 << 0; // needs io_uring_enter wakeup
    IORING_SQ_CQ_OVERFLOW :: 1 << 1; // CQ ring is overflown
    IORING_SQ_TASKRUN     :: 1 << 2; // task should enter the kernel
}

io_cqring_offsets :: struct {
    head:         u32;
    tail:         u32;
    ring_mask:    u32;
    ring_entries: u32;
    overflow:     u32;
    cqes:         u32;
    flags:        u32;
    resv1:        u32;
    resv2:        u64;
};


// cq_ring.flags
using IORING_CQ_Flags :: enum_flags u32 {
    IORING_CQ_EVENTFD_DISABLED :: 1 << 0; // disable eventfd notifications
}

// @note @bryce The header has these as u64 (Unsigned Long Long) but mmap takes an s64 (off_t) so I had to change it.
// Magic offsets for the application to mmap the data it needs
IORING_OFF_SQ_RING: s64: 0;
IORING_OFF_CQ_RING: s64: 0x08000000;
IORING_OFF_SQES:    s64: 0x10000000;

// <~> Submission Queue <~>

// Submission queue entry
io_uring_sqe :: struct {
    opcode: IORING_OP;   // type of operation for this sqe
    flags:  IOSQE_Flags; // IOSQE_ flags
    union {
        ioprio: u16; // ioprio for the request
        accept_flags: IORING_ACCEPT_Flags;
    }
    fd:     s32; // file descriptor to do IO on
    union {
        off:   u64; // offset into file
        addr2: u64;
        recv_send_flags: IORING_RECVSEND_Flags;
    };
    union {
        addr: u64; // pointer to buffer or iovecs
        splice_off_in: u64;
    };
    union {
        len: u32; // buffer size or number of iovecs
        poll_flags: IORING_POLL_Flags;
    }

    union {
        rw_flags:       __kernel_rwf_t;
        op_flags:       IORING_OP_Flags; // The header has u32 xxx_flags for each opcode so I colapsed into one.
        other_flags:    u32;             // Some flags are in other headers etc.
        poll_events:    u16;             // compatibility
        fadvise_advice: u32;
    };

    user_data: u64; // data to be passed back at completion time

    union {
        buf_index: u16 #align 1; // index into fixed buffers, if used
        buf_group: u16 #align 1; // for grouped buffer selection
    }

    personality: u16; // personality to use, if used

    union {
        splice_fd_in: s32;
        file_index:   u32;
    };

    addr3:      u64;
    __pad2: [1] u64;
};

// Submission Opcodes
using IORING_OP :: enum u8 {
    IORING_OP_NOP;
    IORING_OP_READV;
    IORING_OP_WRITEV;
    IORING_OP_FSYNC;
    IORING_OP_READ_FIXED;
    IORING_OP_WRITE_FIXED;
    IORING_OP_POLL_ADD;
    IORING_OP_POLL_REMOVE;
    IORING_OP_SYNC_FILE_RANGE;
    IORING_OP_SENDMSG;
    IORING_OP_RECVMSG;
    IORING_OP_TIMEOUT;
    IORING_OP_TIMEOUT_REMOVE;
    IORING_OP_ACCEPT;
    IORING_OP_ASYNC_CANCEL;
    IORING_OP_LINK_TIMEOUT;
    IORING_OP_CONNECT;
    IORING_OP_FALLOCATE;
    IORING_OP_OPENAT;
    IORING_OP_CLOSE;
    IORING_OP_FILES_UPDATE;
    IORING_OP_STATX;
    IORING_OP_READ;
    IORING_OP_WRITE;
    IORING_OP_FADVISE;
    IORING_OP_MADVISE;
    IORING_OP_SEND;
    IORING_OP_RECV;
    IORING_OP_OPENAT2;
    IORING_OP_EPOLL_CTL;
    IORING_OP_SPLICE;
    IORING_OP_PROVIDE_BUFFERS;
    IORING_OP_REMOVE_BUFFERS;
    IORING_OP_TEE;
    IORING_OP_SHUTDOWN;
    IORING_OP_RENAMEAT;
    IORING_OP_UNLINKAT;
    IORING_OP_MKDIRAT;
    IORING_OP_SYMLINKAT;
    IORING_OP_LINKAT;
    IORING_OP_MSG_RING;
    IORING_OP_FSETXATTR;
    IORING_OP_SETXATTR;
    IORING_OP_FGETXATTR;
    IORING_OP_GETXATTR;
    IORING_OP_SOCKET;
    IORING_OP_URING_CMD;

    // this goes last, obviously
    IORING_OP_LAST;
}

// Submission queue entry flags
using IOSQE_Flag_Bits :: enum {
    IOSQE_FIXED_FILE_BIT;
    IOSQE_IO_DRAIN_BIT;
    IOSQE_IO_LINK_BIT;
    IOSQE_IO_HARDLINK_BIT;
    IOSQE_ASYNC_BIT;
    IOSQE_BUFFER_SELECT_BIT;
    IOSQE_CQE_SKIP_SUCCESS_BIT;
};
using IOSQE_Flags :: enum_flags u8 {
    IOSQE_FIXED_FILE       :: 1 << IOSQE_FIXED_FILE_BIT;       // use fixed fileset
    IOSQE_IO_DRAIN         :: 1 << IOSQE_IO_DRAIN_BIT;         // issue after inflight IO
    IOSQE_IO_LINK          :: 1 << IOSQE_IO_LINK_BIT;          // links next sqe
    IOSQE_IO_HARDLINK      :: 1 << IOSQE_IO_HARDLINK_BIT;      // like LINK, but stronger
    IOSQE_ASYNC            :: 1 << IOSQE_ASYNC_BIT;            // always go async
    IOSQE_BUFFER_SELECT    :: 1 << IOSQE_BUFFER_SELECT_BIT;    // select buffer from sqe->buf_group
    IOSQE_CQE_SKIP_SUCCESS :: 1 << IOSQE_CQE_SKIP_SUCCESS_BIT; // don't post CQE if request succeeded
}

// accept flags stored in sqe.accept_flags
using IORING_ACCEPT_Flags :: enum_flags u16 {
    IORING_ACCEPT_MULTISHOT :: 1 << 0;
}

// If sqe.file_index is set to this for opcodes that instantiate a new direct descriptor (like openat/openat2/accept),
// then io_uring will allocate an available direct descriptor instead of having the application pass
// one in. The picked direct descriptor will be returned in cqe->res, or -ENFILE if the space is full.
IORING_FILE_INDEX_ALLOC: u32: ~cast(u32)0;

// send/sendmsg and recv/recvmsg flags (sqe.recv_send_flags)
using IORING_RECVSEND_Flags :: enum_flags u64 {
    // If set, instead of first attempting to send or receive and arm poll if that
    // yields an -EAGAIN result, arm poll upfront and skip the initial transfer attempt.
    IORING_RECVSEND_POLL_FIRST :: 1 << 0;
}

// POLL_ADD flags. Note that since sqe.poll_events is the flag space,
// the command flags for POLL_ADD are stored in sqe.poll_flags.
using IORING_POLL_Flags :: enum_flags u32 {
    // Multishot poll. Sets IORING_CQE_F_MORE if the poll handler
    // will continue to report CQEs on behalf of the same SQE.
    IORING_POLL_ADD_MULTI        :: 1 << 0;

    // Update existing poll request, matching sqe.addr as the old user_data field.
    IORING_POLL_UPDATE_EVENTS    :: 1 << 1;
    IORING_POLL_UPDATE_USER_DATA :: 1 << 2;
}

// Various flags for sqe.op_flags
using IORING_OP_Flags :: enum_flags u32 #specified {
    // close flags.
    IORING_CLOSE_FD_AND_FILE_SLOT :: 1 << 0;

    // Fsync flags
    IORING_FSYNC_DATASYNC :: 1 << 0;

    // Timeout flags
    IORING_TIMEOUT_ABS           :: 1 << 0;
    IORING_TIMEOUT_UPDATE        :: 1 << 1;
    IORING_TIMEOUT_BOOTTIME      :: 1 << 2;
    IORING_TIMEOUT_REALTIME      :: 1 << 3;
    IORING_LINK_TIMEOUT_UPDATE   :: 1 << 4;
    IORING_TIMEOUT_ETIME_SUCCESS :: 1 << 5;

    IORING_TIMEOUT_CLOCK_MASK    :: IORING_TIMEOUT_BOOTTIME | IORING_TIMEOUT_REALTIME;
    IORING_TIMEOUT_UPDATE_MASK   :: IORING_TIMEOUT_UPDATE | IORING_LINK_TIMEOUT_UPDATE;

    // Splice flags; extends splice(2) flags
    SPLICE_F_FD_IN_FIXED :: 1 << 31; // the last bit of a u32

    // ASYNC_CANCEL flags.
    IORING_ASYNC_CANCEL_ALL :: 1 << 0; // Cancel all requests that match the given key
    IORING_ASYNC_CANCEL_FD  :: 1 << 1; // Key off 'fd' for cancelation rather than the request 'user_data'
    IORING_ASYNC_CANCEL_ANY :: 1 << 2; // Match any request
}

// <~> Completion Queue <~>

// Completion queue entry
io_uring_cqe :: struct {
    user_data: u64; // sqe.user_data submission passed back
    res:       s32; // result code for this event
    flags:     IOCQE_Flags;
};

// cqe.flags
using IOCQE_Flags :: enum_flags u32 {
    IORING_CQE_F_BUFFER        :: 1 << 0; // If set, the upper 16 bits are the buffer ID
    IORING_CQE_F_MORE          :: 1 << 1; // If set, parent SQE will generate more CQE entries
    IORING_CQE_F_SOCK_NONEMPTY :: 1 << 2; // If set, more data to read after socket recv
}

// <~> io_uring_enter <~>

// io_uring_enter(2) flags
using IORING_ENTER :: enum_flags u32 {
    IORING_ENTER_GETEVENTS       :: 1 << 0;
    IORING_ENTER_SQ_WAKEUP       :: 1 << 1;
    IORING_ENTER_SQ_WAIT         :: 1 << 2;
    IORING_ENTER_EXT_ARG         :: 1 << 3;
    IORING_ENTER_REGISTERED_RING :: 1 << 4;
}

io_uring_getevents_arg :: struct {
    sigmask:    u64;
    sigmask_sz: u32;
    pad:        u32;
    ts:         u64;
};

// <~> io_uring_register <~>

// io_uring_register(2) opcodes
using IORING_REGISTER :: enum {
    IORING_REGISTER_BUFFERS       :: 0;
    IORING_UNREGISTER_BUFFERS     :: 1;
    IORING_REGISTER_FILES         :: 2;
    IORING_UNREGISTER_FILES       :: 3;
    IORING_REGISTER_EVENTFD       :: 4;
    IORING_UNREGISTER_EVENTFD     :: 5;
    IORING_REGISTER_FILES_UPDATE  :: 6;
    IORING_REGISTER_EVENTFD_ASYNC :: 7;
    IORING_REGISTER_PROBE         :: 8;
    IORING_REGISTER_PERSONALITY   :: 9;
    IORING_UNREGISTER_PERSONALITY :: 10;
    IORING_REGISTER_RESTRICTIONS  :: 11;
    IORING_REGISTER_ENABLE_RINGS  :: 12;

    // extended with tagging
    IORING_REGISTER_FILES2         :: 13;
    IORING_REGISTER_FILES_UPDATE2  :: 14;
    IORING_REGISTER_BUFFERS2       :: 15;
    IORING_REGISTER_BUFFERS_UPDATE :: 16;

    // set/clear io-wq thread affinities
    IORING_REGISTER_IOWQ_AFF   :: 17;
    IORING_UNREGISTER_IOWQ_AFF :: 18;

    // set/get max number of io-wq workers
    IORING_REGISTER_IOWQ_MAX_WORKERS :: 19;

    // register/unregister io_uring fd with the ring
    IORING_REGISTER_RING_FDS   :: 20;
    IORING_UNREGISTER_RING_FDS :: 21;

    // register ring based provide buffer group
    IORING_REGISTER_PBUF_RING   :: 22;
    IORING_UNREGISTER_PBUF_RING :: 23;

    IORING_REGISTER_LAST; // this goes last
}

// io-wq worker categories
using IO_WQ_Categories :: enum {
    IO_WQ_BOUND;
    IO_WQ_UNBOUND;
};

// deprecated, see io_uring_rsrc_update :: struct
io_uring_files_update :: struct {
    offset: u32;
    resv:   u32;
    fds:   *s32;
};

io_uring_rsrc_register :: struct {
    nr:    u32;
    flags: IORING_RSRC_Flags;
    resv2: u64;
    data: *iovec; // An array of nr iovecs.
    tags: *u64;   // Null to disable tagging, otherwise an array of nr u64s.
};

// Register a fully sparse file space, rather than pass in an array of all -1 file descriptors.
using IORING_RSRC_Flags :: enum_flags u32 {
    IORING_RSRC_REGISTER_SPARSE :: 1 << 0;
}

// The docs don't mention this structure so the type of data is a guess. Maybe it's depreceated and should be removed?
io_uring_rsrc_update :: struct {
    offset: u32;
    resv:   u32;
    data:  *iovec;
};

io_uring_rsrc_update2 :: struct {
    offset: u32;
    resv:   u32;
    data:  *iovec;
    tags:  *u64;
    nr:     u32;
    resv2:  u32;
};

// Skip updating fd indexes set to this value in the fd table
IORING_REGISTER_FILES_SKIP: s32: -2;

io_uring_probe :: struct {
    last_op:   IORING_OP; // last opcode supported
    ops_len:   u8;        // length of ops[] array below
    resv:      u16;
    resv2: [3] u32;
    ops:   [0] io_uring_probe_op;
};

io_uring_probe_op :: struct {
    op:    IORING_OP;
    resv:  u8;
    flags: IO_URING_OP_Flags;
    resv2: u32;
};

using IO_URING_OP_Flags :: enum_flags u16 {
    IO_URING_OP_SUPPORTED :: 1 << 0;
}

io_uring_restriction :: struct {
    opcode: u16;
    union {
        register_op: u8; // IORING_RESTRICTION_REGISTER_OP
        sqe_op:      u8; // IORING_RESTRICTION_SQE_OP
        sqe_flags:   u8; // IORING_RESTRICTION_SQE_FLAGS_*
    };
    resv:      u8;
    resv2: [3] u32;
};

// io_uring_restriction.opcode values
using IO_URING_RESTRICTION_OP :: enum {
    IORING_RESTRICTION_REGISTER_OP        :: 0; // Allow an io_uring_register(2) opcode
    IORING_RESTRICTION_SQE_OP             :: 1; // Allow an sqe opcode
    IORING_RESTRICTION_SQE_FLAGS_ALLOWED  :: 2; // Allow sqe flags
    IORING_RESTRICTION_SQE_FLAGS_REQUIRED :: 3; // Require sqe flags (these flags must be set on each submission)

    IORING_RESTRICTION_LAST;
};

io_uring_buf_ring :: struct {
    union {
        // To avoid spilling into more pages than we need to, the
        // ring tail is overlaid with the io_uring_buf->resv field.
        struct {
            resv1: u64;
            resv2: u32;
            resv3: u16;
            tail:  u16;
        };
        bufs: [0] io_uring_buf;
    };
};

io_uring_buf :: struct {
    addr: u64;
    len:  u32;
    bid:  u16;
    resv: u16;
};

// argument for IORING_(UN)REGISTER_PBUF_RING
io_uring_buf_reg :: struct {
    ring_addr:    u64;
    ring_entries: u32;
    bgid:         u16;
    pad:          u16;
    resv:     [3] u64;
};
