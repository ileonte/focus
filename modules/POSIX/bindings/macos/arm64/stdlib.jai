//
// This file was auto-generated using the following command:
//
// jai modules/POSIX/generate.jai - -arm64
//



/* free is now declared in _malloc.h */
getenv :: (unknown0: *u8) -> *u8 #foreign libc;

system :: (unknown0: *u8) -> s32 #foreign libc;

mktemp :: (unknown0: *u8) -> *u8 #foreign libc;
mkstemp :: (unknown0: *u8) -> s32 #foreign libc;

realpath :: (unknown0: *u8, unknown1: *u8) -> *u8 #foreign libc "realpath$DARWIN_EXTSN";

setenv :: (__name: *u8, __value: *u8, __overwrite: s32) -> s32 #foreign libc;

unsetenv :: (unknown0: *u8) -> s32 #foreign libc;

mkdtemp :: (unknown0: *u8) -> *u8 #foreign libc;

mkpath_np :: (path: *u8, omode: mode_t) -> s32 #foreign libc;
mkpathat_np :: (dfd: s32, path: *u8, omode: mode_t) -> s32 #foreign libc;

mkstemps :: (unknown0: *u8, unknown1: s32) -> s32 #foreign libc;

mkostemp :: (path: *u8, oflags: s32) -> s32 #foreign libc;

mkostemps :: (path: *u8, slen: s32, oflags: s32) -> s32 #foreign libc;

/* Non-portable mkstemp that uses open_dprotected_np */
mkstemp_dprotected_np :: (path: *u8, dpclass: s32, dpflags: s32) -> s32 #foreign libc;

mkdtempat_np :: (dfd: s32, path: *u8) -> *u8 #foreign libc;

mkstempsat_np :: (dfd: s32, path: *u8, slen: s32) -> s32 #foreign libc;

mkostempsat_np :: (dfd: s32, path: *u8, slen: s32, oflags: s32) -> s32 #foreign libc;

#scope_file

libc :: #library,system "libc";
