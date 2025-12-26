const ReturnCode = @import("commons.zig").ReturnCode;
const ErrorInfo = @import("commons.zig").ErrorInfo;

const SapUc = @import("commons.zig").SapUc;
const SapRaw = @import("commons.zig").SapRaw;

// ==================================================
// SNC
// ==================================================

/// Converts SNC name to SNC key.
pub extern fn RfcSNCNameToKey(
    /// Optional: file name of the GSS library to be used for the conversion. If not specified, the
    /// "global" GSS library (environment variable SNC_LIB or SNC_LIB_64) will be used.
    snc_lib: ?[*:0]const SapUc,
    /// Null-terminated SNC name to be converted.
    snc_name: [*:0]const SapUc,
    /// Pre-allocated buffer, which will receive the corresponding SNC key.
    snc_key: [*]SapRaw,
    /// Needs to be filled with the buffer length of sncKey. The return value will be byte length
    /// of the SNC key (if buffer was large enough). Unfortunately in case of RFC_BUFFER_TOO_SMALL
    /// the required size is not returned by the GSS library.
    /// The maximum length of an SNC key is 1024.
    key_length: *c_uint,
    error_info: ?*ErrorInfo,
) ReturnCode;

/// Converts SNC key to SNC name.
pub extern fn RfcSNCKeyToName(
    /// Optional: file name of the GSS library to be used for the conversion. If not specified, the
    /// "global" GSS library (environment variable SNC_LIB or SNC_LIB_64) will be used.
    snc_lib: ?[*:0]const SapUc,
    /// SNC key to be converted.
    snc_key: [*]const SapRaw,
    /// Byte length of the given SNC key
    key_length: c_uint,
    /// Pre-allocated buffer, which will receive the corresponding (null-terminated) SNC name.
    snc_name: [*]SapUc,
    /// Size of the given sncName buffer. (The maximum length of an SNC name is 256.)
    name_length: c_uint,
    error_info: ?*ErrorInfo,
) ReturnCode;
