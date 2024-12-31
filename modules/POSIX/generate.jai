AT_COMPILE_TIME :: true;

ENABLE_GNU_SOURCE :: true; // Enable this and re-run the generator to get Linux’ _GNU_SOURCE extensions to POSIX.

#if AT_COMPILE_TIME {
    #run,stallable {
        set_build_options_dc(.{do_output=false});
        options := get_build_options();
        args := options.compile_time_command_line;
        if !generate_bindings(args) {
            compiler_set_workspace_status(.FAILED);
        }
    }
} else {
    #import "System";

    main :: () {
        set_working_directory(path_strip_filename(get_path_of_running_executable()));
        args := get_command_line_arguments();
        if !generate_bindings(args) {
            exit(1);
        }
    }
}

already_generated: Table(string, bool);
cross_compiler_sysroot: string;

generate_bindings :: (args: [] string) -> bool {
    target_android := array_find(args, "-android");
    target_x64     := array_find(args, "-x64");
    target_arm     := array_find(args, "-arm64");

    os_target  := OS;
    cpu_target := CPU;
    if target_android os_target  = .ANDROID;
    if target_x64     cpu_target = .X64;
    if target_arm     cpu_target = .ARM64;

    bindings_directory: string;
    if os_target == {
        case .LINUX;
            if cpu_target == {
                case .X64;   bindings_directory = "bindings/linux/x64";
                case .ARM64; bindings_directory = "bindings/linux/arm64";
            }
        case .MACOS;
            if cpu_target == {
                case .X64;   bindings_directory = "bindings/macos/x64";
                case .ARM64; bindings_directory = "bindings/macos/arm64";
            }
        case .ANDROID;
            if cpu_target == {
                case .X64;   bindings_directory = "bindings/android/x64";
                case .ARM64; bindings_directory = "bindings/android/arm64";
            }
    }
    assert(bindings_directory != "", "Unsupported OS/CPU");

    success := true;

    if os_target != OS || cpu_target != CPU {
        passed_cross_sysroot, cross_sysroot_index := array_find(args, "-cross_compiler_sysroot");
        if passed_cross_sysroot && cross_sysroot_index < args.count-1 {
            cross_compiler_sysroot = args[cross_sysroot_index + 1];
        }
        else {
            log_error("Since we're trying to generate bindings for a cross-compile target, please pass a system root folder with -cross_compiler_sysroot.");
            success = false;
        }
    }

    make_directory_if_it_does_not_exist(bindings_directory, recursive = true);

    success &&= generate_stdio_bindings(   os_target, cpu_target, bindings_directory);
    success &&= generate_stdlib_bindings(  os_target, cpu_target, bindings_directory);
    success &&= generate_syscall_bindings( os_target, cpu_target, bindings_directory);
    success &&= generate_pthread_bindings( os_target, cpu_target, bindings_directory);
    success &&= generate_resource_bindings(os_target, cpu_target, bindings_directory);
    success &&= generate_sysctl_bindings(  os_target, cpu_target, bindings_directory);
    // Do "base" at the end so that it only includes stuff that’s missing from the other files
    success &&= generate_base_bindings(    os_target, cpu_target, bindings_directory);
    return success;
}

