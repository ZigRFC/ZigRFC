const __root = @This();
pub const __builtin = @import("std").zig.c_translation.builtins;
pub const __helpers = @import("std").zig.c_translation.helpers;

pub const __builtin_va_list = [*c]u8;
pub const __gnuc_va_list = __builtin_va_list;
pub const va_list = __gnuc_va_list;
pub extern fn __mingw_get_crt_info() [*c]const u8;
pub const rsize_t = usize;
pub const ptrdiff_t = c_longlong;
pub const wchar_t = c_ushort;
pub const wint_t = c_ushort;
pub const wctype_t = c_ushort;
pub const errno_t = c_int;
pub const __time32_t = c_long;
pub const __time64_t = c_longlong;
pub const time_t = __time64_t;
pub const struct_threadlocaleinfostruct = extern struct {
    _locale_pctype: [*c]const c_ushort = null,
    _locale_mb_cur_max: c_int = 0,
    _locale_lc_codepage: c_uint = 0,
};
pub const pthreadlocinfo = [*c]struct_threadlocaleinfostruct;
pub const struct_threadmbcinfostruct = opaque {};
pub const pthreadmbcinfo = ?*struct_threadmbcinfostruct;
pub const struct_localeinfo_struct = extern struct {
    locinfo: pthreadlocinfo = null,
    mbcinfo: pthreadmbcinfo = null,
};
pub const _locale_tstruct = struct_localeinfo_struct;
pub const _locale_t = [*c]struct_localeinfo_struct;
pub const struct_tagLC_ID = extern struct {
    wLanguage: c_ushort = 0,
    wCountry: c_ushort = 0,
    wCodePage: c_ushort = 0,
};
pub const LC_ID = struct_tagLC_ID;
pub const LPLC_ID = [*c]struct_tagLC_ID;
pub const threadlocinfo = struct_threadlocaleinfostruct;
pub extern fn _wdupenv_s(_Buffer: [*c][*c]wchar_t, _BufferSizeInWords: [*c]usize, _VarName: [*c]const wchar_t) errno_t;
pub extern fn _itow_s(_Val: c_int, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _Radix: c_int) errno_t;
pub extern fn _ltow_s(_Val: c_long, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _Radix: c_int) errno_t;
pub extern fn _ultow_s(_Val: c_ulong, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _Radix: c_int) errno_t;
pub extern fn _wgetenv_s(_ReturnSize: [*c]usize, _DstBuf: [*c]wchar_t, _DstSizeInWords: usize, _VarName: [*c]const wchar_t) errno_t;
pub extern fn _i64tow_s(_Val: c_longlong, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _Radix: c_int) errno_t;
pub extern fn _ui64tow_s(_Val: c_ulonglong, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _Radix: c_int) errno_t;
pub extern fn _wmakepath_s(_PathResult: [*c]wchar_t, _SizeInWords: usize, _Drive: [*c]const wchar_t, _Dir: [*c]const wchar_t, _Filename: [*c]const wchar_t, _Ext: [*c]const wchar_t) errno_t;
pub extern fn _wputenv_s(_Name: [*c]const wchar_t, _Value: [*c]const wchar_t) errno_t;
pub extern fn _wsearchenv_s(_Filename: [*c]const wchar_t, _EnvVar: [*c]const wchar_t, _ResultPath: [*c]wchar_t, _SizeInWords: usize) errno_t;
pub extern fn _wsplitpath_s(_FullPath: [*c]const wchar_t, _Drive: [*c]wchar_t, _DriveSizeInWords: usize, _Dir: [*c]wchar_t, _DirSizeInWords: usize, _Filename: [*c]wchar_t, _FilenameSizeInWords: usize, _Ext: [*c]wchar_t, _ExtSizeInWords: usize) errno_t;
pub const _onexit_t = ?*const fn () callconv(.c) c_int;
pub const struct__div_t = extern struct {
    quot: c_int = 0,
    rem: c_int = 0,
};
pub const div_t = struct__div_t;
pub const struct__ldiv_t = extern struct {
    quot: c_long = 0,
    rem: c_long = 0,
};
pub const ldiv_t = struct__ldiv_t;
pub const _LDOUBLE = extern struct {
    ld: [10]u8 = @import("std").mem.zeroes([10]u8),
    pub const _atoldbl = __root._atoldbl;
    pub const _atoldbl_l = __root._atoldbl_l;
    pub const atoldbl = __root._atoldbl;
    pub const l = __root._atoldbl_l;
};
pub const _CRT_DOUBLE = extern struct {
    x: f64 = 0,
    pub const _atodbl = __root._atodbl;
    pub const _atodbl_l = __root._atodbl_l;
    pub const atodbl = __root._atodbl;
    pub const l = __root._atodbl_l;
};
pub const _CRT_FLOAT = extern struct {
    f: f32 = 0,
    pub const _atoflt = __root._atoflt;
    pub const _atoflt_l = __root._atoflt_l;
    pub const atoflt = __root._atoflt;
    pub const l = __root._atoflt_l;
};
pub const _LONGDOUBLE = extern struct {
    x: c_longdouble = 0,
};
pub const _LDBL12 = extern struct {
    ld12: [12]u8 = @import("std").mem.zeroes([12]u8),
};
pub extern fn ___mb_cur_max_func() c_int;
pub const _purecall_handler = ?*const fn () callconv(.c) void;
pub extern fn _set_purecall_handler(_Handler: _purecall_handler) _purecall_handler;
pub extern fn _get_purecall_handler() _purecall_handler;
pub const _invalid_parameter_handler = ?*const fn ([*c]const wchar_t, [*c]const wchar_t, [*c]const wchar_t, c_uint, usize) callconv(.c) void;
pub extern fn _set_invalid_parameter_handler(_Handler: _invalid_parameter_handler) _invalid_parameter_handler;
pub extern fn _get_invalid_parameter_handler() _invalid_parameter_handler;
pub extern fn _errno() [*c]c_int;
pub extern fn _set_errno(_Value: c_int) errno_t;
pub extern fn _get_errno(_Value: [*c]c_int) errno_t;
pub extern fn __doserrno() [*c]c_ulong;
pub extern fn _set_doserrno(_Value: c_ulong) errno_t;
pub extern fn _get_doserrno(_Value: [*c]c_ulong) errno_t;
pub extern fn __sys_errlist() [*c][*c]u8;
pub extern fn __sys_nerr() [*c]c_int;
pub extern fn __p___argv() [*c][*c][*c]u8;
pub extern fn __p__fmode() [*c]c_int;
pub extern fn __p___argc() [*c]c_int;
pub extern fn __p___wargv() [*c][*c][*c]wchar_t;
pub extern fn __p__pgmptr() [*c][*c]u8;
pub extern fn __p__wpgmptr() [*c][*c]wchar_t;
pub extern fn _get_pgmptr(_Value: [*c][*c]u8) errno_t;
pub extern fn _get_wpgmptr(_Value: [*c][*c]wchar_t) errno_t;
pub extern fn _set_fmode(_Mode: c_int) errno_t;
pub extern fn _get_fmode(_PMode: [*c]c_int) errno_t;
pub extern fn __p__environ() [*c][*c][*c]u8;
pub extern fn __p__wenviron() [*c][*c][*c]wchar_t;
pub extern fn __p__osplatform() [*c]c_uint;
pub extern fn __p__osver() [*c]c_uint;
pub extern fn __p__winver() [*c]c_uint;
pub extern fn __p__winmajor() [*c]c_uint;
pub extern fn __p__winminor() [*c]c_uint;
pub extern fn _get_osplatform(_Value: [*c]c_uint) errno_t;
pub extern fn _get_osver(_Value: [*c]c_uint) errno_t;
pub extern fn _get_winver(_Value: [*c]c_uint) errno_t;
pub extern fn _get_winmajor(_Value: [*c]c_uint) errno_t;
pub extern fn _get_winminor(_Value: [*c]c_uint) errno_t;
pub extern fn exit(_Code: c_int) noreturn;
pub extern fn _exit(_Code: c_int) noreturn;
pub extern fn quick_exit(_Code: c_int) noreturn;
pub fn _Exit(arg_status: c_int) callconv(.c) noreturn {
    var status = arg_status;
    _ = &status;
    _exit(status);
}
pub extern fn abort() noreturn;
pub extern fn _set_abort_behavior(_Flags: c_uint, _Mask: c_uint) c_uint;
pub extern fn abs(_X: c_int) c_int;
pub extern fn labs(_X: c_long) c_long;
pub inline fn _abs64(arg_x: c_longlong) c_longlong {
    var x = arg_x;
    _ = &x;
    return __builtin.llabs(x);
}
pub extern fn atexit(?*const fn () callconv(.c) void) c_int;
pub extern fn at_quick_exit(?*const fn () callconv(.c) void) c_int;
pub extern fn atof(_String: [*c]const u8) f64;
pub extern fn _atof_l(_String: [*c]const u8, _Locale: _locale_t) f64;
pub extern fn atoi(_Str: [*c]const u8) c_int;
pub extern fn _atoi_l(_Str: [*c]const u8, _Locale: _locale_t) c_int;
pub extern fn atol(_Str: [*c]const u8) c_long;
pub extern fn _atol_l(_Str: [*c]const u8, _Locale: _locale_t) c_long;
pub extern fn bsearch(_Key: ?*const anyopaque, _Base: ?*const anyopaque, _NumOfElements: usize, _SizeOfElements: usize, _PtFuncCompare: ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.c) c_int) ?*anyopaque;
pub extern fn qsort(_Base: ?*anyopaque, _NumOfElements: usize, _SizeOfElements: usize, _PtFuncCompare: ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.c) c_int) void;
pub extern fn _byteswap_ushort(_Short: c_ushort) c_ushort;
pub extern fn _byteswap_ulong(_Long: c_ulong) c_ulong;
pub extern fn _byteswap_uint64(_Int64: c_ulonglong) c_ulonglong;
pub extern fn div(_Numerator: c_int, _Denominator: c_int) div_t;
pub extern fn getenv(_VarName: [*c]const u8) [*c]u8;
pub extern fn _itoa(_Value: c_int, _Dest: [*c]u8, _Radix: c_int) [*c]u8;
pub extern fn _i64toa(_Val: c_longlong, _DstBuf: [*c]u8, _Radix: c_int) [*c]u8;
pub extern fn _ui64toa(_Val: c_ulonglong, _DstBuf: [*c]u8, _Radix: c_int) [*c]u8;
pub extern fn _atoi64(_String: [*c]const u8) c_longlong;
pub extern fn _atoi64_l(_String: [*c]const u8, _Locale: _locale_t) c_longlong;
pub extern fn _strtoi64(_String: [*c]const u8, _EndPtr: [*c][*c]u8, _Radix: c_int) c_longlong;
pub extern fn _strtoi64_l(_String: [*c]const u8, _EndPtr: [*c][*c]u8, _Radix: c_int, _Locale: _locale_t) c_longlong;
pub extern fn _strtoui64(_String: [*c]const u8, _EndPtr: [*c][*c]u8, _Radix: c_int) c_ulonglong;
pub extern fn _strtoui64_l(_String: [*c]const u8, _EndPtr: [*c][*c]u8, _Radix: c_int, _Locale: _locale_t) c_ulonglong;
pub extern fn ldiv(_Numerator: c_long, _Denominator: c_long) ldiv_t;
pub extern fn _ltoa(_Value: c_long, _Dest: [*c]u8, _Radix: c_int) [*c]u8;
pub extern fn mblen(_Ch: [*c]const u8, _MaxCount: usize) c_int;
pub extern fn _mblen_l(_Ch: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn _mbstrlen(_Str: [*c]const u8) usize;
pub extern fn _mbstrlen_l(_Str: [*c]const u8, _Locale: _locale_t) usize;
pub extern fn _mbstrnlen(_Str: [*c]const u8, _MaxCount: usize) usize;
pub extern fn _mbstrnlen_l(_Str: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) usize;
pub extern fn mbtowc(noalias _DstCh: [*c]wchar_t, noalias _SrcCh: [*c]const u8, _SrcSizeInBytes: usize) c_int;
pub extern fn _mbtowc_l(noalias _DstCh: [*c]wchar_t, noalias _SrcCh: [*c]const u8, _SrcSizeInBytes: usize, _Locale: _locale_t) c_int;
pub extern fn mbstowcs(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const u8, _MaxCount: usize) usize;
pub extern fn _mbstowcs_l(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) usize;
pub extern fn mkstemp(template_name: [*c]u8) c_int;
pub extern fn rand() c_int;
pub extern fn _set_error_mode(_Mode: c_int) c_int;
pub extern fn srand(_Seed: c_uint) void;
pub extern fn strtod(noalias _Str: [*c]const u8, noalias _EndPtr: [*c][*c]u8) f64;
pub extern fn strtof(noalias nptr: [*c]const u8, noalias endptr: [*c][*c]u8) f32;
pub extern fn strtold(noalias [*c]const u8, noalias [*c][*c]u8) c_longdouble;
pub extern fn __strtod(noalias [*c]const u8, noalias [*c][*c]u8) f64;
pub extern fn __mingw_strtof(noalias [*c]const u8, noalias [*c][*c]u8) f32;
pub extern fn __mingw_strtod(noalias [*c]const u8, noalias [*c][*c]u8) f64;
pub extern fn __mingw_strtold(noalias [*c]const u8, noalias [*c][*c]u8) c_longdouble;
pub extern fn _strtof_l(noalias _Str: [*c]const u8, noalias _EndPtr: [*c][*c]u8, _Locale: _locale_t) f32;
pub extern fn _strtod_l(noalias _Str: [*c]const u8, noalias _EndPtr: [*c][*c]u8, _Locale: _locale_t) f64;
pub extern fn strtol(noalias _Str: [*c]const u8, noalias _EndPtr: [*c][*c]u8, _Radix: c_int) c_long;
pub extern fn _strtol_l(noalias _Str: [*c]const u8, noalias _EndPtr: [*c][*c]u8, _Radix: c_int, _Locale: _locale_t) c_long;
pub extern fn strtoul(noalias _Str: [*c]const u8, noalias _EndPtr: [*c][*c]u8, _Radix: c_int) c_ulong;
pub extern fn _strtoul_l(noalias _Str: [*c]const u8, noalias _EndPtr: [*c][*c]u8, _Radix: c_int, _Locale: _locale_t) c_ulong;
pub extern fn system(_Command: [*c]const u8) c_int;
pub extern fn _ultoa(_Value: c_ulong, _Dest: [*c]u8, _Radix: c_int) [*c]u8;
pub extern fn wctomb(_MbCh: [*c]u8, _WCh: wchar_t) c_int;
pub extern fn _wctomb_l(_MbCh: [*c]u8, _WCh: wchar_t, _Locale: _locale_t) c_int;
pub extern fn wcstombs(noalias _Dest: [*c]u8, noalias _Source: [*c]const wchar_t, _MaxCount: usize) usize;
pub extern fn _wcstombs_l(noalias _Dest: [*c]u8, noalias _Source: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) usize;
pub extern fn calloc(_NumOfElements: usize, _SizeOfElements: usize) ?*anyopaque;
pub extern fn free(_Memory: ?*anyopaque) void;
pub extern fn malloc(_Size: usize) ?*anyopaque;
pub extern fn realloc(_Memory: ?*anyopaque, _NewSize: usize) ?*anyopaque;
pub extern fn _aligned_free(_Memory: ?*anyopaque) void;
pub extern fn _aligned_malloc(_Size: usize, _Alignment: usize) ?*anyopaque;
pub extern fn _aligned_offset_malloc(_Size: usize, _Alignment: usize, _Offset: usize) ?*anyopaque;
pub extern fn _aligned_realloc(_Memory: ?*anyopaque, _Size: usize, _Alignment: usize) ?*anyopaque;
pub extern fn _aligned_offset_realloc(_Memory: ?*anyopaque, _Size: usize, _Alignment: usize, _Offset: usize) ?*anyopaque;
pub extern fn _recalloc(_Memory: ?*anyopaque, _Count: usize, _Size: usize) ?*anyopaque;
pub extern fn _aligned_recalloc(_Memory: ?*anyopaque, _Count: usize, _Size: usize, _Alignment: usize) ?*anyopaque;
pub extern fn _aligned_offset_recalloc(_Memory: ?*anyopaque, _Count: usize, _Size: usize, _Alignment: usize, _Offset: usize) ?*anyopaque;
pub extern fn _aligned_msize(_Memory: ?*anyopaque, _Alignment: usize, _Offset: usize) usize;
pub extern fn _itow(_Value: c_int, _Dest: [*c]wchar_t, _Radix: c_int) [*c]wchar_t;
pub extern fn _ltow(_Value: c_long, _Dest: [*c]wchar_t, _Radix: c_int) [*c]wchar_t;
pub extern fn _ultow(_Value: c_ulong, _Dest: [*c]wchar_t, _Radix: c_int) [*c]wchar_t;
pub extern fn __mingw_wcstod(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t) f64;
pub extern fn __mingw_wcstof(noalias nptr: [*c]const wchar_t, noalias endptr: [*c][*c]wchar_t) f32;
pub extern fn __mingw_wcstold(noalias [*c]const wchar_t, noalias [*c][*c]wchar_t) c_longdouble;
pub extern fn wcstod(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t) f64;
pub extern fn wcstof(noalias nptr: [*c]const wchar_t, noalias endptr: [*c][*c]wchar_t) f32;
pub extern fn wcstold(noalias [*c]const wchar_t, noalias [*c][*c]wchar_t) c_longdouble;
pub extern fn _wcstod_l(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Locale: _locale_t) f64;
pub extern fn _wcstof_l(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Locale: _locale_t) f32;
pub extern fn wcstol(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Radix: c_int) c_long;
pub extern fn _wcstol_l(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Radix: c_int, _Locale: _locale_t) c_long;
pub extern fn wcstoul(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Radix: c_int) c_ulong;
pub extern fn _wcstoul_l(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Radix: c_int, _Locale: _locale_t) c_ulong;
pub extern fn _wgetenv(_VarName: [*c]const wchar_t) [*c]wchar_t;
pub extern fn _wsystem(_Command: [*c]const wchar_t) c_int;
pub extern fn _wtof(_Str: [*c]const wchar_t) f64;
pub extern fn _wtof_l(_Str: [*c]const wchar_t, _Locale: _locale_t) f64;
pub extern fn _wtoi(_Str: [*c]const wchar_t) c_int;
pub extern fn _wtoi_l(_Str: [*c]const wchar_t, _Locale: _locale_t) c_int;
pub extern fn _wtol(_Str: [*c]const wchar_t) c_long;
pub extern fn _wtol_l(_Str: [*c]const wchar_t, _Locale: _locale_t) c_long;
pub extern fn _i64tow(_Val: c_longlong, _DstBuf: [*c]wchar_t, _Radix: c_int) [*c]wchar_t;
pub extern fn _ui64tow(_Val: c_ulonglong, _DstBuf: [*c]wchar_t, _Radix: c_int) [*c]wchar_t;
pub extern fn _wtoi64(_Str: [*c]const wchar_t) c_longlong;
pub extern fn _wtoi64_l(_Str: [*c]const wchar_t, _Locale: _locale_t) c_longlong;
pub extern fn _wcstoi64(_Str: [*c]const wchar_t, _EndPtr: [*c][*c]wchar_t, _Radix: c_int) c_longlong;
pub extern fn _wcstoi64_l(_Str: [*c]const wchar_t, _EndPtr: [*c][*c]wchar_t, _Radix: c_int, _Locale: _locale_t) c_longlong;
pub extern fn _wcstoui64(_Str: [*c]const wchar_t, _EndPtr: [*c][*c]wchar_t, _Radix: c_int) c_ulonglong;
pub extern fn _wcstoui64_l(_Str: [*c]const wchar_t, _EndPtr: [*c][*c]wchar_t, _Radix: c_int, _Locale: _locale_t) c_ulonglong;
pub extern fn _putenv(_EnvString: [*c]const u8) c_int;
pub extern fn _wputenv(_EnvString: [*c]const wchar_t) c_int;
pub extern fn _fullpath(_FullPath: [*c]u8, _Path: [*c]const u8, _SizeInBytes: usize) [*c]u8;
pub extern fn _ecvt(_Val: f64, _NumOfDigits: c_int, _PtDec: [*c]c_int, _PtSign: [*c]c_int) [*c]u8;
pub extern fn _fcvt(_Val: f64, _NumOfDec: c_int, _PtDec: [*c]c_int, _PtSign: [*c]c_int) [*c]u8;
pub extern fn _gcvt(_Val: f64, _NumOfDigits: c_int, _DstBuf: [*c]u8) [*c]u8;
pub extern fn _atodbl(_Result: [*c]_CRT_DOUBLE, _Str: [*c]u8) c_int;
pub extern fn _atoldbl(_Result: [*c]_LDOUBLE, _Str: [*c]u8) c_int;
pub extern fn _atoflt(_Result: [*c]_CRT_FLOAT, _Str: [*c]u8) c_int;
pub extern fn _atodbl_l(_Result: [*c]_CRT_DOUBLE, _Str: [*c]u8, _Locale: _locale_t) c_int;
pub extern fn _atoldbl_l(_Result: [*c]_LDOUBLE, _Str: [*c]u8, _Locale: _locale_t) c_int;
pub extern fn _atoflt_l(_Result: [*c]_CRT_FLOAT, _Str: [*c]u8, _Locale: _locale_t) c_int;
pub extern fn _lrotl(c_ulong, c_int) c_ulong;
pub extern fn _lrotr(c_ulong, c_int) c_ulong;
pub extern fn _makepath(_Path: [*c]u8, _Drive: [*c]const u8, _Dir: [*c]const u8, _Filename: [*c]const u8, _Ext: [*c]const u8) void;
pub extern fn _onexit(_Func: _onexit_t) _onexit_t;
pub extern fn perror(_ErrMsg: [*c]const u8) void;
pub extern fn _rotl64(_Val: c_ulonglong, _Shift: c_int) c_ulonglong;
pub extern fn _rotr64(Value: c_ulonglong, Shift: c_int) c_ulonglong;
pub extern fn _rotr(_Val: c_uint, _Shift: c_int) c_uint;
pub extern fn _rotl(_Val: c_uint, _Shift: c_int) c_uint;
pub extern fn _searchenv(_Filename: [*c]const u8, _EnvVar: [*c]const u8, _ResultPath: [*c]u8) void;
pub extern fn _splitpath(_FullPath: [*c]const u8, _Drive: [*c]u8, _Dir: [*c]u8, _Filename: [*c]u8, _Ext: [*c]u8) void;
pub extern fn _swab(_Buf1: [*c]u8, _Buf2: [*c]u8, _SizeInBytes: c_int) void;
pub extern fn _wfullpath(_FullPath: [*c]wchar_t, _Path: [*c]const wchar_t, _SizeInWords: usize) [*c]wchar_t;
pub extern fn _wmakepath(_ResultPath: [*c]wchar_t, _Drive: [*c]const wchar_t, _Dir: [*c]const wchar_t, _Filename: [*c]const wchar_t, _Ext: [*c]const wchar_t) void;
pub extern fn _wperror(_ErrMsg: [*c]const wchar_t) void;
pub extern fn _wsearchenv(_Filename: [*c]const wchar_t, _EnvVar: [*c]const wchar_t, _ResultPath: [*c]wchar_t) void;
pub extern fn _wsplitpath(_FullPath: [*c]const wchar_t, _Drive: [*c]wchar_t, _Dir: [*c]wchar_t, _Filename: [*c]wchar_t, _Ext: [*c]wchar_t) void;
pub extern fn _beep(_Frequency: c_uint, _Duration: c_uint) void;
pub extern fn _seterrormode(_Mode: c_int) void;
pub extern fn _sleep(_Duration: c_ulong) void;
pub extern fn ecvt(_Val: f64, _NumOfDigits: c_int, _PtDec: [*c]c_int, _PtSign: [*c]c_int) [*c]u8;
pub extern fn fcvt(_Val: f64, _NumOfDec: c_int, _PtDec: [*c]c_int, _PtSign: [*c]c_int) [*c]u8;
pub extern fn gcvt(_Val: f64, _NumOfDigits: c_int, _DstBuf: [*c]u8) [*c]u8;
pub extern fn itoa(_Val: c_int, _DstBuf: [*c]u8, _Radix: c_int) [*c]u8;
pub extern fn ltoa(_Val: c_long, _DstBuf: [*c]u8, _Radix: c_int) [*c]u8;
pub extern fn putenv(_EnvString: [*c]const u8) c_int;
pub extern fn swab(_Buf1: [*c]u8, _Buf2: [*c]u8, _SizeInBytes: c_int) void;
pub extern fn ultoa(_Val: c_ulong, _Dstbuf: [*c]u8, _Radix: c_int) [*c]u8;
pub extern fn onexit(_Func: _onexit_t) _onexit_t;
pub const lldiv_t = extern struct {
    quot: c_longlong = 0,
    rem: c_longlong = 0,
};
pub extern fn lldiv(c_longlong, c_longlong) lldiv_t;
pub fn llabs(arg__j: c_longlong) callconv(.c) c_longlong {
    var _j = arg__j;
    _ = &_j;
    return if (_j >= @as(c_longlong, 0)) _j else -_j;
}
pub extern fn strtoll(noalias [*c]const u8, noalias [*c][*c]u8, c_int) c_longlong;
pub extern fn strtoull(noalias [*c]const u8, noalias [*c][*c]u8, c_int) c_ulonglong;
pub extern fn atoll([*c]const u8) c_longlong;
pub fn wtoll(arg__w: [*c]const wchar_t) callconv(.c) c_longlong {
    var _w = arg__w;
    _ = &_w;
    return _wtoi64(_w);
}
pub fn lltoa(arg__n: c_longlong, arg__c: [*c]u8, arg__i: c_int) callconv(.c) [*c]u8 {
    var _n = arg__n;
    _ = &_n;
    var _c = arg__c;
    _ = &_c;
    var _i = arg__i;
    _ = &_i;
    return _i64toa(_n, _c, _i);
}
pub fn ulltoa(arg__n: c_ulonglong, arg__c: [*c]u8, arg__i: c_int) callconv(.c) [*c]u8 {
    var _n = arg__n;
    _ = &_n;
    var _c = arg__c;
    _ = &_c;
    var _i = arg__i;
    _ = &_i;
    return _ui64toa(_n, _c, _i);
}
pub fn lltow(arg__n: c_longlong, arg__w: [*c]wchar_t, arg__i: c_int) callconv(.c) [*c]wchar_t {
    var _n = arg__n;
    _ = &_n;
    var _w = arg__w;
    _ = &_w;
    var _i = arg__i;
    _ = &_i;
    return _i64tow(_n, _w, _i);
}
pub fn ulltow(arg__n: c_ulonglong, arg__w: [*c]wchar_t, arg__i: c_int) callconv(.c) [*c]wchar_t {
    var _n = arg__n;
    _ = &_n;
    var _w = arg__w;
    _ = &_w;
    var _i = arg__i;
    _ = &_i;
    return _ui64tow(_n, _w, _i);
}
pub extern fn _dupenv_s(_PBuffer: [*c][*c]u8, _PBufferSizeInBytes: [*c]usize, _VarName: [*c]const u8) errno_t;
pub extern fn bsearch_s(_Key: ?*const anyopaque, _Base: ?*const anyopaque, _NumOfElements: rsize_t, _SizeOfElements: rsize_t, _PtFuncCompare: ?*const fn (?*anyopaque, ?*const anyopaque, ?*const anyopaque) callconv(.c) c_int, _Context: ?*anyopaque) ?*anyopaque;
pub extern fn getenv_s(_ReturnSize: [*c]usize, _DstBuf: [*c]u8, _DstSize: rsize_t, _VarName: [*c]const u8) errno_t;
pub extern fn _itoa_s(_Value: c_int, _DstBuf: [*c]u8, _Size: usize, _Radix: c_int) errno_t;
pub extern fn _i64toa_s(_Val: c_longlong, _DstBuf: [*c]u8, _Size: usize, _Radix: c_int) errno_t;
pub extern fn _ui64toa_s(_Val: c_ulonglong, _DstBuf: [*c]u8, _Size: usize, _Radix: c_int) errno_t;
pub extern fn _ltoa_s(_Val: c_long, _DstBuf: [*c]u8, _Size: usize, _Radix: c_int) errno_t;
pub extern fn mbstowcs_s(_PtNumOfCharConverted: [*c]usize, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _SrcBuf: [*c]const u8, _MaxCount: usize) errno_t;
pub extern fn _mbstowcs_s_l(_PtNumOfCharConverted: [*c]usize, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _SrcBuf: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) errno_t;
pub extern fn _ultoa_s(_Val: c_ulong, _DstBuf: [*c]u8, _Size: usize, _Radix: c_int) errno_t;
pub extern fn wctomb_s(_SizeConverted: [*c]c_int, _MbCh: [*c]u8, _SizeInBytes: rsize_t, _WCh: wchar_t) errno_t;
pub extern fn _wctomb_s_l(_SizeConverted: [*c]c_int, _MbCh: [*c]u8, _SizeInBytes: usize, _WCh: wchar_t, _Locale: _locale_t) errno_t;
pub extern fn wcstombs_s(_PtNumOfCharConverted: [*c]usize, _Dst: [*c]u8, _DstSizeInBytes: usize, _Src: [*c]const wchar_t, _MaxCountInBytes: usize) errno_t;
pub extern fn _wcstombs_s_l(_PtNumOfCharConverted: [*c]usize, _Dst: [*c]u8, _DstSizeInBytes: usize, _Src: [*c]const wchar_t, _MaxCountInBytes: usize, _Locale: _locale_t) errno_t;
pub extern fn _ecvt_s(_DstBuf: [*c]u8, _Size: usize, _Val: f64, _NumOfDights: c_int, _PtDec: [*c]c_int, _PtSign: [*c]c_int) errno_t;
pub extern fn _fcvt_s(_DstBuf: [*c]u8, _Size: usize, _Val: f64, _NumOfDec: c_int, _PtDec: [*c]c_int, _PtSign: [*c]c_int) errno_t;
pub extern fn _gcvt_s(_DstBuf: [*c]u8, _Size: usize, _Val: f64, _NumOfDigits: c_int) errno_t;
pub extern fn _makepath_s(_PathResult: [*c]u8, _Size: usize, _Drive: [*c]const u8, _Dir: [*c]const u8, _Filename: [*c]const u8, _Ext: [*c]const u8) errno_t;
pub extern fn _putenv_s(_Name: [*c]const u8, _Value: [*c]const u8) errno_t;
pub extern fn _searchenv_s(_Filename: [*c]const u8, _EnvVar: [*c]const u8, _ResultPath: [*c]u8, _SizeInBytes: usize) errno_t;
pub extern fn _splitpath_s(_FullPath: [*c]const u8, _Drive: [*c]u8, _DriveSize: usize, _Dir: [*c]u8, _DirSize: usize, _Filename: [*c]u8, _FilenameSize: usize, _Ext: [*c]u8, _ExtSize: usize) errno_t;
pub extern fn qsort_s(_Base: ?*anyopaque, _NumOfElements: usize, _SizeOfElements: usize, _PtFuncCompare: ?*const fn (?*anyopaque, ?*const anyopaque, ?*const anyopaque) callconv(.c) c_int, _Context: ?*anyopaque) void;
pub const struct__heapinfo = extern struct {
    _pentry: [*c]c_int = null,
    _size: usize = 0,
    _useflag: c_int = 0,
    pub const _heapwalk = __root._heapwalk;
    pub const heapwalk = __root._heapwalk;
};
pub const _HEAPINFO = struct__heapinfo;
pub extern fn __p__amblksiz() [*c]c_uint;
pub extern fn __mingw_aligned_malloc(_Size: usize, _Alignment: usize) ?*anyopaque;
pub extern fn __mingw_aligned_free(_Memory: ?*anyopaque) void;
pub extern fn __mingw_aligned_offset_realloc(_Memory: ?*anyopaque, _Size: usize, _Alignment: usize, _Offset: usize) ?*anyopaque;
pub extern fn __mingw_aligned_offset_malloc(usize, usize, usize) ?*anyopaque;
pub extern fn __mingw_aligned_realloc(_Memory: ?*anyopaque, _Size: usize, _Offset: usize) ?*anyopaque;
pub extern fn __mingw_aligned_msize(memblock: ?*anyopaque, alignment: usize, offset: usize) usize;
pub inline fn _mm_malloc(arg___size: usize, arg___align: usize) ?*anyopaque {
    var __size = arg___size;
    _ = &__size;
    var __align = arg___align;
    _ = &__align;
    if (__align == @as(usize, 1)) {
        return malloc(__size);
    }
    if (!((__align & (__align -% @as(usize, 1))) != 0) and (__align < @sizeOf(?*anyopaque))) {
        __align = @sizeOf(?*anyopaque);
    }
    var __mallocedMemory: ?*anyopaque = undefined;
    _ = &__mallocedMemory;
    __mallocedMemory = __mingw_aligned_malloc(__size, __align);
    return __mallocedMemory;
}
pub inline fn _mm_free(arg___p: ?*anyopaque) void {
    var __p = arg___p;
    _ = &__p;
    __mingw_aligned_free(__p);
}
pub extern fn _resetstkoflw() c_int;
pub extern fn _set_malloc_crt_max_wait(_NewValue: c_ulong) c_ulong;
pub extern fn _expand(_Memory: ?*anyopaque, _NewSize: usize) ?*anyopaque;
pub extern fn _msize(_Memory: ?*anyopaque) usize;
pub extern fn _get_sbh_threshold() usize;
pub extern fn _set_sbh_threshold(_NewValue: usize) c_int;
pub extern fn _set_amblksiz(_Value: usize) errno_t;
pub extern fn _get_amblksiz(_Value: [*c]usize) errno_t;
pub extern fn _heapadd(_Memory: ?*anyopaque, _Size: usize) c_int;
pub extern fn _heapchk() c_int;
pub extern fn _heapmin() c_int;
pub extern fn _heapset(_Fill: c_uint) c_int;
pub extern fn _heapwalk(_EntryInfo: [*c]_HEAPINFO) c_int;
pub extern fn _heapused(_Used: [*c]usize, _Commit: [*c]usize) usize;
pub extern fn _get_heap_handle() isize;
pub fn _MarkAllocaS(arg__Ptr: ?*anyopaque, arg__Marker: c_uint) callconv(.c) ?*anyopaque {
    var _Ptr = arg__Ptr;
    _ = &_Ptr;
    var _Marker = arg__Marker;
    _ = &_Marker;
    if (_Ptr != null) {
        @as([*c]c_uint, @ptrCast(@alignCast(_Ptr))).* = _Marker;
        _Ptr = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(_Ptr))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))));
    }
    return _Ptr;
}
pub fn _freea(arg__Memory: ?*anyopaque) callconv(.c) void {
    var _Memory = arg__Memory;
    _ = &_Memory;
    var _Marker: c_uint = undefined;
    _ = &_Marker;
    if (_Memory != null) {
        _Memory = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(_Memory))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))));
        _Marker = @as([*c]c_uint, @ptrCast(@alignCast(_Memory))).*;
        if (_Marker == @as(c_uint, 56797)) {
            free(_Memory);
        }
    }
}
pub extern fn __local_stdio_printf_options() [*c]c_ulonglong;
pub extern fn __local_stdio_scanf_options() [*c]c_ulonglong;
pub const struct__iobuf = extern struct {
    _Placeholder: ?*anyopaque = null,
    pub const __mingw_fscanf = __root.__mingw_fscanf;
    pub const __mingw_vfscanf = __root.__mingw_vfscanf;
    pub const __mingw_fprintf = __root.__mingw_fprintf;
    pub const __mingw_vfprintf = __root.__mingw_vfprintf;
    pub const __ms_fscanf = __root.__ms_fscanf;
    pub const __ms_vfscanf = __root.__ms_vfscanf;
    pub const __ms_fprintf = __root.__ms_fprintf;
    pub const __ms_vfprintf = __root.__ms_vfprintf;
    pub const fprintf = __root.fprintf;
    pub const vfprintf = __root.vfprintf;
    pub const fscanf = __root.fscanf;
    pub const vfscanf = __root.vfscanf;
    pub const _filbuf = __root._filbuf;
    pub const clearerr = __root.clearerr;
    pub const fclose = __root.fclose;
    pub const feof = __root.feof;
    pub const ferror = __root.ferror;
    pub const fflush = __root.fflush;
    pub const fgetc = __root.fgetc;
    pub const fgetpos = __root.fgetpos;
    pub const fgetpos64 = __root.fgetpos64;
    pub const _fileno = __root._fileno;
    pub const fsetpos = __root.fsetpos;
    pub const fsetpos64 = __root.fsetpos64;
    pub const fseek = __root.fseek;
    pub const ftell = __root.ftell;
    pub const _fseeki64 = __root._fseeki64;
    pub const _ftelli64 = __root._ftelli64;
    pub const fseeko = __root.fseeko;
    pub const fseeko64 = __root.fseeko64;
    pub const ftello = __root.ftello;
    pub const ftello64 = __root.ftello64;
    pub const getc = __root.getc;
    pub const _getw = __root._getw;
    pub const _pclose = __root._pclose;
    pub const rewind = __root.rewind;
    pub const setbuf = __root.setbuf;
    pub const setvbuf = __root.setvbuf;
    pub const __mingw_fwscanf = __root.__mingw_fwscanf;
    pub const __mingw_vfwscanf = __root.__mingw_vfwscanf;
    pub const __mingw_fwprintf = __root.__mingw_fwprintf;
    pub const __mingw_vfwprintf = __root.__mingw_vfwprintf;
    pub const __ms_fwscanf = __root.__ms_fwscanf;
    pub const __ms_vfwscanf = __root.__ms_vfwscanf;
    pub const __ms_fwprintf = __root.__ms_fwprintf;
    pub const __ms_vfwprintf = __root.__ms_vfwprintf;
    pub const fwscanf = __root.fwscanf;
    pub const vfwscanf = __root.vfwscanf;
    pub const fwprintf = __root.fwprintf;
    pub const vfwprintf = __root.vfwprintf;
    pub const fgetwc = __root.fgetwc;
    pub const getwc = __root.getwc;
    pub const _fgetwc_nolock = __root._fgetwc_nolock;
    pub const _fgetc_nolock = __root._fgetc_nolock;
    pub const _getc_nolock = __root._getc_nolock;
    pub const _lock_file = __root._lock_file;
    pub const _unlock_file = __root._unlock_file;
    pub const _fclose_nolock = __root._fclose_nolock;
    pub const _fflush_nolock = __root._fflush_nolock;
    pub const _fseek_nolock = __root._fseek_nolock;
    pub const _ftell_nolock = __root._ftell_nolock;
    pub const _fseeki64_nolock = __root._fseeki64_nolock;
    pub const _ftelli64_nolock = __root._ftelli64_nolock;
    pub const fileno = __root.fileno;
    pub const getw = __root.getw;
    pub const clearerr_s = __root.clearerr_s;
    pub const _vfscanf_s_l = __root._vfscanf_s_l;
    pub const vfscanf_s = __root.vfscanf_s;
    pub const _fscanf_s_l = __root._fscanf_s_l;
    pub const fscanf_s = __root.fscanf_s;
    pub const _vfscanf_l = __root._vfscanf_l;
    pub const _fscanf_l = __root._fscanf_l;
    pub const _vfprintf_s_l = __root._vfprintf_s_l;
    pub const vfprintf_s = __root.vfprintf_s;
    pub const _fprintf_s_l = __root._fprintf_s_l;
    pub const fprintf_s = __root.fprintf_s;
    pub const _vfprintf_p_l = __root._vfprintf_p_l;
    pub const _vfprintf_p = __root._vfprintf_p;
    pub const _fprintf_p_l = __root._fprintf_p_l;
    pub const _fprintf_p = __root._fprintf_p;
    pub const _vfprintf_l = __root._vfprintf_l;
    pub const _fprintf_l = __root._fprintf_l;
    pub const _vfwscanf_s_l = __root._vfwscanf_s_l;
    pub const vfwscanf_s = __root.vfwscanf_s;
    pub const _fwscanf_s_l = __root._fwscanf_s_l;
    pub const fwscanf_s = __root.fwscanf_s;
    pub const _vfwprintf_s_l = __root._vfwprintf_s_l;
    pub const vfwprintf_s = __root.vfwprintf_s;
    pub const _fwprintf_s_l = __root._fwprintf_s_l;
    pub const fwprintf_s = __root.fwprintf_s;
    pub const fwide = __root.fwide;
    pub const fgetcU16 = __root.fgetcU16;
    pub const fprintfU16 = __root.fprintfU16;
    pub const vfprintfU16 = __root.vfprintfU16;
    pub const fscanfU16 = __root.fscanfU16;
    pub const filbuf = __root._filbuf;
    pub const fseeki64 = __root._fseeki64;
    pub const ftelli64 = __root._ftelli64;
    pub const pclose = __root._pclose;
    pub const nolock = __root._fgetwc_nolock;
    pub const file = __root._lock_file;
    pub const s = __root.clearerr_s;
    pub const l = __root._vfscanf_s_l;
    pub const p = __root._vfprintf_p;
};
pub const FILE = struct__iobuf;
pub const _off_t = c_long;
pub const off32_t = c_long;
pub const _off64_t = c_longlong;
pub const off64_t = c_longlong;
pub const off_t = off32_t;
pub extern fn __acrt_iob_func(index: c_uint) [*c]FILE;
pub extern fn __iob_func() [*c]FILE;
pub const fpos_t = c_longlong;
pub extern fn __mingw_sscanf(noalias _Src: [*c]const u8, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn __mingw_vsscanf(noalias _Str: [*c]const u8, noalias Format: [*c]const u8, argp: va_list) c_int;
pub extern fn __mingw_scanf(noalias _Format: [*c]const u8, ...) c_int;
pub extern fn __mingw_vscanf(noalias Format: [*c]const u8, argp: va_list) c_int;
pub extern fn __mingw_fscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn __mingw_vfscanf(noalias fp: [*c]FILE, noalias Format: [*c]const u8, argp: va_list) c_int;
pub extern fn __mingw_vsnprintf(noalias _DstBuf: [*c]u8, _MaxCount: usize, noalias _Format: [*c]const u8, _ArgList: va_list) c_int;
pub extern fn __mingw_snprintf(noalias s: [*c]u8, n: usize, noalias format: [*c]const u8, ...) c_int;
pub extern fn __mingw_printf(noalias [*c]const u8, ...) c_int;
pub extern fn __mingw_vprintf(noalias [*c]const u8, va_list) c_int;
pub extern fn __mingw_fprintf(noalias [*c]FILE, noalias [*c]const u8, ...) c_int;
pub extern fn __mingw_vfprintf(noalias [*c]FILE, noalias [*c]const u8, va_list) c_int;
pub extern fn __mingw_sprintf(noalias [*c]u8, noalias [*c]const u8, ...) c_int;
pub extern fn __mingw_vsprintf(noalias [*c]u8, noalias [*c]const u8, va_list) c_int;
pub extern fn __mingw_asprintf(noalias [*c][*c]u8, noalias [*c]const u8, ...) c_int;
pub extern fn __mingw_vasprintf(noalias [*c][*c]u8, noalias [*c]const u8, va_list) c_int;
pub extern fn __ms_sscanf(noalias _Src: [*c]const u8, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn __ms_vsscanf(noalias _Str: [*c]const u8, noalias _Format: [*c]const u8, argp: va_list) c_int;
pub extern fn __ms_scanf(noalias _Format: [*c]const u8, ...) c_int;
pub extern fn __ms_vscanf(noalias _Format: [*c]const u8, argp: va_list) c_int;
pub extern fn __ms_fscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn __ms_vfscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const u8, argp: va_list) c_int;
pub extern fn __ms_printf(noalias [*c]const u8, ...) c_int;
pub extern fn __ms_vprintf(noalias [*c]const u8, va_list) c_int;
pub extern fn __ms_fprintf(noalias [*c]FILE, noalias [*c]const u8, ...) c_int;
pub extern fn __ms_vfprintf(noalias [*c]FILE, noalias [*c]const u8, va_list) c_int;
pub extern fn __ms_sprintf(noalias [*c]u8, noalias [*c]const u8, ...) c_int;
pub extern fn __ms_vsprintf(noalias [*c]u8, noalias [*c]const u8, va_list) c_int;
pub extern fn __ms_snprintf(noalias [*c]u8, usize, noalias [*c]const u8, ...) c_int;
pub extern fn __ms_vsnprintf(noalias [*c]u8, usize, noalias [*c]const u8, va_list) c_int;
pub extern fn __stdio_common_vsprintf(options: c_ulonglong, str: [*c]u8, len: usize, format: [*c]const u8, locale: _locale_t, valist: va_list) c_int;
pub extern fn __stdio_common_vfprintf(options: c_ulonglong, file: [*c]FILE, format: [*c]const u8, locale: _locale_t, valist: va_list) c_int;
pub extern fn __stdio_common_vsscanf(options: c_ulonglong, input: [*c]const u8, length: usize, format: [*c]const u8, locale: _locale_t, valist: va_list) c_int;
pub extern fn __stdio_common_vfscanf(options: c_ulonglong, file: [*c]FILE, format: [*c]const u8, locale: _locale_t, valist: va_list) c_int;
pub extern fn fprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn printf(noalias _Format: [*c]const u8, ...) c_int;
pub extern fn sprintf(noalias _Dest: [*c]u8, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn vfprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const u8, _ArgList: va_list) c_int;
pub extern fn vprintf(noalias _Format: [*c]const u8, _ArgList: va_list) c_int;
pub extern fn vsprintf(noalias _Dest: [*c]u8, noalias _Format: [*c]const u8, _Args: va_list) c_int;
pub extern fn fscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn scanf(noalias _Format: [*c]const u8, ...) c_int;
pub extern fn sscanf(noalias _Src: [*c]const u8, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn vfscanf(__stream: [*c]FILE, __format: [*c]const u8, __local_argv: __builtin_va_list) c_int;
pub extern fn vsscanf(noalias __source: [*c]const u8, noalias __format: [*c]const u8, __local_argv: __builtin_va_list) c_int;
pub extern fn vscanf(__format: [*c]const u8, __local_argv: __builtin_va_list) c_int;
pub extern fn _filbuf(_File: [*c]FILE) c_int;
pub extern fn _flsbuf(_Ch: c_int, _File: [*c]FILE) c_int;
pub extern fn _fsopen(_Filename: [*c]const u8, _Mode: [*c]const u8, _ShFlag: c_int) [*c]FILE;
pub extern fn clearerr(_File: [*c]FILE) void;
pub extern fn fclose(_File: [*c]FILE) c_int;
pub extern fn _fcloseall() c_int;
pub extern fn _fdopen(_FileHandle: c_int, _Mode: [*c]const u8) [*c]FILE;
pub extern fn feof(_File: [*c]FILE) c_int;
pub extern fn ferror(_File: [*c]FILE) c_int;
pub extern fn fflush(_File: [*c]FILE) c_int;
pub extern fn fgetc(_File: [*c]FILE) c_int;
pub extern fn _fgetchar() c_int;
pub extern fn fgetpos(noalias _File: [*c]FILE, noalias _Pos: [*c]fpos_t) c_int;
pub extern fn fgetpos64(noalias _File: [*c]FILE, noalias _Pos: [*c]fpos_t) c_int;
pub extern fn fgets(noalias _Buf: [*c]u8, _MaxCount: c_int, noalias _File: [*c]FILE) [*c]u8;
pub extern fn _fileno(_File: [*c]FILE) c_int;
pub extern fn _tempnam(_DirName: [*c]const u8, _FilePrefix: [*c]const u8) [*c]u8;
pub extern fn _flushall() c_int;
pub extern fn fopen(noalias _Filename: [*c]const u8, noalias _Mode: [*c]const u8) [*c]FILE;
pub extern fn fopen64(noalias filename: [*c]const u8, noalias mode: [*c]const u8) [*c]FILE;
pub extern fn fputc(_Ch: c_int, _File: [*c]FILE) c_int;
pub extern fn _fputchar(_Ch: c_int) c_int;
pub extern fn fputs(noalias _Str: [*c]const u8, noalias _File: [*c]FILE) c_int;
pub extern fn fread(noalias _DstBuf: ?*anyopaque, _ElementSize: usize, _Count: usize, noalias _File: [*c]FILE) usize;
pub extern fn freopen(noalias _Filename: [*c]const u8, noalias _Mode: [*c]const u8, noalias _File: [*c]FILE) [*c]FILE;
pub extern fn fsetpos(_File: [*c]FILE, _Pos: [*c]const fpos_t) c_int;
pub extern fn fsetpos64(_File: [*c]FILE, _Pos: [*c]const fpos_t) c_int;
pub extern fn fseek(_File: [*c]FILE, _Offset: c_long, _Origin: c_int) c_int;
pub extern fn ftell(_File: [*c]FILE) c_long;
pub extern fn _fseeki64(_File: [*c]FILE, _Offset: c_longlong, _Origin: c_int) c_int;
pub extern fn _ftelli64(_File: [*c]FILE) c_longlong;
pub fn fseeko(arg__File: [*c]FILE, arg__Offset: _off_t, arg__Origin: c_int) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Offset = arg__Offset;
    _ = &_Offset;
    var _Origin = arg__Origin;
    _ = &_Origin;
    return fseek(_File, _Offset, _Origin);
}
pub fn fseeko64(arg__File: [*c]FILE, arg__Offset: _off64_t, arg__Origin: c_int) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Offset = arg__Offset;
    _ = &_Offset;
    var _Origin = arg__Origin;
    _ = &_Origin;
    return _fseeki64(_File, _Offset, _Origin);
}
pub fn ftello(arg__File: [*c]FILE) callconv(.c) _off_t {
    var _File = arg__File;
    _ = &_File;
    return ftell(_File);
}
pub fn ftello64(arg__File: [*c]FILE) callconv(.c) _off64_t {
    var _File = arg__File;
    _ = &_File;
    return _ftelli64(_File);
}
pub extern fn fwrite(noalias _Str: ?*const anyopaque, _Size: usize, _Count: usize, noalias _File: [*c]FILE) usize;
pub extern fn getc(_File: [*c]FILE) c_int;
pub extern fn getchar() c_int;
pub extern fn _getmaxstdio() c_int;
pub extern fn gets(_Buffer: [*c]u8) [*c]u8;
pub extern fn _getw(_File: [*c]FILE) c_int;
pub extern fn _pclose(_File: [*c]FILE) c_int;
pub extern fn _popen(_Command: [*c]const u8, _Mode: [*c]const u8) [*c]FILE;
pub extern fn putc(_Ch: c_int, _File: [*c]FILE) c_int;
pub extern fn putchar(_Ch: c_int) c_int;
pub extern fn puts(_Str: [*c]const u8) c_int;
pub extern fn _putw(_Word: c_int, _File: [*c]FILE) c_int;
pub extern fn remove(_Filename: [*c]const u8) c_int;
pub extern fn rename(_OldFilename: [*c]const u8, _NewFilename: [*c]const u8) c_int;
pub extern fn _unlink(_Filename: [*c]const u8) c_int;
pub extern fn unlink(_Filename: [*c]const u8) c_int;
pub extern fn rewind(_File: [*c]FILE) void;
pub extern fn _rmtmp() c_int;
pub extern fn setbuf(noalias _File: [*c]FILE, noalias _Buffer: [*c]u8) void;
pub extern fn _setmaxstdio(_Max: c_int) c_int;
pub extern fn _set_output_format(_Format: c_uint) c_uint;
pub extern fn _get_output_format() c_uint;
pub extern fn setvbuf(noalias _File: [*c]FILE, noalias _Buf: [*c]u8, _Mode: c_int, _Size: usize) c_int;
pub extern fn _scprintf(noalias _Format: [*c]const u8, ...) c_int;
pub extern fn _snscanf(noalias _Src: [*c]const u8, _MaxCount: usize, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn _vscprintf(noalias _Format: [*c]const u8, _ArgList: va_list) c_int;
pub extern fn tmpfile() [*c]FILE;
pub extern fn tmpnam(_Buffer: [*c]u8) [*c]u8;
pub extern fn ungetc(_Ch: c_int, _File: [*c]FILE) c_int;
pub extern fn _vsnprintf(noalias _Dest: [*c]u8, _Count: usize, noalias _Format: [*c]const u8, _Args: va_list) c_int;
pub extern fn _snprintf(noalias _Dest: [*c]u8, _Count: usize, noalias _Format: [*c]const u8, ...) c_int;
pub extern fn vsnprintf(noalias __stream: [*c]u8, __n: usize, noalias __format: [*c]const u8, __local_argv: va_list) c_int;
pub extern fn snprintf(noalias __stream: [*c]u8, __n: usize, noalias __format: [*c]const u8, ...) c_int;
pub extern fn _set_printf_count_output(_Value: c_int) c_int;
pub extern fn _get_printf_count_output() c_int;
pub extern fn __mingw_swscanf(noalias _Src: [*c]const wchar_t, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_vswscanf(noalias _Str: [*c]const wchar_t, noalias Format: [*c]const wchar_t, argp: va_list) c_int;
pub extern fn __mingw_wscanf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_vwscanf(noalias Format: [*c]const wchar_t, argp: va_list) c_int;
pub extern fn __mingw_fwscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_vfwscanf(noalias fp: [*c]FILE, noalias Format: [*c]const wchar_t, argp: va_list) c_int;
pub extern fn __mingw_fwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_wprintf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_vfwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn __mingw_vwprintf(noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn __mingw_snwprintf(noalias s: [*c]wchar_t, n: usize, noalias format: [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_vsnwprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, va_list) c_int;
pub extern fn __mingw_swprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, ...) c_int;
pub extern fn __mingw_vswprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, va_list) c_int;
pub extern fn __ms_swscanf(noalias _Src: [*c]const wchar_t, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __ms_vswscanf(noalias _Src: [*c]const wchar_t, noalias _Format: [*c]const wchar_t, va_list) c_int;
pub extern fn __ms_wscanf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __ms_vwscanf(noalias _Format: [*c]const wchar_t, va_list) c_int;
pub extern fn __ms_fwscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __ms_vfwscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, va_list) c_int;
pub extern fn __ms_fwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __ms_wprintf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn __ms_vfwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn __ms_vwprintf(noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn __ms_swprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, ...) c_int;
pub extern fn __ms_vswprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, va_list) c_int;
pub extern fn __ms_snwprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, ...) c_int;
pub extern fn __ms_vsnwprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, va_list) c_int;
pub extern fn __stdio_common_vswprintf(options: c_ulonglong, str: [*c]wchar_t, len: usize, format: [*c]const wchar_t, locale: _locale_t, valist: va_list) c_int;
pub extern fn __stdio_common_vfwprintf(options: c_ulonglong, file: [*c]FILE, format: [*c]const wchar_t, locale: _locale_t, valist: va_list) c_int;
pub extern fn __stdio_common_vswscanf(options: c_ulonglong, input: [*c]const wchar_t, length: usize, format: [*c]const wchar_t, locale: _locale_t, valist: va_list) c_int;
pub extern fn __stdio_common_vfwscanf(options: c_ulonglong, file: [*c]FILE, format: [*c]const wchar_t, locale: _locale_t, valist: va_list) c_int;
pub extern fn fwscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn swscanf(noalias _Src: [*c]const wchar_t, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn wscanf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn vfwscanf(__stream: [*c]FILE, __format: [*c]const wchar_t, __local_argv: va_list) c_int;
pub extern fn vswscanf(noalias __source: [*c]const wchar_t, noalias __format: [*c]const wchar_t, __local_argv: va_list) c_int;
pub extern fn vwscanf(__format: [*c]const wchar_t, __local_argv: va_list) c_int;
pub extern fn fwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn wprintf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn vfwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn vwprintf(noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn _wfsopen(_Filename: [*c]const wchar_t, _Mode: [*c]const wchar_t, _ShFlag: c_int) [*c]FILE;
pub extern fn fgetwc(_File: [*c]FILE) wint_t;
pub extern fn _fgetwchar() wint_t;
pub extern fn fputwc(_Ch: wchar_t, _File: [*c]FILE) wint_t;
pub extern fn _fputwchar(_Ch: wchar_t) wint_t;
pub extern fn getwc(_File: [*c]FILE) wint_t;
pub extern fn getwchar() wint_t;
pub extern fn putwc(_Ch: wchar_t, _File: [*c]FILE) wint_t;
pub extern fn putwchar(_Ch: wchar_t) wint_t;
pub extern fn ungetwc(_Ch: wint_t, _File: [*c]FILE) wint_t;
pub extern fn fgetws(noalias _Dst: [*c]wchar_t, _SizeInWords: c_int, noalias _File: [*c]FILE) [*c]wchar_t;
pub extern fn fputws(noalias _Str: [*c]const wchar_t, noalias _File: [*c]FILE) c_int;
pub extern fn _getws(_String: [*c]wchar_t) [*c]wchar_t;
pub extern fn _putws(_Str: [*c]const wchar_t) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\stdio.h:1169:15: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _scwprintf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn _snwprintf(noalias _Dest: [*c]wchar_t, _Count: usize, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn _vsnwprintf(noalias _Dest: [*c]wchar_t, _Count: usize, noalias _Format: [*c]const wchar_t, _Args: va_list) c_int;
pub extern fn swprintf(noalias _Dest: [*c]wchar_t, _Count: usize, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn vswprintf(noalias _Dest: [*c]wchar_t, _Count: usize, noalias _Format: [*c]const wchar_t, _Args: va_list) c_int;
pub extern fn snwprintf(noalias s: [*c]wchar_t, n: usize, noalias format: [*c]const wchar_t, ...) c_int;
pub extern fn vsnwprintf(noalias s: [*c]wchar_t, n: usize, noalias format: [*c]const wchar_t, arg: va_list) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\stdio.h:1190:15: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _swprintf(noalias _Dest: [*c]wchar_t, noalias _Format: [*c]const wchar_t, ...) c_int;
pub fn _vswprintf(noalias arg__Dest: [*c]wchar_t, noalias arg__Format: [*c]const wchar_t, arg__Args: va_list) callconv(.c) c_int {
    var _Dest = arg__Dest;
    _ = &_Dest;
    var _Format = arg__Format;
    _ = &_Format;
    var _Args = arg__Args;
    _ = &_Args;
    return __stdio_common_vswprintf(__local_stdio_printf_options().*, _Dest, @bitCast(@as(c_longlong, -@as(c_int, 1))), _Format, null, _Args);
}
pub fn _vscwprintf(noalias arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    var _Result: c_int = __stdio_common_vswprintf(__local_stdio_printf_options().* | @as(c_ulonglong, 2), null, 0, _Format, null, _ArgList);
    _ = &_Result;
    return if (_Result < @as(c_int, 0)) -@as(c_int, 1) else _Result;
}
pub extern fn _wtempnam(_Directory: [*c]const wchar_t, _FilePrefix: [*c]const wchar_t) [*c]wchar_t;
pub extern fn _snwscanf(noalias _Src: [*c]const wchar_t, _MaxCount: usize, noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn _wfdopen(_FileHandle: c_int, _Mode: [*c]const wchar_t) [*c]FILE;
pub extern fn _wfopen(noalias _Filename: [*c]const wchar_t, noalias _Mode: [*c]const wchar_t) [*c]FILE;
pub extern fn _wfreopen(noalias _Filename: [*c]const wchar_t, noalias _Mode: [*c]const wchar_t, noalias _OldFile: [*c]FILE) [*c]FILE;
pub extern fn _wpopen(_Command: [*c]const wchar_t, _Mode: [*c]const wchar_t) [*c]FILE;
pub extern fn _wremove(_Filename: [*c]const wchar_t) c_int;
pub extern fn _wtmpnam(_Buffer: [*c]wchar_t) [*c]wchar_t;
pub extern fn _fgetwc_nolock(_File: [*c]FILE) wint_t;
pub extern fn _fputwc_nolock(_Ch: wchar_t, _File: [*c]FILE) wint_t;
pub extern fn _ungetwc_nolock(_Ch: wint_t, _File: [*c]FILE) wint_t;
pub extern fn _fgetc_nolock(_File: [*c]FILE) c_int;
pub extern fn _fputc_nolock(_Char: c_int, _File: [*c]FILE) c_int;
pub extern fn _getc_nolock(_File: [*c]FILE) c_int;
pub extern fn _putc_nolock(_Char: c_int, _File: [*c]FILE) c_int;
pub extern fn _lock_file(_File: [*c]FILE) void;
pub extern fn _unlock_file(_File: [*c]FILE) void;
pub extern fn _fclose_nolock(_File: [*c]FILE) c_int;
pub extern fn _fflush_nolock(_File: [*c]FILE) c_int;
pub extern fn _fread_nolock(noalias _DstBuf: ?*anyopaque, _ElementSize: usize, _Count: usize, noalias _File: [*c]FILE) usize;
pub extern fn _fseek_nolock(_File: [*c]FILE, _Offset: c_long, _Origin: c_int) c_int;
pub extern fn _ftell_nolock(_File: [*c]FILE) c_long;
pub extern fn _fseeki64_nolock(_File: [*c]FILE, _Offset: c_longlong, _Origin: c_int) c_int;
pub extern fn _ftelli64_nolock(_File: [*c]FILE) c_longlong;
pub extern fn _fwrite_nolock(noalias _DstBuf: ?*const anyopaque, _Size: usize, _Count: usize, noalias _File: [*c]FILE) usize;
pub extern fn _ungetc_nolock(_Ch: c_int, _File: [*c]FILE) c_int;
pub extern fn tempnam(_Directory: [*c]const u8, _FilePrefix: [*c]const u8) [*c]u8;
pub extern fn fcloseall() c_int;
pub extern fn fdopen(_FileHandle: c_int, _Format: [*c]const u8) [*c]FILE;
pub extern fn fgetchar() c_int;
pub extern fn fileno(_File: [*c]FILE) c_int;
pub extern fn flushall() c_int;
pub extern fn fputchar(_Ch: c_int) c_int;
pub extern fn getw(_File: [*c]FILE) c_int;
pub extern fn putw(_Ch: c_int, _File: [*c]FILE) c_int;
pub extern fn rmtmp() c_int;
pub extern fn __mingw_str_wide_utf8(wptr: [*c]const wchar_t, mbptr: [*c][*c]u8, buflen: [*c]usize) c_int;
pub extern fn __mingw_str_utf8_wide(mbptr: [*c]const u8, wptr: [*c][*c]wchar_t, buflen: [*c]usize) c_int;
pub extern fn __mingw_str_free(ptr: ?*anyopaque) void;
pub extern fn _wspawnl(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
pub extern fn _wspawnle(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
pub extern fn _wspawnlp(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
pub extern fn _wspawnlpe(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
pub extern fn _wspawnv(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t) isize;
pub extern fn _wspawnve(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t, _Env: [*c]const [*c]const wchar_t) isize;
pub extern fn _wspawnvp(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t) isize;
pub extern fn _wspawnvpe(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t, _Env: [*c]const [*c]const wchar_t) isize;
pub extern fn _spawnv(_Mode: c_int, _Filename: [*c]const u8, _ArgList: [*c]const [*c]const u8) isize;
pub extern fn _spawnve(_Mode: c_int, _Filename: [*c]const u8, _ArgList: [*c]const [*c]const u8, _Env: [*c]const [*c]const u8) isize;
pub extern fn _spawnvp(_Mode: c_int, _Filename: [*c]const u8, _ArgList: [*c]const [*c]const u8) isize;
pub extern fn _spawnvpe(_Mode: c_int, _Filename: [*c]const u8, _ArgList: [*c]const [*c]const u8, _Env: [*c]const [*c]const u8) isize;
pub extern fn clearerr_s(_File: [*c]FILE) errno_t;
pub extern fn fread_s(_DstBuf: ?*anyopaque, _DstSize: usize, _ElementSize: usize, _Count: usize, _File: [*c]FILE) usize;
pub extern fn __stdio_common_vsprintf_s(_Options: c_ulonglong, _Str: [*c]u8, _Len: usize, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn __stdio_common_vsprintf_p(_Options: c_ulonglong, _Str: [*c]u8, _Len: usize, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn __stdio_common_vsnprintf_s(_Options: c_ulonglong, _Str: [*c]u8, _Len: usize, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn __stdio_common_vfprintf_s(_Options: c_ulonglong, _File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn __stdio_common_vfprintf_p(_Options: c_ulonglong, _File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
pub fn _vfscanf_s_l(arg__File: [*c]FILE, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfscanf(1, _File, _Format, _Locale, _ArgList);
}
pub fn vfscanf_s(arg__File: [*c]FILE, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfscanf_s_l(_File, _Format, null, _ArgList);
}
pub fn _vscanf_s_l(arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfscanf_s_l(__acrt_iob_func(0), _Format, _Locale, _ArgList);
}
pub fn vscanf_s(arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfscanf_s_l(__acrt_iob_func(0), _Format, null, _ArgList);
} // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:60:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fscanf_s_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:70:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn fscanf_s(_File: [*c]FILE, _Format: [*c]const u8, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:80:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _scanf_s_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:90:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn scanf_s(_Format: [*c]const u8, ...) c_int;
pub fn _vfscanf_l(arg__File: [*c]FILE, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfscanf(0, _File, _Format, _Locale, _ArgList);
}
pub fn _vscanf_l(arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfscanf_l(__acrt_iob_func(0), _Format, _Locale, _ArgList);
} // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:110:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fscanf_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:119:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _scanf_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
pub fn _vsscanf_s_l(arg__Src: [*c]const u8, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Src = arg__Src;
    _ = &_Src;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsscanf(1, _Src, @bitCast(@as(c_longlong, -@as(c_int, 1))), _Format, _Locale, _ArgList);
}
pub fn vsscanf_s(arg__Src: [*c]const u8, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _Src = arg__Src;
    _ = &_Src;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vsscanf_s_l(_Src, _Format, null, _ArgList);
} // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:137:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _sscanf_s_l(_Src: [*c]const u8, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:146:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn sscanf_s(_Src: [*c]const u8, _Format: [*c]const u8, ...) c_int;
pub fn _vsscanf_l(arg__Src: [*c]const u8, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Src = arg__Src;
    _ = &_Src;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsscanf(0, _Src, @bitCast(@as(c_longlong, -@as(c_int, 1))), _Format, _Locale, _ArgList);
} // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:160:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _sscanf_l(_Src: [*c]const u8, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:171:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snscanf_s_l(_Src: [*c]const u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:180:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snscanf_s(_Src: [*c]const u8, _MaxCount: usize, _Format: [*c]const u8, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:191:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snscanf_l(_Src: [*c]const u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
pub fn _vfprintf_s_l(arg__File: [*c]FILE, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfprintf_s(__local_stdio_printf_options().*, _File, _Format, _Locale, _ArgList);
}
pub fn vfprintf_s(arg__File: [*c]FILE, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfprintf_s_l(_File, _Format, null, _ArgList);
}
pub fn _vprintf_s_l(arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfprintf_s_l(__acrt_iob_func(1), _Format, _Locale, _ArgList);
}
pub fn vprintf_s(arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfprintf_s_l(__acrt_iob_func(1), _Format, null, _ArgList);
} // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:218:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fprintf_s_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:227:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _printf_s_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:236:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn fprintf_s(_File: [*c]FILE, _Format: [*c]const u8, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:245:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn printf_s(_Format: [*c]const u8, ...) c_int;
pub fn _vsnprintf_c_l(arg__DstBuf: [*c]u8, arg__MaxCount: usize, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsprintf(__local_stdio_printf_options().*, _DstBuf, _MaxCount, _Format, _Locale, _ArgList);
}
pub fn _vsnprintf_c(arg__DstBuf: [*c]u8, arg__MaxCount: usize, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vsnprintf_c_l(_DstBuf, _MaxCount, _Format, null, _ArgList);
} // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:263:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snprintf_c_l(_DstBuf: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:272:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snprintf_c(_DstBuf: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, ...) c_int;
pub fn _vsnprintf_s_l(arg__DstBuf: [*c]u8, arg__DstSize: usize, arg__MaxCount: usize, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsnprintf_s(__local_stdio_printf_options().*, _DstBuf, _DstSize, _MaxCount, _Format, _Locale, _ArgList);
}
pub fn vsnprintf_s(arg__DstBuf: [*c]u8, arg__DstSize: usize, arg__MaxCount: usize, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vsnprintf_s_l(_DstBuf, _DstSize, _MaxCount, _Format, null, _ArgList);
}
pub fn _vsnprintf_s(arg__DstBuf: [*c]u8, arg__DstSize: usize, arg__MaxCount: usize, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vsnprintf_s_l(_DstBuf, _DstSize, _MaxCount, _Format, null, _ArgList);
} // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:294:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snprintf_s_l(_DstBuf: [*c]u8, _DstSize: usize, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:303:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snprintf_s(_DstBuf: [*c]u8, _DstSize: usize, _MaxCount: usize, _Format: [*c]const u8, ...) c_int;
pub fn _vsprintf_s_l(arg__DstBuf: [*c]u8, arg__DstSize: usize, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsprintf_s(__local_stdio_printf_options().*, _DstBuf, _DstSize, _Format, _Locale, _ArgList);
}
pub fn vsprintf_s(arg__DstBuf: [*c]u8, arg__Size: usize, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _Size = arg__Size;
    _ = &_Size;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vsprintf_s_l(_DstBuf, _Size, _Format, null, _ArgList);
} // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:321:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _sprintf_s_l(_DstBuf: [*c]u8, _DstSize: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:330:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn sprintf_s(_DstBuf: [*c]u8, _DstSize: usize, _Format: [*c]const u8, ...) c_int;
pub fn _vfprintf_p_l(arg__File: [*c]FILE, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfprintf_p(__local_stdio_printf_options().*, _File, _Format, _Locale, _ArgList);
}
pub fn _vfprintf_p(arg__File: [*c]FILE, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfprintf_p_l(_File, _Format, null, _ArgList);
}
pub fn _vprintf_p_l(arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfprintf_p_l(__acrt_iob_func(1), _Format, _Locale, _ArgList);
}
pub fn _vprintf_p(arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfprintf_p_l(__acrt_iob_func(1), _Format, null, _ArgList);
} // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:356:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fprintf_p_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:365:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fprintf_p(_File: [*c]FILE, _Format: [*c]const u8, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:374:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _printf_p_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:383:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _printf_p(_Format: [*c]const u8, ...) c_int;
pub fn _vsprintf_p_l(arg__DstBuf: [*c]u8, arg__MaxCount: usize, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsprintf_p(__local_stdio_printf_options().*, _DstBuf, _MaxCount, _Format, _Locale, _ArgList);
}
pub fn _vsprintf_p(arg__Dst: [*c]u8, arg__MaxCount: usize, arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _Dst = arg__Dst;
    _ = &_Dst;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vsprintf_p_l(_Dst, _MaxCount, _Format, null, _ArgList);
} // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:401:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _sprintf_p_l(_DstBuf: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:410:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _sprintf_p(_Dst: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, ...) c_int;
pub fn _vscprintf_p_l(arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsprintf_p(2, null, 0, _Format, _Locale, _ArgList);
}
pub fn _vscprintf_p(arg__Format: [*c]const u8, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vscprintf_p_l(_Format, null, _ArgList);
} // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:428:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _scprintf_p_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:437:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _scprintf_p(_Format: [*c]const u8, ...) c_int;
pub fn _vfprintf_l(arg__File: [*c]FILE, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfprintf(__local_stdio_printf_options().*, _File, _Format, _Locale, _ArgList);
}
pub fn _vprintf_l(arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfprintf_l(__acrt_iob_func(1), _Format, _Locale, _ArgList);
} // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:455:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fprintf_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:464:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _printf_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
pub fn _vsnprintf_l(arg__DstBuf: [*c]u8, arg__MaxCount: usize, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsprintf(1, _DstBuf, _MaxCount, _Format, _Locale, _ArgList);
} // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:478:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snprintf_l(_DstBuf: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
pub fn _vsprintf_l(arg__DstBuf: [*c]u8, arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vsnprintf_l(_DstBuf, @bitCast(@as(c_longlong, -@as(c_int, 1))), _Format, _Locale, _ArgList);
} // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:491:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _sprintf_l(_DstBuf: [*c]u8, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
pub fn _vscprintf_l(arg__Format: [*c]const u8, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsprintf(2, null, 0, _Format, _Locale, _ArgList);
} // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:505:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _scprintf_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
pub extern fn fopen_s(_File: [*c][*c]FILE, _Filename: [*c]const u8, _Mode: [*c]const u8) errno_t;
pub extern fn freopen_s(_File: [*c][*c]FILE, _Filename: [*c]const u8, _Mode: [*c]const u8, _Stream: [*c]FILE) errno_t;
pub extern fn gets_s([*c]u8, rsize_t) [*c]u8;
pub extern fn tmpfile_s(_File: [*c][*c]FILE) errno_t;
pub extern fn tmpnam_s([*c]u8, rsize_t) errno_t;
pub extern fn _getws_s(_Str: [*c]wchar_t, _SizeInWords: usize) [*c]wchar_t;
pub extern fn __stdio_common_vswprintf_s(_Options: c_ulonglong, _Str: [*c]wchar_t, _Len: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn __stdio_common_vsnwprintf_s(_Options: c_ulonglong, _Str: [*c]wchar_t, _Len: usize, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn __stdio_common_vfwprintf_s(_Options: c_ulonglong, _File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub fn _vfwscanf_s_l(arg__File: [*c]FILE, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfwscanf(__local_stdio_scanf_options().* | @as(c_ulonglong, 1), _File, _Format, _Locale, _ArgList);
}
pub fn vfwscanf_s(arg__File: [*c]FILE, arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwscanf_s_l(_File, _Format, null, _ArgList);
}
pub fn _vwscanf_s_l(arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwscanf_s_l(__acrt_iob_func(0), _Format, _Locale, _ArgList);
}
pub fn vwscanf_s(arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwscanf_s_l(__acrt_iob_func(0), _Format, null, _ArgList);
} // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:631:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fwscanf_s_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:641:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn fwscanf_s(_File: [*c]FILE, _Format: [*c]const wchar_t, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:651:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _wscanf_s_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:661:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn wscanf_s(_Format: [*c]const wchar_t, ...) c_int;
pub fn _vswscanf_s_l(arg__Src: [*c]const wchar_t, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Src = arg__Src;
    _ = &_Src;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vswscanf(__local_stdio_scanf_options().* | @as(c_ulonglong, 1), _Src, @bitCast(@as(c_longlong, -@as(c_int, 1))), _Format, _Locale, _ArgList);
}
pub fn vswscanf_s(arg__Src: [*c]const wchar_t, arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Src = arg__Src;
    _ = &_Src;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vswscanf_s_l(_Src, _Format, null, _ArgList);
} // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:681:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _swscanf_s_l(_Src: [*c]const wchar_t, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:690:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn swscanf_s(_Src: [*c]const wchar_t, _Format: [*c]const wchar_t, ...) c_int;
pub fn _vsnwscanf_s_l(arg__Src: [*c]const wchar_t, arg__MaxCount: usize, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Src = arg__Src;
    _ = &_Src;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vswscanf(__local_stdio_scanf_options().* | @as(c_ulonglong, 1), _Src, _MaxCount, _Format, _Locale, _ArgList);
} // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:704:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snwscanf_s_l(_Src: [*c]const wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:713:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snwscanf_s(_Src: [*c]const wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, ...) c_int;
pub fn _vfwprintf_s_l(arg__File: [*c]FILE, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vfwprintf_s(__local_stdio_printf_options().*, _File, _Format, _Locale, _ArgList);
}
pub fn _vwprintf_s_l(arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwprintf_s_l(__acrt_iob_func(1), _Format, _Locale, _ArgList);
}
pub fn vfwprintf_s(arg__File: [*c]FILE, arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _File = arg__File;
    _ = &_File;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwprintf_s_l(_File, _Format, null, _ArgList);
}
pub fn vwprintf_s(arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vfwprintf_s_l(__acrt_iob_func(1), _Format, null, _ArgList);
} // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:739:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _fwprintf_s_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:748:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _wprintf_s_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:757:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn fwprintf_s(_File: [*c]FILE, _Format: [*c]const wchar_t, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:766:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn wprintf_s(_Format: [*c]const wchar_t, ...) c_int;
pub fn _vswprintf_s_l(arg__DstBuf: [*c]wchar_t, arg__DstSize: usize, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vswprintf_s(__local_stdio_printf_options().*, _DstBuf, _DstSize, _Format, _Locale, _ArgList);
}
pub fn vswprintf_s(arg__DstBuf: [*c]wchar_t, arg__DstSize: usize, arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vswprintf_s_l(_DstBuf, _DstSize, _Format, null, _ArgList);
} // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:784:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _swprintf_s_l(_DstBuf: [*c]wchar_t, _DstSize: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:793:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn swprintf_s(_DstBuf: [*c]wchar_t, _DstSize: usize, _Format: [*c]const wchar_t, ...) c_int;
pub fn _vsnwprintf_s_l(arg__DstBuf: [*c]wchar_t, arg__DstSize: usize, arg__MaxCount: usize, arg__Format: [*c]const wchar_t, arg__Locale: _locale_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _Locale = arg__Locale;
    _ = &_Locale;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return __stdio_common_vsnwprintf_s(__local_stdio_printf_options().*, _DstBuf, _DstSize, _MaxCount, _Format, _Locale, _ArgList);
}
pub fn _vsnwprintf_s(arg__DstBuf: [*c]wchar_t, arg__DstSize: usize, arg__MaxCount: usize, arg__Format: [*c]const wchar_t, arg__ArgList: va_list) callconv(.c) c_int {
    var _DstBuf = arg__DstBuf;
    _ = &_DstBuf;
    var _DstSize = arg__DstSize;
    _ = &_DstSize;
    var _MaxCount = arg__MaxCount;
    _ = &_MaxCount;
    var _Format = arg__Format;
    _ = &_Format;
    var _ArgList = arg__ArgList;
    _ = &_ArgList;
    return _vsnwprintf_s_l(_DstBuf, _DstSize, _MaxCount, _Format, null, _ArgList);
} // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:811:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snwprintf_s_l(_DstBuf: [*c]wchar_t, _DstSize: usize, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int; // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\sec_api/stdio_s.h:820:27: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn _snwprintf_s(_DstBuf: [*c]wchar_t, _DstSize: usize, _MaxCount: usize, _Format: [*c]const wchar_t, ...) c_int;
pub extern fn _wfopen_s(_File: [*c][*c]FILE, _Filename: [*c]const wchar_t, _Mode: [*c]const wchar_t) errno_t;
pub extern fn _wfreopen_s(_File: [*c][*c]FILE, _Filename: [*c]const wchar_t, _Mode: [*c]const wchar_t, _OldFile: [*c]FILE) errno_t;
pub extern fn _wtmpnam_s(_DstBuf: [*c]wchar_t, _SizeInWords: usize) errno_t;
pub extern fn _fread_nolock_s(_DstBuf: ?*anyopaque, _DstSize: usize, _ElementSize: usize, _Count: usize, _File: [*c]FILE) usize;
pub const SAP_CHAR = wchar_t;
pub const SAP_UC = wchar_t;
pub const max_align_t = extern struct {
    __aro_max_align_ll: c_longlong = 0,
    __aro_max_align_ld: c_longdouble = 0,
};
pub extern fn __pctype_func() [*c]const c_ushort;
pub extern var __imp__wctype: [*c][*c]const c_ushort;
pub extern fn __pwctype_func() [*c]const wctype_t;
pub extern fn iswalpha(_C: wint_t) c_int;
pub extern fn iswupper(_C: wint_t) c_int;
pub extern fn iswlower(_C: wint_t) c_int;
pub extern fn iswdigit(_C: wint_t) c_int;
pub extern fn iswxdigit(_C: wint_t) c_int;
pub extern fn iswspace(_C: wint_t) c_int;
pub extern fn iswpunct(_C: wint_t) c_int;
pub extern fn iswalnum(_C: wint_t) c_int;
pub extern fn iswprint(_C: wint_t) c_int;
pub extern fn iswgraph(_C: wint_t) c_int;
pub extern fn iswcntrl(_C: wint_t) c_int;
pub extern fn iswascii(_C: wint_t) c_int;
pub extern fn isleadbyte(_C: c_int) c_int;
pub extern fn towupper(_C: wint_t) wint_t;
pub extern fn towlower(_C: wint_t) wint_t;
pub extern fn iswctype(_C: wint_t, _Type: wctype_t) c_int;
pub extern fn __iswcsymf(_C: wint_t) c_int;
pub extern fn __iswcsym(_C: wint_t) c_int;
pub extern fn iswblank(_C: wint_t) c_int;
pub extern fn _iswalpha_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswupper_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswlower_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswdigit_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswxdigit_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswspace_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswpunct_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswalnum_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswprint_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswgraph_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswcntrl_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _towupper_l(_C: wint_t, _Locale: _locale_t) wint_t;
pub extern fn _towlower_l(_C: wint_t, _Locale: _locale_t) wint_t;
pub extern fn _isleadbyte_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _iswctype_l(_C: wint_t, _Type: wctype_t, _Locale: _locale_t) c_int;
pub extern fn _iswblank_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswcsymf_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn _iswcsym_l(_C: wint_t, _Locale: _locale_t) c_int;
pub extern fn is_wctype(_C: wint_t, _Type: wctype_t) c_int;
pub const __newclmap: [*c]const u8 = @extern([*c]const u8, .{
    .name = "__newclmap",
});
pub const __newcumap: [*c]const u8 = @extern([*c]const u8, .{
    .name = "__newcumap",
});
pub extern var __ptlocinfo: pthreadlocinfo;
pub extern var __ptmbcinfo: pthreadmbcinfo;
pub extern var __globallocalestatus: c_int;
pub extern var __locale_changed: c_int;
pub extern var __initiallocinfo: struct_threadlocaleinfostruct;
pub extern var __initiallocalestructinfo: _locale_tstruct;
pub extern fn __updatetlocinfo() pthreadlocinfo;
pub extern fn __updatetmbcinfo() pthreadmbcinfo;
pub extern fn isalpha(_C: c_int) c_int;
pub extern fn isupper(_C: c_int) c_int;
pub extern fn islower(_C: c_int) c_int;
pub extern fn isdigit(_C: c_int) c_int;
pub extern fn isxdigit(_C: c_int) c_int;
pub extern fn isspace(_C: c_int) c_int;
pub extern fn ispunct(_C: c_int) c_int;
pub extern fn isalnum(_C: c_int) c_int;
pub extern fn isprint(_C: c_int) c_int;
pub extern fn isgraph(_C: c_int) c_int;
pub extern fn iscntrl(_C: c_int) c_int;
pub extern fn toupper(_C: c_int) c_int;
pub extern fn _toupper(_C: c_int) c_int;
pub extern fn tolower(_C: c_int) c_int;
pub extern fn _tolower(_C: c_int) c_int;
pub extern fn _tolower_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _isctype(_C: c_int, _Type: c_int) c_int;
pub extern fn isblank(_C: c_int) c_int;
pub extern fn _isalpha_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _isupper_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _islower_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _isdigit_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _isxdigit_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _isspace_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _ispunct_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _isalnum_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _isprint_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _isgraph_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _iscntrl_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _toupper_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn _isctype_l(_C: c_int, _Type: c_int, _Locale: _locale_t) c_int;
pub extern fn _isblank_l(_C: c_int, _Locale: _locale_t) c_int;
pub extern fn __isascii(_C: c_int) c_int;
pub extern fn __toascii(_C: c_int) c_int;
pub extern fn __iscsymf(_C: c_int) c_int;
pub extern fn __iscsym(_C: c_int) c_int;
pub extern fn _memccpy(_Dst: ?*anyopaque, _Src: ?*const anyopaque, _Val: c_int, _MaxCount: usize) ?*anyopaque;
pub extern fn memchr(_Buf: ?*const anyopaque, _Val: c_int, _MaxCount: usize) ?*anyopaque;
pub extern fn _memicmp(_Buf1: ?*const anyopaque, _Buf2: ?*const anyopaque, _Size: usize) c_int;
pub extern fn _memicmp_l(_Buf1: ?*const anyopaque, _Buf2: ?*const anyopaque, _Size: usize, _Locale: _locale_t) c_int;
pub extern fn memcmp(_Buf1: ?*const anyopaque, _Buf2: ?*const anyopaque, _Size: usize) c_int;
pub extern fn memcpy(noalias _Dst: ?*anyopaque, noalias _Src: ?*const anyopaque, _Size: usize) ?*anyopaque;
pub extern fn memcpy_s(_dest: ?*anyopaque, _numberOfElements: usize, _src: ?*const anyopaque, _count: usize) errno_t;
pub extern fn mempcpy(_Dst: ?*anyopaque, _Src: ?*const anyopaque, _Size: usize) ?*anyopaque;
pub extern fn memset(_Dst: ?*anyopaque, _Val: c_int, _Size: usize) ?*anyopaque;
pub extern fn memccpy(_Dst: ?*anyopaque, _Src: ?*const anyopaque, _Val: c_int, _Size: usize) ?*anyopaque;
pub extern fn memicmp(_Buf1: ?*const anyopaque, _Buf2: ?*const anyopaque, _Size: usize) c_int;
pub extern fn _strset(_Str: [*c]u8, _Val: c_int) [*c]u8;
pub extern fn _strset_l(_Str: [*c]u8, _Val: c_int, _Locale: _locale_t) [*c]u8;
pub extern fn strcpy(noalias _Dest: [*c]u8, noalias _Source: [*c]const u8) [*c]u8;
pub extern fn strcat(noalias _Dest: [*c]u8, noalias _Source: [*c]const u8) [*c]u8;
pub extern fn strcmp(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn strlen(_Str: [*c]const u8) usize;
pub extern fn strnlen(_Str: [*c]const u8, _MaxCount: usize) usize;
pub extern fn memmove(_Dst: ?*anyopaque, _Src: ?*const anyopaque, _Size: usize) ?*anyopaque;
pub extern fn _strdup(_Src: [*c]const u8) [*c]u8;
pub extern fn strchr(_Str: [*c]const u8, _Val: c_int) [*c]u8;
pub extern fn _stricmp(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn _strcmpi(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn _stricmp_l(_Str1: [*c]const u8, _Str2: [*c]const u8, _Locale: _locale_t) c_int;
pub extern fn strcoll(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn _strcoll_l(_Str1: [*c]const u8, _Str2: [*c]const u8, _Locale: _locale_t) c_int;
pub extern fn _stricoll(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn _stricoll_l(_Str1: [*c]const u8, _Str2: [*c]const u8, _Locale: _locale_t) c_int;
pub extern fn _strncoll(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize) c_int;
pub extern fn _strncoll_l(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn _strnicoll(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize) c_int;
pub extern fn _strnicoll_l(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn strcspn(_Str: [*c]const u8, _Control: [*c]const u8) usize;
pub extern fn _strerror(_ErrMsg: [*c]const u8) [*c]u8;
pub extern fn strerror(c_int) [*c]u8;
pub extern fn _strlwr(_String: [*c]u8) [*c]u8;
pub extern fn strlwr_l(_String: [*c]u8, _Locale: _locale_t) [*c]u8;
pub extern fn strncat(noalias _Dest: [*c]u8, noalias _Source: [*c]const u8, _Count: usize) [*c]u8;
pub extern fn strncmp(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize) c_int;
pub extern fn _strnicmp(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize) c_int;
pub extern fn _strnicmp_l(_Str1: [*c]const u8, _Str2: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn strncpy(noalias _Dest: [*c]u8, noalias _Source: [*c]const u8, _Count: usize) [*c]u8;
pub extern fn _strnset(_Str: [*c]u8, _Val: c_int, _MaxCount: usize) [*c]u8;
pub extern fn _strnset_l(str: [*c]u8, c: c_int, count: usize, _Locale: _locale_t) [*c]u8;
pub extern fn strpbrk(_Str: [*c]const u8, _Control: [*c]const u8) [*c]u8;
pub extern fn strrchr(_Str: [*c]const u8, _Ch: c_int) [*c]u8;
pub extern fn _strrev(_Str: [*c]u8) [*c]u8;
pub extern fn strspn(_Str: [*c]const u8, _Control: [*c]const u8) usize;
pub extern fn strstr(_Str: [*c]const u8, _SubStr: [*c]const u8) [*c]u8;
pub extern fn strtok(noalias _Str: [*c]u8, noalias _Delim: [*c]const u8) [*c]u8;
pub extern fn strtok_r(noalias _Str: [*c]u8, noalias _Delim: [*c]const u8, noalias __last: [*c][*c]u8) [*c]u8;
pub extern fn _strupr(_String: [*c]u8) [*c]u8;
pub extern fn _strupr_l(_String: [*c]u8, _Locale: _locale_t) [*c]u8;
pub extern fn strxfrm(noalias _Dst: [*c]u8, noalias _Src: [*c]const u8, _MaxCount: usize) usize;
pub extern fn _strxfrm_l(noalias _Dst: [*c]u8, noalias _Src: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) usize;
pub extern fn strdup(_Src: [*c]const u8) [*c]u8;
pub extern fn strcmpi(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn stricmp(_Str1: [*c]const u8, _Str2: [*c]const u8) c_int;
pub extern fn strlwr(_Str: [*c]u8) [*c]u8;
pub extern fn strnicmp(_Str1: [*c]const u8, _Str: [*c]const u8, _MaxCount: usize) c_int;
pub fn strncasecmp(arg___sz1: [*c]const u8, arg___sz2: [*c]const u8, arg___sizeMaxCompare: usize) callconv(.c) c_int {
    var __sz1 = arg___sz1;
    _ = &__sz1;
    var __sz2 = arg___sz2;
    _ = &__sz2;
    var __sizeMaxCompare = arg___sizeMaxCompare;
    _ = &__sizeMaxCompare;
    return _strnicmp(__sz1, __sz2, __sizeMaxCompare);
}
pub fn strcasecmp(arg___sz1: [*c]const u8, arg___sz2: [*c]const u8) callconv(.c) c_int {
    var __sz1 = arg___sz1;
    _ = &__sz1;
    var __sz2 = arg___sz2;
    _ = &__sz2;
    return _stricmp(__sz1, __sz2);
}
pub extern fn strnset(_Str: [*c]u8, _Val: c_int, _MaxCount: usize) [*c]u8;
pub extern fn strrev(_Str: [*c]u8) [*c]u8;
pub extern fn strset(_Str: [*c]u8, _Val: c_int) [*c]u8;
pub extern fn strupr(_Str: [*c]u8) [*c]u8;
pub extern fn _wcsdup(_Str: [*c]const wchar_t) [*c]wchar_t;
pub extern fn wcscat(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const wchar_t) [*c]wchar_t;
pub extern fn wcschr(_Str: [*c]const wchar_t, _Ch: wchar_t) [*c]wchar_t;
pub extern fn wcscmp(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t) c_int;
pub extern fn wcscpy(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const wchar_t) [*c]wchar_t;
pub extern fn wcscspn(_Str: [*c]const wchar_t, _Control: [*c]const wchar_t) usize;
pub extern fn wcslen(_Str: [*c]const wchar_t) usize;
pub extern fn wcsnlen(_Src: [*c]const wchar_t, _MaxCount: usize) usize;
pub extern fn wcsncat(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const wchar_t, _Count: usize) [*c]wchar_t;
pub extern fn wcsncmp(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize) c_int;
pub extern fn wcsncpy(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const wchar_t, _Count: usize) [*c]wchar_t;
pub extern fn _wcsncpy_l(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const wchar_t, _Count: usize, _Locale: _locale_t) [*c]wchar_t;
pub extern fn wcspbrk(_Str: [*c]const wchar_t, _Control: [*c]const wchar_t) [*c]wchar_t;
pub extern fn wcsrchr(_Str: [*c]const wchar_t, _Ch: wchar_t) [*c]wchar_t;
pub extern fn wcsspn(_Str: [*c]const wchar_t, _Control: [*c]const wchar_t) usize;
pub extern fn wcsstr(_Str: [*c]const wchar_t, _SubStr: [*c]const wchar_t) [*c]wchar_t;
pub extern fn wcstok(noalias _Str: [*c]wchar_t, noalias _Delim: [*c]const wchar_t, noalias _Ptr: [*c][*c]wchar_t) [*c]wchar_t;
pub extern fn _wcstok(noalias _Str: [*c]wchar_t, noalias _Delim: [*c]const wchar_t) [*c]wchar_t;
pub extern fn _wcserror(_ErrNum: c_int) [*c]wchar_t;
pub extern fn __wcserror(_Str: [*c]const wchar_t) [*c]wchar_t;
pub extern fn _wcsicmp(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t) c_int;
pub extern fn _wcsicmp_l(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _Locale: _locale_t) c_int;
pub extern fn _wcsnicmp(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize) c_int;
pub extern fn _wcsnicmp_l(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn _wcsnset(_Str: [*c]wchar_t, _Val: wchar_t, _MaxCount: usize) [*c]wchar_t;
pub extern fn _wcsrev(_Str: [*c]wchar_t) [*c]wchar_t;
pub extern fn _wcsset(_Str: [*c]wchar_t, _Val: wchar_t) [*c]wchar_t;
pub extern fn _wcslwr(_String: [*c]wchar_t) [*c]wchar_t;
pub extern fn _wcslwr_l(_String: [*c]wchar_t, _Locale: _locale_t) [*c]wchar_t;
pub extern fn _wcsupr(_String: [*c]wchar_t) [*c]wchar_t;
pub extern fn _wcsupr_l(_String: [*c]wchar_t, _Locale: _locale_t) [*c]wchar_t;
pub extern fn wcsxfrm(noalias _Dst: [*c]wchar_t, noalias _Src: [*c]const wchar_t, _MaxCount: usize) usize;
pub extern fn _wcsxfrm_l(noalias _Dst: [*c]wchar_t, noalias _Src: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) usize;
pub extern fn wcscoll(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t) c_int;
pub extern fn _wcscoll_l(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _Locale: _locale_t) c_int;
pub extern fn _wcsicoll(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t) c_int;
pub extern fn _wcsicoll_l(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _Locale: _locale_t) c_int;
pub extern fn _wcsncoll(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize) c_int;
pub extern fn _wcsncoll_l(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn _wcsnicoll(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize) c_int;
pub extern fn _wcsnicoll_l(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) c_int;
pub extern fn wcsdup(_Str: [*c]const wchar_t) [*c]wchar_t;
pub extern fn wcsicmp(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t) c_int;
pub extern fn wcsnicmp(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t, _MaxCount: usize) c_int;
pub extern fn wcsnset(_Str: [*c]wchar_t, _Val: wchar_t, _MaxCount: usize) [*c]wchar_t;
pub extern fn wcsrev(_Str: [*c]wchar_t) [*c]wchar_t;
pub extern fn wcsset(_Str: [*c]wchar_t, _Val: wchar_t) [*c]wchar_t;
pub extern fn wcslwr(_Str: [*c]wchar_t) [*c]wchar_t;
pub extern fn wcsupr(_Str: [*c]wchar_t) [*c]wchar_t;
pub extern fn wcsicoll(_Str1: [*c]const wchar_t, _Str2: [*c]const wchar_t) c_int;
pub extern fn _strset_s(_Dst: [*c]u8, _DstSize: usize, _Value: c_int) errno_t;
pub extern fn _strerror_s(_Buf: [*c]u8, _SizeInBytes: usize, _ErrMsg: [*c]const u8) errno_t;
pub extern fn strerror_s(_Buf: [*c]u8, _SizeInBytes: usize, _ErrNum: c_int) errno_t;
pub extern fn _strlwr_s(_Str: [*c]u8, _Size: usize) errno_t;
pub extern fn _strlwr_s_l(_Str: [*c]u8, _Size: usize, _Locale: _locale_t) errno_t;
pub extern fn _strnset_s(_Str: [*c]u8, _Size: usize, _Val: c_int, _MaxCount: usize) errno_t;
pub extern fn _strupr_s(_Str: [*c]u8, _Size: usize) errno_t;
pub extern fn _strupr_s_l(_Str: [*c]u8, _Size: usize, _Locale: _locale_t) errno_t;
pub extern fn strncat_s(_Dst: [*c]u8, _DstSizeInChars: usize, _Src: [*c]const u8, _MaxCount: usize) errno_t;
pub extern fn _strncat_s_l(_Dst: [*c]u8, _DstSizeInChars: usize, _Src: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) errno_t;
pub extern fn strcpy_s(_Dst: [*c]u8, _SizeInBytes: rsize_t, _Src: [*c]const u8) errno_t;
pub extern fn strncpy_s(_Dst: [*c]u8, _DstSizeInChars: usize, _Src: [*c]const u8, _MaxCount: usize) errno_t;
pub extern fn _strncpy_s_l(_Dst: [*c]u8, _DstSizeInChars: usize, _Src: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) errno_t;
pub extern fn strtok_s(_Str: [*c]u8, _Delim: [*c]const u8, _Context: [*c][*c]u8) [*c]u8;
pub extern fn _strtok_s_l(_Str: [*c]u8, _Delim: [*c]const u8, _Context: [*c][*c]u8, _Locale: _locale_t) [*c]u8;
pub extern fn strcat_s(_Dst: [*c]u8, _SizeInBytes: rsize_t, _Src: [*c]const u8) errno_t;
pub inline fn strnlen_s(arg__src: [*c]const u8, arg__count: usize) usize {
    var _src = arg__src;
    _ = &_src;
    var _count = arg__count;
    _ = &_count;
    return if (_src != null) strnlen(_src, _count) else @as(usize, 0);
}
pub extern fn memmove_s(_dest: ?*anyopaque, _numberOfElements: usize, _src: ?*const anyopaque, _count: usize) errno_t;
pub extern fn wcstok_s(_Str: [*c]wchar_t, _Delim: [*c]const wchar_t, _Context: [*c][*c]wchar_t) [*c]wchar_t;
pub extern fn _wcserror_s(_Buf: [*c]wchar_t, _SizeInWords: usize, _ErrNum: c_int) errno_t;
pub extern fn __wcserror_s(_Buffer: [*c]wchar_t, _SizeInWords: usize, _ErrMsg: [*c]const wchar_t) errno_t;
pub extern fn _wcsnset_s(_Dst: [*c]wchar_t, _DstSizeInWords: usize, _Val: wchar_t, _MaxCount: usize) errno_t;
pub extern fn _wcsset_s(_Str: [*c]wchar_t, _SizeInWords: usize, _Val: wchar_t) errno_t;
pub extern fn _wcslwr_s(_Str: [*c]wchar_t, _SizeInWords: usize) errno_t;
pub extern fn _wcslwr_s_l(_Str: [*c]wchar_t, _SizeInWords: usize, _Locale: _locale_t) errno_t;
pub extern fn _wcsupr_s(_Str: [*c]wchar_t, _Size: usize) errno_t;
pub extern fn _wcsupr_s_l(_Str: [*c]wchar_t, _Size: usize, _Locale: _locale_t) errno_t;
pub extern fn wcscpy_s(_Dst: [*c]wchar_t, _SizeInWords: rsize_t, _Src: [*c]const wchar_t) errno_t;
pub extern fn wcscat_s(_Dst: [*c]wchar_t, _SizeInWords: rsize_t, _Src: [*c]const wchar_t) errno_t;
pub extern fn wcsncat_s(_Dst: [*c]wchar_t, _DstSizeInChars: usize, _Src: [*c]const wchar_t, _MaxCount: usize) errno_t;
pub extern fn _wcsncat_s_l(_Dst: [*c]wchar_t, _DstSizeInChars: usize, _Src: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) errno_t;
pub extern fn wcsncpy_s(_Dst: [*c]wchar_t, _DstSizeInChars: usize, _Src: [*c]const wchar_t, _MaxCount: usize) errno_t;
pub extern fn _wcsncpy_s_l(_Dst: [*c]wchar_t, _DstSizeInChars: usize, _Src: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) errno_t;
pub extern fn _wcstok_s_l(_Str: [*c]wchar_t, _Delim: [*c]const wchar_t, _Context: [*c][*c]wchar_t, _Locale: _locale_t) [*c]wchar_t;
pub extern fn _wcsset_s_l(_Str: [*c]wchar_t, _SizeInChars: usize, _Val: wchar_t, _Locale: _locale_t) errno_t;
pub extern fn _wcsnset_s_l(_Str: [*c]wchar_t, _SizeInChars: usize, _Val: wchar_t, _Count: usize, _Locale: _locale_t) errno_t;
pub inline fn wcsnlen_s(arg__src: [*c]const wchar_t, arg__count: usize) usize {
    var _src = arg__src;
    _ = &_src;
    var _count = arg__count;
    _ = &_count;
    return if (_src != null) wcsnlen(_src, _count) else @as(usize, 0);
}
pub const SAP_RAW = u8;
pub const SAP_SRAW = i8;
pub const SAP_USHORT = c_ushort;
pub const SAP_UINT = c_uint;
pub const SAP_INT = c_int;
pub const SAP_SHORT = c_short;
pub const SAP_LLONG = c_longlong;
pub const SAP_ULLONG = c_ulonglong;
pub const SAP_BOOL = u8;
pub const SAP_DOUBLE = f64;
pub const LINE_USING_PROC = ?*const fn (buffer: [*c]SAP_CHAR, number_of_chars: c_int) callconv(.c) void;
pub const intU = c_int;
pub const intR = c_int;
pub const unsigned_intU = c_uint;
pub const unsigned_intR = c_uint;
pub const shortU = c_short;
pub const shortR = c_short;
pub const unsigned_shortU = c_ushort;
pub const unsigned_shortR = c_ushort;
pub const longU = c_long;
pub const longR = c_long;
pub const unsigned_longU = c_ulong;
pub const unsigned_longR = c_ulong;
pub const size_tU = usize;
pub const size_tR = usize;
pub const SAP_USHORT_U = SAP_USHORT;
pub const SAP_USHORT_R = SAP_USHORT;
pub const SAP_SHORT_U = SAP_SHORT;
pub const SAP_SHORT_R = SAP_SHORT;
pub const SAP_UINT_U = SAP_UINT;
pub const SAP_UINT_R = SAP_UINT;
pub const SAP_INT_U = SAP_INT;
pub const SAP_INT_R = SAP_INT;
pub const SAP_ULLONG_U = SAP_ULLONG;
pub const SAP_ULLONG_R = SAP_ULLONG;
pub const SAP_LLONG_U = SAP_LLONG;
pub const SAP_LLONG_R = SAP_LLONG;
pub const SAP_DATE = [8]SAP_CHAR;
pub const SAP_TIME = [6]SAP_CHAR;
pub const SAP_BCD = SAP_RAW;
pub const struct_SAP_UUID = extern struct {
    a: SAP_UINT = 0,
    b: SAP_USHORT = 0,
    c: SAP_USHORT = 0,
    d: [8]SAP_RAW = @import("std").mem.zeroes([8]SAP_RAW),
};
pub const SAP_UUID = struct_SAP_UUID;
pub const platform_max_t = [16]SAP_SRAW;
pub const SAP_MAX_ALIGN_T = extern union {
    align_1: c_long,
    align_2: f64,
    align_3: ?*anyopaque,
    align_4: platform_max_t,
};
pub const DecFloat16 = extern union {
    bytes: [8]SAP_RAW,
    @"align": SAP_DOUBLE,
    pub const DecFloat16ToString = __root.DecFloat16ToString;
    pub const DecFloat34ToDecFloat16 = __root.DecFloat34ToDecFloat16;
    pub const DecFloat16RawToDecFloat16 = __root.DecFloat16RawToDecFloat16;
    pub const DecFloat16RawToDecFloat16DB = __root.DecFloat16RawToDecFloat16DB;
    pub const DecFloat16RawToNormDecFloat16 = __root.DecFloat16RawToNormDecFloat16;
    pub const SAP_INTToDecFloat16 = __root.SAP_INTToDecFloat16;
    pub const SAP_LLONGToDecFloat16 = __root.SAP_LLONGToDecFloat16;
    pub const SAP_DOUBLEToDecFloat16 = __root.SAP_DOUBLEToDecFloat16;
    pub const DecFloat16RoundForDEC = __root.DecFloat16RoundForDEC;
    pub const DecFloat16RoundForDECToPrecision = __root.DecFloat16RoundForDECToPrecision;
    pub const DecFloat16CompareForDEC = __root.DecFloat16CompareForDEC;
    pub const BCDToDecFloat16 = __root.BCDToDecFloat16;
    pub const DecFloat16_Add = __root.DecFloat16_Add;
    pub const DecFloat16_Sub = __root.DecFloat16_Sub;
    pub const DecFloat16_Mult = __root.DecFloat16_Mult;
    pub const DecFloat16_Div = __root.DecFloat16_Div;
    pub const DecFloat16_DIV = __root.DecFloat16_DIV;
    pub const DecFloat16_MOD = __root.DecFloat16_MOD;
    pub const DecFloat16_EQ = __root.DecFloat16_EQ;
    pub const DecFloat16_GT = __root.DecFloat16_GT;
    pub const DecFloat16_LT = __root.DecFloat16_LT;
    pub const DecFloat16Compare = __root.DecFloat16Compare;
    pub const DecFloat16RoundDec = __root.DecFloat16RoundDec;
    pub const DecFloat16RoundPrec = __root.DecFloat16RoundPrec;
    pub const DecFloat16RescaleDec = __root.DecFloat16RescaleDec;
    pub const DecFloat16RescalePrec = __root.DecFloat16RescalePrec;
    pub const DecFloat16IsInfinite = __root.DecFloat16IsInfinite;
    pub const DecFloat16IsFinite = __root.DecFloat16IsFinite;
    pub const DecFloat16IsNaN = __root.DecFloat16IsNaN;
    pub const DecFloat16Zero = __root.DecFloat16Zero;
    pub const DecFloat16Ceil = __root.DecFloat16Ceil;
    pub const DecFloat16Floor = __root.DecFloat16Floor;
    pub const DecFloat16ToDecFloat16Neutral = __root.DecFloat16ToDecFloat16Neutral;
    pub const DecFloat16NeutralToDecFloat16 = __root.DecFloat16NeutralToDecFloat16;
    pub const DecFloat16Normalize = __root.DecFloat16Normalize;
    pub const DecFloat16ToNormDecFloat16 = __root.DecFloat16ToNormDecFloat16;
    pub const DecFloat16_Sqrt = __root.DecFloat16_Sqrt;
    pub const DecFloat16_Exp = __root.DecFloat16_Exp;
    pub const DecFloat16_Ln = __root.DecFloat16_Ln;
    pub const DecFloat16_Log10 = __root.DecFloat16_Log10;
    pub const DecFloat16NextMinus = __root.DecFloat16NextMinus;
    pub const DecFloat16NextPlus = __root.DecFloat16NextPlus;
    pub const INTToDecFloat16 = __root.SAP_INTToDecFloat16;
    pub const LLONGToDecFloat16 = __root.SAP_LLONGToDecFloat16;
    pub const DOUBLEToDecFloat16 = __root.SAP_DOUBLEToDecFloat16;
    pub const Add = __root.DecFloat16_Add;
    pub const Sub = __root.DecFloat16_Sub;
    pub const Mult = __root.DecFloat16_Mult;
    pub const Div = __root.DecFloat16_Div;
    pub const DIV = __root.DecFloat16_DIV;
    pub const MOD = __root.DecFloat16_MOD;
    pub const EQ = __root.DecFloat16_EQ;
    pub const GT = __root.DecFloat16_GT;
    pub const LT = __root.DecFloat16_LT;
    pub const Sqrt = __root.DecFloat16_Sqrt;
    pub const Exp = __root.DecFloat16_Exp;
    pub const Ln = __root.DecFloat16_Ln;
    pub const Log10 = __root.DecFloat16_Log10;
};
pub const DecFloat34 = extern union {
    bytes: [16]SAP_RAW,
    @"align": SAP_MAX_ALIGN_T,
    pub const DecFloat34ToString = __root.DecFloat34ToString;
    pub const DecFloat16ToDecFloat34 = __root.DecFloat16ToDecFloat34;
    pub const DecFloat34RawToDecFloat34 = __root.DecFloat34RawToDecFloat34;
    pub const DecFloat34RawToDecFloat34DB = __root.DecFloat34RawToDecFloat34DB;
    pub const DecFloat34RawToNormDecFloat34 = __root.DecFloat34RawToNormDecFloat34;
    pub const SAP_INTToDecFloat34 = __root.SAP_INTToDecFloat34;
    pub const SAP_LLONGToDecFloat34 = __root.SAP_LLONGToDecFloat34;
    pub const SAP_DOUBLEToDecFloat34 = __root.SAP_DOUBLEToDecFloat34;
    pub const DecFloat34RoundForDEC = __root.DecFloat34RoundForDEC;
    pub const DecFloat34RoundForDECToPrecision = __root.DecFloat34RoundForDECToPrecision;
    pub const DecFloat34CompareForDEC = __root.DecFloat34CompareForDEC;
    pub const BCDToDecFloat34 = __root.BCDToDecFloat34;
    pub const DecFloat34_Add = __root.DecFloat34_Add;
    pub const DecFloat34_Sub = __root.DecFloat34_Sub;
    pub const DecFloat34_Mult = __root.DecFloat34_Mult;
    pub const DecFloat34_Div = __root.DecFloat34_Div;
    pub const DecFloat34_DIV = __root.DecFloat34_DIV;
    pub const DecFloat34_MOD = __root.DecFloat34_MOD;
    pub const DecFloat34_EQ = __root.DecFloat34_EQ;
    pub const DecFloat34_GT = __root.DecFloat34_GT;
    pub const DecFloat34_LT = __root.DecFloat34_LT;
    pub const DecFloat34Compare = __root.DecFloat34Compare;
    pub const DecFloat34RoundDec = __root.DecFloat34RoundDec;
    pub const DecFloat34RoundPrec = __root.DecFloat34RoundPrec;
    pub const DecFloat34RescaleDec = __root.DecFloat34RescaleDec;
    pub const DecFloat34RescalePrec = __root.DecFloat34RescalePrec;
    pub const DecFloat34IsInfinite = __root.DecFloat34IsInfinite;
    pub const DecFloat34IsFinite = __root.DecFloat34IsFinite;
    pub const DecFloat34IsNaN = __root.DecFloat34IsNaN;
    pub const DecFloat34Zero = __root.DecFloat34Zero;
    pub const DecFloat34Ceil = __root.DecFloat34Ceil;
    pub const DecFloat34Floor = __root.DecFloat34Floor;
    pub const DecFloat34ToDecFloat34Neutral = __root.DecFloat34ToDecFloat34Neutral;
    pub const DecFloat34NeutralToDecFloat34 = __root.DecFloat34NeutralToDecFloat34;
    pub const DecFloat34Normalize = __root.DecFloat34Normalize;
    pub const DecFloat34ToNormDecFloat34 = __root.DecFloat34ToNormDecFloat34;
    pub const DecFloat34_fPow = __root.DecFloat34_fPow;
    pub const DecFloat34_Sqrt = __root.DecFloat34_Sqrt;
    pub const DecFloat34_Exp = __root.DecFloat34_Exp;
    pub const DecFloat34_Ln = __root.DecFloat34_Ln;
    pub const DecFloat34_Log10 = __root.DecFloat34_Log10;
    pub const DecFloat34NextMinus = __root.DecFloat34NextMinus;
    pub const DecFloat34NextPlus = __root.DecFloat34NextPlus;
    pub const INTToDecFloat34 = __root.SAP_INTToDecFloat34;
    pub const LLONGToDecFloat34 = __root.SAP_LLONGToDecFloat34;
    pub const DOUBLEToDecFloat34 = __root.SAP_DOUBLEToDecFloat34;
    pub const Add = __root.DecFloat34_Add;
    pub const Sub = __root.DecFloat34_Sub;
    pub const Mult = __root.DecFloat34_Mult;
    pub const Div = __root.DecFloat34_Div;
    pub const DIV = __root.DecFloat34_DIV;
    pub const MOD = __root.DecFloat34_MOD;
    pub const EQ = __root.DecFloat34_EQ;
    pub const GT = __root.DecFloat34_GT;
    pub const LT = __root.DecFloat34_LT;
    pub const fPow = __root.DecFloat34_fPow;
    pub const Sqrt = __root.DecFloat34_Sqrt;
    pub const Exp = __root.DecFloat34_Exp;
    pub const Ln = __root.DecFloat34_Ln;
    pub const Log10 = __root.DecFloat34_Log10;
};
pub const DecFloat16RawLen: c_int = 8;
pub const DecFloat34RawLen: c_int = 16;
pub const enum_DecFloatRawLen = c_uint;
pub const DecFloat16Raw = [8]SAP_RAW;
pub const DecFloat34Raw = [16]SAP_RAW;
pub const DecFloat16Len: c_int = 8;
pub const DecFloat34Len: c_int = 16;
pub const enum_DecFloatLen = c_uint;
pub const DecFloat34Buff = [43]SAP_UC;
pub const DecFloat16Buff = [25]SAP_UC;
pub const SAP_UINT_PTR = c_ulonglong;
pub const _fsize_t = c_ulong;
pub const struct__wfinddata32_t = extern struct {
    attrib: c_uint = 0,
    time_create: __time32_t = 0,
    time_access: __time32_t = 0,
    time_write: __time32_t = 0,
    size: _fsize_t = 0,
    name: [260]wchar_t = @import("std").mem.zeroes([260]wchar_t),
};
pub const struct__wfinddata32i64_t = extern struct {
    attrib: c_uint = 0,
    time_create: __time32_t = 0,
    time_access: __time32_t = 0,
    time_write: __time32_t = 0,
    size: c_longlong = 0,
    name: [260]wchar_t = @import("std").mem.zeroes([260]wchar_t),
};
pub const struct__wfinddata64i32_t = extern struct {
    attrib: c_uint = 0,
    time_create: __time64_t = 0,
    time_access: __time64_t = 0,
    time_write: __time64_t = 0,
    size: _fsize_t = 0,
    name: [260]wchar_t = @import("std").mem.zeroes([260]wchar_t),
};
pub const struct__wfinddata64_t = extern struct {
    attrib: c_uint = 0,
    time_create: __time64_t = 0,
    time_access: __time64_t = 0,
    time_write: __time64_t = 0,
    size: c_longlong = 0,
    name: [260]wchar_t = @import("std").mem.zeroes([260]wchar_t),
};
pub extern fn _wgetcwd(_DstBuf: [*c]wchar_t, _SizeInWords: c_int) [*c]wchar_t;
pub extern fn _wgetdcwd(_Drive: c_int, _DstBuf: [*c]wchar_t, _SizeInWords: c_int) [*c]wchar_t;
pub extern fn _wgetdcwd_nolock(_Drive: c_int, _DstBuf: [*c]wchar_t, _SizeInWords: c_int) [*c]wchar_t;
pub extern fn _wchdir(_Path: [*c]const wchar_t) c_int;
pub extern fn _wmkdir(_Path: [*c]const wchar_t) c_int;
pub extern fn _wrmdir(_Path: [*c]const wchar_t) c_int;
pub extern fn _waccess(_Filename: [*c]const wchar_t, _AccessMode: c_int) c_int;
pub extern fn _wchmod(_Filename: [*c]const wchar_t, _Mode: c_int) c_int;
pub extern fn _wcreat(_Filename: [*c]const wchar_t, _PermissionMode: c_int) c_int;
pub extern fn _wfindfirst32(_Filename: [*c]const wchar_t, _FindData: [*c]struct__wfinddata32_t) isize;
pub extern fn _wfindnext32(_FindHandle: isize, _FindData: [*c]struct__wfinddata32_t) c_int;
pub extern fn _wunlink(_Filename: [*c]const wchar_t) c_int;
pub extern fn _wrename(_OldFilename: [*c]const wchar_t, _NewFilename: [*c]const wchar_t) c_int;
pub extern fn _wmktemp(_TemplateName: [*c]wchar_t) [*c]wchar_t;
pub extern fn _wfindfirst32i64(_Filename: [*c]const wchar_t, _FindData: [*c]struct__wfinddata32i64_t) isize;
pub extern fn _wfindfirst64i32(_Filename: [*c]const wchar_t, _FindData: [*c]struct__wfinddata64i32_t) isize;
pub extern fn _wfindfirst64(_Filename: [*c]const wchar_t, _FindData: [*c]struct__wfinddata64_t) isize;
pub extern fn _wfindnext32i64(_FindHandle: isize, _FindData: [*c]struct__wfinddata32i64_t) c_int;
pub extern fn _wfindnext64i32(_FindHandle: isize, _FindData: [*c]struct__wfinddata64i32_t) c_int;
pub extern fn _wfindnext64(_FindHandle: isize, _FindData: [*c]struct__wfinddata64_t) c_int;
pub extern fn _wsopen_s(_FileHandle: [*c]c_int, _Filename: [*c]const wchar_t, _OpenFlag: c_int, _ShareFlag: c_int, _PermissionFlag: c_int) errno_t;
pub extern fn _wopen(_Filename: [*c]const wchar_t, _OpenFlag: c_int, ...) c_int;
pub extern fn _wsopen(_Filename: [*c]const wchar_t, _OpenFlag: c_int, _ShareFlag: c_int, ...) c_int;
pub extern fn _wsetlocale(_Category: c_int, _Locale: [*c]const wchar_t) [*c]wchar_t;
pub extern fn _wcreate_locale(_Category: c_int, _Locale: [*c]const wchar_t) _locale_t;
pub extern fn _wexecl(_Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
pub extern fn _wexecle(_Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
pub extern fn _wexeclp(_Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
pub extern fn _wexeclpe(_Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
pub extern fn _wexecv(_Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t) isize;
pub extern fn _wexecve(_Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t, _Env: [*c]const [*c]const wchar_t) isize;
pub extern fn _wexecvp(_Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t) isize;
pub extern fn _wexecvpe(_Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t, _Env: [*c]const [*c]const wchar_t) isize;
pub const _ino_t = c_ushort;
pub const ino_t = c_ushort;
pub const _dev_t = c_uint;
pub const dev_t = c_uint;
pub const struct__stat32 = extern struct {
    st_dev: _dev_t = 0,
    st_ino: _ino_t = 0,
    st_mode: c_ushort = 0,
    st_nlink: c_short = 0,
    st_uid: c_short = 0,
    st_gid: c_short = 0,
    st_rdev: _dev_t = 0,
    st_size: _off_t = 0,
    st_atime: __time32_t = 0,
    st_mtime: __time32_t = 0,
    st_ctime: __time32_t = 0,
};
pub const struct__stat32i64 = extern struct {
    st_dev: _dev_t = 0,
    st_ino: _ino_t = 0,
    st_mode: c_ushort = 0,
    st_nlink: c_short = 0,
    st_uid: c_short = 0,
    st_gid: c_short = 0,
    st_rdev: _dev_t = 0,
    st_size: c_longlong = 0,
    st_atime: __time32_t = 0,
    st_mtime: __time32_t = 0,
    st_ctime: __time32_t = 0,
};
pub const struct__stat64i32 = extern struct {
    st_dev: _dev_t = 0,
    st_ino: _ino_t = 0,
    st_mode: c_ushort = 0,
    st_nlink: c_short = 0,
    st_uid: c_short = 0,
    st_gid: c_short = 0,
    st_rdev: _dev_t = 0,
    st_size: _off_t = 0,
    st_atime: __time64_t = 0,
    st_mtime: __time64_t = 0,
    st_ctime: __time64_t = 0,
};
pub const struct__stat64 = extern struct {
    st_dev: _dev_t = 0,
    st_ino: _ino_t = 0,
    st_mode: c_ushort = 0,
    st_nlink: c_short = 0,
    st_uid: c_short = 0,
    st_gid: c_short = 0,
    st_rdev: _dev_t = 0,
    st_size: c_longlong = 0,
    st_atime: __time64_t = 0,
    st_mtime: __time64_t = 0,
    st_ctime: __time64_t = 0,
};
pub extern fn _wstat32(_Name: [*c]const wchar_t, _Stat: [*c]struct__stat32) c_int;
pub extern fn _wstat32i64(_Name: [*c]const wchar_t, _Stat: [*c]struct__stat32i64) c_int;
pub extern fn _wstat64i32(_Name: [*c]const wchar_t, _Stat: [*c]struct__stat64i32) c_int;
pub extern fn _wstat64(_Name: [*c]const wchar_t, _Stat: [*c]struct__stat64) c_int;
pub extern fn _cgetws(_Buffer: [*c]wchar_t) [*c]wchar_t;
pub extern fn _getwch() wint_t;
pub extern fn _getwche() wint_t;
pub extern fn _putwch(_WCh: wchar_t) wint_t;
pub extern fn _ungetwch(_WCh: wint_t) wint_t;
pub extern fn _cputws(_String: [*c]const wchar_t) c_int;
pub extern fn _cwprintf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn _cwscanf(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn _cwscanf_l(noalias _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
pub extern fn _vcwprintf(noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn _cwprintf_p(noalias _Format: [*c]const wchar_t, ...) c_int;
pub extern fn _vcwprintf_p(noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn _cwprintf_l(noalias _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
pub extern fn _vcwprintf_l(noalias _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn _cwprintf_p_l(noalias _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
pub extern fn _vcwprintf_p_l(noalias _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn _putwch_nolock(_WCh: wchar_t) wint_t;
pub extern fn _getwch_nolock() wint_t;
pub extern fn _getwche_nolock() wint_t;
pub extern fn _ungetwch_nolock(_WCh: wint_t) wint_t;
pub extern fn __stdio_common_vswprintf_p(_Options: c_ulonglong, _Str: [*c]wchar_t, _Len: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn __stdio_common_vfwprintf_p(_Options: c_ulonglong, _File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub const struct_tm = extern struct {
    tm_sec: c_int = 0,
    tm_min: c_int = 0,
    tm_hour: c_int = 0,
    tm_mday: c_int = 0,
    tm_mon: c_int = 0,
    tm_year: c_int = 0,
    tm_wday: c_int = 0,
    tm_yday: c_int = 0,
    tm_isdst: c_int = 0,
};
pub extern fn _wasctime(_Tm: [*c]const struct_tm) [*c]wchar_t;
pub extern fn _wasctime_s(_Buf: [*c]wchar_t, _SizeInWords: usize, _Tm: [*c]const struct_tm) errno_t;
pub extern fn _wctime32(_Time: [*c]const __time32_t) [*c]wchar_t;
pub extern fn _wctime32_s(_Buf: [*c]wchar_t, _SizeInWords: usize, _Time: [*c]const __time32_t) errno_t;
pub extern fn wcsftime(noalias _Buf: [*c]wchar_t, _SizeInWords: usize, noalias _Format: [*c]const wchar_t, noalias _Tm: [*c]const struct_tm) usize;
pub extern fn _wcsftime_l(noalias _Buf: [*c]wchar_t, _SizeInWords: usize, noalias _Format: [*c]const wchar_t, noalias _Tm: [*c]const struct_tm, _Locale: _locale_t) usize;
pub extern fn _wstrdate(_Buffer: [*c]wchar_t) [*c]wchar_t;
pub extern fn _wstrdate_s(_Buf: [*c]wchar_t, _SizeInWords: usize) errno_t;
pub extern fn _wstrtime(_Buffer: [*c]wchar_t) [*c]wchar_t;
pub extern fn _wstrtime_s(_Buf: [*c]wchar_t, _SizeInWords: usize) errno_t;
pub extern fn _wctime64(_Time: [*c]const __time64_t) [*c]wchar_t;
pub extern fn _wctime64_s(_Buf: [*c]wchar_t, _SizeInWords: usize, _Time: [*c]const __time64_t) errno_t;
pub fn _wctime(arg__Time: [*c]const time_t) callconv(.c) [*c]wchar_t {
    var _Time = arg__Time;
    _ = &_Time;
    return _wctime64(_Time);
}
pub fn _wctime_s(arg__Buffer: [*c]wchar_t, arg__SizeInWords: usize, arg__Time: [*c]const time_t) callconv(.c) errno_t {
    var _Buffer = arg__Buffer;
    _ = &_Buffer;
    var _SizeInWords = arg__SizeInWords;
    _ = &_SizeInWords;
    var _Time = arg__Time;
    _ = &_Time;
    return _wctime64_s(_Buffer, _SizeInWords, _Time);
}
pub const struct__Mbstatet = extern struct {
    _Wchar: c_ulong = 0,
    _Byte: c_ushort = 0,
    _State: c_ushort = 0,
    pub const mbsinit = __root.mbsinit;
};
pub const _Mbstatet = struct__Mbstatet;
pub const mbstate_t = _Mbstatet;
pub const _Wint_t = wchar_t;
pub extern fn btowc(c_int) wint_t;
pub extern fn mbrlen(noalias _Ch: [*c]const u8, _SizeInBytes: usize, noalias _State: [*c]mbstate_t) usize;
pub extern fn mbrtowc(noalias _DstCh: [*c]wchar_t, noalias _SrcCh: [*c]const u8, _SizeInBytes: usize, noalias _State: [*c]mbstate_t) usize;
pub extern fn mbsrtowcs(noalias _Dest: [*c]wchar_t, noalias _PSrc: [*c][*c]const u8, _Count: usize, noalias _State: [*c]mbstate_t) usize;
pub extern fn wcrtomb(noalias _Dest: [*c]u8, _Source: wchar_t, noalias _State: [*c]mbstate_t) usize;
pub extern fn wcsrtombs(noalias _Dest: [*c]u8, noalias _PSource: [*c][*c]const wchar_t, _Count: usize, noalias _State: [*c]mbstate_t) usize;
pub extern fn wctob(_WCh: wint_t) c_int;
pub fn wmemset(arg__S: [*c]wchar_t, arg__C: wchar_t, arg__N: usize) callconv(.c) [*c]wchar_t {
    var _S = arg__S;
    _ = &_S;
    var _C = arg__C;
    _ = &_C;
    var _N = arg__N;
    _ = &_N;
    var _Su: [*c]wchar_t = _S;
    _ = &_Su;
    _Su += 1;
    while (@as(usize, 0) < _N) : (_N -%= 1) {
        _Su.* = _C;
    }
    return _S;
}
pub fn wmemchr(arg__S: [*c]const wchar_t, arg__C: wchar_t, arg__N: usize) callconv(.c) [*c]wchar_t {
    var _S = arg__S;
    _ = &_S;
    var _C = arg__C;
    _ = &_C;
    var _N = arg__N;
    _ = &_N;
    if (_S != null) {
        _S += 1;
        while (@as(usize, 0) < _N) : (_N -%= 1) if (@as(c_int, _S.*) == @as(c_int, _C)) return @ptrCast(@alignCast(@constCast(_S)));
    }
    return null;
}
pub fn wmemcmp(arg__S1: [*c]const wchar_t, arg__S2: [*c]const wchar_t, arg__N: usize) callconv(.c) c_int {
    var _S1 = arg__S1;
    _ = &_S1;
    var _S2 = arg__S2;
    _ = &_S2;
    var _N = arg__N;
    _ = &_N;
    if ((_N == @as(usize, 0)) or (_S1 == _S2)) return 0;
    if (((_S1 != null) and !(_S2 != null)) or ((_S2 != null) and !(_S1 != null))) return if (!(_S2 != null)) @as(c_int, 1) else -@as(c_int, 1);
    _S1 += 1;
    _S2 += 1;
    while (@as(usize, 0) < _N) : (_N -%= 1) if (@as(c_int, _S1.*) != @as(c_int, _S2.*)) return if (@as(c_int, _S1.*) < @as(c_int, _S2.*)) -@as(c_int, 1) else @as(c_int, 1);
    return 0;
}
pub fn wmemcpy(noalias arg__S1: [*c]wchar_t, noalias arg__S2: [*c]const wchar_t, arg__N: usize) callconv(.c) [*c]wchar_t {
    var _S1 = arg__S1;
    _ = &_S1;
    var _S2 = arg__S2;
    _ = &_S2;
    var _N = arg__N;
    _ = &_N;
    return @ptrCast(@alignCast(memcpy(@ptrCast(@alignCast(_S1)), @ptrCast(@alignCast(_S2)), _N *% @sizeOf(wchar_t))));
}
pub extern fn wmempcpy(_Dst: [*c]wchar_t, _Src: [*c]const wchar_t, _Size: usize) [*c]wchar_t;
pub fn wmemmove(arg__S1: [*c]wchar_t, arg__S2: [*c]const wchar_t, arg__N: usize) callconv(.c) [*c]wchar_t {
    var _S1 = arg__S1;
    _ = &_S1;
    var _S2 = arg__S2;
    _ = &_S2;
    var _N = arg__N;
    _ = &_N;
    return @ptrCast(@alignCast(memmove(@ptrCast(@alignCast(_S1)), @ptrCast(@alignCast(_S2)), _N *% @sizeOf(wchar_t))));
}
pub fn fwide(arg__F: [*c]FILE, arg__M: c_int) callconv(.c) c_int {
    var _F = arg__F;
    _ = &_F;
    var _M = arg__M;
    _ = &_M;
    _ = &_F;
    return _M;
}
pub fn mbsinit(arg__P: [*c]const mbstate_t) callconv(.c) c_int {
    var _P = arg__P;
    _ = &_P;
    return @intFromBool(!(_P != null) or (_P.*._Wchar == @as(c_ulong, 0)));
}
pub extern fn wcstoll(noalias nptr: [*c]const wchar_t, noalias endptr: [*c][*c]wchar_t, base: c_int) c_longlong;
pub extern fn wcstoull(noalias nptr: [*c]const wchar_t, noalias endptr: [*c][*c]wchar_t, base: c_int) c_ulonglong;
pub extern fn _waccess_s(_Filename: [*c]const wchar_t, _AccessMode: c_int) errno_t;
pub extern fn _wmktemp_s(_TemplateName: [*c]wchar_t, _SizeInWords: usize) errno_t;
pub extern fn _cgetws_s(_Buffer: [*c]wchar_t, _SizeInWords: usize, _SizeRead: [*c]usize) errno_t;
pub extern fn _cwprintf_s(_Format: [*c]const wchar_t, ...) c_int;
pub extern fn _cwscanf_s(_Format: [*c]const wchar_t, ...) c_int;
pub extern fn _cwscanf_s_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
pub extern fn _vcwprintf_s(_Format: [*c]const wchar_t, _ArgList: va_list) c_int;
pub extern fn _cwprintf_s_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
pub extern fn _vcwprintf_s_l(_Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
pub extern fn mbsrtowcs_s(_Retval: [*c]usize, _Dst: [*c]wchar_t, _SizeInWords: usize, _PSrc: [*c][*c]const u8, _N: usize, _State: [*c]mbstate_t) errno_t;
pub extern fn wcrtomb_s(_Retval: [*c]usize, _Dst: [*c]u8, _SizeInBytes: usize, _Ch: wchar_t, _State: [*c]mbstate_t) errno_t;
pub extern fn wcsrtombs_s(_Retval: [*c]usize, _Dst: [*c]u8, _SizeInBytes: usize, _Src: [*c][*c]const wchar_t, _Size: usize, _State: [*c]mbstate_t) errno_t;
pub extern fn wmemcpy_s(_dest: [*c]wchar_t, _numberOfElements: usize, _src: [*c]const wchar_t, _count: usize) errno_t;
pub extern fn wmemmove_s(_dest: [*c]wchar_t, _numberOfElements: usize, _src: [*c]const wchar_t, _count: usize) errno_t;
pub const struct__utimbuf = extern struct {
    actime: time_t = 0,
    modtime: time_t = 0,
};
pub const struct___utimbuf32 = extern struct {
    actime: __time32_t = 0,
    modtime: __time32_t = 0,
};
pub const struct___utimbuf64 = extern struct {
    actime: __time64_t = 0,
    modtime: __time64_t = 0,
};
pub const struct_utimbuf = extern struct {
    actime: time_t = 0,
    modtime: time_t = 0,
};
pub const struct_utimbuf32 = extern struct {
    actime: __time32_t = 0,
    modtime: __time32_t = 0,
};
pub extern fn _utime32(_Filename: [*c]const u8, _Time: [*c]struct___utimbuf32) c_int;
pub extern fn _futime32(_FileDes: c_int, _Time: [*c]struct___utimbuf32) c_int;
pub extern fn _wutime32(_Filename: [*c]const wchar_t, _Time: [*c]struct___utimbuf32) c_int;
pub extern fn _utime64(_Filename: [*c]const u8, _Time: [*c]struct___utimbuf64) c_int;
pub extern fn _futime64(_FileDes: c_int, _Time: [*c]struct___utimbuf64) c_int;
pub extern fn _wutime64(_Filename: [*c]const wchar_t, _Time: [*c]struct___utimbuf64) c_int;
pub fn _utime(arg__Filename: [*c]const u8, arg__Utimbuf: [*c]struct__utimbuf) callconv(.c) c_int {
    var _Filename = arg__Filename;
    _ = &_Filename;
    var _Utimbuf = arg__Utimbuf;
    _ = &_Utimbuf;
    return _utime64(_Filename, @ptrCast(@alignCast(_Utimbuf)));
}
pub fn _futime(arg__Desc: c_int, arg__Utimbuf: [*c]struct__utimbuf) callconv(.c) c_int {
    var _Desc = arg__Desc;
    _ = &_Desc;
    var _Utimbuf = arg__Utimbuf;
    _ = &_Utimbuf;
    return _futime64(_Desc, @ptrCast(@alignCast(_Utimbuf)));
}
pub fn _wutime(arg__Filename: [*c]const wchar_t, arg__Utimbuf: [*c]struct__utimbuf) callconv(.c) c_int {
    var _Filename = arg__Filename;
    _ = &_Filename;
    var _Utimbuf = arg__Utimbuf;
    _ = &_Utimbuf;
    return _wutime64(_Filename, @ptrCast(@alignCast(_Utimbuf)));
}
pub fn utime(arg__Filename: [*c]const u8, arg__Utimbuf: [*c]struct_utimbuf) callconv(.c) c_int {
    var _Filename = arg__Filename;
    _ = &_Filename;
    var _Utimbuf = arg__Utimbuf;
    _ = &_Utimbuf;
    return _utime64(_Filename, @ptrCast(@alignCast(_Utimbuf)));
}
pub const SAP_UTF16 = wchar_t;
pub const WINT_T = c_int;
pub var unicodeId: [16:0]SAP_RAW = "@(#)     Unicode".*;
pub extern fn dbgAlignCheckStringU16([*c]u8) [*c]SAP_UTF16;
pub extern fn UcnToFileLenR(data: [*c]SAP_CHAR, n: size_tU) size_tR;
pub extern fn strcatU16(dest: [*c]SAP_UTF16, src: [*c]const SAP_UTF16) [*c]SAP_UTF16;
pub extern fn strchrU16(wcs: [*c]const SAP_UTF16, c: c_int) [*c]SAP_UTF16;
pub extern fn strcmpU16(s1: [*c]const SAP_UTF16, s2: [*c]const SAP_UTF16) c_int;
pub extern fn strcpyU16(dest: [*c]SAP_UTF16, src: [*c]const SAP_UTF16) [*c]SAP_UTF16;
pub extern fn strcspnU16(ucs: [*c]const SAP_UTF16, reject: [*c]const SAP_UTF16) usize;
pub extern fn strdupU16(s: [*c]const SAP_UTF16) [*c]SAP_UTF16;
pub extern fn strlenU16(s: [*c]const SAP_UTF16) usize;
pub extern fn strncatU16(dest: [*c]SAP_UTF16, src: [*c]const SAP_UTF16, n: usize) [*c]SAP_UTF16;
pub extern fn strncmpU16(s1: [*c]const SAP_UTF16, s2: [*c]const SAP_UTF16, n: usize) c_int;
pub extern fn strncpyU16(dest: [*c]SAP_UTF16, src: [*c]const SAP_UTF16, n: usize) [*c]SAP_UTF16;
pub extern fn strpbrkU16(ucs: [*c]const SAP_UTF16, accept: [*c]const SAP_UTF16) [*c]SAP_UTF16;
pub extern fn strrchrU16(wcs: [*c]const SAP_UTF16, c: c_int) [*c]SAP_UTF16;
pub extern fn strspnU16(ucs: [*c]const SAP_UTF16, accept: [*c]const SAP_UTF16) usize;
pub extern fn strstrU16(haystack: [*c]const SAP_UTF16, needle: [*c]const SAP_UTF16) [*c]SAP_UTF16;
pub extern fn strtokU16(s: [*c]SAP_UTF16, delim: [*c]const SAP_UTF16) [*c]SAP_UTF16;
pub extern fn strtok_rRFB(s: [*c]u8, delim: [*c]const u8, save_ptr: [*c][*c]u8) [*c]u8;
pub extern fn strtok_rU16(s: [*c]SAP_UTF16, delim: [*c]const SAP_UTF16, save_ptr: [*c][*c]SAP_UTF16) [*c]SAP_UTF16;
pub extern fn strtodU16(str: [*c]const SAP_UTF16, endptr: [*c][*c]SAP_UTF16) f64;
pub extern fn strtolU16(s: [*c]const SAP_UTF16, end: [*c][*c]SAP_UTF16, base: c_int) c_long;
pub extern fn strtoulU16(s: [*c]const SAP_UTF16, end: [*c][*c]SAP_UTF16, base: c_int) c_ulong;
pub extern fn strtollU16(s: [*c]const SAP_UTF16, end: [*c][*c]SAP_UTF16, base: c_int) c_longlong;
pub extern fn strtoullU16(s: [*c]const SAP_UTF16, end: [*c][*c]SAP_UTF16, base: c_int) c_ulonglong;
pub extern fn strcasecmpU16(s1: [*c]const SAP_UTF16, s2: [*c]const SAP_UTF16) c_int;
pub extern fn strcasecmpR(s1: [*c]const u8, s2: [*c]const u8) c_int;
pub extern fn strncasecmpU16(s1: [*c]const SAP_UTF16, s2: [*c]const SAP_UTF16, n: size_tU) c_int;
pub extern fn strncasecmpR(s1: [*c]const u8, s2: [*c]const u8, n: usize) c_int;
pub extern fn getoptU(argc: c_int, argv: [*c]const [*c]SAP_UC, optstr: [*c]const SAP_UC) c_int;
pub extern var optargU: [*c]SAP_UC;
pub extern fn memcmpU16(s1: [*c]const SAP_UTF16, s2: [*c]const SAP_UTF16, n: usize) c_int;
pub extern fn memchrU16(s: [*c]const SAP_UTF16, c: c_int, n: usize) [*c]SAP_UTF16;
pub extern fn memsetU16(s: [*c]SAP_UTF16, c: c_int, n: usize) [*c]SAP_UTF16;
pub extern fn accessU16(path: [*c]const SAP_UTF16, mode: c_int) c_int;
pub extern fn chdirU16(path: [*c]const SAP_UTF16) c_int;
pub extern fn fdopenU16(filedes: c_int, @"type": [*c]const SAP_UTF16) [*c]FILE;
pub extern fn fopenU16(path: [*c]const SAP_UTF16, mode: [*c]const SAP_UTF16) [*c]FILE;
pub extern fn freopenU16(path: [*c]const SAP_UTF16, mode: [*c]const SAP_UTF16, stream: [*c]FILE) [*c]FILE;
pub extern fn gethostnameU16(name: [*c]SAP_UTF16, len: size_tU) c_int;
pub extern fn openU16(wpath: [*c]const SAP_UTF16, oflag: c_int, ...) c_int;
pub extern fn perrorU16(program: [*c]const SAP_UTF16) void;
pub extern fn popenU16(wcomm: [*c]const SAP_UTF16, wtype: [*c]const SAP_UTF16) [*c]FILE;
pub extern fn removeU16(path: [*c]const SAP_UTF16) c_int;
pub extern fn renameU16(from: [*c]const SAP_UTF16, to: [*c]const SAP_UTF16) c_int;
pub extern fn rmdirU16(wpath: [*c]const SAP_UTF16) c_int;
pub extern fn systemU16(s: [*c]const SAP_UTF16) c_int;
pub extern fn strftimeU16(wcs: [*c]SAP_UTF16, len: usize, format: [*c]const SAP_UTF16, tmdate: [*c]const struct_tm) usize;
pub extern fn unlinkU16(path: [*c]const SAP_UTF16) c_int;
pub extern fn utimeU16(wpath: [*c]const SAP_UTF16, time: [*c]const struct_utimbuf) c_int;
pub extern fn asctimeU16(timeptr: [*c]const struct_tm) [*c]SAP_UTF16;
pub extern fn ctimeU16(timer: [*c]const time_t) [*c]SAP_UTF16;
pub extern fn ecvtU16(value: f64, ndig: c_int, dptr: [*c]c_int, sign: [*c]c_int) [*c]SAP_UTF16;
pub extern fn getcwdU16(wbuf: [*c]SAP_UTF16, size: size_tU) [*c]SAP_UTF16;
pub extern fn setlocaleU16(category: c_int, w_inPtr: [*c]const SAP_UTF16) [*c]SAP_UTF16;
pub extern fn strerrorU16(errnum: c_int) [*c]SAP_UTF16;
pub extern fn strerror_rU16(errnum: c_int, buf: [*c]SAP_UTF16, buflen: size_tU) c_int;
pub extern fn strerror_rR(errnum: c_int, buf: [*c]u8, buflen: usize) c_int;
pub extern fn fgetcU16(stream: [*c]FILE) c_int;
pub extern fn fputcU16(wc: c_int, stream: [*c]FILE) c_int;
pub extern fn fwriteU16([*c]const SAP_UTF16, size_tU, usize, stream: [*c]FILE) usize;
pub extern fn freadU16(buf: [*c]SAP_UTF16, s: size_tU, n: usize, stream: [*c]FILE) usize;
pub extern fn fgetsU16(wcs: [*c]SAP_UTF16, n: intU, stream: [*c]FILE) [*c]SAP_UTF16;
pub extern fn getsU16(s: [*c]SAP_UTF16) [*c]SAP_UTF16;
pub extern fn fputsU16(wcs: [*c]const SAP_UTF16, stream: [*c]FILE) intU;
pub extern fn putsU16(wcs: [*c]const SAP_UTF16) intU;
pub extern fn printfU16(format: [*c]const SAP_UTF16, ...) c_int;
pub extern fn fprintfU16(s: [*c]FILE, format: [*c]const SAP_UTF16, ...) c_int;
pub extern fn sprintfU16(s: [*c]SAP_UTF16, format: [*c]const SAP_UTF16, ...) intU;
pub extern fn snprintfU16(s: [*c]SAP_UTF16, n: usize, format: [*c]const SAP_UTF16, ...) intU;
pub extern fn vprintfU16(format: [*c]const SAP_UTF16, ap: va_list) c_int;
pub extern fn vfprintfU16(s: [*c]FILE, format: [*c]const SAP_UTF16, ap: va_list) c_int;
pub extern fn vsprintfU16(s: [*c]SAP_UTF16, format: [*c]const SAP_UTF16, ap: va_list) intU;
pub extern fn vsprintf_sRFB(s: [*c]u8, s1max: size_tR, format: [*c]const u8, ap: va_list) c_int;
pub extern fn vsprintf_sU16(s: [*c]SAP_UTF16, n: usize, format: [*c]const SAP_UTF16, ap: va_list) intU;
pub extern fn vsnprintfU16(s: [*c]SAP_UTF16, n: usize, format: [*c]const SAP_UTF16, ap: va_list) intU;
pub extern fn vsnprintf_sRFB(s: [*c]u8, s1max: size_tR, format: [*c]const u8, ap: va_list) c_int;
pub extern fn vsnprintf_sU16(s: [*c]SAP_UTF16, n: usize, format: [*c]const SAP_UTF16, ap: va_list) intU;
pub extern fn sscanfU16(s: [*c]const SAP_UTF16, format: [*c]const SAP_UTF16, ...) c_int;
pub extern fn scanfU16(format: [*c]const SAP_UTF16, ...) c_int;
pub extern fn fscanfU16(s: [*c]FILE, format: [*c]const SAP_UTF16, ...) c_int;
pub extern fn fget_strR(s: [*c]u8, n: c_int, stream: [*c]FILE, repl_char: SAP_UC) c_int;
pub extern fn fget_strU16(s: [*c]SAP_UTF16, n: c_int, stream: [*c]FILE, repl_char: SAP_UTF16) c_int;
pub extern fn fget_lineR(s: [*c]u8, n: c_int, stream: [*c]FILE, repl_char: SAP_UC) c_int;
pub extern fn fget_lineU16(s: [*c]SAP_UTF16, n: c_int, stream: [*c]FILE, repl_char: SAP_UTF16) c_int;
pub extern fn fget_longR(ptr: [*c]c_long, stream: [*c]FILE) c_int;
pub extern fn fget_longU16(ptr: [*c]c_long, stream: [*c]FILE) c_int;
pub extern fn fget_intR(ptr: [*c]c_int, stream: [*c]FILE) c_int;
pub extern fn fget_intU16(ptr: [*c]c_int, stream: [*c]FILE) c_int;
pub extern fn getenvU16(wname: [*c]const SAP_UTF16) [*c]SAP_UTF16;
pub extern fn putenvU16(wcs: [*c]const SAP_UTF16) c_int;
pub extern fn nlsui_main(argc: c_int, argv: [*c][*c]SAP_UC) c_int;
pub extern fn nlsui_main3(argc: c_int, argv: [*c][*c]SAP_UC, envp: [*c][*c]SAP_UC) c_int;
pub extern fn nlsui_initialize() void;
pub extern fn mblenU(mbptr: [*c]const SAP_UC, units: size_tU) c_int;
pub const struct_passwdU16 = extern struct {
    pw_name: [*c]SAP_UTF16 = null,
    pw_passwd: [*c]SAP_UTF16 = null,
    pw_uid: SAP_UINT = 0,
    pw_gid: SAP_UINT = 0,
    pw_gecos: [*c]SAP_UTF16 = null,
    pw_dir: [*c]SAP_UTF16 = null,
    pw_shell: [*c]SAP_UTF16 = null,
};
pub const struct_hostentU16 = extern struct {
    h_name: [*c]SAP_UTF16 = null,
    h_aliases: [64][*c]SAP_UTF16 = @import("std").mem.zeroes([64][*c]SAP_UTF16),
    h_addrtype: SAP_INT = 0,
    h_length: SAP_INT = 0,
    h_addr_list: [64][*c]SAP_RAW = @import("std").mem.zeroes([64][*c]SAP_RAW),
};
pub const struct_serventU16 = extern struct {
    s_name: [*c]SAP_UTF16 = null,
    s_aliases: [64][*c]SAP_UTF16 = @import("std").mem.zeroes([64][*c]SAP_UTF16),
    s_port: SAP_INT = 0,
    s_proto: [*c]SAP_UTF16 = null,
};
pub extern fn gethostbyaddrU16(addr: ?*const anyopaque, len: c_int, @"type": c_int) [*c]struct_hostentU16;
pub extern fn gethostbynameU16(name: [*c]const SAP_UTF16) [*c]struct_hostentU16;
pub const SAP_U2 = wchar_t;
pub const SAP_U4 = SAP_UINT;
pub const SAP_B8 = u8;
pub const SAP_UTF8 = u8;
pub const SAP_CESU8 = u8;
pub const SAP_UTF7 = u8;
pub const SAP_A7 = u8;
pub const SAP_B7 = u8;
pub const SAP_E8 = u8;
pub const SAP_UC_MB = u8;
pub const none: c_int = 0;
pub const low: c_int = 1;
pub const medium: c_int = 4;
pub const high: c_int = 16;
pub const NlsuiTraceLevel = c_uint;
pub const TRACE_FUNC_T = ?*const fn (buffer: [*c]const SAP_B7, number_of_chars: c_int) callconv(.c) void;
pub extern fn nlsui_set_trace(p: TRACE_FUNC_T, l: NlsuiTraceLevel) void;
pub extern fn nlsui_set_trace_func(p: TRACE_FUNC_T) void;
pub const ICU_BOOL = i8;
pub extern var isalnumU: ?*const fn (c: SAP_U4) callconv(.c) ICU_BOOL;
pub extern var isalphaU: ?*const fn (c: SAP_U4) callconv(.c) ICU_BOOL;
pub extern var iscntrlU: ?*const fn (c: SAP_U4) callconv(.c) ICU_BOOL;
pub extern var islowerU: ?*const fn (c: SAP_U4) callconv(.c) ICU_BOOL;
pub extern var isprintU: ?*const fn (c: SAP_U4) callconv(.c) ICU_BOOL;
pub extern var isspaceU: ?*const fn (c: SAP_U4) callconv(.c) ICU_BOOL;
pub extern var isupperU: ?*const fn (c: SAP_U4) callconv(.c) ICU_BOOL;
pub extern fn isgraphU(c: SAP_U4) ICU_BOOL;
pub extern fn ispunctU(c: SAP_U4) ICU_BOOL;
pub extern fn isxdigitU(c: SAP_U4) ICU_BOOL;
pub extern var tolowerU: ?*const fn (c: SAP_U4) callconv(.c) SAP_U4;
pub extern var toupperU: ?*const fn (c: SAP_U4) callconv(.c) SAP_U4;
pub extern fn strnlenRFB(s: [*c]const u8, maxsize: size_tR) usize;
pub extern fn strnlenU16(s: [*c]const SAP_UTF16, maxsize: size_tU) usize;
pub extern fn strcpy_sRFB(s1: [*c]u8, s1max: size_tR, s2: [*c]const u8) c_int;
pub extern fn strcpy_sU16(dest: [*c]SAP_UTF16, s1max: size_tU, src: [*c]const SAP_UTF16) c_int;
pub extern fn strncpy_sRFB(s1: [*c]u8, s1max: size_tR, s2: [*c]const u8, n: usize) c_int;
pub extern fn strncpy_sU16(dest: [*c]SAP_UTF16, s1max: size_tU, src: [*c]const SAP_UTF16, n: usize) c_int;
pub extern fn strcat_sRFB(s1: [*c]u8, s1max: size_tR, s2: [*c]const u8) c_int;
pub extern fn strcat_sU16(dest: [*c]SAP_UTF16, s1max: size_tU, src: [*c]const SAP_UTF16) c_int;
pub extern fn strncat_sRFB(s1: [*c]u8, s1max: size_tR, s2: [*c]const u8, n: size_tR) c_int;
pub extern fn strncat_sU16(dest: [*c]SAP_UTF16, s1max: size_tU, src: [*c]const SAP_UTF16, n: size_tU) c_int;
pub extern fn gets_sRFB(s: [*c]u8, n: size_tR) [*c]u8;
pub extern fn gets_sU16(s: [*c]SAP_UTF16, n: size_tU) [*c]SAP_UTF16;
pub extern fn sprintf_sRFB(s: [*c]u8, s1max: size_tR, format: [*c]const u8, ...) c_int;
pub extern fn sprintf_sU16(s: [*c]SAP_UTF16, s1max: size_tU, format: [*c]const SAP_UTF16, ...) intU;
pub extern fn snprintf_sRFB(s: [*c]u8, n: size_tR, format: [*c]const u8, ...) c_int;
pub extern fn snprintf_sU16(s: [*c]SAP_UTF16, n: size_tU, format: [*c]const SAP_UTF16, ...) intU;
pub extern fn memcpy_sRFB(s1: ?*anyopaque, s1max: size_tR, s2: ?*const anyopaque, n: size_tR) c_int;
pub extern fn memcpy_sU16(s1: [*c]SAP_UTF16, s1max: size_tU, s2: [*c]const SAP_UTF16, n: size_tU) c_int;
pub extern fn memmove_sRFB(s1: ?*anyopaque, s1max: size_tR, s2: ?*const anyopaque, n: size_tR) c_int;
pub extern fn memmove_sU16(s1: [*c]SAP_UTF16, s1max: size_tU, s2: [*c]const SAP_UTF16, n: size_tU) c_int;
pub const RFC_INT8 = c_longlong;
pub const RFC_CHAR = SAP_UC;
pub const RFC_NUM = RFC_CHAR;
pub const RFC_BYTE = SAP_RAW;
pub const RFC_BCD = SAP_RAW;
pub const RFC_INT1 = SAP_RAW;
pub const RFC_INT2 = c_short;
pub const RFC_INT = c_int;
pub const RFC_FLOAT = f64;
pub const RFC_DATE = [8]RFC_CHAR;
pub const RFC_TIME = [6]RFC_CHAR;
pub const RFC_DECF16 = DecFloat16;
pub const RFC_DECF34 = DecFloat34;
pub const RFC_UTCLONG = RFC_INT8;
pub const RFC_UTCSECOND = RFC_INT8;
pub const RFC_UTCMINUTE = RFC_INT8;
pub const RFC_DTDAY = c_int;
pub const RFC_DTWEEK = c_int;
pub const RFC_DTMONTH = c_int;
pub const RFC_TSECOND = c_int;
pub const RFC_TMINUTE = c_short;
pub const RFC_CDAY = c_short;
pub const RFC_TID = [25]SAP_UC;
pub const RFC_UNITID = [33]SAP_UC;
pub const RFCTYPE_CHAR: c_int = 0;
pub const RFCTYPE_DATE: c_int = 1;
pub const RFCTYPE_BCD: c_int = 2;
pub const RFCTYPE_TIME: c_int = 3;
pub const RFCTYPE_BYTE: c_int = 4;
pub const RFCTYPE_TABLE: c_int = 5;
pub const RFCTYPE_NUM: c_int = 6;
pub const RFCTYPE_FLOAT: c_int = 7;
pub const RFCTYPE_INT: c_int = 8;
pub const RFCTYPE_INT2: c_int = 9;
pub const RFCTYPE_INT1: c_int = 10;
pub const RFCTYPE_NULL: c_int = 14;
pub const RFCTYPE_ABAPOBJECT: c_int = 16;
pub const RFCTYPE_STRUCTURE: c_int = 17;
pub const RFCTYPE_DECF16: c_int = 23;
pub const RFCTYPE_DECF34: c_int = 24;
pub const RFCTYPE_XMLDATA: c_int = 28;
pub const RFCTYPE_STRING: c_int = 29;
pub const RFCTYPE_XSTRING: c_int = 30;
pub const RFCTYPE_INT8: c_int = 31;
pub const RFCTYPE_UTCLONG: c_int = 32;
pub const RFCTYPE_UTCSECOND: c_int = 33;
pub const RFCTYPE_UTCMINUTE: c_int = 34;
pub const RFCTYPE_DTDAY: c_int = 35;
pub const RFCTYPE_DTWEEK: c_int = 36;
pub const RFCTYPE_DTMONTH: c_int = 37;
pub const RFCTYPE_TSECOND: c_int = 38;
pub const RFCTYPE_TMINUTE: c_int = 39;
pub const RFCTYPE_CDAY: c_int = 40;
pub const RFCTYPE_BOX: c_int = 41;
pub const RFCTYPE_GENERIC_BOX: c_int = 42;
pub const _RFCTYPE_max_value: c_int = 43;
pub const enum__RFCTYPE = c_uint;
pub const RFCTYPE = enum__RFCTYPE;
pub const RFC_OK: c_int = 0;
pub const RFC_COMMUNICATION_FAILURE: c_int = 1;
pub const RFC_LOGON_FAILURE: c_int = 2;
pub const RFC_ABAP_RUNTIME_FAILURE: c_int = 3;
pub const RFC_ABAP_MESSAGE: c_int = 4;
pub const RFC_ABAP_EXCEPTION: c_int = 5;
pub const RFC_CLOSED: c_int = 6;
pub const RFC_CANCELED: c_int = 7;
pub const RFC_TIMEOUT: c_int = 8;
pub const RFC_MEMORY_INSUFFICIENT: c_int = 9;
pub const RFC_VERSION_MISMATCH: c_int = 10;
pub const RFC_INVALID_PROTOCOL: c_int = 11;
pub const RFC_SERIALIZATION_FAILURE: c_int = 12;
pub const RFC_INVALID_HANDLE: c_int = 13;
pub const RFC_RETRY: c_int = 14;
pub const RFC_EXTERNAL_FAILURE: c_int = 15;
pub const RFC_EXECUTED: c_int = 16;
pub const RFC_NOT_FOUND: c_int = 17;
pub const RFC_NOT_SUPPORTED: c_int = 18;
pub const RFC_ILLEGAL_STATE: c_int = 19;
pub const RFC_INVALID_PARAMETER: c_int = 20;
pub const RFC_CODEPAGE_CONVERSION_FAILURE: c_int = 21;
pub const RFC_CONVERSION_FAILURE: c_int = 22;
pub const RFC_BUFFER_TOO_SMALL: c_int = 23;
pub const RFC_TABLE_MOVE_BOF: c_int = 24;
pub const RFC_TABLE_MOVE_EOF: c_int = 25;
pub const RFC_START_SAPGUI_FAILURE: c_int = 26;
pub const RFC_ABAP_CLASS_EXCEPTION: c_int = 27;
pub const RFC_UNKNOWN_ERROR: c_int = 28;
pub const RFC_AUTHORIZATION_FAILURE: c_int = 29;
pub const RFC_AUTHENTICATION_FAILURE: c_int = 30;
pub const RFC_CRYPTOLIB_FAILURE: c_int = 31;
pub const RFC_IO_FAILURE: c_int = 32;
pub const RFC_LOCKING_FAILURE: c_int = 33;
pub const _RFC_RC_max_value: c_int = 34;
pub const enum__RFC_RC = c_uint;
pub const RFC_RC = enum__RFC_RC;
pub const OK: c_int = 0;
pub const ABAP_APPLICATION_FAILURE: c_int = 1;
pub const ABAP_RUNTIME_FAILURE: c_int = 2;
pub const LOGON_FAILURE: c_int = 3;
pub const COMMUNICATION_FAILURE: c_int = 4;
pub const EXTERNAL_RUNTIME_FAILURE: c_int = 5;
pub const EXTERNAL_APPLICATION_FAILURE: c_int = 6;
pub const EXTERNAL_AUTHORIZATION_FAILURE: c_int = 7;
pub const EXTERNAL_AUTHENTICATION_FAILURE: c_int = 8;
pub const CRYPTOLIB_FAILURE: c_int = 9;
pub const LOCKING_FAILURE: c_int = 10;
pub const enum__RFC_ERROR_GROUP = c_uint;
pub const RFC_ERROR_GROUP = enum__RFC_ERROR_GROUP;
pub const struct__RFC_ERROR_INFO = extern struct {
    code: RFC_RC = @import("std").mem.zeroes(RFC_RC),
    group: RFC_ERROR_GROUP = @import("std").mem.zeroes(RFC_ERROR_GROUP),
    key: [128]SAP_UC = @import("std").mem.zeroes([128]SAP_UC),
    message: [512]SAP_UC = @import("std").mem.zeroes([512]SAP_UC),
    abapMsgClass: [21]SAP_UC = @import("std").mem.zeroes([21]SAP_UC),
    abapMsgType: [2]SAP_UC = @import("std").mem.zeroes([2]SAP_UC),
    abapMsgNumber: [4]RFC_NUM = @import("std").mem.zeroes([4]RFC_NUM),
    abapMsgV1: [51]SAP_UC = @import("std").mem.zeroes([51]SAP_UC),
    abapMsgV2: [51]SAP_UC = @import("std").mem.zeroes([51]SAP_UC),
    abapMsgV3: [51]SAP_UC = @import("std").mem.zeroes([51]SAP_UC),
    abapMsgV4: [51]SAP_UC = @import("std").mem.zeroes([51]SAP_UC),
    pub const RfcReloadIniFile = __root.RfcReloadIniFile;
    pub const RfcCreateMetadataQueryResult = __root.RfcCreateMetadataQueryResult;
    pub const RfcCreateThroughput = __root.RfcCreateThroughput;
};
pub const RFC_ERROR_INFO = struct__RFC_ERROR_INFO;
pub const struct__RFC_ATTRIBUTES = extern struct {
    dest: [65]SAP_UC = @import("std").mem.zeroes([65]SAP_UC),
    host: [101]SAP_UC = @import("std").mem.zeroes([101]SAP_UC),
    partnerHost: [101]SAP_UC = @import("std").mem.zeroes([101]SAP_UC),
    sysNumber: [3]SAP_UC = @import("std").mem.zeroes([3]SAP_UC),
    sysId: [9]SAP_UC = @import("std").mem.zeroes([9]SAP_UC),
    client: [4]SAP_UC = @import("std").mem.zeroes([4]SAP_UC),
    user: [13]SAP_UC = @import("std").mem.zeroes([13]SAP_UC),
    language: [3]SAP_UC = @import("std").mem.zeroes([3]SAP_UC),
    trace: [2]SAP_UC = @import("std").mem.zeroes([2]SAP_UC),
    isoLanguage: [3]SAP_UC = @import("std").mem.zeroes([3]SAP_UC),
    codepage: [5]SAP_UC = @import("std").mem.zeroes([5]SAP_UC),
    partnerCodepage: [5]SAP_UC = @import("std").mem.zeroes([5]SAP_UC),
    rfcRole: [2]SAP_UC = @import("std").mem.zeroes([2]SAP_UC),
    type: [2]SAP_UC = @import("std").mem.zeroes([2]SAP_UC),
    partnerType: [2]SAP_UC = @import("std").mem.zeroes([2]SAP_UC),
    rel: [5]SAP_UC = @import("std").mem.zeroes([5]SAP_UC),
    partnerRel: [5]SAP_UC = @import("std").mem.zeroes([5]SAP_UC),
    kernelRel: [5]SAP_UC = @import("std").mem.zeroes([5]SAP_UC),
    cpicConvId: [9]SAP_UC = @import("std").mem.zeroes([9]SAP_UC),
    progName: [129]SAP_UC = @import("std").mem.zeroes([129]SAP_UC),
    partnerBytesPerChar: [2]SAP_UC = @import("std").mem.zeroes([2]SAP_UC),
    partnerSystemCodepage: [5]SAP_UC = @import("std").mem.zeroes([5]SAP_UC),
    partnerIP: [16]SAP_UC = @import("std").mem.zeroes([16]SAP_UC),
    partnerIPv6: [46]SAP_UC = @import("std").mem.zeroes([46]SAP_UC),
    reserved: [17]SAP_UC = @import("std").mem.zeroes([17]SAP_UC),
};
pub const RFC_ATTRIBUTES = struct__RFC_ATTRIBUTES;
pub const P_RFC_ATTRIBUTES = [*c]struct__RFC_ATTRIBUTES;
pub const struct__RFC_SECURITY_ATTRIBUTES = extern struct {
    functionName: [*c]SAP_UC = null,
    sysId: [*c]SAP_UC = null,
    client: [*c]SAP_UC = null,
    user: [*c]SAP_UC = null,
    progName: [*c]SAP_UC = null,
    sncName: [*c]SAP_UC = null,
    ssoTicket: [*c]SAP_UC = null,
    sncAclKey: [*c]SAP_RAW = null,
    sncAclKeyLength: c_uint = 0,
};
pub const RFC_SECURITY_ATTRIBUTES = struct__RFC_SECURITY_ATTRIBUTES;
pub const P_RFC_SECURITY_ATTRIBUTES = [*c]struct__RFC_SECURITY_ATTRIBUTES;
pub const struct__RFC_UNIT_ATTRIBUTES = extern struct {
    kernelTrace: c_short = 0,
    satTrace: c_short = 0,
    unitHistory: c_short = 0,
    lock: c_short = 0,
    noCommitCheck: c_short = 0,
    user: [13]SAP_UC = @import("std").mem.zeroes([13]SAP_UC),
    client: [4]SAP_UC = @import("std").mem.zeroes([4]SAP_UC),
    tCode: [21]SAP_UC = @import("std").mem.zeroes([21]SAP_UC),
    program: [41]SAP_UC = @import("std").mem.zeroes([41]SAP_UC),
    hostname: [41]SAP_UC = @import("std").mem.zeroes([41]SAP_UC),
    sendingDate: RFC_DATE = @import("std").mem.zeroes(RFC_DATE),
    sendingTime: RFC_TIME = @import("std").mem.zeroes(RFC_TIME),
};
pub const RFC_UNIT_ATTRIBUTES = struct__RFC_UNIT_ATTRIBUTES;
pub const struct__RFC_UNIT_IDENTIFIER = extern struct {
    unitType: SAP_UC = 0,
    unitID: RFC_UNITID = @import("std").mem.zeroes(RFC_UNITID),
};
pub const RFC_UNIT_IDENTIFIER = struct__RFC_UNIT_IDENTIFIER;
pub const RFC_UNIT_NOT_FOUND: c_int = 0;
pub const RFC_UNIT_IN_PROCESS: c_int = 1;
pub const RFC_UNIT_COMMITTED: c_int = 2;
pub const RFC_UNIT_ROLLED_BACK: c_int = 3;
pub const RFC_UNIT_CONFIRMED: c_int = 4;
pub const enum__RFC_UNIT_STATE = c_uint;
pub const RFC_UNIT_STATE = enum__RFC_UNIT_STATE;
pub const RFC_ABAP_NAME = [31]RFC_CHAR;
pub const RFC_PARAMETER_DEFVALUE = [31]RFC_CHAR;
pub const RFC_PARAMETER_TEXT = [80]RFC_CHAR;
pub const RFC_SYNCHRONOUS: c_int = 0;
pub const RFC_TRANSACTIONAL: c_int = 1;
pub const RFC_QUEUED: c_int = 2;
pub const RFC_BACKGROUND_UNIT: c_int = 3;
pub const enum__RFC_CALL_TYPE = c_uint;
pub const RFC_CALL_TYPE = enum__RFC_CALL_TYPE;
pub const struct__RFC_SERVER_CONTEXT = extern struct {
    type: RFC_CALL_TYPE = @import("std").mem.zeroes(RFC_CALL_TYPE),
    tid: RFC_TID = @import("std").mem.zeroes(RFC_TID),
    unitIdentifier: [*c]RFC_UNIT_IDENTIFIER = null,
    unitAttributes: [*c]RFC_UNIT_ATTRIBUTES = null,
    isStateful: c_uint = 0,
    sessionID: [33]SAP_UC = @import("std").mem.zeroes([33]SAP_UC),
    queueNamesCount: c_uint = 0,
    queueNames: [*c][*c]SAP_UC = null,
};
pub const RFC_SERVER_CONTEXT = struct__RFC_SERVER_CONTEXT;
pub const RFC_AUTH_NONE: c_int = 0;
pub const RFC_AUTH_BASIC: c_int = 1;
pub const RFC_AUTH_X509: c_int = 2;
pub const RFC_AUTH_SSO: c_int = 3;
pub const enum__RFC_AUTHENTICATION_TYPE = c_uint;
pub const RFC_AUTHENTICATION_TYPE = enum__RFC_AUTHENTICATION_TYPE;
pub const struct__RFC_CERTIFICATE_DATA = extern struct {
    subject: [*c]const SAP_UC = null,
    issuer: [*c]const SAP_UC = null,
    validTo: SAP_ULLONG = 0,
    validFrom: SAP_ULLONG = 0,
    signature: [*c]const SAP_UC = null,
    next: [*c]struct__RFC_CERTIFICATE_DATA = null,
};
pub const RFC_CERTIFICATE_DATA = struct__RFC_CERTIFICATE_DATA;
pub const struct__RFC_TYPE_DESC_HANDLE = extern struct {
    handle: ?*anyopaque = null,
    pub const RfcCreateStructure = __root.RfcCreateStructure;
    pub const RfcCreateTable = __root.RfcCreateTable;
    pub const RfcAddTypeField = __root.RfcAddTypeField;
    pub const RfcSetTypeLength = __root.RfcSetTypeLength;
    pub const RfcGetTypeName = __root.RfcGetTypeName;
    pub const RfcGetFieldCount = __root.RfcGetFieldCount;
    pub const RfcGetFieldDescByIndex = __root.RfcGetFieldDescByIndex;
    pub const RfcGetFieldDescByName = __root.RfcGetFieldDescByName;
    pub const RfcGetTypeLength = __root.RfcGetTypeLength;
    pub const RfcDestroyTypeDesc = __root.RfcDestroyTypeDesc;
};
pub const RFC_TYPE_DESC_HANDLE = [*c]struct__RFC_TYPE_DESC_HANDLE;
pub const struct__RFC_FUNCTION_DESC_HANDLE = extern struct {
    handle: ?*anyopaque = null,
    pub const RfcCreateFunction = __root.RfcCreateFunction;
    pub const RfcGetFunctionName = __root.RfcGetFunctionName;
    pub const RfcAddParameter = __root.RfcAddParameter;
    pub const RfcGetParameterCount = __root.RfcGetParameterCount;
    pub const RfcGetParameterDescByIndex = __root.RfcGetParameterDescByIndex;
    pub const RfcGetParameterDescByName = __root.RfcGetParameterDescByName;
    pub const RfcAddException = __root.RfcAddException;
    pub const RfcGetExceptionCount = __root.RfcGetExceptionCount;
    pub const RfcGetExceptionDescByIndex = __root.RfcGetExceptionDescByIndex;
    pub const RfcGetExceptionDescByName = __root.RfcGetExceptionDescByName;
    pub const RfcEnableBASXML = __root.RfcEnableBASXML;
    pub const RfcIsBASXMLSupported = __root.RfcIsBASXMLSupported;
    pub const RfcDestroyFunctionDesc = __root.RfcDestroyFunctionDesc;
};
pub const RFC_FUNCTION_DESC_HANDLE = [*c]struct__RFC_FUNCTION_DESC_HANDLE;
pub const struct__RFC_CLASS_DESC_HANDLE = extern struct {
    handle: ?*anyopaque = null,
    pub const RfcCreateAbapObject = __root.RfcCreateAbapObject;
    pub const RfcGetClassName = __root.RfcGetClassName;
    pub const RfcAddClassAttribute = __root.RfcAddClassAttribute;
    pub const RfcGetClassAttributesCount = __root.RfcGetClassAttributesCount;
    pub const RfcGetClassAttributeDescByIndex = __root.RfcGetClassAttributeDescByIndex;
    pub const RfcGetClassAttributeDescByName = __root.RfcGetClassAttributeDescByName;
    pub const RfcGetParentClassByIndex = __root.RfcGetParentClassByIndex;
    pub const RfcGetParentClassesCount = __root.RfcGetParentClassesCount;
    pub const RfcAddParentClass = __root.RfcAddParentClass;
    pub const RfcGetImplementedInterfaceByIndex = __root.RfcGetImplementedInterfaceByIndex;
    pub const RfcGetImplementedInterfacesCount = __root.RfcGetImplementedInterfacesCount;
    pub const RfcAddImplementedInterface = __root.RfcAddImplementedInterface;
    pub const RfcDestroyClassDesc = __root.RfcDestroyClassDesc;
};
pub const RFC_CLASS_DESC_HANDLE = [*c]struct__RFC_CLASS_DESC_HANDLE;
pub const struct_RFC_DATA_CONTAINER = extern struct {
    handle: ?*anyopaque = null,
    pub const RfcDestroyFunction = __root.RfcDestroyFunction;
    pub const RfcSetParameterActive = __root.RfcSetParameterActive;
    pub const RfcIsParameterActive = __root.RfcIsParameterActive;
    pub const RfcCloneStructure = __root.RfcCloneStructure;
    pub const RfcDestroyStructure = __root.RfcDestroyStructure;
    pub const RfcCloneTable = __root.RfcCloneTable;
    pub const RfcDestroyTable = __root.RfcDestroyTable;
    pub const RfcGetCurrentRow = __root.RfcGetCurrentRow;
    pub const RfcAppendNewRow = __root.RfcAppendNewRow;
    pub const RfcReserveCapacity = __root.RfcReserveCapacity;
    pub const RfcAppendNewRows = __root.RfcAppendNewRows;
    pub const RfcInsertNewRow = __root.RfcInsertNewRow;
    pub const RfcAppendRow = __root.RfcAppendRow;
    pub const RfcInsertRow = __root.RfcInsertRow;
    pub const RfcDeleteCurrentRow = __root.RfcDeleteCurrentRow;
    pub const RfcDeleteAllRows = __root.RfcDeleteAllRows;
    pub const RfcMoveToFirstRow = __root.RfcMoveToFirstRow;
    pub const RfcMoveToLastRow = __root.RfcMoveToLastRow;
    pub const RfcMoveToNextRow = __root.RfcMoveToNextRow;
    pub const RfcMoveToPreviousRow = __root.RfcMoveToPreviousRow;
    pub const RfcMoveTo = __root.RfcMoveTo;
    pub const RfcGetRowCount = __root.RfcGetRowCount;
    pub const RfcGetRowType = __root.RfcGetRowType;
    pub const RfcDestroyAbapObject = __root.RfcDestroyAbapObject;
    pub const RfcGetChars = __root.RfcGetChars;
    pub const RfcGetCharsByIndex = __root.RfcGetCharsByIndex;
    pub const RfcGetNum = __root.RfcGetNum;
    pub const RfcGetNumByIndex = __root.RfcGetNumByIndex;
    pub const RfcGetDate = __root.RfcGetDate;
    pub const RfcGetDateByIndex = __root.RfcGetDateByIndex;
    pub const RfcGetTime = __root.RfcGetTime;
    pub const RfcGetTimeByIndex = __root.RfcGetTimeByIndex;
    pub const RfcGetString = __root.RfcGetString;
    pub const RfcGetStringByIndex = __root.RfcGetStringByIndex;
    pub const RfcGetBytes = __root.RfcGetBytes;
    pub const RfcGetBytesByIndex = __root.RfcGetBytesByIndex;
    pub const RfcGetXString = __root.RfcGetXString;
    pub const RfcGetXStringByIndex = __root.RfcGetXStringByIndex;
    pub const RfcGetInt = __root.RfcGetInt;
    pub const RfcGetIntByIndex = __root.RfcGetIntByIndex;
    pub const RfcGetInt1 = __root.RfcGetInt1;
    pub const RfcGetInt1ByIndex = __root.RfcGetInt1ByIndex;
    pub const RfcGetInt2 = __root.RfcGetInt2;
    pub const RfcGetInt2ByIndex = __root.RfcGetInt2ByIndex;
    pub const RfcGetInt8 = __root.RfcGetInt8;
    pub const RfcGetInt8ByIndex = __root.RfcGetInt8ByIndex;
    pub const RfcGetFloat = __root.RfcGetFloat;
    pub const RfcGetFloatByIndex = __root.RfcGetFloatByIndex;
    pub const RfcGetDecF16 = __root.RfcGetDecF16;
    pub const RfcGetDecF16ByIndex = __root.RfcGetDecF16ByIndex;
    pub const RfcGetDecF34 = __root.RfcGetDecF34;
    pub const RfcGetDecF34ByIndex = __root.RfcGetDecF34ByIndex;
    pub const RfcGetStructure = __root.RfcGetStructure;
    pub const RfcGetStructureByIndex = __root.RfcGetStructureByIndex;
    pub const RfcGetStructureIntoCharBuffer = __root.RfcGetStructureIntoCharBuffer;
    pub const RfcGetTable = __root.RfcGetTable;
    pub const RfcGetTableByIndex = __root.RfcGetTableByIndex;
    pub const RfcGetAbapObject = __root.RfcGetAbapObject;
    pub const RfcGetAbapObjectByIndex = __root.RfcGetAbapObjectByIndex;
    pub const RfcGetStringLength = __root.RfcGetStringLength;
    pub const RfcGetStringLengthByIndex = __root.RfcGetStringLengthByIndex;
    pub const RfcSetChars = __root.RfcSetChars;
    pub const RfcSetCharsByIndex = __root.RfcSetCharsByIndex;
    pub const RfcSetNum = __root.RfcSetNum;
    pub const RfcSetNumByIndex = __root.RfcSetNumByIndex;
    pub const RfcSetString = __root.RfcSetString;
    pub const RfcSetStringByIndex = __root.RfcSetStringByIndex;
    pub const RfcSetDate = __root.RfcSetDate;
    pub const RfcSetDateByIndex = __root.RfcSetDateByIndex;
    pub const RfcSetTime = __root.RfcSetTime;
    pub const RfcSetTimeByIndex = __root.RfcSetTimeByIndex;
    pub const RfcSetBytes = __root.RfcSetBytes;
    pub const RfcSetBytesByIndex = __root.RfcSetBytesByIndex;
    pub const RfcSetXString = __root.RfcSetXString;
    pub const RfcSetXStringByIndex = __root.RfcSetXStringByIndex;
    pub const RfcSetInt = __root.RfcSetInt;
    pub const RfcSetIntByIndex = __root.RfcSetIntByIndex;
    pub const RfcSetInt1 = __root.RfcSetInt1;
    pub const RfcSetInt1ByIndex = __root.RfcSetInt1ByIndex;
    pub const RfcSetInt2 = __root.RfcSetInt2;
    pub const RfcSetInt2ByIndex = __root.RfcSetInt2ByIndex;
    pub const RfcSetInt8 = __root.RfcSetInt8;
    pub const RfcSetInt8ByIndex = __root.RfcSetInt8ByIndex;
    pub const RfcSetFloat = __root.RfcSetFloat;
    pub const RfcSetFloatByIndex = __root.RfcSetFloatByIndex;
    pub const RfcSetDecF16 = __root.RfcSetDecF16;
    pub const RfcSetDecF16ByIndex = __root.RfcSetDecF16ByIndex;
    pub const RfcSetDecF34 = __root.RfcSetDecF34;
    pub const RfcSetDecF34ByIndex = __root.RfcSetDecF34ByIndex;
    pub const RfcSetStructure = __root.RfcSetStructure;
    pub const RfcSetStructureByIndex = __root.RfcSetStructureByIndex;
    pub const RfcSetStructureFromCharBuffer = __root.RfcSetStructureFromCharBuffer;
    pub const RfcSetTable = __root.RfcSetTable;
    pub const RfcSetTableByIndex = __root.RfcSetTableByIndex;
    pub const RfcSetAbapObject = __root.RfcSetAbapObject;
    pub const RfcSetAbapObjectByIndex = __root.RfcSetAbapObjectByIndex;
    pub const RfcGetAbapClassException = __root.RfcGetAbapClassException;
    pub const RfcSetAbapClassException = __root.RfcSetAbapClassException;
    pub const RfcDescribeFunction = __root.RfcDescribeFunction;
    pub const RfcDescribeType = __root.RfcDescribeType;
    pub const RfcDescribeAbapObject = __root.RfcDescribeAbapObject;
    pub const RfcEnableAbapClassException = __root.RfcEnableAbapClassException;
    pub const RfcIsAbapClassExceptionEnabled = __root.RfcIsAbapClassExceptionEnabled;
};
pub const DATA_CONTAINER_HANDLE = [*c]struct_RFC_DATA_CONTAINER;
pub const RFC_STRUCTURE_HANDLE = DATA_CONTAINER_HANDLE;
pub const RFC_FUNCTION_HANDLE = DATA_CONTAINER_HANDLE;
pub const RFC_TABLE_HANDLE = DATA_CONTAINER_HANDLE;
pub const RFC_ABAP_OBJECT_HANDLE = DATA_CONTAINER_HANDLE;
pub const struct__RFC_THROUGHPUT_HANDLE = extern struct {
    handle: ?*anyopaque = null,
    pub const RfcDestroyThroughput = __root.RfcDestroyThroughput;
    pub const RfcResetThroughput = __root.RfcResetThroughput;
    pub const RfcGetNumberOfCalls = __root.RfcGetNumberOfCalls;
    pub const RfcGetTotalTime = __root.RfcGetTotalTime;
    pub const RfcGetSerializationTime = __root.RfcGetSerializationTime;
    pub const RfcGetDeserializationTime = __root.RfcGetDeserializationTime;
    pub const RfcGetApplicationTime = __root.RfcGetApplicationTime;
    pub const RfcGetServerTime = __root.RfcGetServerTime;
    pub const RfcGetNetworkWritingTime = __root.RfcGetNetworkWritingTime;
    pub const RfcGetNetworkReadingTime = __root.RfcGetNetworkReadingTime;
    pub const RfcGetSentBytes = __root.RfcGetSentBytes;
    pub const RfcGetReceivedBytes = __root.RfcGetReceivedBytes;
};
pub const RFC_THROUGHPUT_HANDLE = [*c]struct__RFC_THROUGHPUT_HANDLE;
pub const struct__RFC_AUTHENTICATION_HANDLE = extern struct {
    handle: ?*anyopaque = null,
    pub const RfcGetAuthenticationType = __root.RfcGetAuthenticationType;
    pub const RfcGetAuthenticationUser = __root.RfcGetAuthenticationUser;
    pub const RfcGetAuthenticationPassword = __root.RfcGetAuthenticationPassword;
    pub const RfcGetAuthenticationAssertionTicket = __root.RfcGetAuthenticationAssertionTicket;
    pub const RfcGetAuthenticationCertificateData = __root.RfcGetAuthenticationCertificateData;
};
pub const RFC_AUTHENTICATION_HANDLE = [*c]struct__RFC_AUTHENTICATION_HANDLE;
pub const struct__RFC_CONNECTION_HANDLE = extern struct {
    handle: ?*anyopaque = null,
    pub const RfcSetTraceLevel = __root.RfcSetTraceLevel;
    pub const RfcCloseConnection = __root.RfcCloseConnection;
    pub const RfcIsConnectionHandleValid = __root.RfcIsConnectionHandleValid;
    pub const RfcCancel = __root.RfcCancel;
    pub const RfcResetServerContext = __root.RfcResetServerContext;
    pub const RfcPing = __root.RfcPing;
    pub const RfcGetConnectionAttributes = __root.RfcGetConnectionAttributes;
    pub const RfcGetServerContext = __root.RfcGetServerContext;
    pub const RfcGetSapRouter = __root.RfcGetSapRouter;
    pub const RfcGetPartnerExternalIP = __root.RfcGetPartnerExternalIP;
    pub const RfcGetLocalAddress = __root.RfcGetLocalAddress;
    pub const RfcGetPartnerSSOTicket = __root.RfcGetPartnerSSOTicket;
    pub const RfcGetPartnerSNCName = __root.RfcGetPartnerSNCName;
    pub const RfcGetPartnerSNCKey = __root.RfcGetPartnerSNCKey;
    pub const RfcListenAndDispatch = __root.RfcListenAndDispatch;
    pub const RfcInvoke = __root.RfcInvoke;
    pub const RfcSetServerStateful = __root.RfcSetServerStateful;
    pub const RfcGetTransactionID = __root.RfcGetTransactionID;
    pub const RfcCreateTransaction = __root.RfcCreateTransaction;
    pub const RfcConfirmTransactionID = __root.RfcConfirmTransactionID;
    pub const RfcGetUnitID = __root.RfcGetUnitID;
    pub const RfcCreateUnit = __root.RfcCreateUnit;
    pub const RfcConfirmUnit = __root.RfcConfirmUnit;
    pub const RfcGetUnitState = __root.RfcGetUnitState;
    pub const RfcGetFunctionDesc = __root.RfcGetFunctionDesc;
    pub const RfcGetTypeDesc = __root.RfcGetTypeDesc;
    pub const RfcGetClassDesc = __root.RfcGetClassDesc;
    pub const RfcMetadataBatchQuery = __root.RfcMetadataBatchQuery;
    pub const RfcSetThroughputOnConnection = __root.RfcSetThroughputOnConnection;
    pub const RfcGetThroughputFromConnection = __root.RfcGetThroughputFromConnection;
    pub const RfcRemoveThroughputFromConnection = __root.RfcRemoveThroughputFromConnection;
};
pub const RFC_CONNECTION_HANDLE = [*c]struct__RFC_CONNECTION_HANDLE;
pub const struct__RFC_SERVER_HANDLE = extern struct {
    handle: ?*anyopaque = null,
    pub const RfcDestroyServer = __root.RfcDestroyServer;
    pub const RfcLaunchServer = __root.RfcLaunchServer;
    pub const RfcShutdownServer = __root.RfcShutdownServer;
    pub const RfcGetServerAttributes = __root.RfcGetServerAttributes;
    pub const RfcGetServerConnectionMonitorData = __root.RfcGetServerConnectionMonitorData;
    pub const RfcAddServerErrorListener = __root.RfcAddServerErrorListener;
    pub const RfcAddServerStateChangedListener = __root.RfcAddServerStateChangedListener;
    pub const RfcAddServerSessionChangedListener = __root.RfcAddServerSessionChangedListener;
    pub const RfcSetThroughputOnServer = __root.RfcSetThroughputOnServer;
    pub const RfcGetThroughputFromServer = __root.RfcGetThroughputFromServer;
    pub const RfcRemoveThroughputFromServer = __root.RfcRemoveThroughputFromServer;
};
pub const RFC_SERVER_HANDLE = [*c]struct__RFC_SERVER_HANDLE;
pub const RFC_UNKOWN: c_int = 0;
pub const RFC_CLIENT: c_int = 1;
pub const RFC_STARTED_SERVER: c_int = 2;
pub const RFC_REGISTERED_SERVER: c_int = 3;
pub const RFC_MULTI_COUNT_REGISTERED_SERVER: c_int = 4;
pub const RFC_TCP_SOCKET_CLIENT: c_int = 5;
pub const RFC_TCP_SOCKET_SERVER: c_int = 6;
pub const RFC_WEBSOCKET_CLIENT: c_int = 7;
pub const RFC_WEBSOCKET_SERVER: c_int = 8;
pub const RFC_PROXY_WEBSOCKET_CLIENT: c_int = 9;
pub const enum__RFC_PROTOCOL_TYPE = c_uint;
pub const RFC_PROTOCOL_TYPE = enum__RFC_PROTOCOL_TYPE;
pub const RFC_SERVER_INITIAL: c_int = 0;
pub const RFC_SERVER_STARTING: c_int = 1;
pub const RFC_SERVER_RUNNING: c_int = 2;
pub const RFC_SERVER_BROKEN: c_int = 3;
pub const RFC_SERVER_STOPPING: c_int = 4;
pub const RFC_SERVER_STOPPED: c_int = 5;
pub const enum__RFC_SERVER_STATE = c_uint;
pub const RFC_SERVER_STATE = enum__RFC_SERVER_STATE;
pub const struct__RFC_SERVER_ATTRIBUTES = extern struct {
    serverName: [*c]SAP_UC = null,
    type: RFC_PROTOCOL_TYPE = @import("std").mem.zeroes(RFC_PROTOCOL_TYPE),
    registrationCount: c_uint = 0,
    state: RFC_SERVER_STATE = @import("std").mem.zeroes(RFC_SERVER_STATE),
    currentBusyCount: c_uint = 0,
    peakBusyCount: c_uint = 0,
};
pub const RFC_SERVER_ATTRIBUTES = struct__RFC_SERVER_ATTRIBUTES;
pub const RFC_SESSION_CREATED: c_int = 0;
pub const RFC_SESSION_ACTIVATED: c_int = 1;
pub const RFC_SESSION_PASSIVATED: c_int = 2;
pub const RFC_SESSION_DESTROYED: c_int = 3;
pub const enum__RFC_SESSION_EVENT = c_uint;
pub const RFC_SESSION_EVENT = enum__RFC_SESSION_EVENT;
pub const struct__RFC_SESSION_CHANGE = extern struct {
    sessionID: [31]SAP_UC = @import("std").mem.zeroes([31]SAP_UC),
    event: RFC_SESSION_EVENT = @import("std").mem.zeroes(RFC_SESSION_EVENT),
};
pub const RFC_SESSION_CHANGE = struct__RFC_SESSION_CHANGE;
pub const RFC_SERVER_SESSION_CHANGE_LISTENER = ?*const fn (serverHandle: RFC_SERVER_HANDLE, sessionChange: [*c]RFC_SESSION_CHANGE) callconv(.c) RFC_RC;
pub const RFC_SERVER_ERROR_LISTENER = ?*const fn (serverHandle: RFC_SERVER_HANDLE, clientInfo: [*c]RFC_ATTRIBUTES, errorInfo: [*c]RFC_ERROR_INFO) callconv(.c) void;
pub const struct__RFC_STATE_CHANGE = extern struct {
    oldState: RFC_SERVER_STATE = @import("std").mem.zeroes(RFC_SERVER_STATE),
    newState: RFC_SERVER_STATE = @import("std").mem.zeroes(RFC_SERVER_STATE),
};
pub const RFC_STATE_CHANGE = struct__RFC_STATE_CHANGE;
pub const RFC_SERVER_STATE_CHANGE_LISTENER = ?*const fn (serverHandle: RFC_SERVER_HANDLE, stateChange: [*c]RFC_STATE_CHANGE) callconv(.c) void;
pub const struct__RFC_SERVER_MONITOR_DATA = extern struct {
    clientInfo: [*c]RFC_ATTRIBUTES = null,
    isActive: c_int = 0,
    isStateful: c_int = 0,
    functionModuleName: [128]SAP_UC = @import("std").mem.zeroes([128]SAP_UC),
    lastActivity: time_t = 0,
};
pub const RFC_SERVER_MONITOR_DATA = struct__RFC_SERVER_MONITOR_DATA;
pub const struct__RFC_TRANSACTION_HANDLE = extern struct {
    handle: ?*anyopaque = null,
    pub const RfcInvokeInTransaction = __root.RfcInvokeInTransaction;
    pub const RfcSubmitTransaction = __root.RfcSubmitTransaction;
    pub const RfcConfirmTransaction = __root.RfcConfirmTransaction;
    pub const RfcDestroyTransaction = __root.RfcDestroyTransaction;
};
pub const RFC_TRANSACTION_HANDLE = [*c]struct__RFC_TRANSACTION_HANDLE;
pub const struct__RFC_UNIT_HANDLE = extern struct {
    handle: ?*anyopaque = null,
    pub const RfcInvokeInUnit = __root.RfcInvokeInUnit;
    pub const RfcSubmitUnit = __root.RfcSubmitUnit;
    pub const RfcDestroyUnit = __root.RfcDestroyUnit;
};
pub const RFC_UNIT_HANDLE = [*c]struct__RFC_UNIT_HANDLE;
pub const struct__RFC_CONNECTION_PARAMETER = extern struct {
    name: [*c]const SAP_UC = null,
    value: [*c]const SAP_UC = null,
    pub const RfcOpenConnection = __root.RfcOpenConnection;
    pub const RfcRegisterServer = __root.RfcRegisterServer;
    pub const RfcCreateServer = __root.RfcCreateServer;
};
pub const RFC_CONNECTION_PARAMETER = struct__RFC_CONNECTION_PARAMETER;
pub const P_RFC_CONNECTION_PARAMETER = [*c]struct__RFC_CONNECTION_PARAMETER;
pub const struct__RFC_FIELD_DESC = extern struct {
    name: RFC_ABAP_NAME = @import("std").mem.zeroes(RFC_ABAP_NAME),
    type: RFCTYPE = @import("std").mem.zeroes(RFCTYPE),
    nucLength: c_uint = 0,
    nucOffset: c_uint = 0,
    ucLength: c_uint = 0,
    ucOffset: c_uint = 0,
    decimals: c_uint = 0,
    typeDescHandle: RFC_TYPE_DESC_HANDLE = null,
    extendedDescription: ?*anyopaque = null,
};
pub const RFC_FIELD_DESC = struct__RFC_FIELD_DESC;
pub const P_RFC_FIELD_DESC = [*c]struct__RFC_FIELD_DESC;
pub const RFC_IMPORT: c_int = 1;
pub const RFC_EXPORT: c_int = 2;
pub const RFC_CHANGING: c_int = 3;
pub const RFC_TABLES: c_int = 7;
pub const enum__RFC_DIRECTION = c_uint;
pub const RFC_DIRECTION = enum__RFC_DIRECTION;
pub const struct__RFC_PARAMETER_DESC = extern struct {
    name: RFC_ABAP_NAME = @import("std").mem.zeroes(RFC_ABAP_NAME),
    type: RFCTYPE = @import("std").mem.zeroes(RFCTYPE),
    direction: RFC_DIRECTION = @import("std").mem.zeroes(RFC_DIRECTION),
    nucLength: c_uint = 0,
    ucLength: c_uint = 0,
    decimals: c_uint = 0,
    typeDescHandle: RFC_TYPE_DESC_HANDLE = null,
    defaultValue: RFC_PARAMETER_DEFVALUE = @import("std").mem.zeroes(RFC_PARAMETER_DEFVALUE),
    parameterText: RFC_PARAMETER_TEXT = @import("std").mem.zeroes(RFC_PARAMETER_TEXT),
    optional: RFC_BYTE = 0,
    extendedDescription: ?*anyopaque = null,
};
pub const RFC_PARAMETER_DESC = struct__RFC_PARAMETER_DESC;
pub const P_RFC_PARAMETER_DESC = [*c]struct__RFC_PARAMETER_DESC;
pub const struct__RFC_EXCEPTION_DESC = extern struct {
    key: [128]SAP_UC = @import("std").mem.zeroes([128]SAP_UC),
    message: [512]SAP_UC = @import("std").mem.zeroes([512]SAP_UC),
};
pub const RFC_EXCEPTION_DESC = struct__RFC_EXCEPTION_DESC;
pub const P__RFC_EXCEPTION_DESC = [*c]struct__RFC_EXCEPTION_DESC;
pub const RFC_CLASS_ATTRIBUTE_INSTANCE: c_int = 0;
pub const RFC_CLASS_ATTRIBUTE_CLASS: c_int = 1;
pub const RFC_CLASS_ATTRIBUTE_CONSTANT: c_int = 2;
pub const enum__RFC_CLASS_ATTRIBUTE_TYPE = c_uint;
pub const RFC_CLASS_ATTRIBUTE_TYPE = enum__RFC_CLASS_ATTRIBUTE_TYPE;
pub const RFC_CLASS_ATTRIBUTE_DEFVALUE = [31]RFC_CHAR;
pub const RFC_CLASS_NAME = [31]RFC_CHAR;
pub const RFC_CLASS_ATTRIBUTE_DESCRIPTION = [512]RFC_CHAR;
pub const struct__RFC_CLASS_ATTRIBUTE_DESC = extern struct {
    name: RFC_ABAP_NAME = @import("std").mem.zeroes(RFC_ABAP_NAME),
    type: RFCTYPE = @import("std").mem.zeroes(RFCTYPE),
    nucLength: c_uint = 0,
    ucLength: c_uint = 0,
    decimals: c_uint = 0,
    typeDescHandle: RFC_TYPE_DESC_HANDLE = null,
    defaultValue: RFC_CLASS_ATTRIBUTE_DEFVALUE = @import("std").mem.zeroes(RFC_CLASS_ATTRIBUTE_DEFVALUE),
    declaringClass: RFC_CLASS_NAME = @import("std").mem.zeroes(RFC_CLASS_NAME),
    description: RFC_CLASS_ATTRIBUTE_DESCRIPTION = @import("std").mem.zeroes(RFC_CLASS_ATTRIBUTE_DESCRIPTION),
    isReadOnly: c_uint = 0,
    attributeType: RFC_CLASS_ATTRIBUTE_TYPE = @import("std").mem.zeroes(RFC_CLASS_ATTRIBUTE_TYPE),
    extendedDescription: ?*anyopaque = null,
};
pub const RFC_CLASS_ATTRIBUTE_DESC = struct__RFC_CLASS_ATTRIBUTE_DESC;
pub const P_RFC_CLASS_ATTRIBUTE_DESC = [*c]struct__RFC_CLASS_ATTRIBUTE_DESC;
pub const RFC_SERVER_FUNCTION = ?*const fn (rfcHandle: RFC_CONNECTION_HANDLE, funcHandle: RFC_FUNCTION_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) callconv(.c) RFC_RC;
pub const RFC_ON_CHECK_TRANSACTION = ?*const fn (rfcHandle: RFC_CONNECTION_HANDLE, tid: [*c]const SAP_UC) callconv(.c) RFC_RC;
pub const RFC_ON_COMMIT_TRANSACTION = ?*const fn (rfcHandle: RFC_CONNECTION_HANDLE, tid: [*c]const SAP_UC) callconv(.c) RFC_RC;
pub const RFC_ON_ROLLBACK_TRANSACTION = ?*const fn (rfcHandle: RFC_CONNECTION_HANDLE, tid: [*c]const SAP_UC) callconv(.c) RFC_RC;
pub const RFC_ON_CONFIRM_TRANSACTION = ?*const fn (rfcHandle: RFC_CONNECTION_HANDLE, tid: [*c]const SAP_UC) callconv(.c) RFC_RC;
pub const RFC_FUNC_DESC_CALLBACK = ?*const fn (functionName: [*c]const SAP_UC, rfcAttributes: RFC_ATTRIBUTES, funcDescHandle: [*c]RFC_FUNCTION_DESC_HANDLE) callconv(.c) RFC_RC;
pub const RFC_PM_CALLBACK = ?*const fn (rfcHandle: RFC_CONNECTION_HANDLE, functionName: [*c]const SAP_UC, eppBuffer: [*c]SAP_RAW, eppBufferSize: usize, eppLength: [*c]usize) callconv(.c) RFC_RC;
pub const RFC_ON_CHECK_UNIT = ?*const fn (rfcHandle: RFC_CONNECTION_HANDLE, identifier: [*c]const RFC_UNIT_IDENTIFIER) callconv(.c) RFC_RC;
pub const RFC_ON_COMMIT_UNIT = ?*const fn (rfcHandle: RFC_CONNECTION_HANDLE, identifier: [*c]const RFC_UNIT_IDENTIFIER) callconv(.c) RFC_RC;
pub const RFC_ON_ROLLBACK_UNIT = ?*const fn (rfcHandle: RFC_CONNECTION_HANDLE, identifier: [*c]const RFC_UNIT_IDENTIFIER) callconv(.c) RFC_RC;
pub const RFC_ON_CONFIRM_UNIT = ?*const fn (rfcHandle: RFC_CONNECTION_HANDLE, identifier: [*c]const RFC_UNIT_IDENTIFIER) callconv(.c) RFC_RC;
pub const RFC_ON_GET_UNIT_STATE = ?*const fn (rfcHandle: RFC_CONNECTION_HANDLE, identifier: [*c]const RFC_UNIT_IDENTIFIER, unitState: [*c]RFC_UNIT_STATE) callconv(.c) RFC_RC;
pub const RFC_ON_PASSWORD_CHANGE = ?*const fn (sysId: [*c]const SAP_UC, user: [*c]const SAP_UC, client: [*c]const SAP_UC, password: [*c]SAP_UC, passwordLength: c_uint, newPassword: [*c]SAP_UC, newPasswordLength: c_uint, cause: [*c]RFC_ERROR_INFO) callconv(.c) RFC_RC;
pub const RFC_ON_AUTHORIZATION_CHECK = ?*const fn (rfcHandle: RFC_CONNECTION_HANDLE, secAttributes: [*c]RFC_SECURITY_ATTRIBUTES, errorInfo: [*c]RFC_ERROR_INFO) callconv(.c) RFC_RC;
pub const RFC_ON_AUTHENTICATION_CHECK = ?*const fn (rfcAttributes: RFC_ATTRIBUTES, authenticationHandle: RFC_AUTHENTICATION_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) callconv(.c) RFC_RC;
pub extern fn RfcInit() RFC_RC;
pub extern fn RfcCleanup() RFC_RC;
pub extern fn RfcGetVersion(majorVersion: [*c]c_uint, minorVersion: [*c]c_uint, patchLevel: [*c]c_uint) [*c]const SAP_UC;
pub extern fn RfcGetVersionInternal() RFC_RC;
pub extern fn RfcSetIniPath(pathName: [*c]const SAP_UC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcReloadIniFile(errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetTraceLevel(connection: RFC_CONNECTION_HANDLE, destination: [*c]SAP_UC, traceLevel: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetTraceEncoding(traceEncoding: [*c]SAP_UC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetTraceDir(traceDir: [*c]SAP_UC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetTraceType(traceType: [*c]SAP_UC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetCpicTraceLevel(traceLevel: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetCpicKeepalive(timeout: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetCpicPongTimeout(timeout: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetSocketTraceLevel(traceLevel: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcLoadCryptoLibrary(pathToLibrary: [*c]const SAP_UC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetWebsocketPingInterval(pingInterval: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetWebsocketPongTimeout(pongTimeout: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetMaximumTraceFileSize(size: c_uint, unit: SAP_UC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetMaximumStoredTraceFiles(numberOfFiles: c_int, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcUTF8ToSAPUC(utf8: [*c]const RFC_BYTE, utf8Length: c_uint, sapuc: [*c]SAP_UC, sapucSize: [*c]c_uint, resultLength: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcUTF8ToSAPUC_CCE(utf8: [*c]const RFC_BYTE, utf8Length: c_uint, sapuc: [*c]SAP_UC, sapucSize: [*c]c_uint, resultLength: [*c]c_uint, onCCE: c_ushort, substitute: SAP_UINT, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSAPUCToUTF8(sapuc: [*c]const SAP_UC, sapucLength: c_uint, utf8: [*c]RFC_BYTE, utf8Size: [*c]c_uint, resultLength: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSAPUCToUTF8_CCE(sapuc: [*c]const SAP_UC, sapucLength: c_uint, utf8: [*c]RFC_BYTE, utf8Size: [*c]c_uint, resultLength: [*c]c_uint, onCCE: c_ushort, substitute: SAP_UINT, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetRcAsString(rc: RFC_RC) [*c]const SAP_UC;
pub extern fn RfcGetTypeAsString(@"type": RFCTYPE) [*c]const SAP_UC;
pub extern fn RfcGetDirectionAsString(direction: RFC_DIRECTION) [*c]const SAP_UC;
pub extern fn RfcGetServerStateAsString(serverState: RFC_SERVER_STATE) [*c]const SAP_UC;
pub extern fn RfcGetSessionEventAsString(sessionEvent: RFC_SESSION_EVENT) [*c]const SAP_UC;
pub extern fn RfcLanguageIsoToSap(laiso: [*c]const SAP_UC, lang: [*c]SAP_UC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcLanguageSapToIso(lang: [*c]const SAP_UC, laiso: [*c]SAP_UC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetSaplogonEntries(saplogonIDList: [*c][*c][*c]SAP_UC, numSaplogonIDs: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcFreeSaplogonEntries(saplogonIDList: [*c][*c][*c]SAP_UC, numSaplogonIDs: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetSaplogonEntry(saplogonID: [*c]SAP_UC, entryParameters: [*c][*c]RFC_CONNECTION_PARAMETER, numParameters: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcFreeSaplogonEntry(entryParameters: [*c][*c]RFC_CONNECTION_PARAMETER, numParameters: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcOpenConnection(connectionParams: [*c]const RFC_CONNECTION_PARAMETER, paramCount: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_CONNECTION_HANDLE;
pub extern fn RfcRegisterServer(connectionParams: [*c]const RFC_CONNECTION_PARAMETER, paramCount: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_CONNECTION_HANDLE;
pub extern fn RfcStartServer(argc: c_int, argv: [*c][*c]SAP_UC, connectionParams: [*c]const RFC_CONNECTION_PARAMETER, paramCount: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_CONNECTION_HANDLE;
pub extern fn RfcCloseConnection(rfcHandle: RFC_CONNECTION_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcIsConnectionHandleValid(rfcHandle: RFC_CONNECTION_HANDLE, isValid: [*c]c_int, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcCancel(rfcHandle: RFC_CONNECTION_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcResetServerContext(rfcHandle: RFC_CONNECTION_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcPing(rfcHandle: RFC_CONNECTION_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetConnectionAttributes(rfcHandle: RFC_CONNECTION_HANDLE, attr: [*c]RFC_ATTRIBUTES, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetServerContext(rfcHandle: RFC_CONNECTION_HANDLE, context: [*c]RFC_SERVER_CONTEXT, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetSapRouter(rfcHandle: RFC_CONNECTION_HANDLE, sapRouter: [*c]SAP_UC, length: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetPartnerExternalIP(rfcHandle: RFC_CONNECTION_HANDLE, partnerExternalIP: [*c]SAP_UC, length: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetLocalAddress(rfcHandle: RFC_CONNECTION_HANDLE, localAddress: [*c]SAP_UC, length: [*c]c_uint, localPort: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetPartnerSSOTicket(rfcHandle: RFC_CONNECTION_HANDLE, ssoTicket: [*c]SAP_UC, length: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetPartnerSNCName(rfcHandle: RFC_CONNECTION_HANDLE, sncName: [*c]SAP_UC, length: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetPartnerSNCKey(rfcHandle: RFC_CONNECTION_HANDLE, sncKey: [*c]SAP_RAW, length: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSNCNameToKey(sncLib: [*c]const SAP_UC, sncName: [*c]const SAP_UC, sncKey: [*c]SAP_RAW, keyLength: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSNCKeyToName(sncLib: [*c]const SAP_UC, sncKey: [*c]const SAP_RAW, keyLength: c_uint, sncName: [*c]SAP_UC, nameLength: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcListenAndDispatch(rfcHandle: RFC_CONNECTION_HANDLE, timeout: c_int, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcInvoke(rfcHandle: RFC_CONNECTION_HANDLE, funcHandle: RFC_FUNCTION_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcCreateServer(connectionParams: [*c]const RFC_CONNECTION_PARAMETER, paramCount: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_SERVER_HANDLE;
pub extern fn RfcDestroyServer(serverHandle: RFC_SERVER_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcLaunchServer(serverHandle: RFC_SERVER_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcShutdownServer(serverHandle: RFC_SERVER_HANDLE, timeout: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetServerAttributes(serverHandle: RFC_SERVER_HANDLE, serverAttributes: [*c]RFC_SERVER_ATTRIBUTES, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetServerConnectionMonitorData(serverHandle: RFC_SERVER_HANDLE, numberOfConnections: [*c]c_uint, connectionData: [*c][*c]RFC_SERVER_MONITOR_DATA, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcDestroyServerConnectionMonitorData(numberOfConnections: c_uint, connectionData: [*c]RFC_SERVER_MONITOR_DATA, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcAddServerErrorListener(serverHandle: RFC_SERVER_HANDLE, errorListener: RFC_SERVER_ERROR_LISTENER, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcAddServerStateChangedListener(serverHandle: RFC_SERVER_HANDLE, stateChangeListener: RFC_SERVER_STATE_CHANGE_LISTENER, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcAddServerSessionChangedListener(serverHandle: RFC_SERVER_HANDLE, sessionChangeListener: RFC_SERVER_SESSION_CHANGE_LISTENER, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetServerStateful(connectionHandle: RFC_CONNECTION_HANDLE, isStateful: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcInstallAuthenticationCheckHandler(onAuthenticationCheck: RFC_ON_AUTHENTICATION_CHECK, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetAuthenticationType(authenticationHandle: RFC_AUTHENTICATION_HANDLE, @"type": [*c]RFC_AUTHENTICATION_TYPE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetAuthenticationUser(authenticationHandle: RFC_AUTHENTICATION_HANDLE, user: [*c][*c]const SAP_UC, length: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetAuthenticationPassword(authenticationHandle: RFC_AUTHENTICATION_HANDLE, password: [*c][*c]const SAP_UC, length: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetAuthenticationAssertionTicket(authenticationHandle: RFC_AUTHENTICATION_HANDLE, assertionTicket: [*c][*c]const SAP_UC, length: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetAuthenticationCertificateData(authenticationHandle: RFC_AUTHENTICATION_HANDLE, certificateData: [*c][*c]const RFC_CERTIFICATE_DATA, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetTransactionID(rfcHandle: RFC_CONNECTION_HANDLE, tid: [*c]SAP_UC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcCreateTransaction(rfcHandle: RFC_CONNECTION_HANDLE, tid: [*c]SAP_UC, queueName: [*c]const SAP_UC, errorInfo: [*c]RFC_ERROR_INFO) RFC_TRANSACTION_HANDLE;
pub extern fn RfcInvokeInTransaction(tHandle: RFC_TRANSACTION_HANDLE, funcHandle: RFC_FUNCTION_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSubmitTransaction(tHandle: RFC_TRANSACTION_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcConfirmTransaction(tHandle: RFC_TRANSACTION_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcConfirmTransactionID(rfcHandle: RFC_CONNECTION_HANDLE, tid: [*c]SAP_UC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcDestroyTransaction(tHandle: RFC_TRANSACTION_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetUnitID(rfcHandle: RFC_CONNECTION_HANDLE, uid: [*c]SAP_UC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcCreateUnit(rfcHandle: RFC_CONNECTION_HANDLE, uid: [*c]SAP_UC, queueNames: [*c][*c]const SAP_UC, queueNameCount: c_uint, unitAttr: [*c]const RFC_UNIT_ATTRIBUTES, identifier: [*c]RFC_UNIT_IDENTIFIER, errorInfo: [*c]RFC_ERROR_INFO) RFC_UNIT_HANDLE;
pub extern fn RfcInvokeInUnit(unitHandle: RFC_UNIT_HANDLE, funcHandle: RFC_FUNCTION_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSubmitUnit(unitHandle: RFC_UNIT_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcConfirmUnit(rfcHandle: RFC_CONNECTION_HANDLE, identifier: [*c]RFC_UNIT_IDENTIFIER, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcDestroyUnit(unitHandle: RFC_UNIT_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetUnitState(rfcHandle: RFC_CONNECTION_HANDLE, identifier: [*c]RFC_UNIT_IDENTIFIER, state: [*c]RFC_UNIT_STATE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcInstallServerFunction(sysId: [*c]const SAP_UC, funcDescHandle: RFC_FUNCTION_DESC_HANDLE, serverFunction: RFC_SERVER_FUNCTION, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcInstallGenericServerFunction(serverFunction: RFC_SERVER_FUNCTION, funcDescProvider: RFC_FUNC_DESC_CALLBACK, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcInstallTransactionHandlers(sysId: [*c]const SAP_UC, onCheckFunction: RFC_ON_CHECK_TRANSACTION, onCommitFunction: RFC_ON_COMMIT_TRANSACTION, onRollbackFunction: RFC_ON_ROLLBACK_TRANSACTION, onConfirmFunction: RFC_ON_CONFIRM_TRANSACTION, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcInstallBgRfcHandlers(sysId: [*c]const SAP_UC, onCheckFunction: RFC_ON_CHECK_UNIT, onCommitFunction: RFC_ON_COMMIT_UNIT, onRollbackFunction: RFC_ON_ROLLBACK_UNIT, onConfirmFunction: RFC_ON_CONFIRM_UNIT, onGetStateFunction: RFC_ON_GET_UNIT_STATE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcInstallPassportManager(onClientCallStart: RFC_PM_CALLBACK, onClientCallEnd: RFC_PM_CALLBACK, onServerCallStart: RFC_PM_CALLBACK, onServerCallEnd: RFC_PM_CALLBACK, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcInstallPasswordChangeHandler(onPasswordChange: RFC_ON_PASSWORD_CHANGE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcInstallAuthorizationCheckHandler(onAuthorizationCheck: RFC_ON_AUTHORIZATION_CHECK, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcCreateFunction(funcDescHandle: RFC_FUNCTION_DESC_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_FUNCTION_HANDLE;
pub extern fn RfcDestroyFunction(funcHandle: RFC_FUNCTION_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetParameterActive(funcHandle: RFC_FUNCTION_HANDLE, paramName: [*c]const SAP_UC, isActive: c_int, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcIsParameterActive(funcHandle: RFC_FUNCTION_HANDLE, paramName: [*c]const SAP_UC, isActive: [*c]c_int, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcCreateStructure(typeDescHandle: RFC_TYPE_DESC_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_STRUCTURE_HANDLE;
pub extern fn RfcCloneStructure(srcStructureHandle: RFC_STRUCTURE_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_STRUCTURE_HANDLE;
pub extern fn RfcDestroyStructure(structHandle: RFC_STRUCTURE_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcCreateTable(typeDescHandle: RFC_TYPE_DESC_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_TABLE_HANDLE;
pub extern fn RfcCloneTable(srcTableHandle: RFC_TABLE_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_TABLE_HANDLE;
pub extern fn RfcDestroyTable(tableHandle: RFC_TABLE_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetCurrentRow(tableHandle: RFC_TABLE_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_STRUCTURE_HANDLE;
pub extern fn RfcAppendNewRow(tableHandle: RFC_TABLE_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_STRUCTURE_HANDLE;
pub extern fn RfcReserveCapacity(tableHandle: RFC_TABLE_HANDLE, numRows: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcAppendNewRows(tableHandle: RFC_TABLE_HANDLE, numRows: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcInsertNewRow(tableHandle: RFC_TABLE_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_STRUCTURE_HANDLE;
pub extern fn RfcAppendRow(tableHandle: RFC_TABLE_HANDLE, structHandle: RFC_STRUCTURE_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcInsertRow(tableHandle: RFC_TABLE_HANDLE, structHandle: RFC_STRUCTURE_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcDeleteCurrentRow(tableHandle: RFC_TABLE_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcDeleteAllRows(tableHandle: RFC_TABLE_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcMoveToFirstRow(tableHandle: RFC_TABLE_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcMoveToLastRow(tableHandle: RFC_TABLE_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcMoveToNextRow(tableHandle: RFC_TABLE_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcMoveToPreviousRow(tableHandle: RFC_TABLE_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcMoveTo(tableHandle: RFC_TABLE_HANDLE, index: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetRowCount(tableHandle: RFC_TABLE_HANDLE, rowCount: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetRowType(tableHandle: RFC_TABLE_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_TYPE_DESC_HANDLE;
pub extern fn RfcCreateAbapObject(classDescHandle: RFC_CLASS_DESC_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_ABAP_OBJECT_HANDLE;
pub extern fn RfcDestroyAbapObject(objHandle: RFC_ABAP_OBJECT_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetChars(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, charBuffer: [*c]RFC_CHAR, bufferLength: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetCharsByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, charBuffer: [*c]RFC_CHAR, bufferLength: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetNum(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, charBuffer: [*c]RFC_NUM, bufferLength: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetNumByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, charBuffer: [*c]RFC_NUM, bufferLength: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetDate(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, emptyDate: [*c]RFC_CHAR, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetDateByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, emptyDate: [*c]RFC_CHAR, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetTime(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, emptyTime: [*c]RFC_CHAR, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetTimeByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, emptyTime: [*c]RFC_CHAR, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetString(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, stringBuffer: [*c]SAP_UC, bufferLength: c_uint, stringLength: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetStringByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, stringBuffer: [*c]SAP_UC, bufferLength: c_uint, stringLength: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetBytes(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, byteBuffer: [*c]SAP_RAW, bufferLength: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetBytesByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, byteBuffer: [*c]SAP_RAW, bufferLength: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetXString(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, byteBuffer: [*c]SAP_RAW, bufferLength: c_uint, xstringLength: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetXStringByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, byteBuffer: [*c]SAP_RAW, bufferLength: c_uint, xstringLength: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetInt(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, value: [*c]RFC_INT, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetIntByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, value: [*c]RFC_INT, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetInt1(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, value: [*c]RFC_INT1, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetInt1ByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, value: [*c]RFC_INT1, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetInt2(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, value: [*c]RFC_INT2, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetInt2ByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, value: [*c]RFC_INT2, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetInt8(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, value: [*c]RFC_INT8, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetInt8ByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, value: [*c]RFC_INT8, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetFloat(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, value: [*c]RFC_FLOAT, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetFloatByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, value: [*c]RFC_FLOAT, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetDecF16(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, value: [*c]RFC_DECF16, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetDecF16ByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, value: [*c]RFC_DECF16, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetDecF34(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, value: [*c]RFC_DECF34, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetDecF34ByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, value: [*c]RFC_DECF34, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetStructure(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, structHandle: [*c]RFC_STRUCTURE_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetStructureByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, structHandle: [*c]RFC_STRUCTURE_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetStructureIntoCharBuffer(dataHandle: DATA_CONTAINER_HANDLE, charBuffer: [*c]SAP_UC, bufferLength: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetTable(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, tableHandle: [*c]RFC_TABLE_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetTableByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, tableHandle: [*c]RFC_TABLE_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetAbapObject(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, objHandle: [*c]RFC_ABAP_OBJECT_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetAbapObjectByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, objHandle: [*c]RFC_ABAP_OBJECT_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetStringLength(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, stringLength: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetStringLengthByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, stringLength: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetChars(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, charValue: [*c]const RFC_CHAR, valueLength: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetCharsByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, charValue: [*c]const RFC_CHAR, valueLength: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetNum(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, charValue: [*c]const RFC_NUM, valueLength: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetNumByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, charValue: [*c]const RFC_NUM, valueLength: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetString(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, stringValue: [*c]const SAP_UC, valueLength: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetStringByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, stringValue: [*c]const SAP_UC, valueLength: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetDate(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, date: [*c]const RFC_CHAR, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetDateByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, date: [*c]const RFC_CHAR, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetTime(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, time: [*c]const RFC_CHAR, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetTimeByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, time: [*c]const RFC_CHAR, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetBytes(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, byteValue: [*c]const SAP_RAW, valueLength: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetBytesByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, byteValue: [*c]const SAP_RAW, valueLength: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetXString(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, byteValue: [*c]const SAP_RAW, valueLength: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetXStringByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, byteValue: [*c]const SAP_RAW, valueLength: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetInt(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, value: RFC_INT, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetIntByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, value: RFC_INT, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetInt1(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, value: RFC_INT1, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetInt1ByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, value: RFC_INT1, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetInt2(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, value: RFC_INT2, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetInt2ByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, value: RFC_INT2, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetInt8(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, value: RFC_INT8, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetInt8ByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, value: RFC_INT8, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetFloat(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, value: RFC_FLOAT, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetFloatByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, value: RFC_FLOAT, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetDecF16(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, value: RFC_DECF16, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetDecF16ByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, value: RFC_DECF16, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetDecF34(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, value: RFC_DECF34, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetDecF34ByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, value: RFC_DECF34, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetStructure(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, value: RFC_STRUCTURE_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetStructureByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, value: RFC_STRUCTURE_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetStructureFromCharBuffer(dataHandle: DATA_CONTAINER_HANDLE, charBuffer: [*c]SAP_UC, bufferLength: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetTable(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, value: RFC_TABLE_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetTableByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, value: RFC_TABLE_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetAbapObject(dataHandle: DATA_CONTAINER_HANDLE, name: [*c]const SAP_UC, value: RFC_ABAP_OBJECT_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetAbapObjectByIndex(dataHandle: DATA_CONTAINER_HANDLE, index: c_uint, value: RFC_ABAP_OBJECT_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetAbapClassException(funcHandle: RFC_FUNCTION_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_ABAP_OBJECT_HANDLE;
pub extern fn RfcSetAbapClassException(funcHandle: RFC_FUNCTION_HANDLE, excpHandle: RFC_ABAP_OBJECT_HANDLE, exceptionText: [*c]const SAP_UC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcDescribeFunction(funcHandle: RFC_FUNCTION_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_FUNCTION_DESC_HANDLE;
pub extern fn RfcDescribeType(dataHandle: DATA_CONTAINER_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_TYPE_DESC_HANDLE;
pub extern fn RfcGetFunctionDesc(rfcHandle: RFC_CONNECTION_HANDLE, funcName: [*c]const SAP_UC, errorInfo: [*c]RFC_ERROR_INFO) RFC_FUNCTION_DESC_HANDLE;
pub extern fn RfcGetCachedFunctionDesc(repositoryID: [*c]const SAP_UC, funcName: [*c]const SAP_UC, errorInfo: [*c]RFC_ERROR_INFO) RFC_FUNCTION_DESC_HANDLE;
pub extern fn RfcAddFunctionDesc(repositoryID: [*c]const SAP_UC, funcDesc: RFC_FUNCTION_DESC_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcRemoveFunctionDesc(repositoryID: [*c]const SAP_UC, functionName: [*c]const SAP_UC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetTypeDesc(rfcHandle: RFC_CONNECTION_HANDLE, typeName: [*c]const SAP_UC, errorInfo: [*c]RFC_ERROR_INFO) RFC_TYPE_DESC_HANDLE;
pub extern fn RfcGetCachedTypeDesc(repositoryID: [*c]const SAP_UC, typeName: [*c]const SAP_UC, errorInfo: [*c]RFC_ERROR_INFO) RFC_TYPE_DESC_HANDLE;
pub extern fn RfcAddTypeDesc(repositoryID: [*c]const SAP_UC, typeHandle: RFC_TYPE_DESC_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcRemoveTypeDesc(repositoryID: [*c]const SAP_UC, typeName: [*c]const SAP_UC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetClassDesc(rfcHandle: RFC_CONNECTION_HANDLE, className: [*c]const SAP_UC, errorInfo: [*c]RFC_ERROR_INFO) RFC_CLASS_DESC_HANDLE;
pub extern fn RfcGetCachedClassDesc(repositoryID: [*c]const SAP_UC, className: [*c]const SAP_UC, errorInfo: [*c]RFC_ERROR_INFO) RFC_CLASS_DESC_HANDLE;
pub extern fn RfcDescribeAbapObject(objectHandle: RFC_ABAP_OBJECT_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_CLASS_DESC_HANDLE;
pub extern fn RfcAddClassDesc(repositoryID: [*c]const SAP_UC, classDesc: RFC_CLASS_DESC_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcRemoveClassDesc(repositoryID: [*c]const SAP_UC, className: [*c]const SAP_UC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcClearRepository(repositoryID: [*c]const SAP_UC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSaveRepository(repositoryID: [*c]const SAP_UC, targetStream: [*c]FILE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcLoadRepository(repositoryID: [*c]const SAP_UC, targetStream: [*c]FILE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcCreateTypeDesc(name: [*c]const SAP_UC, errorInfo: [*c]RFC_ERROR_INFO) RFC_TYPE_DESC_HANDLE;
pub extern fn RfcAddTypeField(typeHandle: RFC_TYPE_DESC_HANDLE, fieldDescr: [*c]const RFC_FIELD_DESC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetTypeLength(typeHandle: RFC_TYPE_DESC_HANDLE, nucByteLength: c_uint, ucByteLength: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetTypeName(typeHandle: RFC_TYPE_DESC_HANDLE, bufferForName: [*c]RFC_CHAR, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetFieldCount(typeHandle: RFC_TYPE_DESC_HANDLE, count: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetFieldDescByIndex(typeHandle: RFC_TYPE_DESC_HANDLE, index: c_uint, fieldDescr: [*c]RFC_FIELD_DESC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetFieldDescByName(typeHandle: RFC_TYPE_DESC_HANDLE, name: [*c]const SAP_UC, fieldDescr: [*c]RFC_FIELD_DESC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetTypeLength(typeHandle: RFC_TYPE_DESC_HANDLE, nucByteLength: [*c]c_uint, ucByteLength: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcDestroyTypeDesc(typeHandle: RFC_TYPE_DESC_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcCreateFunctionDesc(name: [*c]const SAP_UC, errorInfo: [*c]RFC_ERROR_INFO) RFC_FUNCTION_DESC_HANDLE;
pub extern fn RfcGetFunctionName(funcDesc: RFC_FUNCTION_DESC_HANDLE, bufferForName: [*c]RFC_CHAR, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcAddParameter(funcDesc: RFC_FUNCTION_DESC_HANDLE, paramDescr: [*c]const RFC_PARAMETER_DESC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetParameterCount(funcDesc: RFC_FUNCTION_DESC_HANDLE, count: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetParameterDescByIndex(funcDesc: RFC_FUNCTION_DESC_HANDLE, index: c_uint, paramDesc: [*c]RFC_PARAMETER_DESC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetParameterDescByName(funcDesc: RFC_FUNCTION_DESC_HANDLE, name: [*c]const SAP_UC, paramDesc: [*c]RFC_PARAMETER_DESC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcAddException(funcDesc: RFC_FUNCTION_DESC_HANDLE, excDesc: [*c]const RFC_EXCEPTION_DESC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetExceptionCount(funcDesc: RFC_FUNCTION_DESC_HANDLE, count: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetExceptionDescByIndex(funcDesc: RFC_FUNCTION_DESC_HANDLE, index: c_uint, excDesc: [*c]RFC_EXCEPTION_DESC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetExceptionDescByName(funcDesc: RFC_FUNCTION_DESC_HANDLE, name: [*c]const SAP_UC, excDesc: [*c]RFC_EXCEPTION_DESC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcEnableBASXML(funcDesc: RFC_FUNCTION_DESC_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcIsBASXMLSupported(funcDesc: RFC_FUNCTION_DESC_HANDLE, isEnabled: [*c]c_int, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcDestroyFunctionDesc(funcDesc: RFC_FUNCTION_DESC_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcEnableAbapClassException(funcHandle: RFC_FUNCTION_HANDLE, rfcHandleRepository: RFC_CONNECTION_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcIsAbapClassExceptionEnabled(funcHandle: RFC_FUNCTION_HANDLE, isEnabled: [*c]c_int, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcCreateClassDesc(name: [*c]const SAP_UC, errorInfo: [*c]RFC_ERROR_INFO) RFC_CLASS_DESC_HANDLE;
pub extern fn RfcGetClassName(classDesc: RFC_CLASS_DESC_HANDLE, bufferForName: [*c]RFC_CHAR, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcAddClassAttribute(classDesc: RFC_CLASS_DESC_HANDLE, attrDesc: [*c]const RFC_CLASS_ATTRIBUTE_DESC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetClassAttributesCount(classDesc: RFC_CLASS_DESC_HANDLE, count: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetClassAttributeDescByIndex(classDesc: RFC_CLASS_DESC_HANDLE, index: c_uint, attrDesc: [*c]RFC_CLASS_ATTRIBUTE_DESC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetClassAttributeDescByName(classDesc: RFC_CLASS_DESC_HANDLE, name: [*c]const SAP_UC, attrDesc: [*c]RFC_CLASS_ATTRIBUTE_DESC, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetParentClassByIndex(classDesc: RFC_CLASS_DESC_HANDLE, name: [*c]RFC_CHAR, index: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetParentClassesCount(classDesc: RFC_CLASS_DESC_HANDLE, parentClassesCount: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcAddParentClass(classDesc: RFC_CLASS_DESC_HANDLE, name: [*c]const RFC_CHAR, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetImplementedInterfaceByIndex(classDesc: RFC_CLASS_DESC_HANDLE, index: c_uint, name: [*c]RFC_CHAR, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetImplementedInterfacesCount(classDesc: RFC_CLASS_DESC_HANDLE, implementedInterfacesCount: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcAddImplementedInterface(classDesc: RFC_CLASS_DESC_HANDLE, name: [*c]const RFC_CHAR, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcDestroyClassDesc(classHandle: RFC_CLASS_DESC_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub const RFC_METADATA_QUERY_RESULT_HANDLE = ?*anyopaque;
pub const struct__RFC_METADATA_QUERY_RESULT_ENTRY = extern struct {
    name: RFC_ABAP_NAME = @import("std").mem.zeroes(RFC_ABAP_NAME),
    errorMessage: [512]SAP_UC = @import("std").mem.zeroes([512]SAP_UC),
};
pub const RFC_METADATA_QUERY_RESULT_ENTRY = struct__RFC_METADATA_QUERY_RESULT_ENTRY;
pub const RFC_METADATA_FUNCTION: c_int = 0;
pub const RFC_METADATA_TYPE: c_int = 1;
pub const RFC_METADATA_CLASS: c_int = 2;
pub const enum__RFC_METADATA_OBJ_TYPE = c_uint;
pub const RFC_METADATA_OBJ_TYPE = enum__RFC_METADATA_OBJ_TYPE;
pub extern fn RfcCreateMetadataQueryResult(errorInfo: [*c]RFC_ERROR_INFO) RFC_METADATA_QUERY_RESULT_HANDLE;
pub extern fn RfcDestroyMetadataQueryResult(handle: RFC_METADATA_QUERY_RESULT_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcDescribeMetadataQueryResult(handle: RFC_METADATA_QUERY_RESULT_HANDLE, @"type": RFC_METADATA_OBJ_TYPE, successful: [*c]c_uint, failed: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetMetadataQueryFailedEntry(handle: RFC_METADATA_QUERY_RESULT_HANDLE, @"type": RFC_METADATA_OBJ_TYPE, index: c_uint, entry: [*c]RFC_METADATA_QUERY_RESULT_ENTRY, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetMetadataQuerySucceededEntry(handle: RFC_METADATA_QUERY_RESULT_HANDLE, @"type": RFC_METADATA_OBJ_TYPE, index: c_uint, succeedObj: [*c]RFC_CHAR, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcMetadataBatchQuery(rfcHandle: RFC_CONNECTION_HANDLE, functionNames: [*c][*c]const SAP_UC, functionCount: c_uint, typeNames: [*c][*c]const SAP_UC, typeCount: c_uint, classNames: [*c][*c]const SAP_UC, classCount: c_uint, handle: RFC_METADATA_QUERY_RESULT_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcCreateThroughput(errorInfo: [*c]RFC_ERROR_INFO) RFC_THROUGHPUT_HANDLE;
pub extern fn RfcDestroyThroughput(throughput: RFC_THROUGHPUT_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetThroughputOnConnection(rfcHandle: RFC_CONNECTION_HANDLE, throughput: RFC_THROUGHPUT_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetThroughputFromConnection(rfcHandle: RFC_CONNECTION_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_THROUGHPUT_HANDLE;
pub extern fn RfcRemoveThroughputFromConnection(rfcHandle: RFC_CONNECTION_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetThroughputOnServer(serverHandle: RFC_SERVER_HANDLE, throughput: RFC_THROUGHPUT_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetThroughputFromServer(serverHandle: RFC_SERVER_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_THROUGHPUT_HANDLE;
pub extern fn RfcRemoveThroughputFromServer(serverHandle: RFC_SERVER_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcResetThroughput(throughput: RFC_THROUGHPUT_HANDLE, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetNumberOfCalls(throughput: RFC_THROUGHPUT_HANDLE, numberOfCalls: [*c]SAP_ULLONG, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetTotalTime(throughput: RFC_THROUGHPUT_HANDLE, totalTime: [*c]SAP_ULLONG, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetSerializationTime(throughput: RFC_THROUGHPUT_HANDLE, serializationTime: [*c]SAP_ULLONG, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetDeserializationTime(throughput: RFC_THROUGHPUT_HANDLE, deserializationTime: [*c]SAP_ULLONG, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetApplicationTime(throughput: RFC_THROUGHPUT_HANDLE, applicationTime: [*c]SAP_ULLONG, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetServerTime(throughput: RFC_THROUGHPUT_HANDLE, serverTime: [*c]SAP_ULLONG, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetNetworkWritingTime(throughput: RFC_THROUGHPUT_HANDLE, writingTime: [*c]SAP_ULLONG, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetNetworkReadingTime(throughput: RFC_THROUGHPUT_HANDLE, readingTime: [*c]SAP_ULLONG, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetSentBytes(throughput: RFC_THROUGHPUT_HANDLE, sentBytes: [*c]SAP_ULLONG, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetReceivedBytes(throughput: RFC_THROUGHPUT_HANDLE, receivedBytes: [*c]SAP_ULLONG, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetMessageServerResponseTimeout(timeout: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetMaximumCpicConversations(maxCpicConversations: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcGetMaximumCpicConversations(maxCpicConversations: [*c]c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub extern fn RfcSetGlobalLogonTimeout(logonTimeout: c_uint, errorInfo: [*c]RFC_ERROR_INFO) RFC_RC;
pub const DECF_NOT_SUPPORTED: c_int = -2;
pub const DECF_WRONG_VERSION: c_int = -1;
pub const DECF_OK: c_int = 0;
pub const DECF_INEXACT: c_int = 1;
pub const DECF_UNDERFLOW: c_int = 2;
pub const DECF_OVERFLOW: c_int = 3;
pub const DECF_CONV_SYNTAX: c_int = 4;
pub const DECF_DIV_ZERO: c_int = 5;
pub const DECF_INVALID_OP: c_int = 6;
pub const DECF_NO_MEMORY: c_int = 7;
pub const DECF_RETURN = c_int;
pub const DECF_ROUND_CEILING: c_int = 0;
pub const DECF_ROUND_UP: c_int = 1;
pub const DECF_ROUND_HALF_UP: c_int = 2;
pub const DECF_ROUND_HALF_EVEN: c_int = 3;
pub const DECF_ROUND_HALF_DOWN: c_int = 4;
pub const DECF_ROUND_DOWN: c_int = 5;
pub const DECF_ROUND_FLOOR: c_int = 6;
pub const DECF_ROUND_MAX: c_int = 7;
pub const DecFRounding = c_uint;
pub const DecFloat16NegInf: DecFloat16 = DecFloat16{
    .bytes = [8]SAP_RAW{
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        248,
    },
};
pub const DecFloat34NegInf: DecFloat34 = DecFloat34{
    .bytes = [16]SAP_RAW{
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        248,
    },
};
pub const DecFloat16ZeroVal: DecFloat16 = DecFloat16{
    .bytes = [8]SAP_RAW{
        0,
        0,
        0,
        0,
        0,
        0,
        56,
        34,
    },
};
pub const DecFloat34ZeroVal: DecFloat34 = DecFloat34{
    .bytes = [16]SAP_RAW{
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        8,
        34,
    },
};
pub const DecFloat16_NoOfDigits: c_int = 16;
pub const DecFloat34_NoOfDigits: c_int = 34;
pub extern fn decf_mutex_lock() void;
pub extern fn decf_mutex_unlock() void;
pub const DECF_DBmode_initial: c_int = 0;
pub const DECF_DBmode_roundForDEC: c_int = 1;
pub const DECF_DBmode_native: c_int = 2;
pub const DecFloatDBmode = c_uint;
pub extern fn DecFloat_InitializeDBmode(decfDBmode: DecFloatDBmode) void;
pub extern fn InitDecFloatLib() DECF_RETURN;
pub extern fn DecFloat16ToString(dfp16: DecFloat16, numstr: [*c]DecFloat16Buff) DECF_RETURN;
pub extern fn DecFloat34ToString(dfp34: DecFloat34, numstr: [*c]DecFloat34Buff) DECF_RETURN;
pub extern fn StringToDecFloat16(numstr: [*c]const SAP_UC, dfp16: [*c]DecFloat16) DECF_RETURN;
pub extern fn StringToDecFloat34(numstr: [*c]const SAP_UC, dfp34: [*c]DecFloat34) DECF_RETURN;
pub extern fn DecFloat16ToDecFloat34(dfp34_res: [*c]DecFloat34, dfp16: DecFloat16) DECF_RETURN;
pub extern fn DecFloat34ToDecFloat16(dfp16_res: [*c]DecFloat16, dfp34: DecFloat34) DECF_RETURN;
pub extern fn DecFloat16ToDecFloat16Raw(dfp16raw_res: [*c]DecFloat16Raw, scale: [*c]SAP_SHORT, dfp16: DecFloat16) DECF_RETURN;
pub extern fn DecFloat16RawToDecFloat16(dfp16_res: [*c]DecFloat16, dfp16raw: [*c]SAP_RAW, scale: SAP_SHORT) DECF_RETURN;
pub extern fn DecFloat34ToDecFloat34Raw(dfp34raw_res: [*c]DecFloat34Raw, scale: [*c]SAP_SHORT, dfp34: DecFloat34) DECF_RETURN;
pub extern fn DecFloat34RawToDecFloat34(dfp34_res: [*c]DecFloat34, dfp34raw: [*c]SAP_RAW, scale: SAP_SHORT) DECF_RETURN;
pub extern fn DecFloat16ToDecFloat16RawDB(dfp16raw_res: [*c]DecFloat16Raw, scale: [*c]SAP_SHORT, dfp16: DecFloat16) DECF_RETURN;
pub extern fn DecFloat16RawToDecFloat16DB(dfp16_res: [*c]DecFloat16, dfp16raw: [*c]SAP_RAW, scale: SAP_SHORT) DECF_RETURN;
pub extern fn DecFloat34ToDecFloat34RawDB(dfp34raw_res: [*c]DecFloat34Raw, scale: [*c]SAP_SHORT, dfp34: DecFloat34) DECF_RETURN;
pub extern fn DecFloat34RawToDecFloat34DB(dfp34_res: [*c]DecFloat34, dfp34raw: [*c]SAP_RAW, scale: SAP_SHORT) DECF_RETURN;
pub extern fn NormDecFloat16ToDecFloat16Raw(dfp16raw_res: [*c]DecFloat16Raw, dfp16: DecFloat16) DECF_RETURN;
pub extern fn DecFloat16RawToNormDecFloat16(dfp16_res: [*c]DecFloat16, dfp16raw: [*c]SAP_RAW) DECF_RETURN;
pub extern fn NormDecFloat34ToDecFloat34Raw(dfp34raw_res: [*c]DecFloat34Raw, dfp34: DecFloat34) DECF_RETURN;
pub extern fn DecFloat34RawToNormDecFloat34(dfp34_res: [*c]DecFloat34, dfp34raw: [*c]SAP_RAW) DECF_RETURN;
pub extern fn DecFloat16ToSAP_INT(i: [*c]SAP_INT, dfp16: DecFloat16) DECF_RETURN;
pub extern fn DecFloat16ToSAP_LLONG(l: [*c]SAP_LLONG, dfp16: DecFloat16) DECF_RETURN;
pub extern fn SAP_INTToDecFloat16(dfp16_res: [*c]DecFloat16, i: SAP_INT) DECF_RETURN;
pub extern fn SAP_LLONGToDecFloat16(dfp16_res: [*c]DecFloat16, l: SAP_LLONG) DECF_RETURN;
pub extern fn DecFloat34ToSAP_INT(i: [*c]SAP_INT, dfp34: DecFloat34) DECF_RETURN;
pub extern fn DecFloat34ToSAP_LLONG(l: [*c]SAP_LLONG, dfp34: DecFloat34) DECF_RETURN;
pub extern fn SAP_INTToDecFloat34(dfp34_res: [*c]DecFloat34, i: SAP_INT) DECF_RETURN;
pub extern fn SAP_LLONGToDecFloat34(dfp34_res: [*c]DecFloat34, l: SAP_LLONG) DECF_RETURN;
pub extern fn DecFloat16ToSAP_DOUBLE(d: [*c]SAP_DOUBLE, dfp16: DecFloat16) DECF_RETURN;
pub extern fn DecFloat34ToSAP_DOUBLE(d: [*c]SAP_DOUBLE, dfp34: DecFloat34) DECF_RETURN;
pub extern fn SAP_DOUBLEToDecFloat16(dfp16_res: [*c]DecFloat16, i: SAP_DOUBLE) DECF_RETURN;
pub extern fn SAP_DOUBLEToDecFloat34(dfp34_res: [*c]DecFloat34, i: SAP_DOUBLE) DECF_RETURN;
pub extern fn DecFloat16ToBCD(bcd_res: [*c]SAP_RAW, dfp16: DecFloat16, length: intR, decPlaces: intR) DECF_RETURN;
pub extern fn DecFloat16RoundForDEC(dfp16: [*c]DecFloat16, length: intR, decPlaces: intR) DECF_RETURN;
pub extern fn DecFloat16RoundForDECToPrecision(dfp16: [*c]DecFloat16, precision: intR, decPlaces: intR) DECF_RETURN;
pub extern fn DecFloat16CompareForDEC(unroundedDf: DecFloat16, dbValue: DecFloat16, decPlaces: intR, p_rc: [*c]DECF_RETURN) SAP_INT;
pub extern fn BCDToDecFloat16(dfp16_res: [*c]DecFloat16, bcd: [*c]SAP_RAW, length: intR, decPlaces: intR) DECF_RETURN;
pub extern fn DecFloat34ToBCD(bcd_res: [*c]SAP_RAW, dfp34: DecFloat34, length: intR, decPlaces: intR) DECF_RETURN;
pub extern fn DecFloat34RoundForDEC(dfp34: [*c]DecFloat34, length: intR, decPlaces: intR) DECF_RETURN;
pub extern fn DecFloat34RoundForDECToPrecision(dfp34: [*c]DecFloat34, precision: intR, decPlaces: intR) DECF_RETURN;
pub extern fn DecFloat34CompareForDEC(unroundedDf: DecFloat34, dbValue: DecFloat34, decPlaces: intR, p_rc: [*c]DECF_RETURN) SAP_INT;
pub extern fn BCDToDecFloat34(dfp34_res: [*c]DecFloat34, bcd: [*c]SAP_RAW, length: intR, decPlaces: intR) DECF_RETURN;
pub extern fn DecFloat16_Add(dfp16_res: [*c]DecFloat16, dfp16_lhs: DecFloat16, dfp16_rhs: DecFloat16) DECF_RETURN;
pub extern fn DecFloat34_Add(dfp34_res: [*c]DecFloat34, dfp34_lhs: DecFloat34, dfp34_rhs: DecFloat34) DECF_RETURN;
pub extern fn DecFloat16_Sub(dfp16_res: [*c]DecFloat16, dfp16_lhs: DecFloat16, dfp16_rhs: DecFloat16) DECF_RETURN;
pub extern fn DecFloat34_Sub(dfp34_res: [*c]DecFloat34, dfp34_lhs: DecFloat34, dfp34_rhs: DecFloat34) DECF_RETURN;
pub extern fn DecFloat16_Mult(dfp16_res: [*c]DecFloat16, dfp16_lhs: DecFloat16, dfp16_rhs: DecFloat16) DECF_RETURN;
pub extern fn DecFloat34_Mult(dfp34_res: [*c]DecFloat34, dfp34_lhs: DecFloat34, dfp34_rhs: DecFloat34) DECF_RETURN;
pub extern fn DecFloat16_Div(dfp16_res: [*c]DecFloat16, dfp16_lhs: DecFloat16, dfp16_rhs: DecFloat16) DECF_RETURN;
pub extern fn DecFloat34_Div(dfp34_res: [*c]DecFloat34, dfp34_lhs: DecFloat34, dfp34_rhs: DecFloat34) DECF_RETURN;
pub extern fn DecFloat16_DIV(dfp16_res: [*c]DecFloat16, dfp16_lhs: DecFloat16, dfp16_rhs: DecFloat16) DECF_RETURN;
pub extern fn DecFloat34_DIV(dfp34_res: [*c]DecFloat34, dfp34_lhs: DecFloat34, dfp34_rhs: DecFloat34) DECF_RETURN;
pub extern fn DecFloat16_MOD(dfp16_res: [*c]DecFloat16, dfp16_lhs: DecFloat16, dfp16_rhs: DecFloat16) DECF_RETURN;
pub extern fn DecFloat34_MOD(dfp34_res: [*c]DecFloat34, dfp34_lhs: DecFloat34, dfp34_rhs: DecFloat34) DECF_RETURN;
pub extern fn DecFloat16_EQ(dfp16_lhs: DecFloat16, dfp16_rhs: DecFloat16, prc: [*c]DECF_RETURN) SAP_BOOL;
pub extern fn DecFloat34_EQ(dfp34_lhs: DecFloat34, dfp34_rhs: DecFloat34, prc: [*c]DECF_RETURN) SAP_BOOL;
pub extern fn DecFloat16_GT(dfp16_lhs: DecFloat16, dfp16_rhs: DecFloat16, prc: [*c]DECF_RETURN) SAP_BOOL;
pub extern fn DecFloat34_GT(dfp34_lhs: DecFloat34, dfp34_rhs: DecFloat34, prc: [*c]DECF_RETURN) SAP_BOOL;
pub extern fn DecFloat16_LT(dfp16_lhs: DecFloat16, dfp16_rhs: DecFloat16, prc: [*c]DECF_RETURN) SAP_BOOL;
pub extern fn DecFloat34_LT(dfp34_lhs: DecFloat34, dfp34_rhs: DecFloat34, prc: [*c]DECF_RETURN) SAP_BOOL;
pub extern fn DecFloat16Compare(dfp16_lhs: DecFloat16, dfp16_rhs: DecFloat16, p_rc: [*c]DECF_RETURN) SAP_INT;
pub extern fn DecFloat34Compare(dfp34_lhs: DecFloat34, dfp34_rhs: DecFloat34, p_rc: [*c]DECF_RETURN) SAP_INT;
pub extern fn DecFloat16RoundDec(dfp16: [*c]DecFloat16, dec: SAP_INT, decFRound: DecFRounding) DECF_RETURN;
pub extern fn DecFloat16RoundPrec(dfp16: [*c]DecFloat16, prec: SAP_INT, decFRound: DecFRounding) DECF_RETURN;
pub extern fn DecFloat34RoundDec(dfp34: [*c]DecFloat34, dec: SAP_INT, decFRound: DecFRounding) DECF_RETURN;
pub extern fn DecFloat34RoundPrec(dfp34: [*c]DecFloat34, prec: SAP_INT, decFRound: DecFRounding) DECF_RETURN;
pub extern fn DecFloat16RescaleDec(dfp16: [*c]DecFloat16, dec: SAP_INT, decFRound: DecFRounding) DECF_RETURN;
pub extern fn DecFloat16RescalePrec(dfp16: [*c]DecFloat16, prec: SAP_INT, decFRound: DecFRounding) DECF_RETURN;
pub extern fn DecFloat34RescaleDec(dfp34: [*c]DecFloat34, dec: SAP_INT, decFRound: DecFRounding) DECF_RETURN;
pub extern fn DecFloat34RescalePrec(dfp34: [*c]DecFloat34, prec: SAP_INT, decFRound: DecFRounding) DECF_RETURN;
pub extern fn DecFloat16IsInfinite(dfp16: DecFloat16) SAP_BOOL;
pub extern fn DecFloat34IsInfinite(dfp34: DecFloat34) SAP_BOOL;
pub extern fn DecFloat16IsFinite(dfp16: DecFloat16) SAP_BOOL;
pub extern fn DecFloat34IsFinite(dfp34: DecFloat34) SAP_BOOL;
pub extern fn DecFloat16IsNaN(dfp16: DecFloat16) SAP_BOOL;
pub extern fn DecFloat34IsNaN(dfp34: DecFloat34) SAP_BOOL;
pub extern fn DecFloat16Zero(dfp16: [*c]DecFloat16) [*c]DecFloat16;
pub extern fn DecFloat34Zero(dfp34: [*c]DecFloat34) [*c]DecFloat34;
pub extern fn DecFloat16Ceil(dfp16: DecFloat16, p_rc: [*c]DECF_RETURN) DecFloat16;
pub extern fn DecFloat34Ceil(dfp34: DecFloat34, p_rc: [*c]DECF_RETURN) DecFloat34;
pub extern fn DecFloat16Floor(dfp16: DecFloat16, p_rc: [*c]DECF_RETURN) DecFloat16;
pub extern fn DecFloat34Floor(dfp34: DecFloat34, p_rc: [*c]DECF_RETURN) DecFloat34;
pub extern fn GetMinDecFloat16() DecFloat16;
pub extern fn GetMinDecFloat34() DecFloat34;
pub extern fn DecFloat16GetExponent(exponent: [*c]SAP_INT, dfp16: DecFloat16) DECF_RETURN;
pub extern fn DecFloat34GetExponent(exponent: [*c]SAP_INT, dfp34: DecFloat34) DECF_RETURN;
pub extern fn DecFloat16GetNumOfDigits(digits: [*c]SAP_INT, dfp16: DecFloat16) DECF_RETURN;
pub extern fn DecFloat34GetNumOfDigits(digits: [*c]SAP_INT, dfp34: DecFloat34) DECF_RETURN;
pub extern fn DecFloat16ToDecFloat16Neutral(dfp16_neutral: [*c]DecFloat16, dfp16: DecFloat16) DECF_RETURN;
pub extern fn DecFloat16NeutralToDecFloat16(dfp16: [*c]DecFloat16, dfp16_neutral: DecFloat16) DECF_RETURN;
pub extern fn DecFloat34ToDecFloat34Neutral(dfp34_neutral: [*c]DecFloat34, dfp34: DecFloat34) DECF_RETURN;
pub extern fn DecFloat34NeutralToDecFloat34(dfp34: [*c]DecFloat34, dfp34_neutral: DecFloat34) DECF_RETURN;
pub extern fn DecFloat16Normalize(dfp16: [*c]DecFloat16) DECF_RETURN;
pub extern fn DecFloat34Normalize(dfp34: [*c]DecFloat34) DECF_RETURN;
pub extern fn DecFloat16ToNormDecFloat16(norm_dfp16: [*c]DecFloat16, dfp16: DecFloat16) DECF_RETURN;
pub extern fn DecFloat34ToNormDecFloat34(norm_dfp34: [*c]DecFloat34, dfp34: DecFloat34) DECF_RETURN;
pub extern fn DecFloat34_fPow(dfp34_res: [*c]DecFloat34, base: DecFloat34, exponent: DecFloat34) DECF_RETURN;
pub extern fn DecFloat16_Sqrt(dfp16_res: [*c]DecFloat16, dfp16: DecFloat16) DECF_RETURN;
pub extern fn DecFloat34_Sqrt(dfp34_res: [*c]DecFloat34, dfp34: DecFloat34) DECF_RETURN;
pub extern fn DecFloat16_Exp(dfp16_res: [*c]DecFloat16, dfp16: DecFloat16) DECF_RETURN;
pub extern fn DecFloat34_Exp(dfp34_res: [*c]DecFloat34, dfp34: DecFloat34) DECF_RETURN;
pub extern fn DecFloat16_Ln(dfp16_res: [*c]DecFloat16, dfp16: DecFloat16) DECF_RETURN;
pub extern fn DecFloat34_Ln(dfp34_res: [*c]DecFloat34, dfp16: DecFloat34) DECF_RETURN;
pub extern fn DecFloat16_Log10(dfp16_res: [*c]DecFloat16, dfp16: DecFloat16) DECF_RETURN;
pub extern fn DecFloat34_Log10(dfp34_res: [*c]DecFloat34, dfp16: DecFloat34) DECF_RETURN;
pub extern fn DecFloat16NextMinus(dfp16_res: [*c]DecFloat16, dfp16: DecFloat16) DECF_RETURN;
pub extern fn DecFloat16NextPlus(dfp16_res: [*c]DecFloat16, dfp16: DecFloat16) DECF_RETURN;
pub extern fn DecFloat34NextMinus(dfp34_res: [*c]DecFloat34, dfp34: DecFloat34) DECF_RETURN;
pub extern fn DecFloat34NextPlus(dfp34_res: [*c]DecFloat34, dfp34: DecFloat34) DECF_RETURN;
pub const Decfl34AllocateCallBack = ?*const fn (SAP_ULLONG) callconv(.c) ?*anyopaque;
pub extern fn DecFloat34StrDiv(divident: [*c]const SAP_UTF8, divisor: [*c]const SAP_UTF8, allocateFn: Decfl34AllocateCallBack, result: [*c]DecFloat34) DECF_RETURN;

pub const __VERSION__ = "Aro aro-zig";
pub const __Aro__ = "";
pub const __STDC__ = @as(c_int, 1);
pub const __STDC_HOSTED__ = @as(c_int, 1);
pub const __STDC_UTF_16__ = @as(c_int, 1);
pub const __STDC_UTF_32__ = @as(c_int, 1);
pub const __STDC_EMBED_NOT_FOUND__ = @as(c_int, 0);
pub const __STDC_EMBED_FOUND__ = @as(c_int, 1);
pub const __STDC_EMBED_EMPTY__ = @as(c_int, 2);
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __GNUC__ = @as(c_int, 7);
pub const __GNUC_MINOR__ = @as(c_int, 1);
pub const __GNUC_PATCHLEVEL__ = @as(c_int, 0);
pub const __ARO_EMULATE_CLANG__ = @as(c_int, 1);
pub const __ARO_EMULATE_GCC__ = @as(c_int, 2);
pub const __ARO_EMULATE_MSVC__ = @as(c_int, 3);
pub const __ARO_EMULATE__ = __ARO_EMULATE_GCC__;
pub inline fn __building_module(x: anytype) @TypeOf(@as(c_int, 0)) {
    _ = &x;
    return @as(c_int, 0);
}
pub const _WIN32 = @as(c_int, 1);
pub const _WIN64 = @as(c_int, 1);
pub const WIN32 = @as(c_int, 1);
pub const __WIN32 = @as(c_int, 1);
pub const __WIN32__ = @as(c_int, 1);
pub const WINNT = @as(c_int, 1);
pub const __WINNT = @as(c_int, 1);
pub const __WINNT__ = @as(c_int, 1);
pub const WIN64 = @as(c_int, 1);
pub const __WIN64 = @as(c_int, 1);
pub const __WIN64__ = @as(c_int, 1);
pub const __MINGW64__ = @as(c_int, 1);
pub const __MSVCRT__ = @as(c_int, 1);
pub const __MINGW32__ = @as(c_int, 1);
pub const __declspec = @compileError("unable to translate C expr: unexpected token '__attribute__'"); // <builtin>:33:9
pub const _cdecl = @compileError("unable to translate macro: undefined identifier `__cdecl__`"); // <builtin>:34:9
pub const __cdecl = @compileError("unable to translate macro: undefined identifier `__cdecl__`"); // <builtin>:35:9
pub const _stdcall = @compileError("unable to translate macro: undefined identifier `__stdcall__`"); // <builtin>:36:9
pub const __stdcall = @compileError("unable to translate macro: undefined identifier `__stdcall__`"); // <builtin>:37:9
pub const _fastcall = @compileError("unable to translate macro: undefined identifier `__fastcall__`"); // <builtin>:38:9
pub const __fastcall = @compileError("unable to translate macro: undefined identifier `__fastcall__`"); // <builtin>:39:9
pub const _thiscall = @compileError("unable to translate macro: undefined identifier `__thiscall__`"); // <builtin>:40:9
pub const __thiscall = @compileError("unable to translate macro: undefined identifier `__thiscall__`"); // <builtin>:41:9
pub const unix = @as(c_int, 1);
pub const __unix = @as(c_int, 1);
pub const __unix__ = @as(c_int, 1);
pub const __code_model_small__ = @as(c_int, 1);
pub const __amd64__ = @as(c_int, 1);
pub const __amd64 = @as(c_int, 1);
pub const __x86_64__ = @as(c_int, 1);
pub const __x86_64 = @as(c_int, 1);
pub const __SEG_GS = @as(c_int, 1);
pub const __SEG_FS = @as(c_int, 1);
pub const __seg_gs = @compileError("unable to translate macro: undefined identifier `address_space`"); // <builtin>:52:9
pub const __seg_fs = @compileError("unable to translate macro: undefined identifier `address_space`"); // <builtin>:53:9
pub const __LAHF_SAHF__ = @as(c_int, 1);
pub const __AES__ = @as(c_int, 1);
pub const __VAES__ = @as(c_int, 1);
pub const __PCLMUL__ = @as(c_int, 1);
pub const __VPCLMULQDQ__ = @as(c_int, 1);
pub const __LZCNT__ = @as(c_int, 1);
pub const __RDRND__ = @as(c_int, 1);
pub const __FSGSBASE__ = @as(c_int, 1);
pub const __BMI__ = @as(c_int, 1);
pub const __BMI2__ = @as(c_int, 1);
pub const __POPCNT__ = @as(c_int, 1);
pub const __PRFCHW__ = @as(c_int, 1);
pub const __RDSEED__ = @as(c_int, 1);
pub const __ADX__ = @as(c_int, 1);
pub const __MWAITX__ = @as(c_int, 1);
pub const __MOVBE__ = @as(c_int, 1);
pub const __SSE4A__ = @as(c_int, 1);
pub const __FMA__ = @as(c_int, 1);
pub const __F16C__ = @as(c_int, 1);
pub const __SHA__ = @as(c_int, 1);
pub const __FXSR__ = @as(c_int, 1);
pub const __XSAVE__ = @as(c_int, 1);
pub const __XSAVEOPT__ = @as(c_int, 1);
pub const __XSAVEC__ = @as(c_int, 1);
pub const __XSAVES__ = @as(c_int, 1);
pub const __CLFLUSHOPT__ = @as(c_int, 1);
pub const __CLWB__ = @as(c_int, 1);
pub const __WBNOINVD__ = @as(c_int, 1);
pub const __SHSTK__ = @as(c_int, 1);
pub const __CLZERO__ = @as(c_int, 1);
pub const __RDPID__ = @as(c_int, 1);
pub const __RDPRU__ = @as(c_int, 1);
pub const __INVPCID__ = @as(c_int, 1);
pub const __CRC32__ = @as(c_int, 1);
pub const __AVX2__ = @as(c_int, 1);
pub const __AVX__ = @as(c_int, 1);
pub const __SSE4_2__ = @as(c_int, 1);
pub const __SSE4_1__ = @as(c_int, 1);
pub const __SSSE3__ = @as(c_int, 1);
pub const __SSE3__ = @as(c_int, 1);
pub const __SSE2__ = @as(c_int, 1);
pub const __SSE__ = @as(c_int, 1);
pub const __SSE_MATH__ = @as(c_int, 1);
pub const __MMX__ = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
pub const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
pub const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
pub const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = @as(c_int, 1);
pub const __ATOMIC_RELAXED = @as(c_int, 0);
pub const __ATOMIC_CONSUME = @as(c_int, 1);
pub const __ATOMIC_ACQUIRE = @as(c_int, 2);
pub const __ATOMIC_RELEASE = @as(c_int, 3);
pub const __ATOMIC_ACQ_REL = @as(c_int, 4);
pub const __ATOMIC_SEQ_CST = @as(c_int, 5);
pub const __ATOMIC_BOOL_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_CHAR_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_SHORT_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_INT_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_LONG_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_LLONG_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_POINTER_LOCK_FREE = @as(c_int, 1);
pub const __CHAR_BIT__ = @as(c_int, 8);
pub const __BOOL_WIDTH__ = @as(c_int, 8);
pub const __SCHAR_MAX__ = @as(c_int, 127);
pub const __SCHAR_WIDTH__ = @as(c_int, 8);
pub const __SHRT_MAX__ = @as(c_int, 32767);
pub const __SHRT_WIDTH__ = @as(c_int, 16);
pub const __INT_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_WIDTH__ = @as(c_int, 32);
pub const __LONG_MAX__ = @as(c_long, 2147483647);
pub const __LONG_WIDTH__ = @as(c_int, 32);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __LONG_LONG_WIDTH__ = @as(c_int, 64);
pub const __WCHAR_MAX__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const __WCHAR_WIDTH__ = @as(c_int, 16);
pub const __INTMAX_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INTMAX_WIDTH__ = @as(c_int, 64);
pub const __SIZE_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __SIZE_WIDTH__ = @as(c_int, 64);
pub const __UINTMAX_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINTMAX_WIDTH__ = @as(c_int, 64);
pub const __PTRDIFF_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __PTRDIFF_WIDTH__ = @as(c_int, 64);
pub const __INTPTR_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INTPTR_WIDTH__ = @as(c_int, 64);
pub const __UINTPTR_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINTPTR_WIDTH__ = @as(c_int, 64);
pub const __SIG_ATOMIC_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
pub const __BITINT_MAXWIDTH__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const __SIZEOF_FLOAT__ = @as(c_int, 4);
pub const __SIZEOF_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 10);
pub const __SIZEOF_SHORT__ = @as(c_int, 2);
pub const __SIZEOF_INT__ = @as(c_int, 4);
pub const __SIZEOF_LONG__ = @as(c_int, 4);
pub const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
pub const __SIZEOF_POINTER__ = @as(c_int, 8);
pub const __SIZEOF_PTRDIFF_T__ = @as(c_int, 8);
pub const __SIZEOF_SIZE_T__ = @as(c_int, 8);
pub const __SIZEOF_WCHAR_T__ = @as(c_int, 2);
pub const __SIZEOF_INT128__ = @as(c_int, 16);
pub const __INTPTR_TYPE__ = c_longlong;
pub const __UINTPTR_TYPE__ = c_ulonglong;
pub const __INTMAX_TYPE__ = c_longlong;
pub const __INTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `LL`"); // <builtin>:165:9
pub const __UINTMAX_TYPE__ = c_ulonglong;
pub const __UINTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `ULL`"); // <builtin>:167:9
pub const __PTRDIFF_TYPE__ = c_longlong;
pub const __SIZE_TYPE__ = c_ulonglong;
pub const __WCHAR_TYPE__ = c_ushort;
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __INT8_TYPE__ = i8;
pub const __INT8_FMTd__ = "hhd";
pub const __INT8_FMTi__ = "hhi";
pub const __INT8_C_SUFFIX__ = "";
pub const __INT16_TYPE__ = c_short;
pub const __INT16_FMTd__ = "hd";
pub const __INT16_FMTi__ = "hi";
pub const __INT16_C_SUFFIX__ = "";
pub const __INT32_TYPE__ = c_int;
pub const __INT32_FMTd__ = "d";
pub const __INT32_FMTi__ = "i";
pub const __INT32_C_SUFFIX__ = "";
pub const __INT64_TYPE__ = c_longlong;
pub const __INT64_FMTd__ = "lld";
pub const __INT64_FMTi__ = "lli";
pub const __INT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `LL`"); // <builtin>:188:9
pub const __UINT8_TYPE__ = u8;
pub const __UINT8_FMTo__ = "hho";
pub const __UINT8_FMTu__ = "hhu";
pub const __UINT8_FMTx__ = "hhx";
pub const __UINT8_FMTX__ = "hhX";
pub const __UINT8_C_SUFFIX__ = "";
pub const __UINT8_MAX__ = @as(c_int, 255);
pub const __INT8_MAX__ = @as(c_int, 127);
pub const __UINT16_TYPE__ = c_ushort;
pub const __UINT16_FMTo__ = "ho";
pub const __UINT16_FMTu__ = "hu";
pub const __UINT16_FMTx__ = "hx";
pub const __UINT16_FMTX__ = "hX";
pub const __UINT16_C_SUFFIX__ = "";
pub const __UINT16_MAX__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const __INT16_MAX__ = @as(c_int, 32767);
pub const __UINT32_TYPE__ = c_uint;
pub const __UINT32_FMTo__ = "o";
pub const __UINT32_FMTu__ = "u";
pub const __UINT32_FMTx__ = "x";
pub const __UINT32_FMTX__ = "X";
pub const __UINT32_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `U`"); // <builtin>:210:9
pub const __UINT32_MAX__ = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __INT32_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __UINT64_TYPE__ = c_ulonglong;
pub const __UINT64_FMTo__ = "llo";
pub const __UINT64_FMTu__ = "llu";
pub const __UINT64_FMTx__ = "llx";
pub const __UINT64_FMTX__ = "llX";
pub const __UINT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `ULL`"); // <builtin>:218:9
pub const __UINT64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __INT64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_LEAST8_TYPE__ = i8;
pub const __INT_LEAST8_MAX__ = @as(c_int, 127);
pub const __INT_LEAST8_WIDTH__ = @as(c_int, 8);
pub const INT_LEAST8_FMTd__ = "hhd";
pub const INT_LEAST8_FMTi__ = "hhi";
pub const __UINT_LEAST8_TYPE__ = u8;
pub const __UINT_LEAST8_MAX__ = @as(c_int, 255);
pub const UINT_LEAST8_FMTo__ = "hho";
pub const UINT_LEAST8_FMTu__ = "hhu";
pub const UINT_LEAST8_FMTx__ = "hhx";
pub const UINT_LEAST8_FMTX__ = "hhX";
pub const __INT_FAST8_TYPE__ = i8;
pub const __INT_FAST8_MAX__ = @as(c_int, 127);
pub const __INT_FAST8_WIDTH__ = @as(c_int, 8);
pub const INT_FAST8_FMTd__ = "hhd";
pub const INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST8_TYPE__ = u8;
pub const __UINT_FAST8_MAX__ = @as(c_int, 255);
pub const UINT_FAST8_FMTo__ = "hho";
pub const UINT_FAST8_FMTu__ = "hhu";
pub const UINT_FAST8_FMTx__ = "hhx";
pub const UINT_FAST8_FMTX__ = "hhX";
pub const __INT_LEAST16_TYPE__ = c_short;
pub const __INT_LEAST16_MAX__ = @as(c_int, 32767);
pub const __INT_LEAST16_WIDTH__ = @as(c_int, 16);
pub const INT_LEAST16_FMTd__ = "hd";
pub const INT_LEAST16_FMTi__ = "hi";
pub const __UINT_LEAST16_TYPE__ = c_ushort;
pub const __UINT_LEAST16_MAX__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT_LEAST16_FMTo__ = "ho";
pub const UINT_LEAST16_FMTu__ = "hu";
pub const UINT_LEAST16_FMTx__ = "hx";
pub const UINT_LEAST16_FMTX__ = "hX";
pub const __INT_FAST16_TYPE__ = c_short;
pub const __INT_FAST16_MAX__ = @as(c_int, 32767);
pub const __INT_FAST16_WIDTH__ = @as(c_int, 16);
pub const INT_FAST16_FMTd__ = "hd";
pub const INT_FAST16_FMTi__ = "hi";
pub const __UINT_FAST16_TYPE__ = c_ushort;
pub const __UINT_FAST16_MAX__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT_FAST16_FMTo__ = "ho";
pub const UINT_FAST16_FMTu__ = "hu";
pub const UINT_FAST16_FMTx__ = "hx";
pub const UINT_FAST16_FMTX__ = "hX";
pub const __INT_LEAST32_TYPE__ = c_int;
pub const __INT_LEAST32_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_LEAST32_WIDTH__ = @as(c_int, 32);
pub const INT_LEAST32_FMTd__ = "d";
pub const INT_LEAST32_FMTi__ = "i";
pub const __UINT_LEAST32_TYPE__ = c_uint;
pub const __UINT_LEAST32_MAX__ = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT_LEAST32_FMTo__ = "o";
pub const UINT_LEAST32_FMTu__ = "u";
pub const UINT_LEAST32_FMTx__ = "x";
pub const UINT_LEAST32_FMTX__ = "X";
pub const __INT_FAST32_TYPE__ = c_int;
pub const __INT_FAST32_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_FAST32_WIDTH__ = @as(c_int, 32);
pub const INT_FAST32_FMTd__ = "d";
pub const INT_FAST32_FMTi__ = "i";
pub const __UINT_FAST32_TYPE__ = c_uint;
pub const __UINT_FAST32_MAX__ = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT_FAST32_FMTo__ = "o";
pub const UINT_FAST32_FMTu__ = "u";
pub const UINT_FAST32_FMTx__ = "x";
pub const UINT_FAST32_FMTX__ = "X";
pub const __INT_LEAST64_TYPE__ = c_longlong;
pub const __INT_LEAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_LEAST64_WIDTH__ = @as(c_int, 64);
pub const INT_LEAST64_FMTd__ = "lld";
pub const INT_LEAST64_FMTi__ = "lli";
pub const __UINT_LEAST64_TYPE__ = c_ulonglong;
pub const __UINT_LEAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const UINT_LEAST64_FMTo__ = "llo";
pub const UINT_LEAST64_FMTu__ = "llu";
pub const UINT_LEAST64_FMTx__ = "llx";
pub const UINT_LEAST64_FMTX__ = "llX";
pub const __INT_FAST64_TYPE__ = c_longlong;
pub const __INT_FAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_FAST64_WIDTH__ = @as(c_int, 64);
pub const INT_FAST64_FMTd__ = "lld";
pub const INT_FAST64_FMTi__ = "lli";
pub const __UINT_FAST64_TYPE__ = c_ulonglong;
pub const __UINT_FAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const UINT_FAST64_FMTo__ = "llo";
pub const UINT_FAST64_FMTu__ = "llu";
pub const UINT_FAST64_FMTx__ = "llx";
pub const UINT_FAST64_FMTX__ = "llX";
pub const __FLT16_DENORM_MIN__ = @as(f16, 5.9604644775390625e-8);
pub const __FLT16_HAS_DENORM__ = "";
pub const __FLT16_DIG__ = @as(c_int, 3);
pub const __FLT16_DECIMAL_DIG__ = @as(c_int, 5);
pub const __FLT16_EPSILON__ = @as(f16, 9.765625e-4);
pub const __FLT16_HAS_INFINITY__ = "";
pub const __FLT16_HAS_QUIET_NAN__ = "";
pub const __FLT16_MANT_DIG__ = @as(c_int, 11);
pub const __FLT16_MAX_10_EXP__ = @as(c_int, 4);
pub const __FLT16_MAX_EXP__ = @as(c_int, 16);
pub const __FLT16_MAX__ = @as(f16, 6.5504e+4);
pub const __FLT16_MIN_10_EXP__ = -@as(c_int, 4);
pub const __FLT16_MIN_EXP__ = -@as(c_int, 13);
pub const __FLT16_MIN__ = @as(f16, 6.103515625e-5);
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub const __FLT_HAS_DENORM__ = "";
pub const __FLT_DIG__ = @as(c_int, 6);
pub const __FLT_DECIMAL_DIG__ = @as(c_int, 9);
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __FLT_HAS_INFINITY__ = "";
pub const __FLT_HAS_QUIET_NAN__ = "";
pub const __FLT_MANT_DIG__ = @as(c_int, 24);
pub const __FLT_MAX_10_EXP__ = @as(c_int, 38);
pub const __FLT_MAX_EXP__ = @as(c_int, 128);
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_MIN_10_EXP__ = -@as(c_int, 37);
pub const __FLT_MIN_EXP__ = -@as(c_int, 125);
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __DBL_DENORM_MIN__ = @as(f64, 4.9406564584124654e-324);
pub const __DBL_HAS_DENORM__ = "";
pub const __DBL_DIG__ = @as(c_int, 15);
pub const __DBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __DBL_EPSILON__ = @as(f64, 2.2204460492503131e-16);
pub const __DBL_HAS_INFINITY__ = "";
pub const __DBL_HAS_QUIET_NAN__ = "";
pub const __DBL_MANT_DIG__ = @as(c_int, 53);
pub const __DBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __DBL_MAX_EXP__ = @as(c_int, 1024);
pub const __DBL_MAX__ = @as(f64, 1.7976931348623157e+308);
pub const __DBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __DBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __DBL_MIN__ = @as(f64, 2.2250738585072014e-308);
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 3.64519953188247460253e-4951);
pub const __LDBL_HAS_DENORM__ = "";
pub const __LDBL_DIG__ = @as(c_int, 18);
pub const __LDBL_DECIMAL_DIG__ = @as(c_int, 21);
pub const __LDBL_EPSILON__ = @as(c_longdouble, 1.08420217248550443401e-19);
pub const __LDBL_HAS_INFINITY__ = "";
pub const __LDBL_HAS_QUIET_NAN__ = "";
pub const __LDBL_MANT_DIG__ = @as(c_int, 64);
pub const __LDBL_MAX_10_EXP__ = @as(c_int, 4932);
pub const __LDBL_MAX_EXP__ = @as(c_int, 16384);
pub const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
pub const __LDBL_MIN_10_EXP__ = -@as(c_int, 4931);
pub const __LDBL_MIN_EXP__ = -@as(c_int, 16381);
pub const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626e-4932);
pub const __FLT_EVAL_METHOD__ = @as(c_int, 0);
pub const __FLT_RADIX__ = @as(c_int, 2);
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __pic__ = @as(c_int, 2);
pub const __PIC__ = @as(c_int, 2);
pub const __MSVCRT_VERSION__ = @as(c_int, 0xE00);
pub const _WIN32_WINNT = @as(c_int, 0x0a00);
pub const SAPonNT = "";
pub const SAPwithUNICODE = "";
pub const SAPNWRFC_H = "";
pub const _INC_STDLIB = "";
pub const _INC_CORECRT = "";
pub const _INC__MINGW_H = "";
pub const _INC_CRTDEFS_MACRO = "";
pub const __MINGW64_PASTE2 = @compileError("unable to translate C expr: unexpected token '##'"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw_mac.h:10:9
pub inline fn __MINGW64_PASTE(x: anytype, y: anytype) @TypeOf(__MINGW64_PASTE2(x, y)) {
    _ = &x;
    _ = &y;
    return __MINGW64_PASTE2(x, y);
}
pub const __STRINGIFY = @compileError("unable to translate C expr: unexpected token ''"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw_mac.h:13:9
pub inline fn __MINGW64_STRINGIFY(x: anytype) @TypeOf(__STRINGIFY(x)) {
    _ = &x;
    return __STRINGIFY(x);
}
pub const __MINGW64_VERSION_MAJOR = @as(c_int, 13);
pub const __MINGW64_VERSION_MINOR = @as(c_int, 0);
pub const __MINGW64_VERSION_BUGFIX = @as(c_int, 0);
pub const __MINGW64_VERSION_RC = @as(c_int, 0);
pub const __MINGW64_VERSION_STR = __MINGW64_STRINGIFY(__MINGW64_VERSION_MAJOR) ++ "." ++ __MINGW64_STRINGIFY(__MINGW64_VERSION_MINOR) ++ "." ++ __MINGW64_STRINGIFY(__MINGW64_VERSION_BUGFIX);
pub const __MINGW64_VERSION_STATE = "alpha";
pub const __MINGW32_MAJOR_VERSION = @as(c_int, 3);
pub const __MINGW32_MINOR_VERSION = @as(c_int, 11);
pub const _M_AMD64 = @as(c_int, 100);
pub const _M_X64 = @as(c_int, 100);
pub const __MINGW_USE_UNDERSCORE_PREFIX = @as(c_int, 0);
pub const __MINGW_IMP_SYMBOL = @compileError("unable to translate macro: undefined identifier `__imp_`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw_mac.h:129:11
pub const __MINGW_IMP_LSYMBOL = @compileError("unable to translate macro: undefined identifier `__imp_`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw_mac.h:130:11
pub inline fn __MINGW_USYMBOL(sym: anytype) @TypeOf(sym) {
    _ = &sym;
    return sym;
}
pub const __MINGW_LSYMBOL = @compileError("unable to translate macro: undefined identifier `_`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw_mac.h:132:11
pub const __MINGW_ASM_CALL = @compileError("unable to translate C expr: unexpected token '__asm__'"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw_mac.h:140:9
pub const __MINGW_ASM_CRT_CALL = @compileError("unable to translate C expr: unexpected token '__asm__'"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw_mac.h:141:9
pub const __WINT_TYPE__ = c_ushort;
pub const __MINGW_EXTENSION = @compileError("unable to translate C expr: unexpected token '__extension__'"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw_mac.h:173:13
pub const __C89_NAMELESS = __MINGW_EXTENSION;
pub const __C89_NAMELESSSTRUCTNAME = "";
pub const __C89_NAMELESSSTRUCTNAME1 = "";
pub const __C89_NAMELESSSTRUCTNAME2 = "";
pub const __C89_NAMELESSSTRUCTNAME3 = "";
pub const __C89_NAMELESSSTRUCTNAME4 = "";
pub const __C89_NAMELESSSTRUCTNAME5 = "";
pub const __C89_NAMELESSUNIONNAME = "";
pub const __C89_NAMELESSUNIONNAME1 = "";
pub const __C89_NAMELESSUNIONNAME2 = "";
pub const __C89_NAMELESSUNIONNAME3 = "";
pub const __C89_NAMELESSUNIONNAME4 = "";
pub const __C89_NAMELESSUNIONNAME5 = "";
pub const __C89_NAMELESSUNIONNAME6 = "";
pub const __C89_NAMELESSUNIONNAME7 = "";
pub const __C89_NAMELESSUNIONNAME8 = "";
pub const __GNU_EXTENSION = __MINGW_EXTENSION;
pub const __MINGW_HAVE_ANSI_C99_PRINTF = @as(c_int, 1);
pub const __MINGW_HAVE_WIDE_C99_PRINTF = @as(c_int, 1);
pub const __MINGW_HAVE_ANSI_C99_SCANF = @as(c_int, 1);
pub const __MINGW_HAVE_WIDE_C99_SCANF = @as(c_int, 1);
pub const __MINGW_POISON_NAME = @compileError("unable to translate macro: undefined identifier `_layout_has_not_been_verified_and_its_declaration_is_most_likely_incorrect`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw_mac.h:213:11
pub const __MSABI_LONG = __helpers.L_SUFFIX;
pub const __MINGW_GCC_VERSION = ((__GNUC__ * @as(c_int, 10000)) + (__GNUC_MINOR__ * @as(c_int, 100))) + __GNUC_PATCHLEVEL__;
pub inline fn __MINGW_GNUC_PREREQ(major: anytype, minor: anytype) @TypeOf((__GNUC__ > major) or ((__GNUC__ == major) and (__GNUC_MINOR__ >= minor))) {
    _ = &major;
    _ = &minor;
    return (__GNUC__ > major) or ((__GNUC__ == major) and (__GNUC_MINOR__ >= minor));
}
pub inline fn __MINGW_MSC_PREREQ(major: anytype, minor: anytype) @TypeOf(@as(c_int, 0)) {
    _ = &major;
    _ = &minor;
    return @as(c_int, 0);
}
pub inline fn __MINGW_ATTRIB_DEPRECATED_STR(X: anytype) void {
    _ = &X;
    return;
}
pub const __MINGW_SEC_WARN_STR = "This function or variable may be unsafe, use _CRT_SECURE_NO_WARNINGS to disable deprecation";
pub const __MINGW_MSVC2005_DEPREC_STR = "This POSIX function is deprecated beginning in Visual C++ 2005, use _CRT_NONSTDC_NO_DEPRECATE to disable deprecation";
pub const __MINGW_ATTRIB_DEPRECATED_MSVC2005 = __MINGW_ATTRIB_DEPRECATED_STR(__MINGW_MSVC2005_DEPREC_STR);
pub const __MINGW_ATTRIB_DEPRECATED_SEC_WARN = __MINGW_ATTRIB_DEPRECATED_STR(__MINGW_SEC_WARN_STR);
pub const __MINGW_MS_PRINTF = @compileError("unable to translate macro: undefined identifier `__format__`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw_mac.h:293:9
pub const __MINGW_MS_SCANF = @compileError("unable to translate macro: undefined identifier `__format__`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw_mac.h:296:9
pub const __MINGW_GNU_PRINTF = @compileError("unable to translate macro: undefined identifier `__format__`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw_mac.h:299:9
pub const __MINGW_GNU_SCANF = @compileError("unable to translate macro: undefined identifier `__format__`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw_mac.h:302:9
pub const __mingw_ovr = @compileError("unable to translate macro: undefined identifier `__unused__`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw_mac.h:311:11
pub const __mingw_attribute_artificial = @compileError("unable to translate macro: undefined identifier `__artificial__`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw_mac.h:318:11
pub const __MINGW_SELECTANY = @compileError("unable to translate macro: undefined identifier `__selectany__`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw_mac.h:324:9
pub const __MINGW_FORTIFY_LEVEL = @as(c_int, 0);
pub const __mingw_bos_ovr = __mingw_ovr;
pub const __MINGW_FORTIFY_VA_ARG = @as(c_int, 0);
pub const _INC_MINGW_SECAPI = "";
pub const _CRT_SECURE_CPP_OVERLOAD_SECURE_NAMES = @as(c_int, 0);
pub const _CRT_SECURE_CPP_OVERLOAD_SECURE_NAMES_MEMORY = @as(c_int, 0);
pub const _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES = @as(c_int, 0);
pub const _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_COUNT = @as(c_int, 0);
pub const _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_MEMORY = @as(c_int, 0);
pub const __MINGW_CRT_NAME_CONCAT2 = @compileError("unable to translate macro: undefined identifier `_s`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw_secapi.h:41:9
pub const __CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_MEMORY_0_3_ = @compileError("unable to translate C expr: unexpected token ''"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw_secapi.h:69:9
pub const __LONG32 = c_long;
pub const __MINGW_IMPORT = @compileError("unable to translate macro: undefined identifier `__dllimport__`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:44:12
pub const __USE_CRTIMP = @as(c_int, 1);
pub const _CRTIMP = @compileError("unable to translate macro: undefined identifier `__dllimport__`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:52:15
pub const __DECLSPEC_SUPPORTED = "";
pub const USE___UUIDOF = @as(c_int, 0);
pub const _inline = @compileError("unable to translate C expr: unexpected token '__inline'"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:74:9
pub const __CRT_INLINE = @compileError("unable to translate macro: undefined identifier `__gnu_inline__`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:83:11
pub const __MINGW_INTRIN_INLINE = @compileError("unable to translate macro: undefined identifier `__always_inline__`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:90:9
pub const __MINGW_CXX11_CONSTEXPR = "";
pub const __MINGW_CXX14_CONSTEXPR = "";
pub const __UNUSED_PARAM = @compileError("unable to translate macro: undefined identifier `__unused__`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:118:11
pub const __restrict_arr = @compileError("unable to translate C expr: unexpected token '__restrict'"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:133:10
pub const __MINGW_ATTRIB_NORETURN = @compileError("unable to translate macro: undefined identifier `__noreturn__`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:149:9
pub const __MINGW_ATTRIB_CONST = @compileError("unable to translate C expr: unexpected token '__attribute__'"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:150:9
pub const __MINGW_ATTRIB_MALLOC = @compileError("unable to translate macro: undefined identifier `__malloc__`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:160:9
pub const __MINGW_ATTRIB_PURE = @compileError("unable to translate macro: undefined identifier `__pure__`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:161:9
pub const __MINGW_ATTRIB_NONNULL = @compileError("unable to translate macro: undefined identifier `__nonnull__`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:174:9
pub const __MINGW_ATTRIB_UNUSED = @compileError("unable to translate macro: undefined identifier `__unused__`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:180:9
pub const __MINGW_ATTRIB_USED = @compileError("unable to translate macro: undefined identifier `__used__`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:186:9
pub const __MINGW_ATTRIB_DEPRECATED = @compileError("unable to translate macro: undefined identifier `__deprecated__`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:187:9
pub const __MINGW_ATTRIB_DEPRECATED_MSG = @compileError("unable to translate macro: undefined identifier `__deprecated__`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:189:9
pub const __MINGW_NOTHROW = @compileError("unable to translate macro: undefined identifier `__nothrow__`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:204:9
pub const __MINGW_ATTRIB_NO_OPTIMIZE = @compileError("unable to translate macro: undefined identifier `__optimize__`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:212:9
pub const __MINGW_PRAGMA_PARAM = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:218:9
pub const __MINGW_BROKEN_INTERFACE = @compileError("unable to translate macro: undefined identifier `message`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:225:9
pub const _UCRT = "";
pub inline fn __MINGW_UCRT_ASM_CALL(func: anytype) @TypeOf(__MINGW_ASM_CALL(func)) {
    _ = &func;
    return __MINGW_ASM_CALL(func);
}
pub const _INT128_DEFINED = "";
pub const __int8 = u8;
pub const __int16 = c_short;
pub const __int32 = c_int;
pub const __int64 = c_longlong;
pub const __ptr32 = "";
pub const __ptr64 = "";
pub const __unaligned = "";
pub const __w64 = "";
pub const __forceinline = @compileError("unable to translate macro: undefined identifier `__always_inline__`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:290:9
pub const __nothrow = "";
pub const _INC_VADEFS = "";
pub const MINGW_SDK_INIT = "";
pub const MINGW_HAS_SECURE_API = @as(c_int, 1);
pub const __STDC_SECURE_LIB__ = @as(c_long, 200411);
pub const __GOT_SECURE_LIB__ = __STDC_SECURE_LIB__;
pub const MINGW_DDK_H = "";
pub const MINGW_HAS_DDK_H = @as(c_int, 1);
pub const __GNUC_VA_LIST = "";
pub const _VA_LIST_DEFINED = "";
pub inline fn _ADDRESSOF(v: anytype) @TypeOf(&v) {
    _ = &v;
    return &v;
}
pub const _crt_va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\vadefs.h:48:9
pub const _crt_va_arg = @compileError("unable to translate macro: undefined identifier `__builtin_va_arg`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\vadefs.h:49:9
pub const _crt_va_end = @compileError("unable to translate macro: undefined identifier `__builtin_va_end`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\vadefs.h:50:9
pub const _crt_va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\vadefs.h:51:9
pub const __CRT_STRINGIZE = @compileError("unable to translate C expr: unexpected token ''"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:309:9
pub inline fn _CRT_STRINGIZE(_Value: anytype) @TypeOf(__CRT_STRINGIZE(_Value)) {
    _ = &_Value;
    return __CRT_STRINGIZE(_Value);
}
pub const __CRT_WIDE = @compileError("unable to translate macro: undefined identifier `L`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:314:9
pub inline fn _CRT_WIDE(_String: anytype) @TypeOf(__CRT_WIDE(_String)) {
    _ = &_String;
    return __CRT_WIDE(_String);
}
pub const _W64 = "";
pub const _CRTIMP_NOIA64 = _CRTIMP;
pub const _CRTIMP2 = _CRTIMP;
pub const _CRTIMP_ALTERNATIVE = _CRTIMP;
pub const _CRT_ALTERNATIVE_IMPORTED = "";
pub const _MRTIMP2 = _CRTIMP;
pub const _DLL = "";
pub const _MT = "";
pub const _MCRTIMP = _CRTIMP;
pub const _CRTIMP_PURE = _CRTIMP;
pub const _PGLOBAL = "";
pub const _AGLOBAL = "";
pub const _SECURECRT_FILL_BUFFER_PATTERN = @as(c_int, 0xFD);
pub const _CRT_DEPRECATE_TEXT = @compileError("unable to translate macro: undefined identifier `deprecated`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:373:9
pub inline fn _CRT_INSECURE_DEPRECATE_MEMORY(_Replacement: anytype) void {
    _ = &_Replacement;
    return;
}
pub inline fn _CRT_INSECURE_DEPRECATE_GLOBALS(_Replacement: anytype) void {
    _ = &_Replacement;
    return;
}
pub const _CRT_MANAGED_HEAP_DEPRECATE = "";
pub inline fn _CRT_OBSOLETE(_NewItem: anytype) void {
    _ = &_NewItem;
    return;
}
pub const _CONST_RETURN = "";
pub const UNALIGNED = "";
pub const _CRT_ALIGN = @compileError("unable to translate macro: undefined identifier `__aligned__`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:415:9
pub const __CRTDECL = @compileError("unable to translate C expr: unexpected token '__cdecl'"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:422:9
pub const _ARGMAX = @as(c_int, 100);
pub const _TRUNCATE = __helpers.cast(usize, -@as(c_int, 1));
pub inline fn _CRT_UNUSED(x: anytype) anyopaque {
    _ = &x;
    return __helpers.cast(anyopaque, x);
}
pub const __USE_MINGW_ANSI_STDIO = @as(c_int, 0);
pub const _CRT_glob = @compileError("unable to translate macro: undefined identifier `_dowildcard`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:479:9
pub const __ANONYMOUS_DEFINED = "";
pub const _ANONYMOUS_UNION = __MINGW_EXTENSION;
pub const _ANONYMOUS_STRUCT = __MINGW_EXTENSION;
pub inline fn _UNION_NAME(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn _STRUCT_NAME(x: anytype) void {
    _ = &x;
    return;
}
pub const DUMMYUNIONNAME = "";
pub const DUMMYUNIONNAME1 = "";
pub const DUMMYUNIONNAME2 = "";
pub const DUMMYUNIONNAME3 = "";
pub const DUMMYUNIONNAME4 = "";
pub const DUMMYUNIONNAME5 = "";
pub const DUMMYUNIONNAME6 = "";
pub const DUMMYUNIONNAME7 = "";
pub const DUMMYUNIONNAME8 = "";
pub const DUMMYUNIONNAME9 = "";
pub const DUMMYSTRUCTNAME = "";
pub const DUMMYSTRUCTNAME1 = "";
pub const DUMMYSTRUCTNAME2 = "";
pub const DUMMYSTRUCTNAME3 = "";
pub const DUMMYSTRUCTNAME4 = "";
pub const DUMMYSTRUCTNAME5 = "";
pub inline fn __CRT_UUID_DECL(@"type": anytype, l: anytype, w1: anytype, w2: anytype, b1: anytype, b2: anytype, b3: anytype, b4: anytype, b5: anytype, b6: anytype, b7: anytype, b8: anytype) void {
    _ = &@"type";
    _ = &l;
    _ = &w1;
    _ = &w2;
    _ = &b1;
    _ = &b2;
    _ = &b3;
    _ = &b4;
    _ = &b5;
    _ = &b6;
    _ = &b7;
    _ = &b8;
    return;
}
pub const __MINGW_DEBUGBREAK_IMPL = @compileError("unable to translate macro: undefined identifier `__debugbreak`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:599:9
pub const __MINGW_FASTFAIL_IMPL = @compileError("unable to translate macro: undefined identifier `__fastfail`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:620:9
pub const __MINGW_PREFETCH_IMPL = @compileError("unable to translate macro: undefined identifier `__prefetch`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw.h:644:9
pub const _CRT_PACKING = @as(c_int, 8);
pub const _CRTNOALIAS = "";
pub const _CRTRESTRICT = "";
pub const _SIZE_T_DEFINED = "";
pub const _SSIZE_T_DEFINED = "";
pub const _RSIZE_T_DEFINED = "";
pub const _INTPTR_T_DEFINED = "";
pub const __intptr_t_defined = "";
pub const _UINTPTR_T_DEFINED = "";
pub const __uintptr_t_defined = "";
pub const _PTRDIFF_T_DEFINED = "";
pub const _PTRDIFF_T_ = "";
pub const _WCHAR_T_DEFINED = "";
pub const _WCTYPE_T_DEFINED = "";
pub const _WINT_T = "";
pub const _ERRCODE_DEFINED = "";
pub const _TIME32_T_DEFINED = "";
pub const _TIME64_T_DEFINED = "";
pub const _TIME_T_DEFINED = "";
pub const _CRT_SECURE_CPP_NOTHROW = @compileError("unable to translate macro: undefined identifier `throw`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\corecrt.h:143:9
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_0(__ret: anytype, __func: anytype, __dsttype: anytype, __dst: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__dsttype;
    _ = &__dst;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_1(__ret: anytype, __func: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_2(__ret: anytype, __func: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype, __type2: anytype, __arg2: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    _ = &__type2;
    _ = &__arg2;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_3(__ret: anytype, __func: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype, __type2: anytype, __arg2: anytype, __type3: anytype, __arg3: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    _ = &__type2;
    _ = &__arg2;
    _ = &__type3;
    _ = &__arg3;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_4(__ret: anytype, __func: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype, __type2: anytype, __arg2: anytype, __type3: anytype, __arg3: anytype, __type4: anytype, __arg4: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    _ = &__type2;
    _ = &__arg2;
    _ = &__type3;
    _ = &__arg3;
    _ = &__type4;
    _ = &__arg4;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_1_1(__ret: anytype, __func: anytype, __type0: anytype, __arg0: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__type0;
    _ = &__arg0;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_1_2(__ret: anytype, __func: anytype, __type0: anytype, __arg0: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype, __type2: anytype, __arg2: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__type0;
    _ = &__arg0;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    _ = &__type2;
    _ = &__arg2;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_1_3(__ret: anytype, __func: anytype, __type0: anytype, __arg0: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype, __type2: anytype, __arg2: anytype, __type3: anytype, __arg3: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__type0;
    _ = &__arg0;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    _ = &__type2;
    _ = &__arg2;
    _ = &__type3;
    _ = &__arg3;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_2_0(__ret: anytype, __func: anytype, __type1: anytype, __arg1: anytype, __type2: anytype, __arg2: anytype, __dsttype: anytype, __dst: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__type1;
    _ = &__arg1;
    _ = &__type2;
    _ = &__arg2;
    _ = &__dsttype;
    _ = &__dst;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_1_ARGLIST(__ret: anytype, __func: anytype, __vfunc: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__vfunc;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_2_ARGLIST(__ret: anytype, __func: anytype, __vfunc: anytype, __dsttype: anytype, __dst: anytype, __type1: anytype, __arg1: anytype, __type2: anytype, __arg2: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__vfunc;
    _ = &__dsttype;
    _ = &__dst;
    _ = &__type1;
    _ = &__arg1;
    _ = &__type2;
    _ = &__arg2;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_SECURE_FUNC_SPLITPATH(__ret: anytype, __func: anytype, __dsttype: anytype, __src: anytype) void {
    _ = &__ret;
    _ = &__func;
    _ = &__dsttype;
    _ = &__src;
    return;
}
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_0 = @compileError("unable to translate macro: undefined identifier `__func_name`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\corecrt.h:277:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_1 = @compileError("unable to translate macro: undefined identifier `__func_name`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\corecrt.h:279:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_2 = @compileError("unable to translate macro: undefined identifier `__func_name`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\corecrt.h:281:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_3 = @compileError("unable to translate macro: undefined identifier `__func_name`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\corecrt.h:283:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_4 = @compileError("unable to translate macro: undefined identifier `__func_name`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\corecrt.h:285:9
pub inline fn __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_0_EX(__ret_type: anytype, __ret_policy: anytype, __decl_spec: anytype, __name: anytype, __sec_name: anytype, __dst_attr: anytype, __dst_type: anytype, __dst: anytype) void {
    _ = &__ret_type;
    _ = &__ret_policy;
    _ = &__decl_spec;
    _ = &__name;
    _ = &__sec_name;
    _ = &__dst_attr;
    _ = &__dst_type;
    _ = &__dst;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_1_EX(__ret_type: anytype, __ret_policy: anytype, __decl_spec: anytype, __name: anytype, __sec_name: anytype, __dst_attr: anytype, __dst_type: anytype, __dst: anytype, __arg1_type: anytype, __arg1: anytype) void {
    _ = &__ret_type;
    _ = &__ret_policy;
    _ = &__decl_spec;
    _ = &__name;
    _ = &__sec_name;
    _ = &__dst_attr;
    _ = &__dst_type;
    _ = &__dst;
    _ = &__arg1_type;
    _ = &__arg1;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_2_EX(__ret_type: anytype, __ret_policy: anytype, __decl_spec: anytype, __name: anytype, __sec_name: anytype, __dst_attr: anytype, __dst_type: anytype, __dst: anytype, __arg1_type: anytype, __arg1: anytype, __arg2_type: anytype, __arg2: anytype) void {
    _ = &__ret_type;
    _ = &__ret_policy;
    _ = &__decl_spec;
    _ = &__name;
    _ = &__sec_name;
    _ = &__dst_attr;
    _ = &__dst_type;
    _ = &__dst;
    _ = &__arg1_type;
    _ = &__arg1;
    _ = &__arg2_type;
    _ = &__arg2;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_3_EX(__ret_type: anytype, __ret_policy: anytype, __decl_spec: anytype, __name: anytype, __sec_name: anytype, __dst_attr: anytype, __dst_type: anytype, __dst: anytype, __arg1_type: anytype, __arg1: anytype, __arg2_type: anytype, __arg2: anytype, __arg3_type: anytype, __arg3: anytype) void {
    _ = &__ret_type;
    _ = &__ret_policy;
    _ = &__decl_spec;
    _ = &__name;
    _ = &__sec_name;
    _ = &__dst_attr;
    _ = &__dst_type;
    _ = &__dst;
    _ = &__arg1_type;
    _ = &__arg1;
    _ = &__arg2_type;
    _ = &__arg2;
    _ = &__arg3_type;
    _ = &__arg3;
    return;
}
pub inline fn __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_4_EX(__ret_type: anytype, __ret_policy: anytype, __decl_spec: anytype, __name: anytype, __sec_name: anytype, __dst_attr: anytype, __dst_type: anytype, __dst: anytype, __arg1_type: anytype, __arg1: anytype, __arg2_type: anytype, __arg2: anytype, __arg3_type: anytype, __arg3: anytype, __arg4_type: anytype, __arg4: anytype) void {
    _ = &__ret_type;
    _ = &__ret_policy;
    _ = &__decl_spec;
    _ = &__name;
    _ = &__sec_name;
    _ = &__dst_attr;
    _ = &__dst_type;
    _ = &__dst;
    _ = &__arg1_type;
    _ = &__arg1;
    _ = &__arg2_type;
    _ = &__arg2;
    _ = &__arg3_type;
    _ = &__arg3;
    _ = &__arg4_type;
    _ = &__arg4;
    return;
}
pub const _TAGLC_ID_DEFINED = "";
pub const _THREADLOCALEINFO = "";
pub inline fn __crt_typefix(ctype: anytype) void {
    _ = &ctype;
    return;
}
pub const _CRT_USE_WINAPI_FAMILY_DESKTOP_APP = "";
pub const _INC_CORECRT_WSTDLIB = "";
pub const _GCC_LIMITS_H_ = "";
pub const __CLANG_LIMITS_H = "";
pub const _INC_CRTDEFS = "";
pub const _INC_LIMITS = "";
pub const PATH_MAX = @as(c_int, 260);
pub const MB_LEN_MAX = @as(c_int, 5);
pub const _I8_MIN = -@as(c_int, 127) - @as(c_int, 1);
pub const _I8_MAX = @as(c_int, 127);
pub const _UI8_MAX = @as(c_uint, 0xff);
pub const _I16_MIN = -@as(c_int, 32767) - @as(c_int, 1);
pub const _I16_MAX = @as(c_int, 32767);
pub const _UI16_MAX = @as(c_uint, 0xffff);
pub const _I32_MIN = -__helpers.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const _I32_MAX = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const _UI32_MAX = __helpers.promoteIntLiteral(c_uint, 0xffffffff, .hex);
pub const _I64_MIN = -@as(c_longlong, 9223372036854775807) - @as(c_int, 1);
pub const _I64_MAX = @as(c_longlong, 9223372036854775807);
pub const _UI64_MAX = @as(c_ulonglong, 0xffffffffffffffff);
pub const SIZE_MAX = _UI64_MAX;
pub const SSIZE_MAX = _I64_MAX;
pub const LONG_LONG_MAX = __LONG_LONG_MAX__;
pub const LONG_LONG_MIN = -__LONG_LONG_MAX__ - @as(c_longlong, 1);
pub const ULONG_LONG_MAX = (__LONG_LONG_MAX__ * @as(c_ulonglong, 2)) + @as(c_ulonglong, 1);
pub const SCHAR_MAX = __SCHAR_MAX__;
pub const SHRT_MAX = __SHRT_MAX__;
pub const INT_MAX = __INT_MAX__;
pub const LONG_MAX = __LONG_MAX__;
pub const SCHAR_MIN = -__SCHAR_MAX__ - @as(c_int, 1);
pub const SHRT_MIN = -__SHRT_MAX__ - @as(c_int, 1);
pub const INT_MIN = -__INT_MAX__ - @as(c_int, 1);
pub const LONG_MIN = -__LONG_MAX__ - @as(c_long, 1);
pub const UCHAR_MAX = (__SCHAR_MAX__ * @as(c_int, 2)) + @as(c_int, 1);
pub const USHRT_MAX = (__SHRT_MAX__ * @as(c_int, 2)) + @as(c_int, 1);
pub const UINT_MAX = (__INT_MAX__ * @as(c_uint, 2)) + @as(c_uint, 1);
pub const ULONG_MAX = (__LONG_MAX__ * @as(c_ulong, 2)) + @as(c_ulong, 1);
pub const CHAR_BIT = __CHAR_BIT__;
pub const CHAR_MIN = SCHAR_MIN;
pub const CHAR_MAX = __SCHAR_MAX__;
pub const LLONG_MIN = -__LONG_LONG_MAX__ - @as(c_longlong, 1);
pub const LLONG_MAX = __LONG_LONG_MAX__;
pub const ULLONG_MAX = (__LONG_LONG_MAX__ * @as(c_ulonglong, 2)) + @as(c_ulonglong, 1);
pub const _SECIMP = @compileError("unable to translate macro: undefined identifier `dllimport`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\stdlib.h:22:9
pub const NULL = __helpers.cast(?*anyopaque, @as(c_int, 0));
pub const EXIT_SUCCESS = @as(c_int, 0);
pub const EXIT_FAILURE = @as(c_int, 1);
pub const _ONEXIT_T_DEFINED = "";
pub const onexit_t = _onexit_t;
pub const _DIV_T_DEFINED = "";
pub const _CRT_DOUBLE_DEC = "";
pub inline fn _PTR_LD(x: anytype) [*c]u8 {
    _ = &x;
    return __helpers.cast([*c]u8, &x.*.ld);
}
pub const RAND_MAX = @as(c_int, 0x7fff);
pub const MB_CUR_MAX = ___mb_cur_max_func();
pub const __mb_cur_max = ___mb_cur_max_func();
pub inline fn __max(a: anytype, b: anytype) @TypeOf(if (a > b) a else b) {
    _ = &a;
    _ = &b;
    return if (a > b) a else b;
}
pub inline fn __min(a: anytype, b: anytype) @TypeOf(if (a < b) a else b) {
    _ = &a;
    _ = &b;
    return if (a < b) a else b;
}
pub const _MAX_PATH = @as(c_int, 260);
pub const _MAX_DRIVE = @as(c_int, 3);
pub const _MAX_DIR = @as(c_int, 256);
pub const _MAX_FNAME = @as(c_int, 256);
pub const _MAX_EXT = @as(c_int, 256);
pub const _OUT_TO_DEFAULT = @as(c_int, 0);
pub const _OUT_TO_STDERR = @as(c_int, 1);
pub const _OUT_TO_MSGBOX = @as(c_int, 2);
pub const _REPORT_ERRMODE = @as(c_int, 3);
pub const _WRITE_ABORT_MSG = @as(c_int, 0x1);
pub const _CALL_REPORTFAULT = @as(c_int, 0x2);
pub const _MAX_ENV = @as(c_int, 32767);
pub const _CRT_ERRNO_DEFINED = "";
pub const errno = _errno().*;
pub const _doserrno = __doserrno().*;
pub const _sys_nerr = __sys_nerr().*;
pub const _sys_errlist = __sys_errlist();
pub const _fmode = __p__fmode().*;
pub const __argc = __p___argc().*;
pub const __argv = __p___argv().*;
pub const __wargv = __p___wargv().*;
pub const _pgmptr = __p__pgmptr().*;
pub const _wpgmptr = __p__wpgmptr().*;
pub const _environ = __p__environ().*;
pub const _wenviron = __p__wenviron().*;
pub const _osplatform = __p__osplatform().*;
pub const _osver = __p__osver().*;
pub const _winver = __p__winver().*;
pub const _winmajor = __p__winmajor().*;
pub const _winminor = __p__winminor().*;
pub inline fn _countof(_Array: anytype) @TypeOf(__helpers.div(__helpers.sizeof(_Array), __helpers.sizeof(_Array[@as(usize, @intCast(@as(c_int, 0)))]))) {
    _ = &_Array;
    return __helpers.div(__helpers.sizeof(_Array), __helpers.sizeof(_Array[@as(usize, @intCast(@as(c_int, 0)))]));
}
pub const _CRT_TERMINATE_DEFINED = "";
pub const _CRT_ABS_DEFINED = "";
pub const _CRT_ATOF_DEFINED = "";
pub const _CRT_ALGO_DEFINED = "";
pub const _CRT_SYSTEM_DEFINED = "";
pub const _CRT_ALLOCATION_DEFINED = "";
pub const _WSTDLIB_DEFINED = "";
pub const _CRT_WSYSTEM_DEFINED = "";
pub const _CVTBUFSIZE = @as(c_int, 309) + @as(c_int, 40);
pub const _CRT_PERROR_DEFINED = "";
pub const _WSTDLIBP_DEFINED = "";
pub const _CRT_WPERROR_DEFINED = "";
pub const sys_errlist = _sys_errlist;
pub const sys_nerr = _sys_nerr;
pub const environ = _environ;
pub const _CRT_SWAB_DEFINED = "";
pub const _INC_STDLIB_S = "";
pub const _QSORT_S_DEFINED = "";
pub const _MALLOC_H_ = "";
pub const _HEAP_MAXREQ = __helpers.promoteIntLiteral(c_int, 0xFFFFFFFFFFFFFFE0, .hex);
pub const _STATIC_ASSERT = @compileError("unable to translate C expr: unexpected token '_Static_assert'"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\malloc.h:29:9
pub const _HEAPEMPTY = -@as(c_int, 1);
pub const _HEAPOK = -@as(c_int, 2);
pub const _HEAPBADBEGIN = -@as(c_int, 3);
pub const _HEAPBADNODE = -@as(c_int, 4);
pub const _HEAPEND = -@as(c_int, 5);
pub const _HEAPBADPTR = -@as(c_int, 6);
pub const _FREEENTRY = @as(c_int, 0);
pub const _USEDENTRY = @as(c_int, 1);
pub const _HEAPINFO_DEFINED = "";
pub const _amblksiz = __p__amblksiz().*;
pub const __MM_MALLOC_H = "";
pub const _MAX_WAIT_MALLOC_CRT = __helpers.promoteIntLiteral(c_int, 60000, .decimal);
pub const _alloca = @compileError("unable to translate macro: undefined identifier `__builtin_alloca`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\malloc.h:163:9
pub const _ALLOCA_S_THRESHOLD = @as(c_int, 1024);
pub const _ALLOCA_S_STACK_MARKER = __helpers.promoteIntLiteral(c_int, 0xCCCC, .hex);
pub const _ALLOCA_S_HEAP_MARKER = __helpers.promoteIntLiteral(c_int, 0xDDDD, .hex);
pub const _ALLOCA_S_MARKER_SIZE = @as(c_int, 16);
pub inline fn _malloca(size: anytype) @TypeOf(if ((size + _ALLOCA_S_MARKER_SIZE) <= _ALLOCA_S_THRESHOLD) _MarkAllocaS(_alloca(size + _ALLOCA_S_MARKER_SIZE), _ALLOCA_S_STACK_MARKER) else _MarkAllocaS(malloc(size + _ALLOCA_S_MARKER_SIZE), _ALLOCA_S_HEAP_MARKER)) {
    _ = &size;
    return if ((size + _ALLOCA_S_MARKER_SIZE) <= _ALLOCA_S_THRESHOLD) _MarkAllocaS(_alloca(size + _ALLOCA_S_MARKER_SIZE), _ALLOCA_S_STACK_MARKER) else _MarkAllocaS(malloc(size + _ALLOCA_S_MARKER_SIZE), _ALLOCA_S_HEAP_MARKER);
}
pub const _FREEA_INLINE = "";
pub const alloca = @compileError("unable to translate macro: undefined identifier `__builtin_alloca`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\malloc.h:238:9
pub const _INC_STDIO = "";
pub const _STDIO_CONFIG_DEFINED = "";
pub const _CRT_INTERNAL_PRINTF_LEGACY_VSPRINTF_NULL_TERMINATION = @as(c_ulonglong, 0x0001);
pub const _CRT_INTERNAL_PRINTF_STANDARD_SNPRINTF_BEHAVIOR = @as(c_ulonglong, 0x0002);
pub const _CRT_INTERNAL_PRINTF_LEGACY_WIDE_SPECIFIERS = @as(c_ulonglong, 0x0004);
pub const _CRT_INTERNAL_PRINTF_LEGACY_MSVCRT_COMPATIBILITY = @as(c_ulonglong, 0x0008);
pub const _CRT_INTERNAL_PRINTF_LEGACY_THREE_DIGIT_EXPONENTS = @as(c_ulonglong, 0x0010);
pub const _CRT_INTERNAL_PRINTF_STANDARD_ROUNDING = @as(c_ulonglong, 0x0020);
pub const _CRT_INTERNAL_SCANF_SECURECRT = @as(c_ulonglong, 0x0001);
pub const _CRT_INTERNAL_SCANF_LEGACY_WIDE_SPECIFIERS = @as(c_ulonglong, 0x0002);
pub const _CRT_INTERNAL_SCANF_LEGACY_MSVCRT_COMPATIBILITY = @as(c_ulonglong, 0x0004);
pub const _CRT_INTERNAL_LOCAL_PRINTF_OPTIONS = __local_stdio_printf_options().*;
pub const _CRT_INTERNAL_LOCAL_SCANF_OPTIONS = __local_stdio_scanf_options().*;
pub const BUFSIZ = @as(c_int, 512);
pub const _NFILE = _NSTREAM_;
pub const _NSTREAM_ = @as(c_int, 512);
pub const _IOB_ENTRIES = @as(c_int, 20);
pub const EOF = -@as(c_int, 1);
pub const _FILE_DEFINED = "";
pub const _P_tmpdir = "\\";
pub const _wP_tmpdir = "\\";
pub const L_tmpnam = @as(c_int, 260);
pub const SEEK_CUR = @as(c_int, 1);
pub const SEEK_END = @as(c_int, 2);
pub const SEEK_SET = @as(c_int, 0);
pub const STDIN_FILENO = @as(c_int, 0);
pub const STDOUT_FILENO = @as(c_int, 1);
pub const STDERR_FILENO = @as(c_int, 2);
pub const FILENAME_MAX = @as(c_int, 260);
pub const FOPEN_MAX = @as(c_int, 20);
pub const _SYS_OPEN = @as(c_int, 20);
pub const TMP_MAX = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const _OFF_T_DEFINED = "";
pub const _OFF_T_ = "";
pub const _OFF64_T_DEFINED = "";
pub const _FILE_OFFSET_BITS_SET_OFFT = "";
pub const _iob = __iob_func();
pub const _FPOS_T_DEFINED = "";
pub inline fn _FPOSOFF(fp: anytype) c_long {
    _ = &fp;
    return __helpers.cast(c_long, fp);
}
pub const _STDSTREAM_DEFINED = "";
pub const stdin = __acrt_iob_func(@as(c_int, 0));
pub const stdout = __acrt_iob_func(@as(c_int, 1));
pub const stderr = __acrt_iob_func(@as(c_int, 2));
pub const _IOFBF = @as(c_int, 0x0000);
pub const _IOLBF = @as(c_int, 0x0040);
pub const _IONBF = @as(c_int, 0x0004);
pub const __MINGW_PRINTF_FORMAT = @compileError("unable to translate macro: undefined identifier `__gnu_printf__`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\stdio.h:280:9
pub const __MINGW_SCANF_FORMAT = @compileError("unable to translate macro: undefined identifier `__gnu_scanf__`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\stdio.h:281:9
pub const _FILE_OFFSET_BITS_SET_FSEEKO = "";
pub const _FILE_OFFSET_BITS_SET_FTELLO = "";
pub const popen = _popen;
pub const pclose = _pclose;
pub const _CRT_DIRECTORY_DEFINED = "";
pub const _WSTDIO_DEFINED = "";
pub const WEOF = __helpers.cast(wint_t, __helpers.promoteIntLiteral(c_int, 0xFFFF, .hex));
pub const _INC_SWPRINTF_INL = "";
pub const wpopen = _wpopen;
pub inline fn _putwc_nolock(_c: anytype, _stm: anytype) @TypeOf(_fputwc_nolock(_c, _stm)) {
    _ = &_c;
    _ = &_stm;
    return _fputwc_nolock(_c, _stm);
}
pub inline fn _getwc_nolock(_c: anytype) @TypeOf(_fgetwc_nolock(_c)) {
    _ = &_c;
    return _fgetwc_nolock(_c);
}
pub const _STDIO_DEFINED = "";
pub inline fn _getchar_nolock() @TypeOf(_getc_nolock(stdin)) {
    return _getc_nolock(stdin);
}
pub inline fn _putchar_nolock(_c: anytype) @TypeOf(_putc_nolock(_c, stdout)) {
    _ = &_c;
    return _putc_nolock(_c, stdout);
}
pub inline fn _getwchar_nolock() @TypeOf(_getwc_nolock(stdin)) {
    return _getwc_nolock(stdin);
}
pub inline fn _putwchar_nolock(_c: anytype) @TypeOf(_putwc_nolock(_c, stdout)) {
    _ = &_c;
    return _putwc_nolock(_c, stdout);
}
pub const P_tmpdir = _P_tmpdir;
pub const SYS_OPEN = _SYS_OPEN;
pub const __MINGW_MBWC_CONVERT_DEFINED = "";
pub const _WSPAWN_DEFINED = "";
pub const _P_WAIT = @as(c_int, 0);
pub const _P_NOWAIT = @as(c_int, 1);
pub const _OLD_P_OVERLAY = @as(c_int, 2);
pub const _P_NOWAITO = @as(c_int, 3);
pub const _P_DETACH = @as(c_int, 4);
pub const _P_OVERLAY = @as(c_int, 2);
pub const _WAIT_CHILD = @as(c_int, 0);
pub const _WAIT_GRANDCHILD = @as(c_int, 1);
pub const _SPAWNV_DEFINED = "";
pub const _INC_STDIO_S = "";
pub const _STDIO_S_DEFINED = "";
pub const L_tmpnam_s = L_tmpnam;
pub const TMP_MAX_S = TMP_MAX;
pub const _WSTDIO_S_DEFINED = "";
pub const SAPUCRFC_H = "$Id: //bas/754_REL/src/include/sapucrfc.h#4 $";
pub const SAPUCX_H = "";
pub const externC = @compileError("unable to translate C expr: unexpected token 'extern'"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:64:15
pub const BEGIN_externC = "";
pub const END_externC = "";
pub const NS_STD_C_HEADER = "";
pub const BEGIN_NS_STD_C_HEADER = "";
pub const END_NS_STD_C_HEADER = "";
pub inline fn CCQ_CAST(p: anytype) void {
    _ = &p;
    return;
}
pub const SAPwithINT_LITTLEENDIAN = @as(c_int, 1);
pub const SAPwithFLOAT_IEEE = @as(c_int, 1);
pub const SAPwithCHAR_ASCII = @as(c_int, 1);
pub const __SAP_DLL_DECLSPEC = @compileError("unable to translate macro: undefined identifier `dllimport`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:287:11
pub const WCHAR_is_2B = "";
pub const SAP_UC_is_wchar = "";
pub const __STDC_VERSION_STDDEF_H__ = @as(c_long, 202311);
pub const offsetof = @compileError("unable to translate macro: undefined identifier `__builtin_offsetof`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\compiler\aro\include\stddef.h:18:9
pub const _INC_CTYPE = "";
pub const _INC_CORECRT_WCTYPE = "";
pub const _CRT_CTYPEDATA_DEFINED = "";
pub const __PCTYPE_FUNC = __pctype_func();
pub const _pctype = __pctype_func();
pub const _CRT_WCTYPEDATA_DEFINED = "";
pub const _wctype = __MINGW_IMP_SYMBOL(_wctype).*;
pub const _pwctype = __pwctype_func();
pub const _UPPER = @as(c_int, 0x1);
pub const _LOWER = @as(c_int, 0x2);
pub const _DIGIT = @as(c_int, 0x4);
pub const _SPACE = @as(c_int, 0x8);
pub const _PUNCT = @as(c_int, 0x10);
pub const _CONTROL = @as(c_int, 0x20);
pub const _BLANK = @as(c_int, 0x40);
pub const _HEX = @as(c_int, 0x80);
pub const _LEADBYTE = __helpers.promoteIntLiteral(c_int, 0x8000, .hex);
pub const _ALPHA = (@as(c_int, 0x0100) | _UPPER) | _LOWER;
pub const _WCTYPE_DEFINED = "";
pub const _WCTYPE_INLINE_DEFINED = "";
pub const _CTYPE_DEFINED = "";
pub inline fn __chvalidchk(a: anytype, b: anytype) @TypeOf(__PCTYPE_FUNC[@as(usize, @intCast(__helpers.cast(u8, a)))] & b) {
    _ = &a;
    _ = &b;
    return __PCTYPE_FUNC[@as(usize, @intCast(__helpers.cast(u8, a)))] & b;
}
pub inline fn _chvalidchk_l(_Char: anytype, _Flag: anytype, _Locale: anytype) @TypeOf(if (!(_Locale != 0)) __chvalidchk(_Char, _Flag) else __helpers.cast(_locale_t, _Locale).*.locinfo.*._locale_pctype[@as(usize, @intCast(__helpers.cast(u8, _Char)))] & _Flag) {
    _ = &_Char;
    _ = &_Flag;
    _ = &_Locale;
    return if (!(_Locale != 0)) __chvalidchk(_Char, _Flag) else __helpers.cast(_locale_t, _Locale).*.locinfo.*._locale_pctype[@as(usize, @intCast(__helpers.cast(u8, _Char)))] & _Flag;
}
pub inline fn _ischartype_l(_Char: anytype, _Flag: anytype, _Locale: anytype) @TypeOf(if ((_Locale != NULL) and (__helpers.cast(_locale_t, _Locale).*.locinfo.*._locale_mb_cur_max > @as(c_int, 1))) _isctype_l(_Char, _Flag, _Locale) else _chvalidchk_l(_Char, _Flag, _Locale)) {
    _ = &_Char;
    _ = &_Flag;
    _ = &_Locale;
    return if ((_Locale != NULL) and (__helpers.cast(_locale_t, _Locale).*.locinfo.*._locale_mb_cur_max > @as(c_int, 1))) _isctype_l(_Char, _Flag, _Locale) else _chvalidchk_l(_Char, _Flag, _Locale);
}
pub inline fn _iscsymf_l(_c: anytype, _p: anytype) @TypeOf((_isalpha_l(_c, _p) != 0) or (_c == '_')) {
    _ = &_c;
    _ = &_p;
    return (_isalpha_l(_c, _p) != 0) or (_c == '_');
}
pub inline fn _iscsym_l(_c: anytype, _p: anytype) @TypeOf((_isalnum_l(_c, _p) != 0) or (_c == '_')) {
    _ = &_c;
    _ = &_p;
    return (_isalnum_l(_c, _p) != 0) or (_c == '_');
}
pub const isascii = __isascii;
pub const toascii = __toascii;
pub const iscsymf = __iscsymf;
pub const iscsym = __iscsym;
pub const _INC_STRING = "";
pub const _NLSCMP_DEFINED = "";
pub const _NLSCMPERROR = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const _WConst_return = "";
pub const _CRT_MEMORY_DEFINED = "";
pub const _WSTRING_DEFINED = "";
pub const wcswcs = wcsstr;
pub const _INC_STRING_S = "";
pub const _WSTRING_S_DEFINED = "";
pub const SAP_SHORT_MIN = SHRT_MIN;
pub const SAP_SHORT_MAX = SHRT_MAX;
pub const SAP_SHORT_BYTES = @as(c_int, 2);
pub inline fn CCQ_FMT(x: anytype) void {
    _ = &x;
    return;
}
pub const SAP_LLONG_IS_LONG_LONG = "";
pub const SAP_Flld = CCQ_FMT("Flld") ++ cU("I64d");
pub const SAP_Fllu = CCQ_FMT("Fllu") ++ cU("I64u");
pub const SAP_Fllx = CCQ_FMT("Fllx") ++ cU("I64x");
pub const SAP_LLONG_BYTES = @as(c_int, 8);
pub const SAP_ULLONG_BYTES = @as(c_int, 8);
pub const FALSE = @as(c_int, 0);
pub const TRUE = @as(c_int, 1);
pub const SAP_DOUBLE_DEFINED = "";
pub const SAP_DOUBLE_MIN = @compileError("unable to translate macro: undefined identifier `DBL_MIN`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:562:11
pub const SAP_DOUBLE_MAX = @compileError("unable to translate macro: undefined identifier `DBL_MAX`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:563:11
pub const SAP_DATE_LN = @as(c_int, 8);
pub const SAP_TIME_LN = @as(c_int, 6);
pub const SAP_UUID_TYPEDEFD = "";
pub const PLATFORM_MAX_T = platform_max_t;
pub const SAP_MAX_ALIGN_T_DEFINED = "";
pub const SAP_DecFloat_DEFINED = "";
pub const DECF_16_MAX_STRLEN = @as(c_int, 25);
pub const DECF_34_MAX_STRLEN = @as(c_int, 43);
pub const __SAPW64 = "";
pub const SAPUC_H = "";
pub const SAPwithICU_CTYPE = "";
pub const SAPwithICU_COLL = "";
pub const SAPwithICU_BIDI = "";
pub const SAPwithICU_SHAPING = "";
pub const SAPwithICU_BREAK = "";
pub const SAPwithICU_NORM = "";
pub const SAPwithICU_TRANS = "";
pub const SAPwithICU_IDNA = "";
pub const SAPwithICU_CAL = "";
pub const SAPwithICU = "";
pub const SAPwithNLSUI_INITIALIZE = "";
pub const SAPwithU16LIB = "";
pub const SAPwithU16LIBLinked = "";
pub const SAP_UC_is_2B = "";
pub const SAP_UC_is_UTF16 = "";
pub const SAP_UC_is_2B_L = "";
pub const SAP_UC_is_UTF16_L = "";
pub const __STDC_VERSION_STDARG_H__ = @as(c_int, 0);
pub const va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\compiler\aro\include\stdarg.h:12:9
pub const va_end = @compileError("unable to translate macro: undefined identifier `__builtin_va_end`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\compiler\aro\include\stdarg.h:14:9
pub const va_arg = @compileError("unable to translate macro: undefined identifier `__builtin_va_arg`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\compiler\aro\include\stdarg.h:15:9
pub const __va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\compiler\aro\include\stdarg.h:18:9
pub const va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\compiler\aro\include\stdarg.h:22:9
pub const _INC_WCHAR = "";
pub const WCHAR_MIN = @as(c_uint, 0);
pub const WCHAR_MAX = @as(c_uint, 0xffff);
pub const _FSIZE_T_DEFINED = "";
pub const _wfinddata_t = _wfinddata64i32_t;
pub const _wfinddatai64_t = _wfinddata64_t;
pub const _wfindfirst = _wfindfirst64i32;
pub const _wfindnext = _wfindnext64i32;
pub const _wfindfirsti64 = _wfindfirst64;
pub const _wfindnexti64 = _wfindnext64;
pub const _WFINDDATA_T_DEFINED = "";
pub const _WDIRECT_DEFINED = "";
pub const _WIO_DEFINED = "";
pub const _WLOCALE_DEFINED = "";
pub const _WEXEC_DEFINED = "";
pub const _INO_T_DEFINED = "";
pub const _DEV_T_DEFINED = "";
pub const __stat64 = _stat64;
pub const _fstat = @compileError("unable to translate macro: undefined identifier `_fstat64i32`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw_stat64.h:14:9
pub const _fstati64 = @compileError("unable to translate macro: undefined identifier `_fstat64`"); // C:\Users\Kaszub\AppData\Roaming\Code\User\globalStorage\ziglang.vscode-zig\zig\x86_64-windows-0.16.0-dev.1441+2ea55d715\lib\libc\include\any-windows-any\_mingw_stat64.h:15:9
pub const _stat = _stat64i32;
pub const _stati64 = _stat64;
pub const _wstat = _wstat64i32;
pub const _wstati64 = _wstat64;
pub const _STAT_DEFINED = "";
pub const _WSTAT_DEFINED = "";
pub const _WCONIO_DEFINED = "";
pub const _TM_DEFINED = "";
pub const _WTIME_DEFINED = "";
pub const _INC_WTIME_INL = "";
pub const _INC_WTIME_S_INL = "";
pub const _INC_WCHAR_S = "";
pub const _WIO_S_DEFINED = "";
pub const _WCONIO_S_DEFINED = "";
pub const _WTIME_S_DEFINED = "";
pub const _INC_UTIME = "";
pub const _UTIMBUF_DEFINED = "";
pub const SAP_SYS_CP_STR = cU("4103");
pub const SAP_SYS_CP_C4 = @compileError("unable to translate C expr: unexpected token '{'"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1100:13
pub const DECL_EXP = "";
pub const UTF16Null = __helpers.cast(SAP_UTF16, @as(c_int, 0));
pub const NLSUI_WINT_T = "";
pub const WINT_EOF = -@as(c_int, 1);
pub inline fn CAST_RAW2UC(x: anytype) [*c]SAP_UC {
    _ = &x;
    return __helpers.cast([*c]SAP_UC, __helpers.cast(?*anyopaque, x));
}
pub inline fn CAST_RAW2CHAR(x: anytype) [*c]SAP_CHAR {
    _ = &x;
    return __helpers.cast([*c]SAP_CHAR, __helpers.cast(?*anyopaque, x));
}
pub const SAP_UC_LN = @as(c_uint, 2);
pub const SAP_UC_SF = @as(c_uint, 1);
pub const SAP_UC_ALIGN_MASK = @as(c_uint, 1);
pub inline fn sizeofR(par: anytype) @TypeOf(__helpers.sizeof(par)) {
    _ = &par;
    return __helpers.sizeof(par);
}
pub inline fn sizeofU(par: anytype) @TypeOf(__helpers.div(sizeofR(par), sizeofR(SAP_UC))) {
    _ = &par;
    return __helpers.div(sizeofR(par), sizeofR(SAP_UC));
}
pub inline fn cNtoS(par: anytype) @TypeOf(cNtoS_HELP(par)) {
    _ = &par;
    return cNtoS_HELP(par);
}
pub const cNtoS_HELP = @compileError("unable to translate C expr: unexpected token ''"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1240:9
pub inline fn cR(par: anytype) @TypeOf(par) {
    _ = &par;
    return par;
}
pub inline fn cU(par: anytype) @TypeOf(cU16(par)) {
    _ = &par;
    return cU16(par);
}
pub inline fn iU(par: anytype) @TypeOf(iU16(par)) {
    _ = &par;
    return iU16(par);
}
pub inline fn cU16(par: anytype) @TypeOf(cU16_HELP(par)) {
    _ = &par;
    return cU16_HELP(par);
}
pub inline fn iU16(par: anytype) @TypeOf(iU16_HELP(par)) {
    _ = &par;
    return iU16_HELP(par);
}
pub const cU16_HELP = @compileError("unable to translate macro: undefined identifier `L`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1259:11
pub const iU16_HELP = @compileError("unable to translate macro: undefined identifier `L`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1260:11
pub const SAP_UNAME = @compileError("unable to translate macro: undefined identifier `U16`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1286:11
pub const SAP_UNAME_ = @compileError("unable to translate macro: undefined identifier `U16`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1287:11
pub const SAP_UNAME_UR = @compileError("unable to translate macro: undefined identifier `U16`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1288:11
pub const SAP_UNAME_MEM_RET = @compileError("unable to translate macro: undefined identifier `U16`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1289:11
pub const SAP_UNAME_STRUCT = @compileError("unable to translate macro: undefined identifier `U16`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1290:11
pub inline fn NUC_UC(name_nuc: anytype, name_uc: anytype) @TypeOf(name_uc) {
    _ = &name_nuc;
    _ = &name_uc;
    return name_uc;
}
pub inline fn NT_CAST(@"type": anytype) @TypeOf(@"type") {
    _ = &@"type";
    return @"type";
}
pub const SAP_U16_PROTOTYPE_HLP = @compileError("unable to translate macro: undefined identifier `_RETURN`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1315:9
pub inline fn SAP_U16_PROTOTYPE_UO_HLP(nameU16: anytype) void {
    _ = &nameU16;
    return;
}
pub inline fn SAP_U16_PROTOTYPE_UX_HLP(nameU16: anytype) void {
    _ = &nameU16;
    return;
}
pub inline fn SAP_U16_PROTOTYPE_STDC_HLP(nameU16: anytype) @TypeOf(BEGIN_NS_STD_C_HEADER ++ SAP_U16_PROTOTYPE_HLP(nameU16)) {
    _ = &nameU16;
    return BEGIN_NS_STD_C_HEADER ++ SAP_U16_PROTOTYPE_HLP(nameU16);
}
pub const SAP_U16_PROTOTYPE_FLIKE_HLP = @compileError("unable to translate macro: undefined identifier `_RETURN`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1331:9
pub const SAP_U16_PROTOTYPE_STAT = @compileError("unable to translate macro: undefined identifier `U16_RETURN`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1334:9
pub const SAP_U16_PROTOTYPE = @compileError("unable to translate macro: undefined identifier `U16`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1335:9
pub const SAP_U16_PROTOTYPE_UO = @compileError("unable to translate macro: undefined identifier `U16`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1336:9
pub const SAP_U16_PROTOTYPE_UX = @compileError("unable to translate macro: undefined identifier `U16`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1337:9
pub const SAP_U16_PROTOTYPE_STDC = @compileError("unable to translate macro: undefined identifier `U16`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1338:9
pub const SAP_U16_PROTOTYPE_FLIKE = @compileError("unable to translate macro: undefined identifier `U16`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1339:9
pub const SAP_U16_PROTOTYPE_UC = @compileError("unable to translate macro: undefined identifier `U16`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1342:11
pub const SAP_U16_PROTOTYPE_UO_UC = @compileError("unable to translate macro: undefined identifier `U16`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1343:11
pub const SAP_U16_PROTOTYPE_STDC_UC = @compileError("unable to translate macro: undefined identifier `U16`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1344:11
pub inline fn U_CHAR(par: anytype) @TypeOf(par) {
    _ = &par;
    return par;
}
pub inline fn SAP_UNUSED_PARAM(name: anytype) void {
    _ = &name;
    return;
}
pub const SAP_USED = "";
pub const SAP_UNUSED = "";
pub const SAP_IDENT_SEC = "";
pub const SAP_IDENT_SEC_U16 = "";
pub const SAP_UNUSED_OPT = "";
pub const SAP_UNUSED_PARAM_OPT = "";
pub const SAP_USED_OPT = "";
pub const SAP_IDENTN = @compileError("unable to translate macro: undefined identifier `U16`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1438:11
pub const SAP_IDENT2N = @compileError("unable to translate macro: undefined identifier `U16`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1441:11
pub const SAP_IDENT3N = @compileError("unable to translate macro: undefined identifier `U16`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1444:11
pub const SAP_IDENT9N = @compileError("unable to translate macro: undefined identifier `U16`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1447:11
pub inline fn strcatR(dest: anytype, src: anytype) @TypeOf(strcat(dest, src)) {
    _ = &dest;
    _ = &src;
    return strcat(dest, src);
}
pub const strcatU16_RETURN = [*c]SAP_UTF16;
pub const strcatU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `dest`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1525:9
pub const strcatU16_PARAMS = @compileError("unable to translate macro: undefined identifier `dest`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1526:9
pub const strcatU = SAP_UNAME(strcat);
pub const strchrR = @compileError("unable to translate C expr: unexpected token 'const'"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1530:9
pub const strchrU16_RETURN = [*c]SAP_UTF16;
pub const strchrU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `wcs`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1532:9
pub const strchrU16_PARAMS = @compileError("unable to translate macro: undefined identifier `wcs`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1533:9
pub inline fn strchrU(s: anytype, c: anytype) @TypeOf(SAP_UNAME(strchr)(s, U_CHAR(c))) {
    _ = &s;
    _ = &c;
    return SAP_UNAME(strchr)(s, U_CHAR(c));
}
pub const strcmpU16_RETURN = c_int;
pub const strcmpU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s1`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1538:9
pub const strcmpU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s1`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1539:9
pub const strcmpU = SAP_UNAME(strcmp);
pub inline fn strcpyR(dest: anytype, src: anytype) @TypeOf(strcpy(dest, src)) {
    _ = &dest;
    _ = &src;
    return strcpy(dest, src);
}
pub const strcpyU16_RETURN = [*c]SAP_UTF16;
pub const strcpyU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `dest`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1545:9
pub const strcpyU16_PARAMS = @compileError("unable to translate macro: undefined identifier `dest`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1546:9
pub const strcpyU = SAP_UNAME(strcpy);
pub const strcspnU16_RETURN = usize;
pub const strcspnU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `ucs`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1551:9
pub const strcspnU16_PARAMS = @compileError("unable to translate macro: undefined identifier `ucs`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1552:9
pub const strcspnU = SAP_UNAME(strcspn);
pub const strdupU16_RETURN = [*c]SAP_UTF16;
pub const strdupU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1557:9
pub const strdupU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1558:9
pub const _strdupU = SAP_UNAME_(strdup);
pub const strdupU = SAP_UNAME_(strdup);
pub const strlenR = @compileError("unable to translate C expr: unexpected token 'const'"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1563:9
pub const strlenU16_RETURN = usize;
pub const strlenU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1565:9
pub const strlenU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1566:9
pub const strlenU = SAP_UNAME(strlen);
pub inline fn strncatR(dest: anytype, src: anytype, n: anytype) @TypeOf(strncat(dest, src, n)) {
    _ = &dest;
    _ = &src;
    _ = &n;
    return strncat(dest, src, n);
}
pub const strncatU16_RETURN = [*c]SAP_UTF16;
pub const strncatU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `dest`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1572:9
pub const strncatU16_PARAMS = @compileError("unable to translate macro: undefined identifier `dest`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1573:9
pub const strncatU = SAP_UNAME(strncat);
pub const strncmpU16_RETURN = c_int;
pub const strncmpU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s1`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1578:9
pub const strncmpU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s1`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1579:9
pub const strncmpU = SAP_UNAME(strncmp);
pub inline fn strncpyR(dest: anytype, src: anytype, n: anytype) @TypeOf(strncpy(dest, src, n)) {
    _ = &dest;
    _ = &src;
    _ = &n;
    return strncpy(dest, src, n);
}
pub const strncpyU16_RETURN = [*c]SAP_UTF16;
pub const strncpyU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `dest`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1585:9
pub const strncpyU16_PARAMS = @compileError("unable to translate macro: undefined identifier `dest`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1586:9
pub const strncpyU = SAP_UNAME(strncpy);
pub const strpbrkU16_RETURN = [*c]SAP_UTF16;
pub const strpbrkU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `ucs`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1591:9
pub const strpbrkU16_PARAMS = @compileError("unable to translate macro: undefined identifier `ucs`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1592:9
pub const strpbrkU = SAP_UNAME(strpbrk);
pub const strrchrR = @compileError("unable to translate C expr: unexpected token 'const'"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1596:9
pub const strrchrU16_RETURN = [*c]SAP_UTF16;
pub const strrchrU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `wcs`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1598:9
pub const strrchrU16_PARAMS = @compileError("unable to translate macro: undefined identifier `wcs`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1599:9
pub inline fn strrchrU(s: anytype, c: anytype) @TypeOf(SAP_UNAME(strrchr)(s, U_CHAR(c))) {
    _ = &s;
    _ = &c;
    return SAP_UNAME(strrchr)(s, U_CHAR(c));
}
pub const strspnU16_RETURN = usize;
pub const strspnU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `ucs`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1604:9
pub const strspnU16_PARAMS = @compileError("unable to translate macro: undefined identifier `ucs`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1605:9
pub const strspnU = SAP_UNAME(strspn);
pub const strstrU16_RETURN = [*c]SAP_UTF16;
pub const strstrU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `haystack`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1610:9
pub const strstrU16_PARAMS = @compileError("unable to translate macro: undefined identifier `haystack`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1611:9
pub const strstrU = SAP_UNAME(strstr);
pub const strtokU16_RETURN = [*c]SAP_UTF16;
pub const strtokU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1616:9
pub const strtokU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1617:9
pub const strtokU = SAP_UNAME(strtok);
pub const strtok_rR = strtok_rRFB;
pub const strtok_rU16_RETURN = [*c]SAP_UTF16;
pub const strtok_rU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1627:9
pub const strtok_rU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1628:9
pub const strtok_rU = SAP_UNAME_UR(strtok_r);
pub const _strdupU16 = _wcsdup;
pub const strtodU16_RETURN = f64;
pub const strtodU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `str`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1688:9
pub const strtodU16_PARAMS = @compileError("unable to translate macro: undefined identifier `str`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1689:9
pub inline fn strtodU(s: anytype, end: anytype) @TypeOf(SAP_UNAME(strtod)(s, end)) {
    _ = &s;
    _ = &end;
    return SAP_UNAME(strtod)(s, end);
}
pub const strtolU16_RETURN = c_long;
pub const strtolU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1694:9
pub const strtolU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1695:9
pub inline fn strtolU(s: anytype, end: anytype, base: anytype) @TypeOf(SAP_UNAME(strtol)(s, end, base)) {
    _ = &s;
    _ = &end;
    _ = &base;
    return SAP_UNAME(strtol)(s, end, base);
}
pub const strtoulU16_RETURN = c_ulong;
pub const strtoulU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1700:9
pub const strtoulU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1701:9
pub inline fn strtoulU(s: anytype, end: anytype, base: anytype) @TypeOf(SAP_UNAME(strtoul)(s, end, base)) {
    _ = &s;
    _ = &end;
    _ = &base;
    return SAP_UNAME(strtoul)(s, end, base);
}
pub const strtollU16_RETURN = c_longlong;
pub const strtollU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1706:9
pub const strtollU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1707:9
pub const strtoullU16_RETURN = c_ulonglong;
pub const strtoullU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1711:9
pub const strtoullU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1712:9
pub inline fn strtollU(s: anytype, end: anytype, base: anytype) @TypeOf(NUC_UC(_strtoi64, strtollU16)(s, end, base)) {
    _ = &s;
    _ = &end;
    _ = &base;
    return NUC_UC(_strtoi64, strtollU16)(s, end, base);
}
pub inline fn strtoullU(s: anytype, end: anytype, base: anytype) @TypeOf(NUC_UC(_strtoui64, strtoullU16)(s, end, base)) {
    _ = &s;
    _ = &end;
    _ = &base;
    return NUC_UC(_strtoui64, strtoullU16)(s, end, base);
}
pub const strcasecmpU16_RETURN = c_int;
pub const strcasecmpU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s1`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1746:9
pub const strcasecmpU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s1`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1747:9
pub inline fn strcasecmpU(s1: anytype, s2: anytype) @TypeOf(SAP_UNAME_UR(strcasecmp)(s1, s2)) {
    _ = &s1;
    _ = &s2;
    return SAP_UNAME_UR(strcasecmp)(s1, s2);
}
pub const strncasecmpU16_RETURN = c_int;
pub const strncasecmpU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s1`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1753:9
pub const strncasecmpU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s1`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1754:9
pub inline fn strncasecmpU(s1: anytype, s2: anytype, n: anytype) @TypeOf(SAP_UNAME_UR(strncasecmp)(s1, s2, n)) {
    _ = &s1;
    _ = &s2;
    _ = &n;
    return SAP_UNAME_UR(strncasecmp)(s1, s2, n);
}
pub inline fn _strcmpiU(s1: anytype, s2: anytype) @TypeOf(NUC_UC(_strcmpi, _wcsicmp)(s1, s2)) {
    _ = &s1;
    _ = &s2;
    return NUC_UC(_strcmpi, _wcsicmp)(s1, s2);
}
pub inline fn strcmpiU(s1: anytype, s2: anytype) @TypeOf(NUC_UC(_strcmpi, _wcsicmp)(s1, s2)) {
    _ = &s1;
    _ = &s2;
    return NUC_UC(_strcmpi, _wcsicmp)(s1, s2);
}
pub inline fn _stricmpU(s1: anytype, s2: anytype) @TypeOf(NUC_UC(_stricmp, _wcsicmp)(s1, s2)) {
    _ = &s1;
    _ = &s2;
    return NUC_UC(_stricmp, _wcsicmp)(s1, s2);
}
pub inline fn stricmpU(s1: anytype, s2: anytype) @TypeOf(NUC_UC(_stricmp, _wcsicmp)(s1, s2)) {
    _ = &s1;
    _ = &s2;
    return NUC_UC(_stricmp, _wcsicmp)(s1, s2);
}
pub inline fn _strnicmpU(s1: anytype, s2: anytype, n: anytype) @TypeOf(NUC_UC(_strnicmp, _wcsnicmp)(s1, s2, n)) {
    _ = &s1;
    _ = &s2;
    _ = &n;
    return NUC_UC(_strnicmp, _wcsnicmp)(s1, s2, n);
}
pub inline fn strnicmpU(s1: anytype, s2: anytype, n: anytype) @TypeOf(NUC_UC(_strnicmp, _wcsnicmp)(s1, s2, n)) {
    _ = &s1;
    _ = &s2;
    _ = &n;
    return NUC_UC(_strnicmp, _wcsnicmp)(s1, s2, n);
}
pub const atoiU16 = @compileError("unable to translate C expr: expected ')' instead got '*'"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1810:11
pub const atofU16 = @compileError("unable to translate C expr: expected ')' instead got '*'"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1811:11
pub const atolU16 = @compileError("unable to translate C expr: expected ')' instead got '*'"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1812:11
pub inline fn atollU16(s: anytype) @TypeOf(_wtoi64(s)) {
    _ = &s;
    return _wtoi64(s);
}
pub inline fn atoiU(s: anytype) @TypeOf(SAP_UNAME(atoi)(s)) {
    _ = &s;
    return SAP_UNAME(atoi)(s);
}
pub inline fn atofU(s: anytype) @TypeOf(SAP_UNAME(atof)(s)) {
    _ = &s;
    return SAP_UNAME(atof)(s);
}
pub inline fn atolU(s: anytype) @TypeOf(SAP_UNAME(atol)(s)) {
    _ = &s;
    return SAP_UNAME(atol)(s);
}
pub inline fn atollU(s: anytype) @TypeOf(NUC_UC(_atoi64, atollU16)(s)) {
    _ = &s;
    return NUC_UC(_atoi64, atollU16)(s);
}
pub const mallocR = malloc;
pub inline fn mallocU16(len: anytype) [*c]SAP_UTF16 {
    _ = &len;
    return __helpers.cast([*c]SAP_UTF16, malloc(len * sizeofR(SAP_UTF16)));
}
pub inline fn mallocU(len: anytype) @TypeOf(SAP_UNAME_MEM_RET(malloc)(len)) {
    _ = &len;
    return SAP_UNAME_MEM_RET(malloc)(len);
}
pub const reallocR = realloc;
pub inline fn reallocU16(s: anytype, len: anytype) [*c]SAP_UTF16 {
    _ = &s;
    _ = &len;
    return __helpers.cast([*c]SAP_UTF16, realloc(s, len * sizeofR(SAP_UTF16)));
}
pub inline fn reallocU(s: anytype, len: anytype) @TypeOf(SAP_UNAME_MEM_RET(realloc)(s, len)) {
    _ = &s;
    _ = &len;
    return SAP_UNAME_MEM_RET(realloc)(s, len);
}
pub const callocR = calloc;
pub inline fn callocU16(num: anytype, len: anytype) [*c]SAP_UTF16 {
    _ = &num;
    _ = &len;
    return __helpers.cast([*c]SAP_UTF16, calloc(num, len * sizeofR(SAP_UTF16)));
}
pub inline fn callocU(number: anytype, len: anytype) @TypeOf(SAP_UNAME_MEM_RET(calloc)(number, len)) {
    _ = &number;
    _ = &len;
    return SAP_UNAME_MEM_RET(calloc)(number, len);
}
pub const memcmpR = memcmp;
pub const memcmpU16_RETURN = c_int;
pub const memcmpU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s1`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1882:9
pub const memcmpU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s1`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1883:9
pub inline fn memcmpU(s1: anytype, s2: anytype, len: anytype) @TypeOf(SAP_UNAME_UR(memcmp)(s1, s2, len)) {
    _ = &s1;
    _ = &s2;
    _ = &len;
    return SAP_UNAME_UR(memcmp)(s1, s2, len);
}
pub const memcpyR = memcpy;
pub inline fn memcpyU(s1: anytype, s2: anytype, len: anytype) @TypeOf(SAP_UNAME_MEM_RET(memcpy)(s1, s2, len)) {
    _ = &s1;
    _ = &s2;
    _ = &len;
    return SAP_UNAME_MEM_RET(memcpy)(s1, s2, len);
}
pub const memmoveR = memmove;
pub inline fn memmoveU(s1: anytype, s2: anytype, len: anytype) @TypeOf(SAP_UNAME_MEM_RET(memmove)(s1, s2, len)) {
    _ = &s1;
    _ = &s2;
    _ = &len;
    return SAP_UNAME_MEM_RET(memmove)(s1, s2, len);
}
pub const memchrR = memchr;
pub const memchrU16_RETURN = [*c]SAP_UTF16;
pub const memchrU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1894:9
pub const memchrU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1895:9
pub inline fn memchrU(s: anytype, c: anytype, len: anytype) @TypeOf(SAP_UNAME_MEM_RET(memchr)(s, U_CHAR(c), len)) {
    _ = &s;
    _ = &c;
    _ = &len;
    return SAP_UNAME_MEM_RET(memchr)(s, U_CHAR(c), len);
}
pub const memsetU_GCC = @compileError("unable to translate macro: undefined identifier `_mr`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1899:9
pub const memsetR = memset;
pub const memsetU16_RETURN = [*c]SAP_UTF16;
pub const memsetU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1907:9
pub const memsetU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:1908:9
pub inline fn memsetU(s: anytype, c: anytype, len: anytype) @TypeOf(SAP_UNAME_MEM_RET(memset)(s, U_CHAR(c), len)) {
    _ = &s;
    _ = &c;
    _ = &len;
    return SAP_UNAME_MEM_RET(memset)(s, U_CHAR(c), len);
}
pub inline fn memcpyU16(s1: anytype, s2: anytype, len: anytype) @TypeOf(wmemcpy(s1, s2, len)) {
    _ = &s1;
    _ = &s2;
    _ = &len;
    return wmemcpy(s1, s2, len);
}
pub inline fn memmoveU16(s1: anytype, s2: anytype, len: anytype) @TypeOf(wmemmove(s1, s2, len)) {
    _ = &s1;
    _ = &s2;
    _ = &len;
    return wmemmove(s1, s2, len);
}
pub const accessU16_RETURN = c_int;
pub const accessU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `path`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2047:9
pub const accessU16_PARAMS = @compileError("unable to translate macro: undefined identifier `path`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2048:9
pub const accessU = @compileError("unable to translate macro: undefined identifier `access`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2050:9
pub const chdirU16_RETURN = c_int;
pub const chdirU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `path`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2053:9
pub const chdirU16_PARAMS = @compileError("unable to translate macro: undefined identifier `path`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2054:9
pub const chdirU = @compileError("unable to translate macro: undefined identifier `chdir`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2056:9
pub const fdopenU16_RETURN = [*c]FILE;
pub const fdopenU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `filedes`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2059:9
pub const fdopenU16_PARAMS = @compileError("unable to translate macro: undefined identifier `filedes`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2060:9
pub inline fn fdopenU(filedes: anytype, @"type": anytype) @TypeOf(SAP_UNAME_(fdopen)(filedes, @"type")) {
    _ = &filedes;
    _ = &@"type";
    return SAP_UNAME_(fdopen)(filedes, @"type");
}
pub const fopenU16_RETURN = [*c]FILE;
pub const fopenU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `path`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2065:9
pub const fopenU16_PARAMS = @compileError("unable to translate macro: undefined identifier `path`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2066:9
pub inline fn fopenU(path: anytype, mode: anytype) @TypeOf(SAP_UNAME(fopen)(path, mode)) {
    _ = &path;
    _ = &mode;
    return SAP_UNAME(fopen)(path, mode);
}
pub const freopenU16_RETURN = [*c]FILE;
pub const freopenU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `path`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2089:9
pub const freopenU16_PARAMS = @compileError("unable to translate macro: undefined identifier `path`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2091:9
pub inline fn freopenU(path: anytype, mode: anytype, stream: anytype) @TypeOf(SAP_UNAME(freopen)(path, mode, stream)) {
    _ = &path;
    _ = &mode;
    _ = &stream;
    return SAP_UNAME(freopen)(path, mode, stream);
}
pub const gethostnameU16_RETURN = c_int;
pub const gethostnameU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `name`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2105:9
pub const gethostnameU16_PARAMS = @compileError("unable to translate macro: undefined identifier `name`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2106:9
pub const gethostnameU = @compileError("unable to translate macro: undefined identifier `gethostname`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2108:9
pub const openU16_RETURN = c_int;
pub const openU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `wpath`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2111:9
pub const openU16_PARAMS = @compileError("unable to translate macro: undefined identifier `wpath`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2112:9
pub const openU = @compileError("unable to translate macro: undefined identifier `open`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2114:9
pub const _openU = openU;
pub const perrorU16_RETURN = anyopaque;
pub const perrorU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `program`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2118:9
pub const perrorU16_PARAMS = @compileError("unable to translate macro: undefined identifier `program`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2119:9
pub inline fn perrorU(program: anytype) @TypeOf(SAP_UNAME(perror)(program)) {
    _ = &program;
    return SAP_UNAME(perror)(program);
}
pub const popenU16_RETURN = [*c]FILE;
pub const popenU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `wcomm`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2124:9
pub const popenU16_PARAMS = @compileError("unable to translate macro: undefined identifier `wcomm`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2125:9
pub inline fn popenU(command: anytype, @"type": anytype) @TypeOf(SAP_UNAME_(popen)(command, @"type")) {
    _ = &command;
    _ = &@"type";
    return SAP_UNAME_(popen)(command, @"type");
}
pub inline fn _popenU(command: anytype, @"type": anytype) @TypeOf(popenU(command, @"type")) {
    _ = &command;
    _ = &@"type";
    return popenU(command, @"type");
}
pub const removeU16_RETURN = c_int;
pub const removeU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `path`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2131:9
pub const removeU16_PARAMS = @compileError("unable to translate macro: undefined identifier `path`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2132:9
pub inline fn removeU(path: anytype) @TypeOf(SAP_UNAME(remove)(path)) {
    _ = &path;
    return SAP_UNAME(remove)(path);
}
pub const renameU16_RETURN = c_int;
pub const renameU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `from`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2137:9
pub const renameU16_PARAMS = @compileError("unable to translate macro: undefined identifier `from`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2138:9
pub inline fn renameU(from: anytype, to: anytype) @TypeOf(SAP_UNAME(rename)(from, to)) {
    _ = &from;
    _ = &to;
    return SAP_UNAME(rename)(from, to);
}
pub const rmdirU16_RETURN = c_int;
pub const rmdirU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `wpath`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2143:9
pub const rmdirU16_PARAMS = @compileError("unable to translate macro: undefined identifier `wpath`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2144:9
pub const rmdirU = @compileError("unable to translate macro: undefined identifier `rmdir`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2146:9
pub const systemU16_RETURN = c_int;
pub const systemU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2149:9
pub const systemU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2150:9
pub inline fn systemU(s: anytype) @TypeOf(SAP_UNAME(system)(s)) {
    _ = &s;
    return SAP_UNAME(system)(s);
}
pub const strftimeU16_RETURN = usize;
pub const strftimeU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `wcs`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2158:9
pub const strftimeU16_PARAMS = @compileError("unable to translate macro: undefined identifier `wcs`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2160:9
pub const strftimeU = @compileError("unable to translate macro: undefined identifier `strftime`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2162:9
pub const unlinkU16_RETURN = c_int;
pub const unlinkU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `path`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2166:9
pub const unlinkU16_PARAMS = @compileError("unable to translate macro: undefined identifier `path`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2167:9
pub inline fn unlinkU(path: anytype) @TypeOf(SAP_UNAME_(unlink)(path)) {
    _ = &path;
    return SAP_UNAME_(unlink)(path);
}
pub inline fn _unlinkU(path: anytype) @TypeOf(unlinkU(path)) {
    _ = &path;
    return unlinkU(path);
}
pub const utimeU16_RETURN = c_int;
pub const utimeU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `wpath`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2174:9
pub const utimeU16_PARAMS = @compileError("unable to translate macro: undefined identifier `wpath`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2175:9
pub inline fn utimeU(path: anytype, time: anytype) @TypeOf(SAP_UNAME_(utime)(path, time)) {
    _ = &path;
    _ = &time;
    return SAP_UNAME_(utime)(path, time);
}
pub inline fn SAP_U16_PROTOTYPE_MODE_T(name: anytype) void {
    _ = &name;
    return;
}
pub const chmodU16_RETURN = c_int;
pub const chmodU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `wpath`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2186:9
pub const chmodU16_PARAMS = @compileError("unable to translate macro: undefined identifier `wpath`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2187:9
pub const chmodU = @compileError("unable to translate macro: undefined identifier `chmod`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2189:9
pub inline fn _chmodU(wpath: anytype, mode: anytype) @TypeOf(chmodU(wpath, mode)) {
    _ = &wpath;
    _ = &mode;
    return chmodU(wpath, mode);
}
pub const creatU16_RETURN = c_int;
pub const creatU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `wpath`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2193:9
pub const creatU16_PARAMS = @compileError("unable to translate macro: undefined identifier `wpath`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2194:9
pub const creatU = @compileError("unable to translate macro: undefined identifier `creat`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2196:9
pub const mkdirU16_RETURN = c_int;
pub const mkdirU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `wpath`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2199:9
pub const mkdirU16_PARAMS = @compileError("unable to translate macro: undefined identifier `wpath`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2200:9
pub const _mkdirU = @compileError("unable to translate macro: undefined identifier `_mkdir`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2203:11
pub const chmodU16 = _wchmod;
pub const creatU16 = _wcreat;
pub const _mkdirU16 = _wmkdir;
pub const asctimeU16_RETURN = [*c]SAP_UTF16;
pub const asctimeU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `timeptr`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2291:9
pub const asctimeU16_PARAMS = @compileError("unable to translate macro: undefined identifier `timeptr`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2292:9
pub const asctimeU = @compileError("unable to translate macro: undefined identifier `asctime`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2294:9
pub const asctime_rU16_RETURN = [*c]SAP_UTF16;
pub const asctime_rU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `timeptr`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2297:9
pub const asctime_rU16_PARAMS = @compileError("unable to translate macro: undefined identifier `timeptr`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2298:9
pub inline fn asctime_rU(timeptr: anytype, bufptr: anytype) @TypeOf(SAP_UNAME(asctime_r)(timeptr, bufptr)) {
    _ = &timeptr;
    _ = &bufptr;
    return SAP_UNAME(asctime_r)(timeptr, bufptr);
}
pub const basenameU16_RETURN = [*c]SAP_UTF16;
pub const basenameU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `path`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2305:9
pub const basenameU16_PARAMS = @compileError("unable to translate macro: undefined identifier `path`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2306:9
pub const basenameU = @compileError("unable to translate macro: undefined identifier `basename`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2308:9
pub const ctimeU16_RETURN = [*c]SAP_UTF16;
pub const ctimeU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `timer`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2315:9
pub const ctimeU16_PARAMS = @compileError("unable to translate macro: undefined identifier `timer`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2316:9
pub const ctimeU = @compileError("unable to translate macro: undefined identifier `ctime`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2318:9
pub const ctime_rU16_RETURN = [*c]SAP_UTF16;
pub const ctime_rU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `timer`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2321:9
pub const ctime_rU16_PARAMS = @compileError("unable to translate macro: undefined identifier `timer`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2322:9
pub inline fn ctime_rU(timer: anytype, bufptr: anytype) @TypeOf(SAP_UNAME(ctime_r)(timer, bufptr)) {
    _ = &timer;
    _ = &bufptr;
    return SAP_UNAME(ctime_r)(timer, bufptr);
}
pub const dirnameU16_RETURN = [*c]SAP_UTF16;
pub const dirnameU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `path`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2329:9
pub const dirnameU16_PARAMS = @compileError("unable to translate macro: undefined identifier `path`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2330:9
pub const dirnameU = @compileError("unable to translate macro: undefined identifier `dirname`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2332:9
pub const ecvtU16_RETURN = [*c]SAP_UTF16;
pub const ecvtU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `value`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2339:9
pub const ecvtU16_PARAMS = @compileError("unable to translate macro: undefined identifier `value`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2340:9
pub inline fn ecvtU(value: anytype, ndig: anytype, dptr: anytype, sign: anytype) @TypeOf(SAP_UNAME_(ecvt)(value, ndig, dptr, sign)) {
    _ = &value;
    _ = &ndig;
    _ = &dptr;
    _ = &sign;
    return SAP_UNAME_(ecvt)(value, ndig, dptr, sign);
}
pub const getcwdU16_RETURN = [*c]SAP_UTF16;
pub const getcwdU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `wbuf`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2350:9
pub const getcwdU16_PARAMS = @compileError("unable to translate macro: undefined identifier `wbuf`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2351:9
pub const getcwdU = @compileError("unable to translate macro: undefined identifier `getcwd`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2353:9
pub const setlocaleU16_RETURN = [*c]SAP_UTF16;
pub const setlocaleU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `category`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2364:9
pub const setlocaleU16_PARAMS = @compileError("unable to translate macro: undefined identifier `category`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2365:9
pub const setlocaleU = @compileError("unable to translate macro: undefined identifier `setlocale`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2367:9
pub const strerrorU16_RETURN = [*c]SAP_UTF16;
pub const strerrorU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `errnum`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2370:9
pub const strerrorU16_PARAMS = @compileError("unable to translate macro: undefined identifier `errnum`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2371:9
pub inline fn strerrorU(errnum: anytype) @TypeOf(SAP_UNAME(strerror)(errnum)) {
    _ = &errnum;
    return SAP_UNAME(strerror)(errnum);
}
pub const strerror_rU16_RETURN = c_int;
pub const strerror_rU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `errnum`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2376:9
pub const strerror_rU16_PARAMS = @compileError("unable to translate macro: undefined identifier `errnum`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2377:9
pub inline fn strerror_rU(errnum: anytype, buf: anytype, buflen: anytype) @TypeOf(SAP_UNAME(strerror_r)(errnum, buf, buflen)) {
    _ = &errnum;
    _ = &buf;
    _ = &buflen;
    return SAP_UNAME(strerror_r)(errnum, buf, buflen);
}
pub const ttynameU16_RETURN = [*c]SAP_UTF16;
pub const ttynameU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `filedes`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2387:9
pub const ttynameU16_PARAMS = @compileError("unable to translate macro: undefined identifier `filedes`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2388:9
pub const ttynameU = @compileError("unable to translate macro: undefined identifier `ttyname`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2390:9
pub const _WINSOCK_DEPRECATED_NO_WARNINGS = "";
pub inline fn asctime_rU16(timeptr: anytype, bufptr: anytype) @TypeOf(bufptr) {
    _ = &timeptr;
    _ = &bufptr;
    return blk_1: {
        _ = _wasctime_s(bufptr, @as(c_int, 26), timeptr);
        break :blk_1 bufptr;
    };
}
pub const asctime_r = @compileError("unable to translate macro: undefined identifier `asctime_s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2398:11
pub inline fn ctime_rU16(timeptr: anytype, bufptr: anytype) @TypeOf(bufptr) {
    _ = &timeptr;
    _ = &bufptr;
    return blk_1: {
        _ = _wctime_s(bufptr, @as(c_int, 26), timeptr);
        break :blk_1 bufptr;
    };
}
pub const ctime_r = @compileError("unable to translate macro: undefined identifier `ctime_s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2403:11
pub inline fn strerror_r(errnum: anytype, buf: anytype, buflen: anytype) @TypeOf(strerror_s(buf, buflen, errnum)) {
    _ = &errnum;
    _ = &buf;
    _ = &buflen;
    return strerror_s(buf, buflen, errnum);
}
pub inline fn fgetcR(stream: anytype) @TypeOf(fgetc(stream)) {
    _ = &stream;
    return fgetc(stream);
}
pub const fgetcU16_RETURN = c_int;
pub const fgetcU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `stream`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2460:9
pub const fgetcU16_PARAMS = @compileError("unable to translate macro: undefined identifier `stream`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2461:9
pub inline fn fgetcU(stream: anytype) @TypeOf(SAP_UNAME(fgetc)(stream)) {
    _ = &stream;
    return SAP_UNAME(fgetc)(stream);
}
pub inline fn getcR(stream: anytype) @TypeOf(getc(stream)) {
    _ = &stream;
    return getc(stream);
}
pub inline fn getcU(stream: anytype) @TypeOf(NUC_UC(getc, fgetcU16)(stream)) {
    _ = &stream;
    return NUC_UC(getc, fgetcU16)(stream);
}
pub inline fn fputcR(rawdata: anytype, stream: anytype) @TypeOf(fputc(rawdata, stream)) {
    _ = &rawdata;
    _ = &stream;
    return fputc(rawdata, stream);
}
pub const fputcU16_RETURN = c_int;
pub const fputcU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `wc`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2470:9
pub const fputcU16_PARAMS = @compileError("unable to translate macro: undefined identifier `wc`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2471:9
pub inline fn fputcU(c: anytype, stream: anytype) @TypeOf(SAP_UNAME(fputc)(c, stream)) {
    _ = &c;
    _ = &stream;
    return SAP_UNAME(fputc)(c, stream);
}
pub inline fn putcR(rawdata: anytype, stream: anytype) @TypeOf(putc(rawdata, stream)) {
    _ = &rawdata;
    _ = &stream;
    return putc(rawdata, stream);
}
pub inline fn putcU(c: anytype, stream: anytype) @TypeOf(NUC_UC(putc, fputcU16)(c, stream)) {
    _ = &c;
    _ = &stream;
    return NUC_UC(putc, fputcU16)(c, stream);
}
pub inline fn fwriteR(rawdata: anytype, s: anytype, n: anytype, stream: anytype) @TypeOf(fwrite(rawdata, s, n, stream)) {
    _ = &rawdata;
    _ = &s;
    _ = &n;
    _ = &stream;
    return fwrite(rawdata, s, n, stream);
}
pub inline fn fwriteU(buf: anytype, s: anytype, n: anytype, stream: anytype) @TypeOf(SAP_UNAME(fwrite)(buf, s, n, stream)) {
    _ = &buf;
    _ = &s;
    _ = &n;
    _ = &stream;
    return SAP_UNAME(fwrite)(buf, s, n, stream);
}
pub inline fn freadR(rawdata: anytype, s: anytype, n: anytype, stream: anytype) @TypeOf(fread(rawdata, s, n, stream)) {
    _ = &rawdata;
    _ = &s;
    _ = &n;
    _ = &stream;
    return fread(rawdata, s, n, stream);
}
pub const freadU16_RETURN = usize;
pub const freadU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `buf`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2484:9
pub const freadU16_PARAMS = @compileError("unable to translate macro: undefined identifier `buf`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2485:9
pub inline fn freadU(buf: anytype, s: anytype, n: anytype, stream: anytype) @TypeOf(SAP_UNAME(fread)(buf, s, n, stream)) {
    _ = &buf;
    _ = &s;
    _ = &n;
    _ = &stream;
    return SAP_UNAME(fread)(buf, s, n, stream);
}
pub inline fn fgetsR(s: anytype, n: anytype, stream: anytype) @TypeOf(fgets(__helpers.cast([*c]u8, s), n, stream)) {
    _ = &s;
    _ = &n;
    _ = &stream;
    return fgets(__helpers.cast([*c]u8, s), n, stream);
}
pub const fgetsU16_RETURN = [*c]SAP_UTF16;
pub const fgetsU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `wcs`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2503:9
pub const fgetsU16_PARAMS = @compileError("unable to translate macro: undefined identifier `wcs`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2504:9
pub inline fn fgetsU(s: anytype, n: anytype, stream: anytype) @TypeOf(SAP_UNAME(fgets)(s, n, stream)) {
    _ = &s;
    _ = &n;
    _ = &stream;
    return SAP_UNAME(fgets)(s, n, stream);
}
pub inline fn getsR(s: anytype) @TypeOf(gets(s)) {
    _ = &s;
    return gets(s);
}
pub const getsU16_RETURN = [*c]SAP_UTF16;
pub const getsU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2510:9
pub const getsU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2511:9
pub inline fn getsU(s: anytype) @TypeOf(SAP_UNAME(gets)(s)) {
    _ = &s;
    return SAP_UNAME(gets)(s);
}
pub inline fn fputsR(s: anytype, stream: anytype) @TypeOf(fputs(s, stream)) {
    _ = &s;
    _ = &stream;
    return fputs(s, stream);
}
pub const fputsU16_RETURN = intU;
pub const fputsU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `wcs`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2517:9
pub const fputsU16_PARAMS = @compileError("unable to translate macro: undefined identifier `wcs`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2518:9
pub inline fn fputsU(s: anytype, stream: anytype) @TypeOf(SAP_UNAME(fputs)(s, stream)) {
    _ = &s;
    _ = &stream;
    return SAP_UNAME(fputs)(s, stream);
}
pub const putsR = @compileError("unable to translate macro: undefined identifier `stream`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2522:9
pub const putsU16_RETURN = intU;
pub const putsU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `wcs`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2524:9
pub const putsU16_PARAMS = @compileError("unable to translate macro: undefined identifier `wcs`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2525:9
pub inline fn putsU(s: anytype) @TypeOf(SAP_UNAME(puts)(s)) {
    _ = &s;
    return SAP_UNAME(puts)(s);
}
pub inline fn getcharU() @TypeOf(getcU(stdin)) {
    return getcU(stdin);
}
pub inline fn putcharU(c: anytype) @TypeOf(putcU(c, stdout)) {
    _ = &c;
    return putcU(c, stdout);
}
pub inline fn setvbufR(stream: anytype, buf: anytype, m: anytype, n: anytype) @TypeOf(setvbuf(stream, __helpers.cast([*c]u8, buf), m, n)) {
    _ = &stream;
    _ = &buf;
    _ = &m;
    _ = &n;
    return setvbuf(stream, __helpers.cast([*c]u8, buf), m, n);
}
pub inline fn setvbufU16(stream: anytype, buf: anytype, mod: anytype, n: anytype) @TypeOf(setvbuf(stream, __helpers.cast([*c]u8, buf), mod, n * SAP_UC_LN)) {
    _ = &stream;
    _ = &buf;
    _ = &mod;
    _ = &n;
    return setvbuf(stream, __helpers.cast([*c]u8, buf), mod, n * SAP_UC_LN);
}
pub inline fn setvbufU(stream: anytype, buf: anytype, mod: anytype, n: anytype) @TypeOf(SAP_UNAME(setvbuf)(stream, buf, mod, n)) {
    _ = &stream;
    _ = &buf;
    _ = &mod;
    _ = &n;
    return SAP_UNAME(setvbuf)(stream, buf, mod, n);
}
pub const printfU16_RETURN = c_int;
pub const printfU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `format`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2560:9
pub const printfU16_PARAMS = @compileError("unable to translate macro: undefined identifier `format`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2561:9
pub const printfU = SAP_UNAME(printf);
pub const fprintfU16_RETURN = c_int;
pub const fprintfU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2568:9
pub const fprintfU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2569:9
pub const fprintfU = SAP_UNAME(fprintf);
pub const sprintfU16_RETURN = intU;
pub const sprintfU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2576:9
pub const sprintfU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2577:9
pub const sprintfU = SAP_UNAME(sprintf);
pub const snprintfU16_RETURN = intU;
pub const snprintfU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2584:9
pub const snprintfU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2585:9
pub const SAP_U16_PROTOTYPE_STDC_VALIST = @compileError("unable to translate macro: undefined identifier `U16`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2591:11
pub const vprintfU16_RETURN = c_int;
pub const vprintfU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `format`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2597:9
pub const vprintfU16_PARAMS = @compileError("unable to translate macro: undefined identifier `format`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2598:9
pub inline fn vprintfU(p1: anytype, p2: anytype) @TypeOf(SAP_UNAME(vprintf)(p1, p2)) {
    _ = &p1;
    _ = &p2;
    return SAP_UNAME(vprintf)(p1, p2);
}
pub const vfprintfU16_RETURN = c_int;
pub const vfprintfU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2603:9
pub const vfprintfU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2604:9
pub inline fn vfprintfU(p1: anytype, p2: anytype, p3: anytype) @TypeOf(SAP_UNAME(vfprintf)(p1, p2, p3)) {
    _ = &p1;
    _ = &p2;
    _ = &p3;
    return SAP_UNAME(vfprintf)(p1, p2, p3);
}
pub const vsprintfU16_RETURN = intU;
pub const vsprintfU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2609:9
pub const vsprintfU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2610:9
pub inline fn vsprintfU(p1: anytype, p2: anytype, p3: anytype) @TypeOf(SAP_UNAME(vsprintf)(p1, p2, p3)) {
    _ = &p1;
    _ = &p2;
    _ = &p3;
    return SAP_UNAME(vsprintf)(p1, p2, p3);
}
pub const vsprintf_sR = vsprintf_sRFB;
pub const vsprintf_sU16_RETURN = intU;
pub const vsprintf_sU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2617:9
pub const vsprintf_sU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2618:9
pub inline fn vsprintf_sU(p1: anytype, p2: anytype, p3: anytype, p4: anytype) @TypeOf(SAP_UNAME_UR(vsprintf_s)(p1, p2, p3, p4)) {
    _ = &p1;
    _ = &p2;
    _ = &p3;
    _ = &p4;
    return SAP_UNAME_UR(vsprintf_s)(p1, p2, p3, p4);
}
pub const vsnprintfU16_RETURN = intU;
pub const vsnprintfU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2623:9
pub const vsnprintfU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2624:9
pub const vsnprintf_sR = vsnprintf_sRFB;
pub const vsnprintf_sU16_RETURN = intU;
pub const vsnprintf_sU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2630:9
pub const vsnprintf_sU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2631:9
pub inline fn vsnprintf_sU(p1: anytype, p2: anytype, p3: anytype, p4: anytype) @TypeOf(SAP_UNAME_UR(vsnprintf_s)(p1, p2, p3, p4)) {
    _ = &p1;
    _ = &p2;
    _ = &p3;
    _ = &p4;
    return SAP_UNAME_UR(vsnprintf_s)(p1, p2, p3, p4);
}
pub const sscanfU16_RETURN = c_int;
pub const sscanfU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2636:9
pub const sscanfU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2637:9
pub const sscanfU = SAP_UNAME(sscanf);
pub const scanfU16_RETURN = c_int;
pub const scanfU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `format`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2645:9
pub const scanfU16_PARAMS = @compileError("unable to translate macro: undefined identifier `format`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2646:9
pub const scanfU = SAP_UNAME(scanf);
pub const fscanfU16_RETURN = c_int;
pub const fscanfU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2654:9
pub const fscanfU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2655:9
pub const fscanfU = SAP_UNAME(fscanf);
pub const snprintfU = SAP_UNAME_(snprintf);
pub inline fn vsnprintfU(p1: anytype, p2: anytype, p3: anytype, p4: anytype) @TypeOf(SAP_UNAME_(vsnprintf)(p1, p2, p3, p4)) {
    _ = &p1;
    _ = &p2;
    _ = &p3;
    _ = &p4;
    return SAP_UNAME_(vsnprintf)(p1, p2, p3, p4);
}
pub const fget_strU16_RETURN = c_int;
pub const fget_strU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2690:9
pub const fget_strU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2692:9
pub const fget_strU = @compileError("unable to translate macro: undefined identifier `fget_str`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2694:9
pub const fget_lineU16_RETURN = c_int;
pub const fget_lineU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2698:9
pub const fget_lineU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2700:9
pub const fget_lineU = @compileError("unable to translate macro: undefined identifier `fget_line`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2702:9
pub const fget_longU16_RETURN = c_int;
pub const fget_longU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `ptr`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2706:9
pub const fget_longU16_PARAMS = @compileError("unable to translate macro: undefined identifier `ptr`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2707:9
pub const fget_longU = @compileError("unable to translate macro: undefined identifier `fget_long`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2709:9
pub const fget_intU16_RETURN = c_int;
pub const fget_intU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `ptr`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2713:9
pub const fget_intU16_PARAMS = @compileError("unable to translate macro: undefined identifier `ptr`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2714:9
pub const fget_intU = @compileError("unable to translate macro: undefined identifier `fget_int`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2716:9
pub const execlU16_RETURN = c_int;
pub const execlU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `path`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2725:9
pub const execlU16_PARAMS = @compileError("unable to translate macro: undefined identifier `path`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2726:9
pub const execlU = @compileError("unable to translate macro: undefined identifier `execl`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2728:9
pub const execleU16_RETURN = c_int;
pub const execleU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `path`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2731:9
pub const execleU16_PARAMS = @compileError("unable to translate macro: undefined identifier `path`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2732:9
pub const execleU = @compileError("unable to translate macro: undefined identifier `execle`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2734:9
pub const execlpU16_RETURN = c_int;
pub const execlpU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `file`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2737:9
pub const execlpU16_PARAMS = @compileError("unable to translate macro: undefined identifier `file`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2738:9
pub const execlpU = @compileError("unable to translate macro: undefined identifier `execlp`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2740:9
pub const execvU16_RETURN = c_int;
pub const execvU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `path`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2743:9
pub const execvU16_PARAMS = @compileError("unable to translate macro: undefined identifier `path`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2744:9
pub const execvU = @compileError("unable to translate macro: undefined identifier `execv`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2746:9
pub const execveU16_RETURN = c_int;
pub const execveU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `path`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2749:9
pub const execveU16_PARAMS = @compileError("unable to translate macro: undefined identifier `path`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2751:9
pub const execveU = @compileError("unable to translate macro: undefined identifier `execve`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2753:9
pub const execvpU16_RETURN = c_int;
pub const execvpU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `path`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2756:9
pub const execvpU16_PARAMS = @compileError("unable to translate macro: undefined identifier `path`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2757:9
pub const execvpU = @compileError("unable to translate macro: undefined identifier `execvp`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2759:9
pub const execlU16 = _wexecl;
pub const execleU16 = _wexecle;
pub const execlpU16 = _wexeclp;
pub const execvU16 = _wexecv;
pub const execveU16 = _wexecve;
pub const execvpU16 = _wexecvp;
pub const getenvU16_RETURN = [*c]SAP_UTF16;
pub const getenvU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `wname`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2806:9
pub const getenvU16_PARAMS = @compileError("unable to translate macro: undefined identifier `wname`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2807:9
pub inline fn getenvU(name: anytype) @TypeOf(SAP_UNAME(getenv)(name)) {
    _ = &name;
    return SAP_UNAME(getenv)(name);
}
pub const putenvU16_RETURN = c_int;
pub const putenvU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `wcs`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2812:9
pub const putenvU16_PARAMS = @compileError("unable to translate macro: undefined identifier `wcs`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2813:9
pub inline fn putenvU(s: anytype) @TypeOf(SAP_UNAME_(putenv)(s)) {
    _ = &s;
    return SAP_UNAME_(putenv)(s);
}
pub inline fn _putenvU(s: anytype) @TypeOf(putenvU(s)) {
    _ = &s;
    return putenvU(s);
}
pub const environU = SAP_UNAME_UR(environ);
pub const DECLAREenvironU = @compileError("unable to translate macro: undefined identifier `DECLAREenviron`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2832:9
pub const GETenvironU = @compileError("unable to translate macro: undefined identifier `GETenviron`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2833:9
pub const FREEenvironU = @compileError("unable to translate macro: undefined identifier `FREEenviron`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2834:9
pub const environU16 = _wenviron;
pub const DECLAREenvironU16 = @compileError("unable to translate macro: undefined identifier `sapu16cu_env_unused_var`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2838:11
pub const GETenvironU16 = _wenviron;
pub const FREEenvironU16 = @as(c_int, 1);
pub const environR = environ;
pub const DECLAREenvironR = @compileError("unable to translate macro: undefined identifier `sapu16cr_env_unused_var`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2861:11
pub const GETenvironR = environ;
pub const FREEenvironR = @as(c_int, 1);
pub inline fn MAINU_INIT_HOOK_MAYBE(ARGC: anytype, ARGV: anytype) void {
    _ = &ARGC;
    _ = &ARGV;
    return;
}
pub inline fn NLSUI_STORE_CMDLINE(argc: anytype, argv: anytype) void {
    _ = &argc;
    _ = &argv;
    return;
}
pub inline fn NLSUI_INIT_HOOK_MAYBE(ARGC: anytype, ARGV: anytype) void {
    _ = &ARGC;
    _ = &ARGV;
    return;
}
pub const NLSUI_SET_7BIT_MAYBE = "";
pub const mainU = @compileError("unable to translate macro: undefined identifier `wmain`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2956:11
pub const main3U = @compileError("unable to translate macro: undefined identifier `wmain`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:2968:11
pub const MB_CUR_MAX_U = @as(c_int, 2);
pub const MB_CUR_MAX_NUC = @as(c_int, 1);
pub const MB_CUR_MAX_UC = @as(c_int, 2);
pub const MAX_ALIASES = @as(c_int, 64);
pub const MAX_ADDRESSES = @as(c_int, 64);
pub const MAX_PATH_LN = _MAX_PATH;
pub const passwdU = @compileError("unable to translate macro: undefined identifier `passwd`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:3257:9
pub const AS4_EXT_PTR = "";
pub const getpwuidU16_RETURN = [*c]struct_passwdU16;
pub const getpwuidU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `uid`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:3265:9
pub const getpwuidU16_PARAMS = @compileError("unable to translate macro: undefined identifier `uid`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:3266:9
pub const getpwuidU = @compileError("unable to translate macro: undefined identifier `getpwuid`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:3268:9
pub const getpwnamU16_RETURN = [*c]struct_passwdU16;
pub const getpwnamU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `name`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:3271:9
pub const getpwnamU16_PARAMS = @compileError("unable to translate macro: undefined identifier `name`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:3272:9
pub const getpwnamU = @compileError("unable to translate macro: undefined identifier `getpwnam`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:3274:9
pub const h_addr = @compileError("unable to translate macro: undefined identifier `h_addr_list`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:3291:18
pub const hostentU = @compileError("unable to translate macro: undefined identifier `hostent`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:3293:9
pub const serventU = @compileError("unable to translate macro: undefined identifier `servent`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:3301:9
pub const gethostbyaddrU16_RETURN = [*c]struct_hostentU16;
pub const gethostbyaddrU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `addr`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:3304:9
pub const gethostbyaddrU16_PARAMS = @compileError("unable to translate macro: undefined identifier `addr`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:3305:9
pub const gethostbyaddrU = @compileError("unable to translate macro: undefined identifier `gethostbyaddr`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:3307:9
pub const gethostbynameU16_RETURN = [*c]struct_hostentU16;
pub const gethostbynameU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `name`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:3310:9
pub const gethostbynameU16_PARAMS = @compileError("unable to translate macro: undefined identifier `name`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:3311:9
pub const gethostbynameU = @compileError("unable to translate macro: undefined identifier `gethostbyname`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:3313:9
pub inline fn _splitpathU16(path: anytype, drive: anytype, dir: anytype, fname: anytype, ext: anytype) @TypeOf(_wsplitpath(path, drive, dir, fname, ext)) {
    _ = &path;
    _ = &drive;
    _ = &dir;
    _ = &fname;
    _ = &ext;
    return _wsplitpath(path, drive, dir, fname, ext);
}
pub inline fn _splitpathU(path: anytype, drive: anytype, dir: anytype, fname: anytype, ext: anytype) @TypeOf(SAP_UNAME(_splitpath)(path, drive, dir, fname, ext)) {
    _ = &path;
    _ = &drive;
    _ = &dir;
    _ = &fname;
    _ = &ext;
    return SAP_UNAME(_splitpath)(path, drive, dir, fname, ext);
}
pub const U2Null = __helpers.cast(SAP_U2, @as(c_int, 0));
pub const U4Null = __helpers.cast(SAP_U4, @as(c_int, 0));
pub const B8Null = __helpers.cast(SAP_B8, @as(c_int, 0));
pub const UTF8Null = __helpers.cast(SAP_UTF8, @as(c_int, 0));
pub const CESU8Null = __helpers.cast(SAP_CESU8, @as(c_int, 0));
pub const UTF7Null = __helpers.cast(SAP_UTF7, @as(c_int, 0));
pub const A7Null = __helpers.cast(SAP_A7, @as(c_int, 0));
pub const B7Null = __helpers.cast(SAP_B7, @as(c_int, 0));
pub const E8Null = __helpers.cast(SAP_E8, @as(c_int, 0));
pub const UCMBNull = __helpers.cast(SAP_UC_MB, @as(c_int, 0));
pub inline fn isdigit09(c: anytype) @TypeOf(__helpers.cast(c_uint, c - cU('0')) < @as(c_int, 10)) {
    _ = &c;
    return __helpers.cast(c_uint, c - cU('0')) < @as(c_int, 10);
}
pub inline fn isxdigit0F(c: anytype) @TypeOf((((c >= cU('0')) and (c <= cU('9'))) or ((c >= cU('A')) and (c <= cU('F')))) or ((c >= cU('a')) and (c <= cU('f')))) {
    _ = &c;
    return (((c >= cU('0')) and (c <= cU('9'))) or ((c >= cU('A')) and (c <= cU('F')))) or ((c >= cU('a')) and (c <= cU('f')));
}
pub inline fn isxxxNUC(isfctnuc: anytype, c: anytype) @TypeOf(if (sizeofR(c) == sizeofR(SAP_CHAR)) isfctnuc(U_CHAR(c)) else isfctnuc(c)) {
    _ = &isfctnuc;
    _ = &c;
    return if (sizeofR(c) == sizeofR(SAP_CHAR)) isfctnuc(U_CHAR(c)) else isfctnuc(c);
}
pub inline fn isasciiU(c: anytype) @TypeOf(isascii(c)) {
    _ = &c;
    return isascii(c);
}
pub inline fn isdigitU(c: anytype) @TypeOf(isdigit09(c)) {
    _ = &c;
    return isdigit09(c);
}
pub inline fn TOLOWERU_A7(c: anytype) @TypeOf(if ((c > @as(c_int, 0x40)) and (c < @as(c_int, 0x5B))) c + @as(c_int, 0x20) else c) {
    _ = &c;
    return if ((c > @as(c_int, 0x40)) and (c < @as(c_int, 0x5B))) c + @as(c_int, 0x20) else c;
}
pub inline fn TOUPPERU_A7(c: anytype) @TypeOf(if ((c > @as(c_int, 0x60)) and (c < @as(c_int, 0x7B))) c - @as(c_int, 0x20) else c) {
    _ = &c;
    return if ((c > @as(c_int, 0x60)) and (c < @as(c_int, 0x7B))) c - @as(c_int, 0x20) else c;
}
pub inline fn TOLOWERU(c: anytype) @TypeOf(if ((c & __helpers.promoteIntLiteral(c_int, 0xFF80, .hex)) == @as(c_int, 0)) TOLOWERU_A7(c) else tolowerU(c)) {
    _ = &c;
    return if ((c & __helpers.promoteIntLiteral(c_int, 0xFF80, .hex)) == @as(c_int, 0)) TOLOWERU_A7(c) else tolowerU(c);
}
pub inline fn TOUPPERU(c: anytype) @TypeOf(if ((c & __helpers.promoteIntLiteral(c_int, 0xFF80, .hex)) == @as(c_int, 0)) TOUPPERU_A7(c) else toupperU(c)) {
    _ = &c;
    return if ((c & __helpers.promoteIntLiteral(c_int, 0xFF80, .hex)) == @as(c_int, 0)) TOUPPERU_A7(c) else toupperU(c);
}
pub const SECURE_NAME = @compileError("unable to translate macro: undefined identifier `RFB`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:4215:9
pub inline fn strnlenR(s: anytype, maxsize: anytype) @TypeOf(SECURE_NAME(strnlen)(__helpers.cast([*c]u8, s), maxsize)) {
    _ = &s;
    _ = &maxsize;
    return SECURE_NAME(strnlen)(__helpers.cast([*c]u8, s), maxsize);
}
pub inline fn strnlenaR(s: anytype) @TypeOf(SECURE_NAME(strnlen)(__helpers.cast([*c]u8, s), sizeofR(s))) {
    _ = &s;
    return SECURE_NAME(strnlen)(__helpers.cast([*c]u8, s), sizeofR(s));
}
pub inline fn strnlenU(s: anytype, s1max: anytype) @TypeOf(SAP_UNAME_UR(strnlen)(s, s1max)) {
    _ = &s;
    _ = &s1max;
    return SAP_UNAME_UR(strnlen)(s, s1max);
}
pub inline fn strnlenaU(s: anytype) @TypeOf(SAP_UNAME_UR(strnlen)(s, sizeofU(s))) {
    _ = &s;
    return SAP_UNAME_UR(strnlen)(s, sizeofU(s));
}
pub const strcpy_sR = @compileError("unable to translate C expr: unexpected token 'const'"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:4227:9
pub inline fn strcpy_saR(s1: anytype, s2: anytype) @TypeOf(SECURE_NAME(strcpy_s)(s1, sizeofR(s1), s2)) {
    _ = &s1;
    _ = &s2;
    return SECURE_NAME(strcpy_s)(s1, sizeofR(s1), s2);
}
pub inline fn strcpy_sU(s1: anytype, s1max: anytype, s2: anytype) @TypeOf(SAP_UNAME_UR(strcpy_s)(s1, s1max, s2)) {
    _ = &s1;
    _ = &s1max;
    _ = &s2;
    return SAP_UNAME_UR(strcpy_s)(s1, s1max, s2);
}
pub inline fn strcpy_saU(s1: anytype, s2: anytype) @TypeOf(SAP_UNAME_UR(strcpy_s)(s1, sizeofU(s1), s2)) {
    _ = &s1;
    _ = &s2;
    return SAP_UNAME_UR(strcpy_s)(s1, sizeofU(s1), s2);
}
pub inline fn strncpy_sR(s1: anytype, s1max: anytype, s2: anytype, n: anytype) @TypeOf(SECURE_NAME(strncpy_s)(s1, s1max, s2, n)) {
    _ = &s1;
    _ = &s1max;
    _ = &s2;
    _ = &n;
    return SECURE_NAME(strncpy_s)(s1, s1max, s2, n);
}
pub inline fn strncpy_saR(s1: anytype, s2: anytype, n: anytype) @TypeOf(SECURE_NAME(strncpy_s)(s1, sizeofR(s1), s2, n)) {
    _ = &s1;
    _ = &s2;
    _ = &n;
    return SECURE_NAME(strncpy_s)(s1, sizeofR(s1), s2, n);
}
pub inline fn strncpy_sU(s1: anytype, s1max: anytype, s2: anytype, n: anytype) @TypeOf(SAP_UNAME_UR(strncpy_s)(s1, s1max, s2, n)) {
    _ = &s1;
    _ = &s1max;
    _ = &s2;
    _ = &n;
    return SAP_UNAME_UR(strncpy_s)(s1, s1max, s2, n);
}
pub inline fn strncpy_saU(s1: anytype, s2: anytype, n: anytype) @TypeOf(SAP_UNAME_UR(strncpy_s)(s1, sizeofU(s1), s2, n)) {
    _ = &s1;
    _ = &s2;
    _ = &n;
    return SAP_UNAME_UR(strncpy_s)(s1, sizeofU(s1), s2, n);
}
pub inline fn strcat_sR(s1: anytype, s1max: anytype, s2: anytype) @TypeOf(SECURE_NAME(strcat_s)(s1, s1max, s2)) {
    _ = &s1;
    _ = &s1max;
    _ = &s2;
    return SECURE_NAME(strcat_s)(s1, s1max, s2);
}
pub inline fn strcat_saR(s1: anytype, s2: anytype) @TypeOf(SECURE_NAME(strcat_s)(s1, sizeofR(s1), s2)) {
    _ = &s1;
    _ = &s2;
    return SECURE_NAME(strcat_s)(s1, sizeofR(s1), s2);
}
pub inline fn strcat_sU(s1: anytype, s1max: anytype, s2: anytype) @TypeOf(SAP_UNAME_UR(strcat_s)(s1, s1max, s2)) {
    _ = &s1;
    _ = &s1max;
    _ = &s2;
    return SAP_UNAME_UR(strcat_s)(s1, s1max, s2);
}
pub inline fn strcat_saU(s1: anytype, s2: anytype) @TypeOf(SAP_UNAME_UR(strcat_s)(s1, sizeofU(s1), s2)) {
    _ = &s1;
    _ = &s2;
    return SAP_UNAME_UR(strcat_s)(s1, sizeofU(s1), s2);
}
pub inline fn strncat_sR(s1: anytype, s1max: anytype, s2: anytype, n: anytype) @TypeOf(SECURE_NAME(strncat_s)(s1, s1max, s2, n)) {
    _ = &s1;
    _ = &s1max;
    _ = &s2;
    _ = &n;
    return SECURE_NAME(strncat_s)(s1, s1max, s2, n);
}
pub inline fn strncat_saR(s1: anytype, s2: anytype, n: anytype) @TypeOf(SECURE_NAME(strncat_s)(s1, sizeofR(s1), s2, n)) {
    _ = &s1;
    _ = &s2;
    _ = &n;
    return SECURE_NAME(strncat_s)(s1, sizeofR(s1), s2, n);
}
pub inline fn strncat_sU(s1: anytype, s1max: anytype, s2: anytype, n: anytype) @TypeOf(SAP_UNAME_UR(strncat_s)(s1, s1max, s2, n)) {
    _ = &s1;
    _ = &s1max;
    _ = &s2;
    _ = &n;
    return SAP_UNAME_UR(strncat_s)(s1, s1max, s2, n);
}
pub inline fn strncat_saU(s1: anytype, s2: anytype, n: anytype) @TypeOf(SAP_UNAME_UR(strncat_s)(s1, sizeofU(s1), s2, n)) {
    _ = &s1;
    _ = &s2;
    _ = &n;
    return SAP_UNAME_UR(strncat_s)(s1, sizeofU(s1), s2, n);
}
pub inline fn gets_sR(s: anytype, n: anytype) @TypeOf(SECURE_NAME(gets_s)(s, n)) {
    _ = &s;
    _ = &n;
    return SECURE_NAME(gets_s)(s, n);
}
pub inline fn gets_saR(s: anytype) @TypeOf(SECURE_NAME(gets_s)(s, sizeofR(s))) {
    _ = &s;
    return SECURE_NAME(gets_s)(s, sizeofR(s));
}
pub inline fn gets_sU(s: anytype, n: anytype) @TypeOf(SAP_UNAME_UR(gets_s)(s, n)) {
    _ = &s;
    _ = &n;
    return SAP_UNAME_UR(gets_s)(s, n);
}
pub inline fn gets_saU(s: anytype) @TypeOf(SAP_UNAME_UR(gets_s)(s, sizeofU(s))) {
    _ = &s;
    return SAP_UNAME_UR(gets_s)(s, sizeofU(s));
}
pub const sprintf_sR = sprintf_sRFB;
pub const sprintf_sU16_RETURN = intU;
pub const sprintf_sU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:4269:9
pub const sprintf_sU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:4270:9
pub const sprintf_sU = SAP_UNAME_UR(sprintf_s);
pub const snprintf_sR = snprintf_sRFB;
pub const snprintf_sU16_RETURN = intU;
pub const snprintf_sU16_TPARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:4284:9
pub const snprintf_sU16_PARAMS = @compileError("unable to translate macro: undefined identifier `s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:4285:9
pub const snprintf_sU = @compileError("unable to translate macro: undefined identifier `snprintf_s`"); // C:\Users\Kaszub\Desktop\ZIG SAP RFC NW SDK BINDINGS\src-c\sapucrfc.h:4289:9
pub inline fn memcpy_sR(s1: anytype, s1max: anytype, s2: anytype, n: anytype) @TypeOf(SECURE_NAME(memcpy_s)(s1, s1max, s2, n)) {
    _ = &s1;
    _ = &s1max;
    _ = &s2;
    _ = &n;
    return SECURE_NAME(memcpy_s)(s1, s1max, s2, n);
}
pub inline fn memcpy_saR(s1: anytype, s2: anytype, n: anytype) @TypeOf(SECURE_NAME(memcpy_s)(s1, sizeofR(s1), s2, n)) {
    _ = &s1;
    _ = &s2;
    _ = &n;
    return SECURE_NAME(memcpy_s)(s1, sizeofR(s1), s2, n);
}
pub inline fn memcpy_sU(s1: anytype, s1max: anytype, s2: anytype, n: anytype) @TypeOf(SAP_UNAME_UR(memcpy_s)(s1, s1max, s2, n)) {
    _ = &s1;
    _ = &s1max;
    _ = &s2;
    _ = &n;
    return SAP_UNAME_UR(memcpy_s)(s1, s1max, s2, n);
}
pub inline fn memcpy_saU(s1: anytype, s2: anytype, n: anytype) @TypeOf(SAP_UNAME_UR(memcpy_s)(s1, sizeofU(s1), s2, n)) {
    _ = &s1;
    _ = &s2;
    _ = &n;
    return SAP_UNAME_UR(memcpy_s)(s1, sizeofU(s1), s2, n);
}
pub inline fn memmove_sR(s1: anytype, s1max: anytype, s2: anytype, n: anytype) @TypeOf(SECURE_NAME(memmove_s)(s1, s1max, s2, n)) {
    _ = &s1;
    _ = &s1max;
    _ = &s2;
    _ = &n;
    return SECURE_NAME(memmove_s)(s1, s1max, s2, n);
}
pub inline fn memmove_saR(s1: anytype, s2: anytype, n: anytype) @TypeOf(SECURE_NAME(memmove_s)(s1, sizeofR(s1), s2, n)) {
    _ = &s1;
    _ = &s2;
    _ = &n;
    return SECURE_NAME(memmove_s)(s1, sizeofR(s1), s2, n);
}
pub inline fn memmove_sU(s1: anytype, s1max: anytype, s2: anytype, n: anytype) @TypeOf(SAP_UNAME_UR(memmove_s)(s1, s1max, s2, n)) {
    _ = &s1;
    _ = &s1max;
    _ = &s2;
    _ = &n;
    return SAP_UNAME_UR(memmove_s)(s1, s1max, s2, n);
}
pub inline fn memmove_saU(s1: anytype, s2: anytype, n: anytype) @TypeOf(SAP_UNAME_UR(memmove_s)(s1, sizeofU(s1), s2, n)) {
    _ = &s1;
    _ = &s2;
    _ = &n;
    return SAP_UNAME_UR(memmove_s)(s1, sizeofU(s1), s2, n);
}
pub const SAP_API = _stdcall;
pub const RFC_TID_LN = @as(c_int, 24);
pub const RFC_UNITID_LN = @as(c_int, 32);
pub const SAPDECF_H = "";
pub const SAP_FAR = "";
pub const SAP_PASCAL = "";
pub const SAP_EXPORT = "";
pub const SAP_LOADDS = "";
pub const SAP_STDCALL = _stdcall;
pub const threadlocaleinfostruct = struct_threadlocaleinfostruct;
pub const threadmbcinfostruct = struct_threadmbcinfostruct;
pub const localeinfo_struct = struct_localeinfo_struct;
pub const tagLC_ID = struct_tagLC_ID;
pub const _div_t = struct__div_t;
pub const _ldiv_t = struct__ldiv_t;
pub const _heapinfo = struct__heapinfo;
pub const _iobuf = struct__iobuf;
pub const DecFloatRawLen = enum_DecFloatRawLen;
pub const DecFloatLen = enum_DecFloatLen;
pub const _wfinddata32_t = struct__wfinddata32_t;
pub const _wfinddata32i64_t = struct__wfinddata32i64_t;
pub const _wfinddata64i32_t = struct__wfinddata64i32_t;
pub const _wfinddata64_t = struct__wfinddata64_t;
pub const _stat32 = struct__stat32;
pub const _stat32i64 = struct__stat32i64;
pub const _stat64i32 = struct__stat64i32;
pub const _stat64 = struct__stat64;
pub const tm = struct_tm;
pub const _utimbuf = struct__utimbuf;
pub const __utimbuf32 = struct___utimbuf32;
pub const __utimbuf64 = struct___utimbuf64;
pub const utimbuf = struct_utimbuf;
pub const utimbuf32 = struct_utimbuf32;
pub const passwdU16 = struct_passwdU16;
pub const hostentU16 = struct_hostentU16;
pub const serventU16 = struct_serventU16;
pub const _RFCTYPE = enum__RFCTYPE;
pub const _RFC_RC = enum__RFC_RC;
pub const _RFC_ERROR_GROUP = enum__RFC_ERROR_GROUP;
pub const _RFC_ERROR_INFO = struct__RFC_ERROR_INFO;
pub const _RFC_ATTRIBUTES = struct__RFC_ATTRIBUTES;
pub const _RFC_SECURITY_ATTRIBUTES = struct__RFC_SECURITY_ATTRIBUTES;
pub const _RFC_UNIT_ATTRIBUTES = struct__RFC_UNIT_ATTRIBUTES;
pub const _RFC_UNIT_IDENTIFIER = struct__RFC_UNIT_IDENTIFIER;
pub const _RFC_UNIT_STATE = enum__RFC_UNIT_STATE;
pub const _RFC_CALL_TYPE = enum__RFC_CALL_TYPE;
pub const _RFC_SERVER_CONTEXT = struct__RFC_SERVER_CONTEXT;
pub const _RFC_AUTHENTICATION_TYPE = enum__RFC_AUTHENTICATION_TYPE;
pub const _RFC_CERTIFICATE_DATA = struct__RFC_CERTIFICATE_DATA;
pub const _RFC_TYPE_DESC_HANDLE = struct__RFC_TYPE_DESC_HANDLE;
pub const _RFC_FUNCTION_DESC_HANDLE = struct__RFC_FUNCTION_DESC_HANDLE;
pub const _RFC_CLASS_DESC_HANDLE = struct__RFC_CLASS_DESC_HANDLE;
pub const RFC_DATA_CONTAINER = struct_RFC_DATA_CONTAINER;
pub const _RFC_THROUGHPUT_HANDLE = struct__RFC_THROUGHPUT_HANDLE;
pub const _RFC_AUTHENTICATION_HANDLE = struct__RFC_AUTHENTICATION_HANDLE;
pub const _RFC_CONNECTION_HANDLE = struct__RFC_CONNECTION_HANDLE;
pub const _RFC_SERVER_HANDLE = struct__RFC_SERVER_HANDLE;
pub const _RFC_PROTOCOL_TYPE = enum__RFC_PROTOCOL_TYPE;
pub const _RFC_SERVER_STATE = enum__RFC_SERVER_STATE;
pub const _RFC_SERVER_ATTRIBUTES = struct__RFC_SERVER_ATTRIBUTES;
pub const _RFC_SESSION_EVENT = enum__RFC_SESSION_EVENT;
pub const _RFC_SESSION_CHANGE = struct__RFC_SESSION_CHANGE;
pub const _RFC_STATE_CHANGE = struct__RFC_STATE_CHANGE;
pub const _RFC_SERVER_MONITOR_DATA = struct__RFC_SERVER_MONITOR_DATA;
pub const _RFC_TRANSACTION_HANDLE = struct__RFC_TRANSACTION_HANDLE;
pub const _RFC_UNIT_HANDLE = struct__RFC_UNIT_HANDLE;
pub const _RFC_CONNECTION_PARAMETER = struct__RFC_CONNECTION_PARAMETER;
pub const _RFC_FIELD_DESC = struct__RFC_FIELD_DESC;
pub const _RFC_DIRECTION = enum__RFC_DIRECTION;
pub const _RFC_PARAMETER_DESC = struct__RFC_PARAMETER_DESC;
pub const _RFC_EXCEPTION_DESC = struct__RFC_EXCEPTION_DESC;
pub const _RFC_CLASS_ATTRIBUTE_TYPE = enum__RFC_CLASS_ATTRIBUTE_TYPE;
pub const _RFC_CLASS_ATTRIBUTE_DESC = struct__RFC_CLASS_ATTRIBUTE_DESC;
pub const _RFC_METADATA_QUERY_RESULT_ENTRY = struct__RFC_METADATA_QUERY_RESULT_ENTRY;
pub const _RFC_METADATA_OBJ_TYPE = enum__RFC_METADATA_OBJ_TYPE;
