//
// This file was auto-generated using the following command:
//
// jai generate.jai - -arm64 -cross_compiler_sysroot /home/.../Apps/cross-pi-gcc-14.2.0-64
//



/* Return the value of envariable NAME, or NULL if it doesn't exist.  */
getenv :: (__name: *u8) -> *u8 #foreign libc;

/* Set NAME to VALUE in the environment.
If REPLACE is nonzero, overwrite an existing value.  */
setenv :: (__name: *u8, __value: *u8, __replace: s32) -> s32 #foreign libc;

/* Remove the variable NAME from the environment.  */
unsetenv :: (__name: *u8) -> s32 #foreign libc;

/* Generate a unique temporary file name from TEMPLATE.
The last six characters of TEMPLATE must be "XXXXXX";
they are replaced with a string that makes the file name unique.
Always returns TEMPLATE, it's either a temporary file name or a null
string if it cannot get a unique file name.  */
mktemp :: (__template: *u8) -> *u8 #foreign libc;

mkstemp :: (__template: *u8) -> s32 #foreign libc;

mkstemps :: (__template: *u8, __suffixlen: s32) -> s32 #foreign libc;

/* Create a unique temporary directory from TEMPLATE.
The last six characters of TEMPLATE must be "XXXXXX";
they are replaced with a string that makes the directory name unique.
Returns TEMPLATE, or a null pointer if it cannot get a unique name.
The directory is created mode 700.  */
mkdtemp :: (__template: *u8) -> *u8 #foreign libc;

mkostemp :: (__template: *u8, __flags: s32) -> s32 #foreign libc;

mkostemps :: (__template: *u8, __suffixlen: s32, __flags: s32) -> s32 #foreign libc;

/* Execute the given line as a shell command.

This function is a cancellation point and therefore not marked with
__THROW.  */
system :: (__command: *u8) -> s32 #foreign libc;

/* Return the canonical absolute name of file NAME.  If RESOLVED is
null, the result is malloc'd; otherwise, if the canonical name is
PATH_MAX chars or more, returns null with `errno' set to
ENAMETOOLONG; if the name fits in fewer than PATH_MAX chars,
returns the name in RESOLVED.  */
realpath :: (__name: *u8, __resolved: *u8) -> *u8 #foreign libc;

#scope_file

libc :: #library,system "libc";