generate_base_bindings :: (os: Operating_System_Tag, cpu: CPU_Tag, bindings_directory: string) -> bool {
    output_path := tprint("%/base.jai", bindings_directory);
    options := get_common_options(os, cpu);

    options.generate_printf_wrappers = false;

    libc_path, libc_platform_path := posix_get_libc_paths(os, cpu);

    sys_path := ifx os == .LINUX && cpu == CPU then libc_platform_path else libc_path;

    if os == .LINUX {
        array_add(*options.system_library_names,
            "libdl.so.2", // dlopen, etc.
            "librt.so.1", // shm_*
        );
    }
    if os == .ANDROID {
        array_add(*options.system_library_names,
            "libdl", // dlopen, etc.
        );
    }

    array_add(*options.source_files,
        tprint("%/dlfcn.h",               libc_path),
        tprint("%/dirent.h",              libc_path),
        tprint("%/errno.h",               libc_path),
        tprint("%/execinfo.h",            libc_path),
        tprint("%/fnmatch.h",             libc_path),
        tprint("%/pwd.h",                 libc_path),
        tprint("%/signal.h",              libc_path),
        tprint("%/sys/ipc.h",             sys_path),
        tprint("%/sys/mman.h",            sys_path), // MADV*
        tprint("%/sys/poll.h",            sys_path), // POLL*
        tprint("%/sys/signal.h",          sys_path), // SIG*
        tprint("%/sys/shm.h",             sys_path),  // shmget
        tprint("%/sys/time.h",            sys_path),
        tprint("%/sys/types.h",           sys_path),
        tprint("%/sys/ucontext.h",        sys_path),
        tprint("%/sys/utsname.h",         sys_path),  // utsname
        tprint("%/sys/wait.h",            sys_path),  // WNOHANG, …
        tprint("%/time.h",                libc_path),
        tprint("%/unistd.h",              libc_path),
    );
    if os == {
        case .LINUX;
            array_add(*options.source_files,
                tprint("%/sys/uio.h", sys_path),
                tprint("%/sys/ipc.h", sys_path),  // ipc_perm
            );
        case .MACOS;
            array_add(*options.source_files,
                tprint("%/mach/std_types.h", libc_path),
                tprint("%/sys/attr.h",            sys_path), // attribute_set_t, …
                tprint("%/sys/dirent.h",          sys_path), // DT_*
                tprint("%/sys/_types/_iovec_t.h", sys_path),
                tprint("%/sys/vnode.h",           sys_path),  // vtype
            );
        case .ANDROID;
            // array_add(*options.source_files,
            //     tprint("%/asm/stat.h", libc_platform_path), // stat64
            // );
    }

    array_add(*options.path_fragments_to_treat_as_non_system_paths,
        "errno.h",
        "errno-base.h",
        "seek_constants.h",
        "posix_types.h",
        "timespec.h",
        "siginfo.h",
        "signal_types.h",
        "time.h",

        "mach/arm/_structs.h", // __darwin_arm_exception_state64, …

        // Things that need to be whitelisted despite being included above because libclang is annoying:
        "sys/attr.h",
        "sys/dirent.h",
        "sys/mman.h",
        "/signal.h",
        "sys/types.h",
        "sys/wait.h",
        "sys/_types/_sigaltstack.h",
        "ucontext.h",

        // Linux
        "waitflags.h",      // idtype_t, WNOHANG, …
        "signum-generic.h", // SIG*, but most of the values get re-declared in signum with different values.
        "signum.h",         // SIG*
        "confname.h",       // _SC_*
        "sigaction.h",      // sigaction(_t)
        "sigevent_t.h",     // sigevent
        "dirent.h",         // dirent
        "shm.h",
        "ipc.h",
        "mman.h",           // MAP_*
        "mman-linux.h",     // MADV_*
        "dlfcn.h",          // RTLD_*
        "poll.h",           // POLL*

        // Linux typedefs that we probably want to get rid of
        "bits/types.h",

        // Android
        "sys/user.h", // user_fpsimd_struct
        "linux/wait.h", // WNOHANG, …
        "unistd.h",
        "mman-common.h",     // MADV_*
    );
    array_add(*options.system_types_to_include,
        "_filesec",
        "blkcnt_t",
        "blksize_t",
        "clock_t",
        "dev_t",
        "filesec_t",
        "fixpt_t",
        "getattrlistbulk",
        "gid_t",
        "ino_t",
        "iovec",
        "itimerspec",
        "key_t",
        "locale_t",
        "loff_t",
        "mach_port_t",
        "mode_t",
        "nlink_t",
        "off64_t",
        "off_t",
        "passwd",
        "pid_t",
        "ptrdiff_t",
        "readlink",
        "sigset_t",
        "suseconds_t",
        "time_t",
        "timer_t",
        "timeval",
        "tm",
        "uid_t",
        "uint_t",
        "useconds_t",
        "uuid_t",

        // Linux stuff
        "__locale_struct",
        "siginfo_t",
        "stack_t",
        "sigval",

        // macOS stuff
        "__darwin_mcontext64",
        "__darwin_x86_exception_state64",
        "__darwin_x86_thread_state64",
        "__darwin_x86_float_state64",
        "__darwin_arm_exception_state64",
        "__darwin_arm_thread_state64",
        "__darwin_arm_float_state64",
        "__darwin_mmst_reg",
        "__darwin_xmm_reg",
        "__darwin_fp_control",
        "__darwin_fp_status",

        // Android stuff
        "__locale_t",
    );

    if os == .LINUX {
        array_add(*options.system_types_to_include,
            "sigcontext",
            "_fpstate",
            "_fpxreg",
            "_xmmreg",
            "timex",
        );

        if cpu == .ARM64 {
            array_add(*options.system_types_to_include,
                "elf_fpregset_t",
                "elf_greg_t",
                "elf_gregset_t",
                "idtype_t",
                "ipc_perm",
                "shmid_ds",
            );
        }
    }
    if os == .ANDROID {
        array_add(*options.system_types_to_include,
            "sigcontext",
            "_fpstate_64",
            "_fpx_sw_bytes",
            "read",
            "close",
            "fork",
            "pipe",
        );
    }

    array_add(*options.typedef_prefixes_to_unwrap, "__");
    array_add(*options.macro_prefixes_to_unwrap, "POSIX_MADV");

    array_add(*options.generate_enums_from_macros_with_prefixes,
        "ATTR_CMN",
        "ATTR_DIR",
        "ATTR_FILE",
        "ATTR_VOL",
        "ATTR_FORK",
        "CLOCK_",
        "_SC_",
        "_PC_",
        "DT_",
    );

    options.visitor = base_visitor;

    return generate_bindings(options, output_path);
}

BASE_DECLARATION_PREFIXES_TO_OMIT :: string.[
    "_POSIX_",
    "_POSIX2_",
    "pthread_", // Should be part of pthread.jai instead
];

BASE_DECLARATIONS_TO_OMIT :: string.[
    "accessx_np",
    "MB_CUR_MAX",        // Alias for an #elsewhere, which aren’t constant in Jai.
    "fd_mask",           // in "Socket", needs to be omitted on macOS, for consistency with other platforms
    "socklen_t",         // in "Socket"
    "__kernel_sigation", // :AndroidKernelSigaction


    // Included in "Basic"
    "exit",
    "free",

    // Linux noise
    "__siginfo_t_defined",
    "__sigevent_t_defined",
    "__iovec_defined",

    // Android noise
    "__kernel_legacy_shmid_ds",
    "__kernel_legacy_ipc_perm",

    // Deprecated
    "sigstack",
    "sigstack_",
    "stime",
];

