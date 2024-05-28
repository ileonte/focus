linux_handle_cross_compile_link :: (w: Workspace, m: *Message_Phase) {
    cwd     := get_working_directory();
    objdir  := tprint("%/.build", cwd);
    sysroot := tprint("%/src/platform/linux/aarch64-minimal-dist", cwd);
    libdir  := tprint("%/lib/aarch64-linux-gnu", sysroot);
    options := get_build_options(w);
    target_filename := tprint("%1/%2-aarch64", options.output_path, options.output_executable_name);
    missing_sym: string;

    arguments: [..] string;

    /*
     * Some bullshit
     */
    array_add(*arguments, "/bin/sh", "-c", tprint("nm % | grep  'U allocator_proc_'", get_quoted_command_string(m.compiler_generated_object_files)));
    print("Running: %\n", get_quoted_command_string(arguments));
    process_result, output := run_command(..arguments, capture_and_return_output = true);
    if process_result.exit_code != 0 {
        compiler_report(tprint("Error: Link step failed! (Exit code %).\n", process_result.exit_code));
    }

    lines := split(output, "\n");

    table: Table(string, int);
    init(*table);
    defer deinit(*table);

    for lines {
        if !trim(it) continue;
        p := table_find_pointer(*table, it);
        if p {
            p.* += 1;
        } else {
            table_add(*table, it, 1);
        }
    }
    for table {
        if it == 1 {
            missing_sym = trim_left(it_index, " UT");
            break;
        }
    }

    array_reset(*arguments);
    array_add(*arguments, tprint("%/bin/lld-linux", compiler_get_base_path()));
    array_add(*arguments, "-flavor", "Gnu");
    array_add(*arguments, "--export-dynamic");
    array_add(*arguments, "--eh-frame-hdr");
    array_add(*arguments, "--nostdlib");
    array_add(*arguments, "--dynamic-linker", "/lib/ld-linux-aarch64.so.1");
    array_add(*arguments, "--as-needed");
    array_add(*arguments, tprint("--sysroot=%", sysroot));
    array_add(*arguments, "-L", libdir);
    array_add(*arguments, tprint("-o%", target_filename));

    for m.compiler_generated_object_files array_add(*arguments, it);
    array_add(*arguments, tprint("%/crt1.o", libdir));
    array_add(*arguments, tprint("%/crti.o", libdir));
    array_add(*arguments, tprint("%/crtn.o", libdir));

    for m.system_libraries {
        lib := it;
        path, basename, extension, filename := path_decomp(lib);

        if extension == "so" {
            if starts_with(basename, "lib") {
                advance(*basename, 3);
                lib = tprint("-l%", basename);
            } else {
                lib = tprint("%.a", basename);
            }
            array_add(*arguments, lib);
        }
    }
    array_add(*arguments, "-ldl", "-lpthread");

    for m.user_libraries {
        lib := it;
        path, basename, extension, filename := path_decomp(lib);
        if extension == "a" {
            if basename == {
                case "stb_image"; lib = "-lstb_image";
                case "freetype"; lib = "-lfreetype";
            }
        }
        array_add(*arguments, lib);
    }

    if missing_sym array_add(*arguments, "--defsym", tprint("%=0", missing_sym));

    print("Running AArch64 cross-compile link command: %\n", get_quoted_command_string(arguments));
    process_result = run_command(..arguments);
    if process_result.exit_code != 0 {
        compiler_report(tprint("Error: Link step failed! (Exit code %).\n", process_result.exit_code));
    }

    compiler_custom_link_command_is_complete(w);
}

#scope_file
#import "Hash_Table";
