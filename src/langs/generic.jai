generic_highlighter_can_handle :: (extension: string) -> bool {
    return extension == "lua";
}

generic_highlighter_highlight :: (using buffer: *Buffer) {
    if !number_re_ok {
        number_re, number_re_ok = RE.compile(trim(NUMBER_RE_STR));
        assert(number_re_ok);

        reg := GH.get_registry();
        print("REGISTRY: %\n", reg);
    }

    memset(colors.data, xx Code_Color.DEFAULT, colors.count);

    base := 0;
    text := to_string(bytes.data, bytes.count);
    while text.count > 0 {
        matched, matches := RE.match(text, number_re);
        if !matched break;

        print("MATCHES: %\n", matches);

        memset(colors.data + base + matches[0].start, xx Code_Color.ERROR, matches[0].slice.count);
        base += matches[0].end;
        text  = advance(text, matches[0].end);
        array_free(matches);
    }
}

#no_reset bla_lang_name :: "bla name";
#no_reset bla_lang :: GH.Highlighter_Language.{
    name = bla_lang_name
};
#run GH.register_language(bla_lang);

// #run GH.register_language(.{"borp!"});

#scope_file
RE :: #import "uniform";
GH :: #import "Generic_Highlighter";

number_re_ok: bool;
number_re: RE.Regexp;

NUMBER_RE_STR :: #string END
(?:0[xX](?:\.[0-9A-Fa-f]+|[0-9A-Fa-f]+\.?[0-9A-Fa-f]*)(?:[pP][-+]?\d*)?|(?:\.\d+|\d+\.?\d*)(?:[eE][-+]?\d*)?)
END