BASE_DECLARATIONS_TO_OMIT_X64 :: string.[
    "pause", // We have a better version in Machine_X64,
];

BASE_DECLARATIONS_TO_OMIT_MACOS :: string.[
    // Deprecated stuff
    "stat64",
    "fstatx64_np",
    "lstatx64_np",
    "statx64_np",
    "fstat64",
    "lstat64",
    "ostat",
    "wait_t",
    "sys_signame",
    "_sys_siglist",
    "sys_siglist",
];

BASE_DECLARATIONS_TO_OMIT_ANDROID :: string.[
    "shmctl",
];

base_visitor :: (decl: *Declaration, parent_decl: *Declaration) -> Declaration_Visit_Result {
    if !parent_decl {
        if array_find(BASE_DECLARATIONS_TO_OMIT, decl.name) ||
           (context.generator_options.cpu == .X64    && array_find(BASE_DECLARATIONS_TO_OMIT_X64,     decl.name)) ||
           (context.generator_options.os == .MACOS   && array_find(BASE_DECLARATIONS_TO_OMIT_MACOS,   decl.name)) ||
           (context.generator_options.os == .ANDROID && array_find(BASE_DECLARATIONS_TO_OMIT_ANDROID, decl.name)) {
            decl.decl_flags |= .OMIT_FROM_OUTPUT;
            return .STOP;
        }

        for BASE_DECLARATION_PREFIXES_TO_OMIT {
            if begins_with(decl.name, it) {
                decl.decl_flags |= .OMIT_FROM_OUTPUT;
                return .STOP;
            }
        }

        // Hide the macro for Android's second sigaction struct (that represents the kernel’s variant) :AndroidKernelSigaction
        if decl.kind == .MACRO_DEFINITION && decl.name == "sigaction" {
            decl.decl_flags |= .OMIT_FROM_OUTPUT;
            return .STOP;
        }

        // Unify names and return values of errno functions across OSes:
        if decl.kind == .FUNCTION && (decl.name == "__error" /*macOS*/ || decl.name == "__errno" /*Android*/ || decl.name == "__errno_location" /*Linux*/) {
            decl.output_name = "__errno_location";

            POINTER_SIZE :: 8;
            error_code_type := New(CType);
            error_code_type.hardcoded_jai_string = "OS_Error_Code";

            pointer_type := New(CType);
            pointer_type.pointer_to = error_code_type;
            pointer_type.size = POINTER_SIZE;
            change_return_type(decl, pointer_type);

            return .RECURSE;
        }

        // Rename the generated "_SC" enum to the previously used name, even though that one isn’t great.
        if decl.output_name == "_SC" || decl.output_name == "SC" {
            assert(decl.kind == .ENUM);
            decl.output_name = "_SC_definitions";
            decl.type = context.generator.type_def_s32;

            // Keep the individual values usable by their original name for backwards compatibility
            decl.decl_flags |= .QUALIFIER_USING;
            _enum := cast(*Enum) decl;
            for * _enum.enumerates {
                it.output_name = it.name;
            }

            return .STOP;
        }

        if decl.output_name == "_PC" { // Unify _PC_ declarations across Linux & Android
            assert(decl.kind == .ENUM);
            decl.output_name = "PC";
            decl.type = context.generator.type_def_u32;
            _enum := cast(*Enum) decl;
            _enum.flags &= ~.ALIAS_ORIGINAL_NAMES;
        }

        // Rename the generated CLOCK enum to match the typedef & remove the typedef
        if decl.output_name == "CLOCK" {
            assert(decl.kind == .ENUM);
            decl.output_name = "clockid_t";
            decl.type = context.generator.type_def_u32;
            return .STOP;
        }
        if decl.name == "clockid_t" && decl.kind != .ENUM {
            decl.decl_flags |= .OMIT_FROM_OUTPUT;
            return .STOP;
        }

        if decl.output_name == "ATTR_CMN" {
            assert(decl.kind == .ENUM);
            decl.type = context.generator.type_def_u32;
            return .STOP;
        }

        if decl.output_name == "DT" {
            assert(decl.kind == .ENUM);
            _enum := cast(*Enum) decl;
            _enum.flags &= ~.ALIAS_ORIGINAL_NAMES;
            _enum.type = context.generator.type_def_u8;
            return .STOP;
        }

        // Make sysconf use the generated enum
        if decl.name == "sysconf" {
            function_type := decl.type.type_of_function;
            assert(function_type != null);
            assert(function_type.arguments.count == 1);
            arg := function_type.arguments[0];
            arg.output_name = "name";
            change_type_to_enum(arg, "_SC_definitions");
            return .STOP;
        }


        if context.generator_options.os == .ANDROID && decl.kind == .ENUM && !decl.name { // Fix that the register enum is anonymous on Android
            _enum := cast(*Enum) decl;
            for _enum.enumerates {
                if it.name == "REG_R8" {
                    _enum.output_name = "REG";
                    break;
                }
            }
        }

        if decl.kind == .ENUM && decl.name == "REG" {
            _enum := cast(*Enum) decl;
            _enum.flags &= ~.ALIAS_ORIGINAL_NAMES;
        }

        // change (f)pathconf to use the PC enum
        if decl.name == "pathconf" || decl.name == "fpathconf" {
            assert(decl.kind == .FUNCTION);
            function_type := decl.type.type_of_function;
            assert(function_type.arguments.count == 2);
            name_arg := function_type.arguments[1];
            name_arg.output_name = "__name"; // For consistency
            change_type_to_enum(name_arg, "PC");
            return .STOP;
        }

    } else {
        // Omit functions that take blocks for now. Maybe we can add them to the Objective C module
        if parent_decl.kind == .FUNCTION && decl.type == context.generator.type_def_objc_block_pointer {
            parent_decl.decl_flags |= .OMIT_FROM_OUTPUT;
            return .STOP;
        }

        // Make sigaction_t compatible across OSes #1
        if decl.name == "__sigaction_u" /*macOS*/ || decl.name == "__sigaction_handler" /*Linux*/ {
            decl.decl_flags |= .QUALIFIER_USING;
            return .STOP;
        }

        // Make sigaction_t compatible across OSes #1
        if parent_decl.name == "__sigaction_u" {
            if begins_with(decl.output_name, "__") { // macOS prefixed some fields, just to mess with us.
                advance(*decl.output_name, 2);
            }
            return .STOP;
        }

        // Make utsname compatible across OSes
        if parent_decl.name == "utsname" {
            if begins_with(decl.output_name, "__") { // Linux prefixed some fields, just to mess with us.
                advance(*decl.output_name, 2);
            }
            return .STOP;
        }

        // Change type of commonattr for consistency with the previous bindings:
        if decl.name == "commonattr" {
            change_type_to_enum(decl, "ATTR_CMN");
            return .STOP;
        }

        if decl.name == "d_type" {
            change_type_to_enum(decl, "DT");
            return .STOP;
        }
    }

    return posix_visitor(decl, parent_decl);
}

