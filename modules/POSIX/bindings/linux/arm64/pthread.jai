//
// This file was auto-generated using the following command:
//
// jai generate.jai - -arm64 -cross_compiler_sysroot /home/.../Apps/cross-pi-gcc-14.2.0-64
//



SCHED_OTHER :: 0;
SCHED_FIFO :: 1;
SCHED_RR :: 2;

SCHED_BATCH :: 3;
SCHED_ISO :: 4;
SCHED_IDLE :: 5;
SCHED_DEADLINE :: 6;

SCHED_RESET_ON_FORK :: 0x40000000;

CSIGNAL :: 0x000000ff;
CLONE_VM :: 0x00000100;
CLONE_FS :: 0x00000200;
CLONE_FILES :: 0x00000400;
CLONE_SIGHAND :: 0x00000800;
CLONE_PIDFD :: 0x00001000;

CLONE_PTRACE :: 0x00002000;
CLONE_VFORK :: 0x00004000;

CLONE_PARENT :: 0x00008000;

CLONE_THREAD :: 0x00010000;
CLONE_NEWNS :: 0x00020000;
CLONE_SYSVSEM :: 0x00040000;
CLONE_SETTLS :: 0x00080000;
CLONE_PARENT_SETTID :: 0x00100000;

CLONE_CHILD_CLEARTID :: 0x00200000;

CLONE_DETACHED :: 0x00400000;
CLONE_UNTRACED :: 0x00800000;

CLONE_CHILD_SETTID :: 0x01000000;

CLONE_NEWCGROUP :: 0x02000000;
CLONE_NEWUTS :: 0x04000000;
CLONE_NEWIPC :: 0x08000000;
CLONE_NEWUSER :: 0x10000000;
CLONE_NEWPID :: 0x20000000;
CLONE_NEWNET :: 0x40000000;
CLONE_IO :: 0x80000000;

CLONE_NEWTIME :: 0x00000080;

_BITS_TYPES_STRUCT_SCHED_PARAM :: 1;

__CPU_SETSIZE :: 1024;

CPU_SETSIZE :: __CPU_SETSIZE;

__PTHREAD_MUTEX_HAVE_PREV :: 1;

__have_pthread_attr_t :: 1;

__jmp_buf_tag_defined :: 1;

PTHREAD_CANCELED :: cast,trunc(*void) -1;

PTHREAD_ONCE_INIT :: 0;

PTHREAD_BARRIER_SERIAL_THREAD :: -1;

PTHREAD_ATTR_NO_SIGMASK_NP :: -1;

sched_param :: struct {
    sched_priority: s32;
}

