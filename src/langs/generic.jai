generic_highlighter_can_handle :: (extension: string) -> bool {
    return extension == "lua";
}

generic_highlighter_highlight :: (buffer: *Buffer) {
    GH.highlight(buffer.bytes, buffer.colors);
}

#scope_file
GH :: #import "Generic_Highlighter";

NUMBER_RE_STR :: #string END
(?:0[xX](?:\.[0-9A-Fa-f]+|[0-9A-Fa-f]+\.?[0-9A-Fa-f]*)(?:[pP][-+]?\d*)?|(?:\.\d+|\d+\.?\d*)(?:[eE][-+]?\d*)?)
END