generate_stdio_bindings :: (os: Operating_System_Tag, cpu: CPU_Tag, bindings_directory: string) -> bool {
    output_path := tprint("%/stdio.jai", bindings_directory);
    options := get_common_options(os, cpu);

    libc_path, libc_platform_path := posix_get_libc_paths(os, cpu);
    sys_path := ifx os == .LINUX && cpu == CPU then libc_platform_path else libc_path;

    if os == .LINUX {
        array_add(*options.system_library_names, "librt.so.1"); // aio_*
    }
    array_add(*options.source_files,
        tprint("%/stdio.h", libc_path),
        tprint("%/sys/fcntl.h", sys_path),
        tprint("%/sys/stat.h",  sys_path),
        tprint("%/sys/ioctl.h", sys_path),  // ioctl
    );
    if os == {
        case .LINUX;
            array_add(*options.source_files,
                tprint("%/aio.h", libc_path), // AIO_*
                tprint("%/fcntl.h", libc_path),
                tprint("%/sys/eventfd.h", sys_path),
                tprint("%/sys/timerfd.h", sys_path),
                tprint("%/sys/signalfd.h", sys_path),
            );
        case .ANDROID;
            array_add(*options.source_files,
                tprint("%/fcntl.h", libc_path),
                tprint("%/sys/eventfd.h", sys_path),
                tprint("%/sys/timerfd.h", sys_path),
                tprint("%/sys/signalfd.h", sys_path),
            );
        case .MACOS;
            array_add(*options.source_files,
                tprint("%/sys/aio.h", sys_path), // AIO_*
            );
    }

    array_add(*options.path_fragments_to_treat_as_non_system_paths,
        "sys/fcntl.h",
        "fcntl.h",          // fcntl
        "fcntl-linux.h",    // FD_*

        // macOS
        "_s_ifmt.h", // S_IF*

        // Linux
        "sys/stat.h",
        "stat.h",
        "ioctls.h",         // SIO*
        "eventfd.h",        // EFD_*
        "timerfd.h",        // TFD_*
        "signalfd.h",       // SFD_*
    );
    array_add(*options.system_types_to_include,
        "fpos_t",
        "ftello64",
        "_filesec",
        "filesec_t",
        "O_SYNC",
    );

    if os == .LINUX {
        array_add(*options.system_types_to_include,
            // for fpos_t:
            "_G_fpos_t",
            "_G_fpos64_t",
            "__mbstate_t",
            "_IO_cookie_io_functions_t", // fopencookie
        );

        if cpu == .ARM64 {
            array_add(*options.system_types_to_include,
                "cookie_close_function_t",
                "cookie_io_functions_t",
                "cookie_read_function_t",
                "cookie_seek_function_t",
                "cookie_write_function_t",
            );
        }
    }
    #if ENABLE_GNU_SOURCE {
        array_add(*options.system_types_to_include,
            "__io_read_fn",
            "__io_write_fn",
            "__io_seek_fn",
            "__io_close_fn",
        );
    }

    options.visitor = stdio_visitor;
    if os == {
        case .LINUX;
            options.footer = sprint(
                STDIO_LINUX_FOOTER_TEMPLATE,
                ENABLE_GNU_SOURCE,
                ifx cpu == .ARM64 then "" else STDIO_LINUX_FOOTER_SYSCALL_WRAPPERS,
            );
        case .MACOS; options.footer = STDIO_MACOS_FOOTER;
    }

    return generate_bindings(options, output_path);
}

