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


Rect :: struct {
    x, y: s32;
    w, h: s32;
}

/*
 * Same semantics as `NCCALCSIZE_PARAMS::rgrc` as described in:
 *   https://learn.microsoft.com/en-us/windows/win32/api/winuser/ns-winuser-nccalcsize_params
 */
Calc_Size_Params :: struct {
    rects: [3]Rect;
}
Calc_Size_Callback :: #type (window: Window_Type, client_area_in: Rect, data: *void) -> (calculated_client_area: Rect, calculated_window_area: Rect);

Hit_Test_Result :: enum {
    None;
    Client_Area;
    Window_Title;
    Resize_NW;
    Resize_N;
    Resize_NE;
    Resize_E;
    Resize_SE;
    Resize_S;
    Resize_SW;
    Resize_W;
}
Hit_Test_Callback :: #type (window: Window_Type, x: s32, y: s32, data: *void) -> Hit_Test_Result;

Client_Side_Decorations_Params :: struct {
    calc_size_cb: Calc_Size_Callback;
    calc_size_data: *void;

    hit_test_cb: Hit_Test_Callback;
    hit_test_data: *void;
}
