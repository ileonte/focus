Highlighter_Language :: struct {
    name: string;
    lists: Table(string, Item_List);
    contexts: Table(string, Highlight_Context);
    entrypoint: *Highlight_Context;
}

highlight :: (bytes: []u8, colors: []u8) {
    lang := lua_get_definition();

    stack: [..]*Highlight_Context;
    array_reserve(*stack, 128);
    array_add(*stack, lang.entrypoint);

    base := 0;
    column := 0;
    while (base < bytes.count) && (stack.count > 0) {
        ctx := stack[stack.count - 1];

        matched, count := context_match(*stack, bytes, base);
        if !matched {
            base += 1;
            continue;
        }

        memset(colors.data + base, ctx.attribute, count);
        base += count;
    }
}

#scope_module

context_match :: (stack: *[..]*Highlight_Context, bytes: []u8, base: int) -> bool, int {
    view : []u8;
    view.data = bytes.data + base;
    view.count = bytes.count - base;

    ctx := stack.data[stack.count - 1];

    for * rule : ctx.rules {
        matched, count := rule_match(rule, view);
        if matched {
            rule_common := cast(*Rule_Common) rule.bytes.data;
            if rule_common.ctx {
                action := Highlight_Context.Line_End_Action.{ .Push, rule_common.ctx };
                v: []Highlight_Context.Line_End_Action;
                v.data = *action;
                v.count = 1;
                context_apply_actions(stack, v);
            }
            if rule_common.look_ahead continue;
            return true, count;
        }
    }

    if ctx.line_end_actions.count > 0 {
        found, pos := array_find(view, #char "\n");
        if found {
            if pos == 0 context_apply_actions(stack, ctx.line_empty_actions);
            else context_apply_actions(stack, ctx.line_end_actions);
        } else {
            pos = view.count - 1;
        }
        return true, pos + 1;
    }

    context_apply_actions(stack, ctx.fallthrough_actions);
    return false, 0;
}

context_apply_actions :: (stack: *[..]*Highlight_Context, actions: []Highlight_Context.Line_End_Action) {
    for action : actions {
        if #complete action.value == {
            case .Stay; {}
            case .Pop; {
                print("POP: %\n", <<stack);
                if stack.count > 0 {
                    stack.count -= 1;
                    return;
                }
            }
            case .Push; {
                array_add(stack, action.ctx);
                print("PUSH: %\n", <<stack);
            }
        }
    }
}

rule_match :: (rule: *Highlight_Rule, bytes: []u8) -> bool, int {
    matched := false;
    count := 0;
    if rule.tag == {
        case Rule_Detect2Chars; matched, count = rule_match(isa(rule, Rule_Detect2Chars), bytes);
    }
    return matched, count;
}

rule_match :: inline (rule: *Rule_Detect2Chars, bytes: []u8) -> bool, int {
    if bytes.count < 2 return false, 0;
    matched := (bytes[0] == rule.char1) && (bytes[1] == rule.char2);
    return matched, 2;
}

Item_List :: struct {
    name: string;
    values: []string;
}

Highlight_Context :: struct {
    name: string;

    attribute: u8;

    Line_End_Action :: struct {
        value: enum {
            Stay;
            Pop;
            Push;
        };
        ctx: *Highlight_Context;
    }
    line_end_actions: []Line_End_Action;
    line_empty_actions: []Line_End_Action;
    fallthrough_actions: []Line_End_Action;

    rules: [..]Highlight_Rule;  // @TODO: should be slice not dynamic array
}

Highlight_Rule :: Tagged_Union(
    Rule_DetectChar,
    Rule_Detect2Chars,
    Rule_DetectSpaces,
    Rule_Keyword,
    Rule_RegExp,
    Rule_AnyChar);

Rule_Common :: struct {
    attribute: u8;
    ctx: *Highlight_Context;
    begin_region: void;  // @TODO: code folding
    end_region: void;    // @TODO: code folding
    look_ahead: bool;
    first_non_space: bool;
    column: int = -1;
}

Rule_DetectChar :: struct {
    using #as common: Rule_Common;
    char: u8;
}

Rule_Detect2Chars :: struct {
    using #as common: Rule_Common;
    char1: u8;
    char2: u8;
}

Rule_DetectSpaces :: struct {
    using #as common: Rule_Common;
}

Rule_Keyword :: struct {
    using #as common: Rule_Common;
    list_name: string;
    list: *Item_List;
}

Rule_RegExp :: struct {
    using #as common: Rule_Common;
    /* Built from the value of "insensitive" and "minimal" attributes */
    flags := RE.ParseFlags.LikePerl;
    re: RE.Regexp;
}

Rule_AnyChar :: struct {
    using #as common: Rule_Common;
    str: string;
}

#import "Basic";
#import "Hash_Table";
#import "Tagged_Union";
RE :: #import "uniform";

#load "lua-manual.jai";