STDIO_LINUX_FOOTER_TEMPLATE :: #string END

USE_GNU :: %;

#scope_export

FILE :: _IO_FILE;
_IO_FILE :: struct {};

#if !USE_GNU {
ftello64 :: ftello;
}

%

END

STDIO_LINUX_FOOTER_SYSCALL_WRAPPERS :: #string END

// for some reason a handfull of syscalls on Linux arent available in libc.so by default
// (they exist as a static link in) so we need to wrap syscall for these to work...
stat  :: (path: *u8, buf: *stat_t) -> s64 { return syscall(SYS_stat, path, buf); }
fstat :: (fd:   s32, buf: *stat_t) -> s64 { return syscall(SYS_fstat, fd, buf); }
lstat :: (path: *u8, buf: *stat_t) -> s64 { return syscall(SYS_lstat, path, buf); }

END

STDIO_MACOS_FOOTER :: #string END

#scope_export

FILE :: struct {};

ftello64 :: ftello;

END

stdio_visitor :: (decl: *Declaration, parent_decl: *Declaration) -> Declaration_Visit_Result {
    if !parent_decl {
        //
        // Fix stdin/-out/-err on macOS. They are declared as macro renames there.
        //
        if decl.kind == .DECLARATION && begins_with(decl.name, "__std") { // __stdinp => stdin, etc.
            decl.output_name = advance(decl.name, 2);
            assert(decl.output_name[decl.output_name.count - 1] == #char "p");
            decl.output_name.count -= 1;
            return .STOP;
        }
        if decl.kind == .MACRO_DEFINITION && (decl.name == "stdin" || decl.name == "stdout" || decl.name == "stderr") {
            decl.decl_flags |= .OMIT_FROM_OUTPUT;
            return .STOP;
        }

        // ARM64 hack: x64 Linux bindings don't include vsnprintf and friends, so I won't here.
        if decl.kind == .FUNCTION &&
           ( ( starts_with(decl.name, "v") &&
               ( ends_with(decl.name, "printf") || ends_with(decl.name, "scanf") ) ) ||
             contains(decl.name, "vprintf") )
        {
            decl.decl_flags |= .OMIT_FROM_OUTPUT;
            return .STOP;
        }
    } else {
        // Rename the members of stat_t to be the same on all platforms, just to reduce the number of "#if OS" clauses needed
        if parent_decl.kind == .STRUCT && (parent_decl.output_name == "stat_t" || parent_decl.output_name == "stat64_t") {
            // macOS: *timespec -> *time
            if ends_with(decl.output_name, "timespec") {
                decl.output_name.count -= 4;
            }
            // Linux / Android: *tim -> *time
            if ends_with(decl.output_name, "tim") {
                decl.output_name = sprint("%e", decl.output_name);
            }
            return .STOP;
        }
    }

    return posix_visitor(decl, parent_decl);
}


generate_stdlib_bindings :: (os: Operating_System_Tag, cpu: CPU_Tag, bindings_directory: string) -> bool {
    output_path := tprint("%/stdlib.jai", bindings_directory);
    options := get_common_options(os, cpu);

    libc_path := posix_get_libc_paths(os, cpu);

    array_add(*options.source_files,
        tprint("%/stdlib.h", libc_path),
        tprint("%/unistd.h", libc_path), // For mktemp stuff on macOS
    );

    options.visitor = stdlib_visitor;

    return generate_bindings(options, output_path);
}

STDLIB_DECLARATIONS :: string.[
    // We’re very selective here to avoid bloating the module even more.
    // Feel free to change this list if you need more stuff.
    "getenv",
    "setenv",
    "unsetenv",
    "realpath",
    "system",

    // mktemp variants
    "mktemp",
    "mkdtemp",
    "mkpath_np",
    "mkpathat_np",
    "mkstemp",
    "mkstemps",
    "mktemp",
    "mkostemp",
    "mkostemps",
    "mkstemp_dprotected_np",
    "mkdtempat_np",
    "mkstempsat_np",
    "mkostempsat_np",
];

stdlib_visitor :: (decl: *Declaration, parent_decl: *Declaration) -> Declaration_Visit_Result {
    if !parent_decl {
        if !array_find(STDLIB_DECLARATIONS, decl.name) {
            decl.decl_flags |= .OMIT_FROM_OUTPUT;
            return .STOP;
        }
    }

    return posix_visitor(decl, parent_decl);
}

generate_syscall_bindings :: (os: Operating_System_Tag, cpu: CPU_Tag, bindings_directory: string) -> bool {
    output_path := tprint("%/syscall.jai", bindings_directory);
    options := get_common_options(os, cpu);

    libc_path, libc_platform_path := posix_get_libc_paths(os, cpu);
    sys_path := ifx os == .LINUX && cpu == CPU then libc_platform_path else libc_path;

    array_add(*options.source_files,
        tprint("%/unistd.h", libc_path), // for syscall()
        tprint("%/sys/syscall.h", sys_path),
    );
    array_add(*options.path_fragments_to_treat_as_non_system_paths,
        "unistd", // __NR_* that all the SYS_* macros are based on. We’ll unwrap and hide them below.
        "syscall.h", // SYS_*

        // Android:
        "syscalls.h",
    );

    array_add(*options.macro_prefixes_to_unwrap, "__NR");

    options.visitor = syscall_visitor;

    return generate_bindings(options, output_path);
}

syscall_visitor :: (decl: *Declaration, parent_decl: *Declaration) -> Declaration_Visit_Result {
    if !parent_decl && decl.name != "syscall" && !begins_with(decl.name, "SYS") {
        decl.decl_flags |= .OMIT_FROM_OUTPUT;
        return .STOP;
    }

    return posix_visitor(decl, parent_decl);
}


generate_pthread_bindings :: (os: Operating_System_Tag, cpu: CPU_Tag, bindings_directory: string) -> bool {
    output_path := tprint("%/pthread.jai", bindings_directory);
    options := get_common_options(os, cpu);

    if os == .LINUX {
        array_insert_at(*options.system_library_names, "libpthread.so.0", 0);

        if cpu == .ARM64 {
            array_add(
                *options.system_library_paths,
                tprint("%/aarch64-linux-gnu/libc/lib64", cross_compiler_sysroot),
            );
        }
    }

    libc_path := posix_get_libc_paths(os, cpu);

    array_add(*options.source_files,
        tprint("%/pthread.h",   libc_path),
        tprint("%/semaphore.h", libc_path),
        tprint("%/setjmp.h",    libc_path), // On Ubuntu 18.04 we need this file to get __sigset_t.
    );

    if os == .MACOS {
        // This isn't technically part of pthreads but it's most useful for threading and doesn't fit elsewhere yet
        array_add(*options.source_files,
            tprint("%/sys/qos.h",              libc_path), // required for pthread/qos.h
            tprint("%/pthread/pthread_spis.h", libc_path),
        );
    }

    array_add(*options.path_fragments_to_treat_as_non_system_paths,
        "pthread.h",
        "sched.h",
        // Linux
        "bits/pthreadtypes.h",
        "bits/setjmp.h",
        "bits/struct_mutex.h",
        "bits/struct_rwlock.h",
        "bits/thread-shared-types.h",
        "bits/types/__sigset_t.h",
        "bits/types/struct___jmp_buf_tag.h",
        "bits/types/struct_sched_param.h",
        // Android
        "bits/pthread_types.h",
        // macOS
        "_pthread_attr_t.h",
        "_pthread_cond_t.h",
        "_pthread_condattr_t.h",
        "_pthread_key_t.h",
        "_pthread_mutex_t.h",
        "_pthread_mutexattr_t.h",
        "_pthread_once_t.h",
        "_pthread_rwlock_t.h",
        "_pthread_rwlockattr_t.h",
        "_pthread_t.h",
        "_pthread_types.h",
        "qos.h",
        "pthread_spis.h",
    );
    #if ENABLE_GNU_SOURCE {
        array_add(*options.path_fragments_to_treat_as_non_system_paths,
            "cpu-set.h",
        );
    }
    array_add(*options.system_types_to_include,
        "__darwin_id_t",
        "qos_class_t",
        "__pthread_rwlock_arch_t",
        "sem_t",
    );
    options.visitor = pthread_visitor;

    return generate_bindings(options, output_path);
}

