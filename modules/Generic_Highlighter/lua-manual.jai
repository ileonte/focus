lua_get_definition :: () -> *Highlighter_Language {
    if !lua_lang.name {
        using lua_lang;

        name = "Lua";

        init(*lists);
        table_add(*lists, list_keywords.name, list_keywords);
        table_add(*lists, list_specialvars.name, list_specialvars);
        table_add(*lists, list_control.name, list_control);
        table_add(*lists, list_startcontrol.name, list_startcontrol);
        table_add(*lists, list_endcontrol.name, list_endcontrol);
        table_add(*lists, list_elsecontrol.name, list_elsecontrol);
        table_add(*lists, list_basefunc.name, list_basefunc);
        table_add(*lists, list_basevar.name, list_basevar);
        table_add(*lists, list_startcontrol.name, list_startcontrol);
        table_add(*lists, list_metamethod.name, list_metamethod);
        table_add(*lists, list_deprecated.name, list_deprecated);

        {
            ctx := Highlight_Context.{
                name = "ShebangLine",
                attribute = 1, // Code_Color.COMMENT
                line_end_actions = .[.{value = .Pop}],
            };
            table_add(*contexts, ctx.name, ctx);
        }

        {
            ctx := Highlight_Context.{
                name = "Normal",
                attribute = 0, // Code_Color.DEFAULT
                line_end_actions = .[.{value = .Stay}],
            };

            rule: Highlight_Rule;
            set(*rule, Rule_Detect2Chars.{
                attribute = 1,
                ctx = table_find_pointer(*contexts, "ShebangLine"),
                column = 0,
                char1 = #char "#",
                char2 = #char "!",
            });
            assert(isa(rule, Rule_Detect2Chars).ctx != null);
            array_add(*ctx.rules, rule);

            table_add(*contexts, ctx.name, ctx);
        }

        entrypoint = table_find_pointer(*contexts, "Normal");
        assert(entrypoint != null);
    }
    return *lua_lang;
}

#scope_file
lua_lang: Highlighter_Language;

list_keywords :: Item_List.{
    name = "keywords",
    values = .[
        "and",
        "function",
        "in",
        "local",
        "not",
        "or",
    ]
};

list_specialvars :: Item_List.{
    name = "specialvars",
    values = .[
        "nil",
        "false",
        "true",
    ]
};

list_control :: Item_List.{
    name = "control",
    values = .[
        "break",
        "do",
        "else",
        "elseif",
        "end",
        "for",
        "goto",
        "if",
        "repeat",
        "return",
        "then",
        "until",
        "while",
    ]
};

list_startcontrol :: Item_List.{
    name = "startcontrol",
    values = .[
        "do",
        "if",
        "repeat",
    ]
};

list_elsecontrol :: Item_List.{
    name = "elsecontrol",
    values = .[
        "else",
        "elseif",
    ]
};

list_endcontrol :: Item_List.{
    name = "endcontrol",
    values = .[
        "end",
        "until",
    ]
};

list_basevar :: Item_List.{
    name = "basevar",
    values = .[
        "_PROMPT",
        "_PROMPT2",
        "LUA_PATH",
        "LUA_CPATH",
        "LUA_INIT",
        "_ENV",
        "_VERSION",
        "_G",
        "package.config",
        "package.cpath",
        "package.loaded",
        "package.path",
        "package.preload",
        "package.searchers",
        "utf8.charpattern",
        "math.maxinteger",
        "math.mininteger",
        "math.pi",
    ]
};

