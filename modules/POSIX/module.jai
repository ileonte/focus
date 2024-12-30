// A collection of the POSIX API that is shared amongst our supported Unix-based targets

// The macOS bindings are currently generated against the macOS 10.13 SDK (x64) and macOS 11 SDK (oldest Arm64 SDK). If you need something from a more-recent SDK
// you can generate newer bindings like this:
//
//     export MACOS_SDK_PATH=<path_to_your_macos_sdk>; jai-r modules/POSIX/generate.jai [- -arm64]
//

#assert(OS == .LINUX || OS == .ANDROID || OS == .MACOS);

OS_Error_Code :: #type,isa s32;

errno :: inline () -> OS_Error_Code #no_context {
    return <<__errno_location();
}
set_errno :: inline (value: OS_Error_Code) #no_context {
    <<__errno_location() = value;
}

// Some common C types that are no longer used by the bindings, but might still be used by people’s code, so we keep them for now
// to avoid generating too much friction for now.
size_t   :: u64;
ssize_t  :: s64;
off_t    :: s64;


#if OS == {
    case .LINUX;
        #load "bindings/linux/base.jai";
        #load "bindings/linux/stdio.jai";
        #load "bindings/linux/stdlib.jai";
        #load "bindings/linux/syscall.jai";
        #load "bindings/linux/pthread.jai";
        #load "bindings/linux/resource.jai";

    case .MACOS;
        SYSCALL_MACH_BASE :: 0x1000000;
        SYSCALL_UNIX_BASE :: 0x2000000; // Needs to be added to all syscall numbers when you call them directly via #asm, to distinguish the numbers from eg. Mach syscalls. libc’s syscall applies this mask automatically

        #if CPU == .ARM64 {
            #load "bindings/macos/arm64/base.jai";
            #load "bindings/macos/arm64/stdio.jai";
            #load "bindings/macos/arm64/stdlib.jai";
            #load "bindings/macos/arm64/syscall.jai";
            #load "bindings/macos/arm64/pthread.jai";
            #load "bindings/macos/arm64/resource.jai";
            #load "bindings/macos/arm64/sysctl.jai";
        } else {
            #load "bindings/macos/x64/base.jai";
            #load "bindings/macos/x64/stdio.jai";
            #load "bindings/macos/x64/stdlib.jai";
            #load "bindings/macos/x64/syscall.jai";
            #load "bindings/macos/x64/pthread.jai";
            #load "bindings/macos/x64/resource.jai";
            #load "bindings/macos/x64/sysctl.jai";
        }

    case .ANDROID;
        #if CPU == .ARM64 {
            #load "bindings/android/arm64/base.jai";
            #load "bindings/android/arm64/stdio.jai";
            #load "bindings/android/arm64/stdlib.jai";
            #load "bindings/android/arm64/syscall.jai";
            #load "bindings/android/arm64/pthread.jai";
            #load "bindings/android/arm64/resource.jai";
        } else {
            #load "bindings/android/x64/base.jai";
            #load "bindings/android/x64/stdio.jai";
            #load "bindings/android/x64/stdlib.jai";
            #load "bindings/android/x64/syscall.jai";
            #load "bindings/android/x64/pthread.jai";
            #load "bindings/android/x64/resource.jai";
        }
}

// Various transcribed macro functions

IFTODT :: inline (mode:    mode_t) -> mode_t { return (mode & 0xF000) >> 12; }
DTTOIF :: inline (dirtype: mode_t) -> mode_t { return dirtype << 12; }

S_ISDIR  :: inline (mode: mode_t) -> bool { return mode & S_IFMT == S_IFDIR; }
S_ISCHR  :: inline (mode: mode_t) -> bool { return mode & S_IFMT == S_IFCHR; }
S_ISBLK  :: inline (mode: mode_t) -> bool { return mode & S_IFMT == S_IFBLK; }
S_ISREG  :: inline (mode: mode_t) -> bool { return mode & S_IFMT == S_IFREG; }
S_ISFIFO :: inline (mode: mode_t) -> bool { return mode & S_IFMT == S_IFIFO; }
S_ISLNK  :: inline (mode: mode_t) -> bool { return mode & S_IFMT == S_IFLNK; }
S_ISSOCK :: inline (mode: mode_t) -> bool { return mode & S_IFMT == S_IFSOCK; }


#if OS == .LINUX || OS == .ANDROID {
    #scope_file
    __WCOREFLAG   :: 0x80;
    __W_CONTINUED :: 0xffff;
    #scope_export

    WEXITSTATUS  :: inline (status: s32) -> s32  { return (status & 0xff00) >> 8; }
    WTERMSIG     :: inline (status: s32) -> s32  { return status & 0x7f; }
    WSTOPSIG     :: inline (status: s32) -> s32  { return WEXITSTATUS(status); }
    WIFEXITED    :: inline (status: s32) -> bool { return WTERMSIG(status) == 0; }
    WIFSIGNALED  :: inline (status: s32) -> bool { return (cast(u8) ((status & 0x7f) + 1) >> 1) > 0; }
    WIFSTOPPED   :: inline (status: s32) -> bool { return (status & 0xff) == 0x7f; }
    WIFCONTINUED :: inline (status: s32) -> bool { return status == __W_CONTINUED; }
    WCOREDUMP    :: inline (status: s32) -> s32  { return status & __WCOREFLAG; }
} else #if OS == .MACOS {
    #scope_file
    WSTATUS :: inline (status: s32) -> s32 { return status & 0x7F; } // 0o177
    #scope_export

    WEXITSTATUS  :: inline (status: s32) -> s32  { return (status >> 8) & 0x000000ff; }
    WTERMSIG     :: inline (status: s32) -> s32  { return WSTATUS(status); }
    WSTOPSIG     :: inline (status: s32) -> s32  { return status >> 8; }
    WIFEXITED    :: inline (status: s32) -> bool { return WSTATUS(status) == 0; }
    WIFSIGNALED  :: inline (status: s32) -> bool { return WSTATUS(status) != _WSTOPPED && WSTATUS(status) != 0; }
    WIFSTOPPED   :: inline (status: s32) -> bool { return WSTATUS(status) == _WSTOPPED && WSTOPSIG(status) != 0x13; }
    WIFCONTINUED :: inline (status: s32) -> bool { return WSTATUS(status) == _WSTOPPED && WSTOPSIG(status) == 0x13; }
    WCOREDUMP    :: inline (status: s32) -> s32  { return status & WCOREFLAG; }
}

// Literally the only thing that was used from string.h, so we declare it manually to avoid generating bindings for the whole file:
strsignal :: (sig: s32) -> *u8 #foreign libc; // But do we really need this?

#scope_file
libc :: #library,system "libc";