PTHREAD_DECLARATIONS_TO_OMIT :: string.[
    "pid_t", // Should be part of base.jai

    // Deprecated
    "pthread_yield",
    // Not available on some popular linuxes:
    "pthread_mutex_consistent_np",
    "pthread_mutexattr_getrobust_np",
    "pthread_mutexattr_setrobust_np",
];

pthread_visitor :: (decl: *Declaration, parent_decl: *Declaration) -> Declaration_Visit_Result {
    if !parent_decl {
        if array_find(PTHREAD_DECLARATIONS_TO_OMIT, decl.name) {
            decl.decl_flags |= .OMIT_FROM_OUTPUT;
            return .STOP;
        }
    }

    return posix_visitor(decl, parent_decl);
}

generate_resource_bindings :: (os: Operating_System_Tag, cpu: CPU_Tag, bindings_directory: string) -> bool {
    output_path := tprint("%/resource.jai", bindings_directory);
    options := get_common_options(os, cpu);

    libc_path, libc_platform_path := posix_get_libc_paths(os, cpu);
    if os == .LINUX && cpu == CPU {
        array_add(*options.source_files, tprint("%/sys/resource.h", libc_platform_path));
    } else {
        array_add(*options.source_files, tprint("%/sys/resource.h", libc_path));
    }

    array_add(*options.path_fragments_to_treat_as_non_system_paths,
        "/resource.h",
         // Linux
        "struct_rusage.h",
    );
    array_add(*options.system_types_to_include,
        "id_t",
        "__id_t",
        "__rlim_t",
        // "RLIM_INFINITY",
        // "RLIM_SAVED_MAX",
        // "RLIM_SAVED_CUR",
    );
    array_add(*options.generate_enums_from_macros_with_prefixes,
        "RUSAGE_INFO_",
        "RUSAGE_", // To give macOS the same API as Linux
    );

    array_add(*options.typedef_prefixes_to_unwrap, "__syscall_");

    options.convert_macro_value_to_enum_callback = (decl: *Declaration) -> string {
        if begins_with(decl.name, "PRIO_") && decl.name != "PRIO_MIN" && decl.name != "PRIO_MAX" {
            return "PRIO";
        }
        RLIMIT_BLACKLIST :: string.["RLIMIT_WAKEUPS_MONITOR", "RLIMIT_CPU_USAGE_MONITOR", "RLIMIT_THREAD_CPULIMITS", "RLIMIT_FOOTPRINT_INTERVAL"];
        if begins_with(decl.name, "RLIMIT_") && !array_find(RLIMIT_BLACKLIST, decl.name) {
            return "RLIMIT";
        }

        return "";
    };

    // We replace all the function argument types, so I feel less bad if the original enum names are not present
    // because you see the enum in the function arguments. And it avoids a lot of generated noise.
    //  -rluba, 2024-02-13
    options.alias_original_enum_names = false;

    options.visitor = resource_visitor;

    return generate_bindings(options, output_path);
}

