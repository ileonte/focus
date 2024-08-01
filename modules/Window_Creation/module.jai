// Platform-independent window creation routines.

#if OS == .WINDOWS {
    #load "windows.jai";
} else #if OS == .LINUX {
    #load "linux.jai";
} else #if OS == .MACOS {
    #load "osx.jai";
}

#scope_module

#import "Basic";

DEFAULT_WINDOW_CREATION_COLOR :: float.[.15,.15,.2];

#scope_export

// @CompilerBug: There is some kind of name importation problem that keeps happening,
// for example, Window_Type doesn't go through unless we do this weird WT thing.
// -jblow, 25 February 2021
WT :: #import "Window_Type";  // Define this for the people.
Window_Type :: WT.Window_Type;
INVALID_WINDOW :: WT.INVALID_WINDOW;

Point :: struct {
    x, y: s32;
}

Rect :: struct {
    x, y: s32;
    w, h: s32;
}

rect_is_valid :: inline (r: Rect) -> bool #c_call {
    return r.w > 0 && r.h > 0;
}

point_in_rectangle :: inline (x: s32, y: s32, r: Rect) -> bool #c_call {
    return rect_is_valid(r) && x >= r.x && x < (r.x + r.w) && y >= r.y && y < (r.y + r.h);
}

point_in_rectangle :: inline (p: Point, r: Rect) -> bool #c_call {
    return point_in_rectangle(p.x, p.y, r);
}

