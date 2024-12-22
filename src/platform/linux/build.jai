linux_handle_cross_compile_link :: (w: Workspace, m: *Message_Phase) {
    cwd     := get_working_directory();
    objdir  := tprint("%/.build", cwd);
    sysroot := tprint("%/src/platform/linux/aarch64-minimal-dist", cwd);
    libdir  := tprint("%/lib/aarch64-linux-gnu", sysroot);
    options := get_build_options(w);
    target_filename := tprint("%1/%2-aarch64", options.output_path, options.output_executable_name);

    /*
     * When cross-compiling for AArch64, the Linux compiler will generate multiple manglings for
     * `Default_Allocator.allocator_proc` (I don't understand why that function specifically, it
     * just does it consistently). Only one of the manglings is "correct", all the other ones are
     * just unused references that the linker can not resolve.
     *
     * To work-around this problem we parse the object files and record all of the mangled names
     * of `allocator_proc` that can't be resolved. We later add a linker parameter for each of
     * these mangled names to artificially "resolve" that specific reference.
     *
     * - ileonte, 2024.12.23
     */
    missing_syms := find_orphaned_syms(m.compiler_generated_object_files, "allocator_proc");
    if missing_syms print("INFO: Found % orphaned `allocator_proc` mangling%: %\n",
        missing_syms.count,
        ifx missing_syms.count == 1 then "" else "s",
        get_quoted_command_string(missing_syms));

    arguments: [..] string;
    array_add(*arguments, tprint("%/bin/lld-linux", compiler_get_base_path()));
    array_add(*arguments, "-flavor", "Gnu", "-export-dynamic", "--eh-frame-hdr", "--nostdlib", "--as-needed");
    array_add(*arguments, "--dynamic-linker", "/lib/ld-linux-aarch64.so.1");
    array_add(*arguments, tprint("--sysroot=%", sysroot), "-L", libdir, "--dynamic-linker", "/lib/ld-linux-aarch64.so.1");
    array_add(*arguments, "-o", target_filename);

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
            /*
             * We bundle AArch64 versions of FreeType and stb_image in our minimal
             * sysroot, we just have to make sure to tell the linker about them.
             */
            if basename == {
                case "stb_image"; lib = "-lstb_image";
                case "freetype"; lib = "-lfreetype";
            }
        }
        array_add(*arguments, lib);
    }

    for missing_syms  array_add(*arguments, "--defsym", tprint("%=0", it));

    print("Running linker (aarch64-cross): %\n", get_quoted_command_string(arguments));
    process_result := run_command(..arguments);
    if process_result.exit_code != 0 {
        compiler_report(tprint("Error: Link step failed! (Exit code %).\n", process_result.exit_code));
    }

    compiler_custom_link_command_is_complete(w);
}

#scope_file
find_orphaned_syms :: (paths: []string, sym_name: string) -> []string {
    table: Table(string, bool);
    init(*table);
    defer deinit(*table);

    ret: [..]string;

    for path : paths {
        success, elf := parse_elf_file(path);
        if !success continue;

        for elf.symbols {
            type:, name:, success = get_symbol_type_and_name(elf, it, elf.symbol_names);
            if !success continue;

            if !starts_with(name, sym_name) continue;

            p := table_find_pointer(*table, name);
            if p {
                if type != .NOTYPE p.* = true;
            } else {
                table_add(*table, name, type != .NOTYPE);
            }
        }
    }

    for table {
        if !it array_add(*ret, it_index);
    }

    return ret;
}

#import "Hash_Table";
#import "executable_formats";