clone :: (__fn: #type (__arg: *void) -> s32 #c_call, __child_stack: *void, __flags: s32, __arg: *void, __args: ..Any) -> s32 #foreign libpthread;

unshare :: (__flags: s32) -> s32 #foreign libpthread;

sched_getcpu :: () -> s32 #foreign libpthread;

getcpu :: (unknown0: *u32, unknown1: *u32) -> s32 #foreign libpthread;

setns :: (__fd: s32, __nstype: s32) -> s32 #foreign libpthread;

__cpu_mask :: u64;

cpu_set_t :: struct {
    __bits: [16] __cpu_mask;
}

__sched_cpucount :: (__setsize: u64, __setp: *cpu_set_t) -> s32 #foreign libpthread;

__sched_cpualloc :: (__count: u64) -> *cpu_set_t #foreign libpthread;
__sched_cpufree :: (__set: *cpu_set_t) -> void #foreign libpthread;

sched_setparam :: (__pid: s32, __param: *sched_param) -> s32 #foreign libpthread;

sched_getparam :: (__pid: s32, __param: *sched_param) -> s32 #foreign libpthread;

sched_setscheduler :: (__pid: s32, __policy: s32, __param: *sched_param) -> s32 #foreign libpthread;

sched_getscheduler :: (__pid: s32) -> s32 #foreign libpthread;

sched_yield :: () -> s32 #foreign libpthread;

sched_get_priority_max :: (__algorithm: s32) -> s32 #foreign libpthread;

sched_get_priority_min :: (__algorithm: s32) -> s32 #foreign libpthread;

sched_rr_get_interval :: (__pid: s32, __t: *timespec) -> s32 #foreign libpthread;

sched_setaffinity :: (__pid: s32, __cpusetsize: u64, __cpuset: *cpu_set_t) -> s32 #foreign libpthread;

sched_getaffinity :: (__pid: s32, __cpusetsize: u64, __cpuset: *cpu_set_t) -> s32 #foreign libpthread;

__pthread_internal_list :: struct {
    __prev: *__pthread_internal_list;
    __next: *__pthread_internal_list;
}

__pthread_internal_slist :: struct {
    __next: *__pthread_internal_slist;
}

__pthread_mutex_s :: struct {
    __lock:   s32;
    __count:  u32;
    __owner:  s32;

    __nusers: u32;

    __kind:   s32;

    __spins:  s32;
    __list:   __pthread_internal_list;
}

__pthread_rwlock_arch_t :: struct {
    __readers:       u32;
    __writers:       u32;
    __wrphase_futex: u32;
    __writers_futex: u32;
    __pad3:          u32;
    __pad4:          u32;
    __cur_writer:    s32;
    __shared:        s32;
    __pad1:          u64;
    __pad2:          u64;
    __flags:         u32;
}

__pthread_cond_s :: struct {
    __wseq:         u64;
    __g1_start:     u64;
    __g_refs:       [2] u32;
    __g_size:       [2] u32;
    __g1_orig_size: u32;
    __wrefs:        u32;
    __g_signals:    [2] u32;
}

__once_flag :: struct {
    __data: s32;
}

pthread_t :: u64;

pthread_mutexattr_t :: union {
    __size:  [8] u8;
    __align: s32;
}

pthread_condattr_t :: union {
    __size:  [8] u8;
    __align: s32;
}

pthread_key_t :: u32;

pthread_once_t :: s32;

pthread_attr_t :: union {
    __size:  [64] u8;
    __align: s64;
}

pthread_mutex_t :: union {
    __data:  __pthread_mutex_s;
    __size:  [48] u8;
    __align: s64;
}

pthread_cond_t :: union {
    __data:  __pthread_cond_s;
    __size:  [48] u8;
    __align: s64;
}

pthread_rwlock_t :: union {
    __data:  __pthread_rwlock_arch_t;
    __size:  [56] u8;
    __align: s64;
}

pthread_rwlockattr_t :: union {
    __size:  [8] u8;
    __align: s64;
}

pthread_spinlock_t :: s32;

pthread_barrier_t :: union {
    __size:  [32] u8;
    __align: s64;
}

pthread_barrierattr_t :: union {
    __size:  [8] u8;
    __align: s32;
}

__jmp_buf :: [22] u64;

__sigset_t :: struct {
    __val: [16] u64;
}

__jmp_buf_tag :: struct {
    __jmpbuf:         __jmp_buf;
    __mask_was_saved: s32;
    __saved_mask:     __sigset_t;
}

/* Detach state.  */
PTHREAD_CREATE :: enum u32 {
    JOINABLE :: 0;

    DETACHED :: 1;

    PTHREAD_CREATE_JOINABLE :: JOINABLE;

    PTHREAD_CREATE_DETACHED :: DETACHED;
}

/* Mutex types.  */
PTHREAD_MUTEX :: enum u32 {
    TIMED_NP      :: 0;
    RECURSIVE_NP  :: 1;
    ERRORCHECK_NP :: 2;
    ADAPTIVE_NP   :: 3;

    NORMAL        :: 0;
    RECURSIVE     :: 1;
    ERRORCHECK    :: 2;
    DEFAULT       :: 0;

    FAST_NP       :: 0;

    PTHREAD_MUTEX_TIMED_NP      :: TIMED_NP;
    PTHREAD_MUTEX_RECURSIVE_NP  :: RECURSIVE_NP;
    PTHREAD_MUTEX_ERRORCHECK_NP :: ERRORCHECK_NP;
    PTHREAD_MUTEX_ADAPTIVE_NP   :: ADAPTIVE_NP;

    PTHREAD_MUTEX_NORMAL        :: NORMAL;
    PTHREAD_MUTEX_RECURSIVE     :: RECURSIVE;
    PTHREAD_MUTEX_ERRORCHECK    :: ERRORCHECK;
    PTHREAD_MUTEX_DEFAULT       :: DEFAULT;

    PTHREAD_MUTEX_FAST_NP       :: FAST_NP;
}

/* Robust mutex or not flags.  */
PTHREAD_MUTEX_1 :: enum u32 {
    STALLED    :: 0;
    STALLED_NP :: 0;
    ROBUST     :: 1;
    ROBUST_NP  :: 1;

    PTHREAD_MUTEX_STALLED    :: STALLED;
    PTHREAD_MUTEX_STALLED_NP :: STALLED_NP;
    PTHREAD_MUTEX_ROBUST     :: ROBUST;
    PTHREAD_MUTEX_ROBUST_NP  :: ROBUST_NP;
}

/* Mutex protocols.  */
PTHREAD_PRIO :: enum u32 {
    NONE    :: 0;
    INHERIT :: 1;
    PROTECT :: 2;

    PTHREAD_PRIO_NONE    :: NONE;
    PTHREAD_PRIO_INHERIT :: INHERIT;
    PTHREAD_PRIO_PROTECT :: PROTECT;
}

PTHREAD_RWLOCK :: enum u32 {
    PREFER_READER_NP              :: 0;
    PREFER_WRITER_NP              :: 1;
    PREFER_WRITER_NONRECURSIVE_NP :: 2;
    DEFAULT_NP                    :: 0;

    PTHREAD_RWLOCK_PREFER_READER_NP              :: PREFER_READER_NP;
    PTHREAD_RWLOCK_PREFER_WRITER_NP              :: PREFER_WRITER_NP;
    PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP :: PREFER_WRITER_NONRECURSIVE_NP;
    PTHREAD_RWLOCK_DEFAULT_NP                    :: DEFAULT_NP;
}

/* Scheduler inheritance.  */
PTHREAD :: enum u32 {
    INHERIT_SCHED  :: 0;

    EXPLICIT_SCHED :: 1;

    PTHREAD_INHERIT_SCHED  :: INHERIT_SCHED;

    PTHREAD_EXPLICIT_SCHED :: EXPLICIT_SCHED;
}

/* Scope handling.  */
PTHREAD_SCOPE :: enum u32 {
    SYSTEM  :: 0;

    PROCESS :: 1;

    PTHREAD_SCOPE_SYSTEM  :: SYSTEM;

    PTHREAD_SCOPE_PROCESS :: PROCESS;
}

/* Process shared or private flag.  */
PTHREAD_PROCESS :: enum u32 {
    PRIVATE :: 0;

    SHARED  :: 1;

    PTHREAD_PROCESS_PRIVATE :: PRIVATE;

    PTHREAD_PROCESS_SHARED  :: SHARED;
}

/* Cleanup buffers */
_pthread_cleanup_buffer :: struct {
    __routine:    #type (unknown0: *void) -> void #c_call; /* Function to call.  */
    __arg:        *void; /* Its argument.  */
    __canceltype: s32; /* Saved cancellation type. */
    __prev:       *_pthread_cleanup_buffer; /* Chaining of cleanup functions.  */
}

/* Cancellation */
PTHREAD_CANCEL :: enum u32 {
    ENABLE  :: 0;

    DISABLE :: 1;

    PTHREAD_CANCEL_ENABLE  :: ENABLE;

    PTHREAD_CANCEL_DISABLE :: DISABLE;
}

PTHREAD_CANCEL_1 :: enum u32 {
    DEFERRED     :: 0;

    ASYNCHRONOUS :: 1;

    PTHREAD_CANCEL_DEFERRED     :: DEFERRED;

    PTHREAD_CANCEL_ASYNCHRONOUS :: ASYNCHRONOUS;
}

/* Create a new thread, starting with execution of START-ROUTINE
getting passed ARG.  Creation attributed come from ATTR.  The new
handle is stored in *NEWTHREAD.  */
pthread_create :: (__newthread: *pthread_t, __attr: *pthread_attr_t, __start_routine: #type (unknown0: *void) -> *void #c_call, __arg: *void) -> s32 #foreign libpthread;

/* Terminate calling thread.

The registered cleanup handlers are called via exception handling
so we cannot mark this function with __THROW.*/
pthread_exit :: (__retval: *void) -> void #foreign libpthread;

/* Make calling thread wait for termination of the thread TH.  The
exit status of the thread is stored in *THREAD_RETURN, if THREAD_RETURN
is not NULL.

This function is a cancellation point and therefore not marked with
__THROW.  */
pthread_join :: (__th: pthread_t, __thread_return: **void) -> s32 #foreign libpthread;

/* Check whether thread TH has terminated.  If yes return the status of
the thread in *THREAD_RETURN, if THREAD_RETURN is not NULL.  */
pthread_tryjoin_np :: (__th: pthread_t, __thread_return: **void) -> s32 #foreign libpthread;

/* Make calling thread wait for termination of the thread TH, but only
until TIMEOUT.  The exit status of the thread is stored in
*THREAD_RETURN, if THREAD_RETURN is not NULL.

This function is a cancellation point and therefore not marked with
__THROW.  */
pthread_timedjoin_np :: (__th: pthread_t, __thread_return: **void, __abstime: *timespec) -> s32 #foreign libpthread;

/* Make calling thread wait for termination of the thread TH, but only
until TIMEOUT measured against the clock specified by CLOCKID.  The
exit status of the thread is stored in *THREAD_RETURN, if
THREAD_RETURN is not NULL.

This function is a cancellation point and therefore not marked with
__THROW.  */
pthread_clockjoin_np :: (__th: pthread_t, __thread_return: **void, __clockid: clockid_t, __abstime: *timespec) -> s32 #foreign libpthread;

/* Indicate that the thread TH is never to be joined with PTHREAD_JOIN.
The resources of TH will therefore be freed immediately when it
terminates, instead of waiting for another thread to perform PTHREAD_JOIN
on it.  */
pthread_detach :: (__th: pthread_t) -> s32 #foreign libpthread;

/* Obtain the identifier of the current thread.  */
pthread_self :: () -> pthread_t #foreign libpthread;

/* Compare two thread identifiers.  */
pthread_equal :: (__thread1: pthread_t, __thread2: pthread_t) -> s32 #foreign libpthread;

/* Initialize thread attribute *ATTR with default attributes
(detachstate is PTHREAD_JOINABLE, scheduling policy is SCHED_OTHER,
no user-provided stack).  */
pthread_attr_init :: (__attr: *pthread_attr_t) -> s32 #foreign libpthread;

/* Destroy thread attribute *ATTR.  */
pthread_attr_destroy :: (__attr: *pthread_attr_t) -> s32 #foreign libpthread;

/* Get detach state attribute.  */
pthread_attr_getdetachstate :: (__attr: *pthread_attr_t, __detachstate: *s32) -> s32 #foreign libpthread;

/* Set detach state attribute.  */
pthread_attr_setdetachstate :: (__attr: *pthread_attr_t, __detachstate: s32) -> s32 #foreign libpthread;

/* Get the size of the guard area created for stack overflow protection.  */
pthread_attr_getguardsize :: (__attr: *pthread_attr_t, __guardsize: *u64) -> s32 #foreign libpthread;

/* Set the size of the guard area created for stack overflow protection.  */
pthread_attr_setguardsize :: (__attr: *pthread_attr_t, __guardsize: u64) -> s32 #foreign libpthread;

/* Return in *PARAM the scheduling parameters of *ATTR.  */
pthread_attr_getschedparam :: (__attr: *pthread_attr_t, __param: *sched_param) -> s32 #foreign libpthread;

/* Set scheduling parameters (priority, etc) in *ATTR according to PARAM.  */
pthread_attr_setschedparam :: (__attr: *pthread_attr_t, __param: *sched_param) -> s32 #foreign libpthread;

/* Return in *POLICY the scheduling policy of *ATTR.  */
pthread_attr_getschedpolicy :: (__attr: *pthread_attr_t, __policy: *s32) -> s32 #foreign libpthread;

/* Set scheduling policy in *ATTR according to POLICY.  */
pthread_attr_setschedpolicy :: (__attr: *pthread_attr_t, __policy: s32) -> s32 #foreign libpthread;

/* Return in *INHERIT the scheduling inheritance mode of *ATTR.  */
pthread_attr_getinheritsched :: (__attr: *pthread_attr_t, __inherit: *s32) -> s32 #foreign libpthread;

/* Set scheduling inheritance mode in *ATTR according to INHERIT.  */
pthread_attr_setinheritsched :: (__attr: *pthread_attr_t, __inherit: s32) -> s32 #foreign libpthread;

/* Return in *SCOPE the scheduling contention scope of *ATTR.  */
pthread_attr_getscope :: (__attr: *pthread_attr_t, __scope: *s32) -> s32 #foreign libpthread;

/* Set scheduling contention scope in *ATTR according to SCOPE.  */
pthread_attr_setscope :: (__attr: *pthread_attr_t, __scope: s32) -> s32 #foreign libpthread;

/* Return the previously set address for the stack.  */
pthread_attr_getstackaddr :: (__attr: *pthread_attr_t, __stackaddr: **void) -> s32 #foreign libpthread;

/* Set the starting address of the stack of the thread to be created.
Depending on whether the stack grows up or down the value must either
be higher or lower than all the address in the memory block.  The
minimal size of the block must be PTHREAD_STACK_MIN.  */
pthread_attr_setstackaddr :: (__attr: *pthread_attr_t, __stackaddr: *void) -> s32 #foreign libpthread;

/* Return the currently used minimal stack size.  */
pthread_attr_getstacksize :: (__attr: *pthread_attr_t, __stacksize: *u64) -> s32 #foreign libpthread;

/* Add information about the minimum stack size needed for the thread
to be started.  This size must never be less than PTHREAD_STACK_MIN
and must also not exceed the system limits.  */
pthread_attr_setstacksize :: (__attr: *pthread_attr_t, __stacksize: u64) -> s32 #foreign libpthread;

/* Return the previously set address for the stack.  */
pthread_attr_getstack :: (__attr: *pthread_attr_t, __stackaddr: **void, __stacksize: *u64) -> s32 #foreign libpthread;

/* The following two interfaces are intended to replace the last two.  They
require setting the address as well as the size since only setting the
address will make the implementation on some architectures impossible.  */
pthread_attr_setstack :: (__attr: *pthread_attr_t, __stackaddr: *void, __stacksize: u64) -> s32 #foreign libpthread;

/* Thread created with attribute ATTR will be limited to run only on
the processors represented in CPUSET.  */
pthread_attr_setaffinity_np :: (__attr: *pthread_attr_t, __cpusetsize: u64, __cpuset: *cpu_set_t) -> s32 #foreign libpthread;

/* Get bit set in CPUSET representing the processors threads created with
ATTR can run on.  */
pthread_attr_getaffinity_np :: (__attr: *pthread_attr_t, __cpusetsize: u64, __cpuset: *cpu_set_t) -> s32 #foreign libpthread;

/* Get the default attributes used by pthread_create in this process.  */
pthread_getattr_default_np :: (__attr: *pthread_attr_t) -> s32 #foreign libpthread;

/* Store *SIGMASK as the signal mask for the new thread in *ATTR.  */
pthread_attr_setsigmask_np :: (__attr: *pthread_attr_t, sigmask: *__sigset_t) -> s32 #foreign libpthread;

/* Store the signal mask of *ATTR in *SIGMASK.  If there is no signal
mask stored, return PTHREAD_ATTR_NOSIGMASK_NP.  Return zero on
success.  */
pthread_attr_getsigmask_np :: (__attr: *pthread_attr_t, sigmask: *__sigset_t) -> s32 #foreign libpthread;

/* Set the default attributes to be used by pthread_create in this
process.  */
pthread_setattr_default_np :: (__attr: *pthread_attr_t) -> s32 #foreign libpthread;

/* Initialize thread attribute *ATTR with attributes corresponding to the
already running thread TH.  It shall be called on uninitialized ATTR
and destroyed with pthread_attr_destroy when no longer needed.  */
pthread_getattr_np :: (__th: pthread_t, __attr: *pthread_attr_t) -> s32 #foreign libpthread;

/* Set the scheduling parameters for TARGET_THREAD according to POLICY
and *PARAM.  */
pthread_setschedparam :: (__target_thread: pthread_t, __policy: s32, __param: *sched_param) -> s32 #foreign libpthread;

/* Return in *POLICY and *PARAM the scheduling parameters for TARGET_THREAD. */
pthread_getschedparam :: (__target_thread: pthread_t, __policy: *s32, __param: *sched_param) -> s32 #foreign libpthread;

/* Set the scheduling priority for TARGET_THREAD.  */
pthread_setschedprio :: (__target_thread: pthread_t, __prio: s32) -> s32 #foreign libpthread;

/* Get thread name visible in the kernel and its interfaces.  */
pthread_getname_np :: (__target_thread: pthread_t, __buf: *u8, __buflen: u64) -> s32 #foreign libpthread;

/* Set thread name visible in the kernel and its interfaces.  */
pthread_setname_np :: (__target_thread: pthread_t, __name: *u8) -> s32 #foreign libpthread;

/* Determine level of concurrency.  */
pthread_getconcurrency :: () -> s32 #foreign libpthread;

/* Set new concurrency level to LEVEL.  */
pthread_setconcurrency :: (__level: s32) -> s32 #foreign libpthread;

/* Limit specified thread TH to run only on the processors represented
in CPUSET.  */
pthread_setaffinity_np :: (__th: pthread_t, __cpusetsize: u64, __cpuset: *cpu_set_t) -> s32 #foreign libpthread;

/* Get bit set in CPUSET representing the processors TH can run on.  */
pthread_getaffinity_np :: (__th: pthread_t, __cpusetsize: u64, __cpuset: *cpu_set_t) -> s32 #foreign libpthread;

/* Guarantee that the initialization function INIT_ROUTINE will be called
only once, even if pthread_once is executed several times with the
same ONCE_CONTROL argument. ONCE_CONTROL must point to a static or
extern variable initialized to PTHREAD_ONCE_INIT.

The initialization functions might throw exception which is why
this function is not marked with __THROW.  */
pthread_once :: (__once_control: *pthread_once_t, __init_routine: #type () -> void #c_call) -> s32 #foreign libpthread;

/* Set cancelability state of current thread to STATE, returning old
state in *OLDSTATE if OLDSTATE is not NULL.  */
pthread_setcancelstate :: (__state: s32, __oldstate: *s32) -> s32 #foreign libpthread;

/* Set cancellation state of current thread to TYPE, returning the old
type in *OLDTYPE if OLDTYPE is not NULL.  */
pthread_setcanceltype :: (__type: s32, __oldtype: *s32) -> s32 #foreign libpthread;

/* Cancel THREAD immediately or at the next possibility.  */
pthread_cancel :: (__th: pthread_t) -> s32 #foreign libpthread;

/* Test for pending cancellation for the current thread and terminate
the thread as per pthread_exit(PTHREAD_CANCELED) if it has been
cancelled.  */
pthread_testcancel :: () -> void #foreign libpthread;

/* Cancellation handling with integration into exception handling.  */
__cancel_jmp_buf_tag :: struct {
    __cancel_jmp_buf: __jmp_buf;
    __mask_was_saved: s32;
}

__pthread_unwind_buf_t :: struct {
    __cancel_jmp_buf: [1] __cancel_jmp_buf_tag;
    __pad:            [4] *void;
}

/* Structure to hold the cleanup handler information.  */
__pthread_cleanup_frame :: struct {
    __cancel_routine: #type (unknown0: *void) -> void #c_call;
    __cancel_arg:     *void;
    __do_it:          s32;
    __cancel_type:    s32;
}

__pthread_register_cancel :: (__buf: *__pthread_unwind_buf_t) -> void #foreign libpthread;

__pthread_unregister_cancel :: (__buf: *__pthread_unwind_buf_t) -> void #foreign libpthread;

__pthread_register_cancel_defer :: (__buf: *__pthread_unwind_buf_t) -> void #foreign libpthread;

__pthread_unregister_cancel_restore :: (__buf: *__pthread_unwind_buf_t) -> void #foreign libpthread;

/* Internal interface to initiate cleanup.  */
__pthread_unwind_next :: (__buf: *__pthread_unwind_buf_t) -> void #foreign libpthread;

/* Store the calling environment in ENV, also saving the
signal mask if SAVEMASK is nonzero.  Return 0.
This is the internal name for `sigsetjmp'.  */
__sigsetjmp :: (__env: *[1] __jmp_buf_tag, __savemask: s32) -> s32 #foreign libpthread;

/* Initialize a mutex.  */
pthread_mutex_init :: (__mutex: *pthread_mutex_t, __mutexattr: *pthread_mutexattr_t) -> s32 #foreign libpthread;

/* Destroy a mutex.  */
pthread_mutex_destroy :: (__mutex: *pthread_mutex_t) -> s32 #foreign libpthread;

/* Try locking a mutex.  */
pthread_mutex_trylock :: (__mutex: *pthread_mutex_t) -> s32 #foreign libpthread;

/* Lock a mutex.  */
pthread_mutex_lock :: (__mutex: *pthread_mutex_t) -> s32 #foreign libpthread;

pthread_mutex_timedlock :: (__mutex: *pthread_mutex_t, __abstime: *timespec) -> s32 #foreign libpthread;

pthread_mutex_clocklock :: (__mutex: *pthread_mutex_t, __clockid: clockid_t, __abstime: *timespec) -> s32 #foreign libpthread;

/* Unlock a mutex.  */
pthread_mutex_unlock :: (__mutex: *pthread_mutex_t) -> s32 #foreign libpthread;

/* Get the priority ceiling of MUTEX.  */
pthread_mutex_getprioceiling :: (__mutex: *pthread_mutex_t, __prioceiling: *s32) -> s32 #foreign libpthread;

/* Set the priority ceiling of MUTEX to PRIOCEILING, return old
priority ceiling value in *OLD_CEILING.  */
pthread_mutex_setprioceiling :: (__mutex: *pthread_mutex_t, __prioceiling: s32, __old_ceiling: *s32) -> s32 #foreign libpthread;

/* Declare the state protected by MUTEX as consistent.  */
pthread_mutex_consistent :: (__mutex: *pthread_mutex_t) -> s32 #foreign libpthread;

/* Initialize mutex attribute object ATTR with default attributes
(kind is PTHREAD_MUTEX_TIMED_NP).  */
pthread_mutexattr_init :: (__attr: *pthread_mutexattr_t) -> s32 #foreign libpthread;

/* Destroy mutex attribute object ATTR.  */
pthread_mutexattr_destroy :: (__attr: *pthread_mutexattr_t) -> s32 #foreign libpthread;

/* Get the process-shared flag of the mutex attribute ATTR.  */
pthread_mutexattr_getpshared :: (__attr: *pthread_mutexattr_t, __pshared: *s32) -> s32 #foreign libpthread;

/* Set the process-shared flag of the mutex attribute ATTR.  */
pthread_mutexattr_setpshared :: (__attr: *pthread_mutexattr_t, __pshared: s32) -> s32 #foreign libpthread;

/* Return in *KIND the mutex kind attribute in *ATTR.  */
pthread_mutexattr_gettype :: (__attr: *pthread_mutexattr_t, __kind: *s32) -> s32 #foreign libpthread;

/* Set the mutex kind attribute in *ATTR to KIND (either PTHREAD_MUTEX_NORMAL,
PTHREAD_MUTEX_RECURSIVE, PTHREAD_MUTEX_ERRORCHECK, or
PTHREAD_MUTEX_DEFAULT).  */
pthread_mutexattr_settype :: (__attr: *pthread_mutexattr_t, __kind: s32) -> s32 #foreign libpthread;

/* Return in *PROTOCOL the mutex protocol attribute in *ATTR.  */
pthread_mutexattr_getprotocol :: (__attr: *pthread_mutexattr_t, __protocol: *s32) -> s32 #foreign libpthread;

/* Set the mutex protocol attribute in *ATTR to PROTOCOL (either
PTHREAD_PRIO_NONE, PTHREAD_PRIO_INHERIT, or PTHREAD_PRIO_PROTECT).  */
pthread_mutexattr_setprotocol :: (__attr: *pthread_mutexattr_t, __protocol: s32) -> s32 #foreign libpthread;

/* Return in *PRIOCEILING the mutex prioceiling attribute in *ATTR.  */
pthread_mutexattr_getprioceiling :: (__attr: *pthread_mutexattr_t, __prioceiling: *s32) -> s32 #foreign libpthread;

/* Set the mutex prioceiling attribute in *ATTR to PRIOCEILING.  */
pthread_mutexattr_setprioceiling :: (__attr: *pthread_mutexattr_t, __prioceiling: s32) -> s32 #foreign libpthread;

/* Get the robustness flag of the mutex attribute ATTR.  */
pthread_mutexattr_getrobust :: (__attr: *pthread_mutexattr_t, __robustness: *s32) -> s32 #foreign libpthread;

/* Set the robustness flag of the mutex attribute ATTR.  */
pthread_mutexattr_setrobust :: (__attr: *pthread_mutexattr_t, __robustness: s32) -> s32 #foreign libpthread;

/* Initialize read-write lock RWLOCK using attributes ATTR, or use
the default values if later is NULL.  */
pthread_rwlock_init :: (__rwlock: *pthread_rwlock_t, __attr: *pthread_rwlockattr_t) -> s32 #foreign libpthread;

/* Destroy read-write lock RWLOCK.  */
pthread_rwlock_destroy :: (__rwlock: *pthread_rwlock_t) -> s32 #foreign libpthread;

/* Acquire read lock for RWLOCK.  */
pthread_rwlock_rdlock :: (__rwlock: *pthread_rwlock_t) -> s32 #foreign libpthread;

/* Try to acquire read lock for RWLOCK.  */
pthread_rwlock_tryrdlock :: (__rwlock: *pthread_rwlock_t) -> s32 #foreign libpthread;

pthread_rwlock_timedrdlock :: (__rwlock: *pthread_rwlock_t, __abstime: *timespec) -> s32 #foreign libpthread;

pthread_rwlock_clockrdlock :: (__rwlock: *pthread_rwlock_t, __clockid: clockid_t, __abstime: *timespec) -> s32 #foreign libpthread;

/* Acquire write lock for RWLOCK.  */
pthread_rwlock_wrlock :: (__rwlock: *pthread_rwlock_t) -> s32 #foreign libpthread;

/* Try to acquire write lock for RWLOCK.  */
pthread_rwlock_trywrlock :: (__rwlock: *pthread_rwlock_t) -> s32 #foreign libpthread;

pthread_rwlock_timedwrlock :: (__rwlock: *pthread_rwlock_t, __abstime: *timespec) -> s32 #foreign libpthread;

pthread_rwlock_clockwrlock :: (__rwlock: *pthread_rwlock_t, __clockid: clockid_t, __abstime: *timespec) -> s32 #foreign libpthread;

/* Unlock RWLOCK.  */
pthread_rwlock_unlock :: (__rwlock: *pthread_rwlock_t) -> s32 #foreign libpthread;

/* Initialize attribute object ATTR with default values.  */
pthread_rwlockattr_init :: (__attr: *pthread_rwlockattr_t) -> s32 #foreign libpthread;

/* Destroy attribute object ATTR.  */
pthread_rwlockattr_destroy :: (__attr: *pthread_rwlockattr_t) -> s32 #foreign libpthread;

/* Return current setting of process-shared attribute of ATTR in PSHARED.  */
pthread_rwlockattr_getpshared :: (__attr: *pthread_rwlockattr_t, __pshared: *s32) -> s32 #foreign libpthread;

/* Set process-shared attribute of ATTR to PSHARED.  */
pthread_rwlockattr_setpshared :: (__attr: *pthread_rwlockattr_t, __pshared: s32) -> s32 #foreign libpthread;

/* Return current setting of reader/writer preference.  */
pthread_rwlockattr_getkind_np :: (__attr: *pthread_rwlockattr_t, __pref: *s32) -> s32 #foreign libpthread;

/* Set reader/write preference.  */
pthread_rwlockattr_setkind_np :: (__attr: *pthread_rwlockattr_t, __pref: s32) -> s32 #foreign libpthread;

/* Initialize condition variable COND using attributes ATTR, or use
the default values if later is NULL.  */
pthread_cond_init :: (__cond: *pthread_cond_t, __cond_attr: *pthread_condattr_t) -> s32 #foreign libpthread;

/* Destroy condition variable COND.  */
pthread_cond_destroy :: (__cond: *pthread_cond_t) -> s32 #foreign libpthread;

/* Wake up one thread waiting for condition variable COND.  */
pthread_cond_signal :: (__cond: *pthread_cond_t) -> s32 #foreign libpthread;

/* Wake up all threads waiting for condition variables COND.  */
pthread_cond_broadcast :: (__cond: *pthread_cond_t) -> s32 #foreign libpthread;

/* Wait for condition variable COND to be signaled or broadcast.
MUTEX is assumed to be locked before.

This function is a cancellation point and therefore not marked with
__THROW.  */
pthread_cond_wait :: (__cond: *pthread_cond_t, __mutex: *pthread_mutex_t) -> s32 #foreign libpthread;

pthread_cond_timedwait :: (__cond: *pthread_cond_t, __mutex: *pthread_mutex_t, __abstime: *timespec) -> s32 #foreign libpthread;

pthread_cond_clockwait :: (__cond: *pthread_cond_t, __mutex: *pthread_mutex_t, __clock_id: s32, __abstime: *timespec) -> s32 #foreign libpthread;

/* Initialize condition variable attribute ATTR.  */
pthread_condattr_init :: (__attr: *pthread_condattr_t) -> s32 #foreign libpthread;

/* Destroy condition variable attribute ATTR.  */
pthread_condattr_destroy :: (__attr: *pthread_condattr_t) -> s32 #foreign libpthread;

/* Get the process-shared flag of the condition variable attribute ATTR.  */
pthread_condattr_getpshared :: (__attr: *pthread_condattr_t, __pshared: *s32) -> s32 #foreign libpthread;

/* Set the process-shared flag of the condition variable attribute ATTR.  */
pthread_condattr_setpshared :: (__attr: *pthread_condattr_t, __pshared: s32) -> s32 #foreign libpthread;

/* Get the clock selected for the condition variable attribute ATTR.  */
pthread_condattr_getclock :: (__attr: *pthread_condattr_t, __clock_id: *s32) -> s32 #foreign libpthread;

/* Set the clock selected for the condition variable attribute ATTR.  */
pthread_condattr_setclock :: (__attr: *pthread_condattr_t, __clock_id: s32) -> s32 #foreign libpthread;

/* Initialize the spinlock LOCK.  If PSHARED is nonzero the spinlock can
be shared between different processes.  */
pthread_spin_init :: (__lock: *pthread_spinlock_t, __pshared: s32) -> s32 #foreign libpthread;

/* Destroy the spinlock LOCK.  */
pthread_spin_destroy :: (__lock: *pthread_spinlock_t) -> s32 #foreign libpthread;

/* Wait until spinlock LOCK is retrieved.  */
pthread_spin_lock :: (__lock: *pthread_spinlock_t) -> s32 #foreign libpthread;

/* Try to lock spinlock LOCK.  */
pthread_spin_trylock :: (__lock: *pthread_spinlock_t) -> s32 #foreign libpthread;

/* Release spinlock LOCK.  */
pthread_spin_unlock :: (__lock: *pthread_spinlock_t) -> s32 #foreign libpthread;

/* Initialize BARRIER with the attributes in ATTR.  The barrier is
opened when COUNT waiters arrived.  */
pthread_barrier_init :: (__barrier: *pthread_barrier_t, __attr: *pthread_barrierattr_t, __count: u32) -> s32 #foreign libpthread;

/* Destroy a previously dynamically initialized barrier BARRIER.  */
pthread_barrier_destroy :: (__barrier: *pthread_barrier_t) -> s32 #foreign libpthread;

/* Wait on barrier BARRIER.  */
pthread_barrier_wait :: (__barrier: *pthread_barrier_t) -> s32 #foreign libpthread;

/* Initialize barrier attribute ATTR.  */
pthread_barrierattr_init :: (__attr: *pthread_barrierattr_t) -> s32 #foreign libpthread;

/* Destroy previously dynamically initialized barrier attribute ATTR.  */
pthread_barrierattr_destroy :: (__attr: *pthread_barrierattr_t) -> s32 #foreign libpthread;

/* Get the process-shared flag of the barrier attribute ATTR.  */
pthread_barrierattr_getpshared :: (__attr: *pthread_barrierattr_t, __pshared: *s32) -> s32 #foreign libpthread;

/* Set the process-shared flag of the barrier attribute ATTR.  */
pthread_barrierattr_setpshared :: (__attr: *pthread_barrierattr_t, __pshared: s32) -> s32 #foreign libpthread;

/* Create a key value identifying a location in the thread-specific
data area.  Each thread maintains a distinct thread-specific data
area.  DESTR_FUNCTION, if non-NULL, is called with the value
associated to that key when the key is destroyed.
DESTR_FUNCTION is not called if the value associated is NULL when
the key is destroyed.  */
pthread_key_create :: (__key: *pthread_key_t, __destr_function: #type (unknown0: *void) -> void #c_call) -> s32 #foreign libpthread;

/* Destroy KEY.  */
pthread_key_delete :: (__key: pthread_key_t) -> s32 #foreign libpthread;

/* Return current value of the thread-specific data slot identified by KEY.  */
pthread_getspecific :: (__key: pthread_key_t) -> *void #foreign libpthread;

/* Store POINTER in the thread-specific data slot identified by KEY. */
pthread_setspecific :: (__key: pthread_key_t, __pointer: *void) -> s32 #foreign libpthread;

/* Get ID of CPU-time clock for thread THREAD_ID.  */
pthread_getcpuclockid :: (__thread_id: pthread_t, __clock_id: *s32) -> s32 #foreign libpthread;

sem_t :: union {
    __size:  [32] u8;
    __align: s64;
}

/* Initialize semaphore object SEM to VALUE.  If PSHARED then share it
with other processes.  */
sem_init :: (__sem: *sem_t, __pshared: s32, __value: u32) -> s32 #foreign libpthread;

/* Free resources associated with semaphore object SEM.  */
sem_destroy :: (__sem: *sem_t) -> s32 #foreign libpthread;

/* Open a named semaphore NAME with open flags OFLAG.  */
sem_open :: (__name: *u8, __oflag: s32, __args: ..Any) -> *sem_t #foreign libpthread;

/* Close descriptor for named semaphore SEM.  */
sem_close :: (__sem: *sem_t) -> s32 #foreign libpthread;

/* Remove named semaphore NAME.  */
sem_unlink :: (__name: *u8) -> s32 #foreign libpthread;

/* Wait for SEM being posted.

This function is a cancellation point and therefore not marked with
__THROW.  */
sem_wait :: (__sem: *sem_t) -> s32 #foreign libpthread;

sem_timedwait :: (__sem: *sem_t, __abstime: *timespec) -> s32 #foreign libpthread;

sem_clockwait :: (__sem: *sem_t, clock: clockid_t, __abstime: *timespec) -> s32 #foreign libpthread;

/* Test whether SEM is posted.  */
sem_trywait :: (__sem: *sem_t) -> s32 #foreign libpthread;

/* Post SEM.  */
sem_post :: (__sem: *sem_t) -> s32 #foreign libpthread;

/* Get current value of SEM and store it in *SVAL.  */
sem_getvalue :: (__sem: *sem_t, __sval: *s32) -> s32 #foreign libpthread;

jmp_buf :: [1] __jmp_buf_tag;

/* Store the calling environment in ENV, also saving the signal mask.
Return 0.  */
setjmp :: (__env: *jmp_buf) -> s32 #foreign libpthread;

/* Store the calling environment in ENV, not saving the signal mask.
Return 0.  */
_setjmp :: (__env: *[1] __jmp_buf_tag) -> s32 #foreign libpthread;

/* Jump to the environment saved in ENV, making the
`setjmp' call there return VAL, or 1 if VAL is 0.  */
longjmp :: (__env: *[1] __jmp_buf_tag, __val: s32) -> void #foreign libpthread;

/* Same.  Usually `_longjmp' is used with `_setjmp', which does not save
the signal mask.  But it is how ENV was saved that determines whether
`longjmp' restores the mask; `_longjmp' is just an alias.  */
_longjmp :: (__env: *[1] __jmp_buf_tag, __val: s32) -> void #foreign libpthread;

/* Use the same type for `jmp_buf' and `sigjmp_buf'.
The `__mask_was_saved' flag determines whether
or not `longjmp' will restore the signal mask.  */
sigjmp_buf :: [1] __jmp_buf_tag;

/* Jump to the environment saved in ENV, making the
sigsetjmp call there return VAL, or 1 if VAL is 0.
Restore the signal mask if that sigsetjmp call saved it.
This is just an alias `longjmp'.  */
siglongjmp :: (__env: *sigjmp_buf, __val: s32) -> void #foreign libpthread;

#scope_file

libpthread :: #library,system "libpthread";
libc :: #library,system "libc";