list_basefunc :: Item_List.{
    name = "basefunc",
    values = .[
        "assert",
        "collectgarbage",
        "dofile",
        "error",
        "getmetatable",
        "ipairs",
        "load",
        "loadfile",
        "next",
        "pairs",
        "pcall",
        "print",
        "rawequal",
        "rawget",
        "rawlen",
        "rawset",
        "select",
        "setmetatable",
        "tonumber",
        "tostring",
        "type",
        "warn",
        "xpcall",
        "coroutine.create",
        "coroutine.isyieldable",
        "coroutine.resume",
        "coroutine.close",
        "coroutine.running",
        "coroutine.status",
        "coroutine.wrap",
        "coroutine.yield",
        "require",
        "package.loadlib",
        "package.searchpath",
        "string.byte",
        "string.char",
        "string.dump",
        "string.find",
        "string.format",
        "string.gmatch",
        "string.gsub",
        "string.len",
        "string.lower",
        "string.match",
        "string.pack",
        "string.packsize",
        "string.rep",
        "string.reverse",
        "string.sub",
        "string.unpack",
        "string.upper",
        "utf8.char",
        "utf8.codes",
        "utf8.codepoint",
        "utf8.len",
        "utf8.offset",
        "table.concat",
        "table.insert",
        "table.move",
        "table.pack",
        "table.remove",
        "table.sort",
        "table.unpack",
        "math.abs",
        "math.acos",
        "math.asin",
        "math.atan",
        "math.ceil",
        "math.cos",
        "math.deg",
        "math.exp",
        "math.floor",
        "math.fmod",
        "math.huge",
        "math.log",
        "math.max",
        "math.min",
        "math.modf",
        "math.rad",
        "math.random",
        "math.randomseed",
        "math.sin",
        "math.sqrt",
        "math.tan",
        "math.tointeger",
        "math.type",
        "math.utl",
        "io.close",
        "io.flush",
        "io.input",
        "io.lines",
        "io.open",
        "io.output",
        "io.popen",
        "io.read",
        "io.stderr",
        "io.stdin",
        "io.stdout",
        "io.tmpfile",
        "io.type",
        "io.write",
        "os.clock",
        "os.date",
        "os.difftime",
        "os.execute",
        "os.exit",
        "os.getenv",
        "os.remove",
        "os.rename",
        "os.setlocale",
        "os.time",
        "os.tmpname",
        "debug.debug",
        "debug.gethook",
        "debug.getinfo",
        "debug.getlocal",
        "debug.getmetatable",
        "debug.getregistry",
        "debug.getupvalue",
        "debug.getuservalue",
        "debug.sethook",
        "debug.setlocal",
        "debug.setmetatable",
        "debug.setupvalue",
        "debug.setuservalue",
        "debug.traceback",
        "debug.upvalueid",
        "debug.upvaluejoin",
        "cgilua",
        "cgilua.addclosefunction",
        "cgilua.addopenfunction",
        "cgilua.addopenfunction",
        "cgilua.addscripthandler",
        "cgilua.addscripthandler",
        "cgilua.buildprocesshandler",
        "cgilua.contentheader",
        "cgilua.cookies.delete",
        "cgilua.cookies.get",
        "cgilua.cookies.set",
        "cgilua.cookies.sethtml",
        "cgilua.cookies",
        "cgilua.doif",
        "cgilua.doscript",
        "cgilua.errorlog",
        "cgilua.handlelp",
        "cgilua.header",
        "cgilua.htmlheader",
        "cgilua.lp.compile",
        "cgilua.lp.include",
        "cgilua.lp.setcompatmode",
        "cgilua.lp.setoutfunc",
        "cgilua.lp.translate",
        "cgilua.mkabsoluteurl",
        "cgilua.mkurlpath",
        "cgilua.pack",
        "cgilua.put",
        "cgilua.redirect",
        "cgilua.script_file",
        "cgilua.script_path",
        "cgilua.script_pdir",
        "cgilua.script_vdir",
        "cgilua.script_vpath",
        "cgilua.serialize",
        "cgilua.servervariable",
        "cgilua.session.close",
        "cgilua.session.data",
        "cgilua.session.delete",
        "cgilua.session.load",
        "cgilua.session.new",
        "cgilua.session.open",
        "cgilua.session.save",
        "cgilua.session.setsessiondir",
        "cgilua.session",
        "cgilua.seterrorhandler",
        "cgilua.seterroroutput",
        "cgilua.setmaxfilesize",
        "cgilua.setmaxinput",
        "cgilua.setoutfunc",
        "cgilua.splitpath",
        "cgilua.urlcode.encodetable",
        "cgilua.urlcode.escape",
        "cgilua.urlcode.insertfield",
        "cgilua.urlcode.parsequery",
        "cgilua.urlcode.unescape",
        "cgilua.urlpath",
        "lfs",
        "lfs.attributes",
        "lfs.chdir",
        "lfs.currentdir",
        "lfs.dir",
        "lfs.lock",
        "lfs.mkdir",
        "lfs.rmdir",
        "lfs.touch",
        "lfs.unlock",
        "zip",
        "zip.open",
        "zip.openfile",
        "byte",
        "char",
        "dump",
        "find",
        "format",
        "gmatch",
        "gsub",
        "len",
        "lower",
        "match",
        "pack",
        "packsize",
        "rep",
        "reverse",
        "sub",
        "unpack",
        "upper",
        "concat",
        "insert",
        "move",
        "pack",
        "remove",
        "sort",
        "unpack",
        "close",
        "commit",
        "connect",
        "escape",
        "execute",
        "fetch",
        "getcolnames",
        "getcoltypes",
        "getlastautoid",
        "numrows",
        "rollback",
        "setautocommit",
        "files",
        "close",
        "flush",
        "lines",
        "read",
        "seek",
        "setvbuf",
        "write",
    ]
};

list_metamethod :: Item_List.{
    name = "metamethod",
    values = .[
        "__add",
        "__sub",
        "__mul",
        "__div",
        "__mod",
        "__pow",
        "__unm",
        "__idiv",
        "__band",
        "__bor",
        "__bxor",
        "__bnot",
        "__shl",
        "__shr",
        "__concat",
        "__len",
        "__eq",
        "__lt",
        "__le",
        "__index",
        "__newindex",
        "__call",
        "__tostring",
        "__name",
        "__close",
        "__pairs",
        "__metatable",
        "__gc",
        "__mode",
    ]
};

list_deprecated :: Item_List.{
    name = "deprecated",
    values = .[
        "_ALERT",
        "_ERRORMESSAGE",
        "_LOADED",
        "__ipairs",
        "foreach",
        "foreachi",
        "loadstring",
        "math.atan2",
        "math.cosh",
        "math.frexp",
        "math.ldexp",
        "math.log10",
        "math.mod",
        "math.pow",
        "math.sinh",
        "math.tanh",
        "string.gfind",
        "table.foreach",
        "table.foreachi",
        "table.getn",
        "table.setn",
    ]
};