resource_visitor :: (decl: *Declaration, parent_decl: *Declaration) -> Declaration_Visit_Result {
    if !parent_decl {
        // Update linux enum names to match their values & the enums generated for other platforms
        if decl.name == "__priority_which" {
            decl.output_name = "PRIO";
            return .STOP;
        }
        if decl.name == "__rusage_who" {
            decl.output_name = "RUSAGE";
            return .STOP;
        }
        if decl.name == "__rlimit_resource" {
            decl.output_name = "RLIMIT_RESOURCE";
            return .STOP;
        }


        // Remove int typedefs that should be enums
        if decl.name == "__priority_which_t" || decl.name == "__rusage_who_t" || decl.name == "__rlimit_resource_t" {
            decl.decl_flags |= .OMIT_FROM_OUTPUT;
            return .STOP;
        }

        if decl.kind == .ENUM && (decl.name == "PRIO" || decl.name == "RLIMIT" || decl.name == "RUSAGE") {
            decl.type = context.generator.type_def_s32;
            if decl.name == "RLIMIT" decl.output_name = "RLIMIT_RESOURCE";
            return .STOP;
        }

        if decl.kind == .FUNCTION {
            function_type := decl.type.type_of_function;
            if decl.name == "getpriority" || decl.name == "setpriority" {
                assert(function_type.arguments.count >= 2);
                change_type_to_enum(function_type.arguments[0], "PRIO");
                return .STOP;
            }
            if decl.name == "getrlimit" || decl.name == "setrlimit" || decl.name == "getrlimit64" || decl.name == "setrlimit64" {
                assert(function_type.arguments.count == 2);
                change_type_to_enum(function_type.arguments[0], "RLIMIT_RESOURCE");
                return .STOP;
            }
            if decl.name == "prlimit" || decl.name == "prlimit64" {
                assert(function_type.arguments.count == 4);
                change_type_to_enum(function_type.arguments[1], "RLIMIT_RESOURCE");
                return .STOP;
            }
            if decl.name == "getrusage" {
                assert(function_type.arguments.count == 2);
                change_type_to_enum(function_type.arguments[0], "RUSAGE");
                return .STOP;
            }
        }
    }

    return posix_visitor(decl, parent_decl);
}

generate_sysctl_bindings :: (os: Operating_System_Tag, cpu: CPU_Tag, bindings_directory: string) -> bool {
    HEADER :: #string END

    ucred :: struct {}
    END

    if os != .MACOS {
        return true; // We don’t care about sysctl anywhere else atm
    }

    output_path := tprint("%/sysctl.jai", bindings_directory);
    options := get_common_options(os, cpu);

    libc_path := posix_get_libc_paths(os, cpu);
    array_add(*options.source_files, tprint("%/sys/sysctl.h", libc_path));

    array_add(*options.system_types_to_include, "extern_proc", "P_TRACED", "pgrp", "session", "proc", "vmspace");
    options.header = HEADER;

    return generate_bindings(options, output_path);
}

get_common_options :: (os: Operating_System_Tag, cpu: CPU_Tag) -> Generate_Bindings_Options {
    options: Generate_Bindings_Options;
    options.os  = os;
    options.cpu = cpu;

    if os == .LINUX {
        array_add(*options.system_library_names, "libc.so.6");
    } else {
        array_add(*options.system_library_names, "libc");
    }

    array_add(*options.extra_clang_arguments,
        "-x", "c",
        // Disable some warnings we don’t care about
        "-Wno-nullability-completeness",
        "-Wno-expansion-to-defined",
    );

    if os == {
        case .LINUX;
            #if ENABLE_GNU_SOURCE {
                array_add(*options.extra_clang_arguments, "-D_GNU_SOURCE");
            }

            if cpu == .ARM64 {
                array_add(*options.extra_clang_arguments,
                    "-target", "aarch64-unknown-linux-gnu",
                    "-isysroot", cross_compiler_sysroot,
                );

                libc_path, libc_platform_path := posix_get_libc_paths(os, cpu);
                array_add(
                    *options.system_include_paths,
                    libc_path,
                    libc_platform_path,
                    tprint("%/lib/gcc/aarch64-linux-gnu/14.2.0/include", cross_compiler_sysroot),
                );
                array_add(
                    *options.system_library_paths,
                    tprint("%/lib",                          cross_compiler_sysroot),
                    tprint("%/aarch64-linux-gnu/libc/lib64", cross_compiler_sysroot),
                );
            }
        case .MACOS;
            sdk_path := get_macos_sdk_path();
            build_options := get_build_options(); // @Incomplete: run-time version
            target_triple_with_sdk := get_macos_target_triple(cpu, build_options.minimum_os_version.major, build_options.minimum_os_version.minor);
            array_add(*options.extra_clang_arguments,
                "-target", target_triple_with_sdk,
                "-isysroot", sdk_path,
            );
            array_add(*options.system_library_paths, tprint("%/usr/lib", sdk_path));
        case .ANDROID;
            _, target_triple_with_sdk := get_android_target_triple(cpu);
            paths := get_ndk_paths();
            array_add(*options.extra_clang_arguments,
                "-target", target_triple_with_sdk,
                "--sysroot", paths.sysroot
            );
            #if ENABLE_GNU_SOURCE {
                array_add(*options.extra_clang_arguments, "-D_GNU_SOURCE");
            }
    }

    options.generate_printf_wrappers            = false;
    options.log_stripped_declarations           = false;
    options.generate_compile_time_struct_checks = false;

    options.visitor = posix_visitor;
    options.will_print_bindings = track_already_generated;

    return options;
}

