Highlighter_Language :: struct {
    name: string;
}

register_language :: (lang: Highlighter_Language) {
    if registry_storage_size < registry_storage.count {
        registry_storage[registry_storage_size] = lang;
        registry_storage_size += 1;
    }
}

get_registry :: () -> []Highlighter_Language {
    ret: []Highlighter_Language;
    ret.data = registry_storage.data;
    ret.count = registry_storage_size;
    return ret;
}

#scope_module

#import "Basic";
#no_reset registry_storage_size: int;
#no_reset registry_storage: [512]Highlighter_Language;
