// Utility for comparing two sets of (generated) bindings.
// I use it to make sure that the auto-generated POSIX bindings contain
// everything that was previously defined manually – to avoid breaking people’s code when we switch over.
//  -rluba, 2024-02-07

#run {
    set_build_options_dc(.{do_output = false});

    options := get_build_options();
    os := OS;
    cpu := CPU;
    args := options.compile_time_command_line;
    if array_find(args, "-android") {
        os = .ANDROID;
    }
    if array_find(args, "-arm64") {
        cpu = .ARM64;
    }

    success, manual := collect_declarations("Manual", OS, CPU, #string END
        #import "POSIX";
    END);
    if !success return;

    success=, generated := collect_declarations("Generated", os, cpu, #string END
        #import "POSIX";
    END);
    if !success return;

    log("Found % and % declarations", manual.count, generated.count);

    only_manual, only_generated, mismatches, common := diff(manual, generated);
    log("Only manual: %, only generated: %, mismatches: %, common: %", only_manual.count, only_generated.count, mismatches.count, common.count);

    quick_sort(only_manual, (a, b) => compare(a.name, b.name));
    quick_sort(only_generated, (a, b) => compare(a.name, b.name));

    log("\n\nMissing from generated:");
    for only_manual {
        log("%:%: % (%)", get_filename(it), it.l0, it.name, ifx it.expression then it.expression.kind else .UNINITIALIZED);
    }

    // log("\n\nMismatching kinds:");
    // for mismatches {
    //     log("A: %:%: % (%)", get_filename(it.a), it.a.l0, it.a.name, ifx it.a.expression then it.a.expression.kind else .UNINITIALIZED);
    //     log("B: %:%: % (%)", get_filename(it.b), it.b.l0, it.b.name, ifx it.b.expression then it.b.expression.kind else .UNINITIALIZED);
    // }

    if !only_manual {
        log("\n\nOnly in generated:");
        for only_generated {
            log("%:%: % (%)", get_filename(it), it.l0, it.name, ifx it.expression then it.expression.kind else .UNINITIALIZED);
        }
    }
}

IGNORE :: string.[
    "GNU_ENV", // Implementation detail of the old bindings
    "syscall", // Moved to syscall.jai
    // Unwrapped nowadays
    "quad_t",
    "size_t",
    "ssize_t",

    // Used to be two overloads, but is actually defined as varargs:
    "open",
    "openat",
];

IGNORE_PREFIXES :: string.[
    "SYS_", // Moved to syscall.jai
];

IGNORE_MACOS :: string.[
    "__syscall",       // outdated?
    "SIGPOLL",         // not supported?
    "darwin_mmst_reg", // defined in modules/macos as __darwin_mmst_reg
    "greg_t",          // Not used on macOS
    "libexecinfo",     // Library alias
    "librt",           // Library alias

    // (Sub-)structs that have different names on macOS than what they were called in the manual bindings:
    "aiocb_t",         // aiocb
    "attrlist_t",      // attrlist
    "mcontext_t",      // __darwin_mcontext64
    "sigevent_t",      // sigevent
    "sigval_t",        // sigval
    "xmm_reg",         // __darwin_xmm_reg
    "x64_exception_state64_t",
    "x64_float_state64_t",
    "x64_thread_state64_t",


    // Not available in macOS 10.13, only later versions
    "AT_FDONLY",
    "AT_REALDEV",
    "AT_SYMLINK_NOFOLLOW_ANY",
    "O_NOFOLLOW_ANY",
    "SYS___mach_bridge_remote_time",
    "SYS_kqueue_workloop_ctl",
];

collect_declarations :: (name: string, os: Operating_System_Tag, cpu: CPU_Tag, build_string: string) -> success: bool, [] *Code_Declaration {
    w := compiler_create_workspace(name);
    options := get_build_options(w);
    copy_commonly_propagated_fields(get_build_options(), *options);
    options.os_target  = os;
    options.cpu_target = cpu;
    options.output_type = .NO_OUTPUT;
    set_build_options(options, w);

    compiler_begin_intercept(w);
    add_build_string(build_string, w);
    declarations: [..] *Code_Declaration;
    while true {
        message := compiler_wait_for_message();
        if message.kind == {
            case .TYPECHECKED;
                tc := cast(*Message_Typechecked) message;
                for typechecked: tc.declarations {
                    decl := typechecked.expression;
                    filename := get_filename(decl);
                    if !contains(filename, "POSIX") continue;

                    if decl.expression && decl.expression.kind == .DIRECTIVE_LIBRARY continue; // We don’t care what the libraries were named, as long as their functions exist.

                    if !decl.name {
                        log_error("Found declaration without at name at %:%", filename, decl.l0);
                        continue;
                    }

                    if array_find(IGNORE, decl.name) continue;
                    for IGNORE_PREFIXES {
                        if begins_with(decl.name, it) continue typechecked;
                    }
                    if array_find(IGNORE, decl.name) continue;
                    if options.os_target == .MACOS && array_find(IGNORE_MACOS, decl.name) continue;

                    array_add(*declarations, decl);
                }
            case .COMPLETE;
                complete := cast(*Message_Complete) message;
                if complete.error_code != .NONE return false, .[];

                break;
        }
    }
    compiler_end_intercept(w);

    return true, declarations;
}

Declaration_Set :: struct {
    a: *Code_Declaration;
    b: *Code_Declaration;
}

diff :: (a: [] *Code_Declaration, b: [] *Code_Declaration) -> only_a: [] *Code_Declaration, only_b: [] *Code_Declaration, mismatches: [] Declaration_Set, common: [] *Code_Declaration {
    only_a: [..] *Code_Declaration;
    only_b: [..] *Code_Declaration;
    common: [..] *Code_Declaration;
    mismatches: [..] Declaration_Set;

    b_table: Table(string, [..] *Code_Declaration);
    for b {
        declarations := find_or_add(*b_table, it.name);
        array_add(declarations, it);
    }

    for a_decl: a {
        declarations := table_find_pointer(*b_table, a_decl.name);
        if declarations {
            b_decl := (declarations.*)[declarations.count - 1];
            declarations.count -= 1;
            if !declarations.count table_remove(*b_table, a_decl.name);

            if (a_decl.expression == null) != (b_decl.expression == null) || (a_decl.expression && a_decl.expression.kind != b_decl.expression.kind) {
                // Same name, but different types!
                array_add(*mismatches, .{a_decl, b_decl});
            } else {
                array_add(*common, a_decl);
            }
        } else {
            array_add(*only_a, a_decl);
        }
    }

    array_reserve(*only_b, b_table.count);
    for declarations: b_table {
        for declarations {
            array_add(*only_b, it);
        }
    }

    return only_a, only_b, mismatches, common;
}

#import "Basic";
#import "Compiler";
#import "Hash_Table";
#import "Sort";
#import "String";