#scope_file

track_already_generated :: () {
    push_allocator(context.default_allocator);
    for decl: context.generator.global_scope.members {
        if decl.decl_flags & .OMIT_FROM_OUTPUT continue;
        table_add(*already_generated, copy_string(decl.output_name), true);
    }
}

DECLARATIONS_TO_OMIT :: string.[
    "__QOS_CLASS_AVAILABLE",
    "__QOS_CLASS_AVAILABLE_STARTING",
    "__sched_priority",
    "__CTERMID_DEFINED",
    "va_list",
];

Type_Replacement :: struct {
    type: string;
    replacement: string;
}
TYPE_REPLACEMENTS_TO_MAKE :: Type_Replacement.[
    .{"__atomic_wide_counter", "u64"},
    .{"__pid_t",               "pid_t"},
    .{"__u64",                 "u64"},
];

// Structs we need to rename because they clash with functions of the same name
STRUCTS_TO_RENAME :: string.[
    "sigaction",
    "sigaction64",
    "stat",
    "stat64",
    "statx",
    "sigaltstack",
    "wait",
];

posix_visitor :: (decl: *Declaration, parent_decl: *Declaration) -> Declaration_Visit_Result {
    // Get rid of all the "<name> :: __darwin_<name>" and "__darwin_<name> :: _opague_<name>" indirections
    if decl.kind == .TYPEDEF {
        typedef := cast (*Typedef) decl;
        target_name := get_type_name(typedef.type);
        if begins_with(target_name, "__darwin") || begins_with(target_name, "__opaque") {
            decl.decl_flags |= .OMIT_FROM_OUTPUT;
            while typedef.type.type_of_typedef {
                typedef.type.type_of_typedef.output_name = decl.output_name;
                if !(decl.decl_flags & .OMIT_FROM_OUTPUT)   break;
                typedef = typedef.type.type_of_typedef;
            }

            if typedef.type.type_of_struct {
                typedef.type.type_of_struct.output_name = decl.output_name;
            }
        }
    }

    if !parent_decl {
        if array_find(DECLARATIONS_TO_OMIT, decl.name) {
            decl.decl_flags |= .OMIT_FROM_OUTPUT;
            return .STOP;
        }
        if decl.kind == .DECLARATION && decl.name == "timezone" {
            decl.decl_flags |= .OMIT_FROM_OUTPUT; // avoid a nameclash between a global and a struct name.
            return .STOP;
        }

        if table_find_pointer(*already_generated, decl.output_name) {
            decl.decl_flags |= .OMIT_FROM_OUTPUT;
            return .STOP;
        }

        if decl.kind == .TYPEDEF {
            for TYPE_REPLACEMENTS_TO_MAKE if decl.name == it.type {
                decl.output_name = it.replacement;
                decl.decl_flags |= .OMIT_FROM_OUTPUT;
                return .STOP;
            }
        }

        // Avoid name conflict between function and struct types
        if decl.kind == .STRUCT && array_find(STRUCTS_TO_RENAME, decl.name) {
            decl.output_name = tprint("%_t", decl.name);
            return .RECURSE;
        }
    }

    return .RECURSE;
}

posix_get_libc_paths :: (os := OS, cpu := CPU) -> libc_path: string, libc_platform_path: string, success: bool {
    libc_path, libc_platform_path: string;
    success: bool;

    if cpu == .ARM64 && CPU != cpu {
        libc_path          = tprint("%/aarch64-linux-gnu/libc/usr/include/", cross_compiler_sysroot);
        libc_platform_path = tprint("%/aarch64-linux-gnu/include",           cross_compiler_sysroot);
        success = true;
    }
    else {
        libc_path, libc_platform_path, success = get_libc_paths(os, cpu);
    }

    return libc_path, libc_platform_path, success;
}

#import "Toolchains/Android";
#import "Toolchains/macOS";
#import "Basic";
#import "Bindings_Generator";
#import "Compiler";
#import "File";
#import "String";
#import "Hash_Table";
