CSD_Data :: struct {
    enabled := false;

    border_size: s32 = 12;

    title_bar_height: s32;
    title_bar_margin: s32;
    title_bar_padding: s32;

    draw_area: Rect;     // includes the title bar area (essentially client_area + title_area)
    client_area: Rect;   // the actual editor area
    title_area: Rect;
    resize_NW: Rect;
    resize_N: Rect;
    resize_NE: Rect;
    resize_E: Rect;
    resize_SE: Rect;
    resize_S: Rect;
    resize_SW: Rect;
    resize_W: Rect;

    client_area_win: Rect;  // client area in window coordinates
    title_area_win: Rect;   // title area in window coordinates
}
CSD: CSD_Data;

recalculate_rects :: (new_width: int, new_height: int) {
    using CSD;

    if !enabled {
        screen = make_rect(0, 0, new_width, new_height);
        return;
    }

    draw_area = make_rect(border_size, border_size, new_width, new_height);
    screen = expand(draw_area, xx border_size);

    title_bar_margin = xx floor(8 * dpi_scale);
    title_bar_padding = xx floor(4 * dpi_scale);
    title_bar_height = xx floor(font_ui_line_height + 2 * title_bar_margin + 2 * title_bar_padding + 2);
    title_area, client_area = cut_top(draw_area, xx title_bar_height);
    title_area_win = gl_to_window_rect(title_area, draw_area);
    client_area_win = gl_to_window_rect(client_area, draw_area);

    log("title_area=% title_area_win=%", title_area, title_area_win);
    log("client_area=% client_area_win=%", client_area, client_area_win);

    max_x := new_width + border_size;
    max_y := new_height + border_size;
    resize_NW = make_rect(0, 0, border_size, border_size);
    resize_N  = make_rect(border_size, 0, new_width, border_size);
    resize_NE = make_rect(max_x, 0, border_size, border_size);
    resize_E  = make_rect(max_x, border_size, border_size, new_height);
    resize_SE = make_rect(max_x, max_y, border_size, border_size);
    resize_S  = make_rect(border_size, max_y, new_width, border_size);
    resize_SW = make_rect(0, max_y, border_size, border_size);
    resize_W  = make_rect(0, border_size, border_size, new_height);
}

#scope_file

gl_to_window_rect :: inline (r: Rect, parent: Rect) -> Rect {
    ret := r;
    ret.y = parent.y + xx (parent.h + parent.y - xx floor(ret.y));
    return ret;
}
