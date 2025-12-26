const ReturnCode = @import("commons.zig").ReturnCode;
const ErrorInfo = @import("commons.zig").ErrorInfo;

const SapUc = @import("commons.zig").SapUc;
const Byte = @import("commons.zig").Byte;
const SapUInt = @import("commons.zig").SapUInt;

// ==================================================
// Conversions
// ==================================================
/// Converts data in UTF-8 format to SAP_UC strings.
///
/// Special case of %RfcUTF8ToSAPUC() with onCCE = 0.
pub extern fn RfcUTF8ToSAPUC(
    /// Pointer to UTF-8 data to be converted
    utf8: [*]const Byte,
    /// Number of bytes to convert
    utf8Length: c_uint,
    /// Pre-allocated output buffer, which will receive the result. Output will be null-terminated.
    sapuc: [*]SapUc,
    /// Needs to be filled with the size of the given output buffer in SAP_UC characters.
    /// If the given buffer turns out to be too small (return code RFC_BUFFER_TOO_SMALL), it will be filled
    /// with the required buffer size that would be necessary to convert the given input data.
    sapucSize: *c_uint,
    /// If the output buffer was large enough, resultLength will be filled with the
    /// length of the output string in SAP_UC characters.
    resultLength: *c_uint,
    error_info: ?*ErrorInfo,
) ReturnCode;

/// Converts data in UTF-8 format to SAP_UC strings.
///
/// The function can deal with values that cannot be converted, i.e. invalid UTF8 codepoints. By setting onCCE to 0, the function
/// will stop the conversion and return an error. By setting onCCE to 2, the function will replace the invalid codepoint with
/// the given substitue.
/// This is similiar to the connection parameters ON_CCE and CFIT in the sapnwrfc.ini.
pub extern fn RfcUTF8ToSAPUC_CCE(
    /// Pointer to UTF-8 data to be converted
    utf8: [*]const Byte,
    /// Number of bytes to convert
    utf8Length: c_uint,
    /// Pre-allocated output buffer, which will receive the result. Output will be null-terminated.
    sapuc: [*]SapUc,
    /// Needs to be filled with the size of the given output buffer in SAP_UC characters.
    ///  If the given buffer turns out to be too small (return code RFC_BUFFER_TOO_SMALL), it will be filled
    /// with the required buffer size that would be necessary to convert the given input data.
    sapucSize: *c_uint,
    /// If the output buffer was large enough, resultLength will be filled with the
    /// length of the output string in SAP_UC characters.
    resultLength: *c_uint,
    /// Flag for dealing with failed conversion
    onCCE: c_ushort,
    /// Copdepoint of substitue character, if onCCE = 2
    substitute: SapUInt,
    error_info: ?*ErrorInfo,
) ReturnCode;

/// Converts data in SAP_UC format to UTF-8 format
///
/// Special case of %RfcSAPUCToUTF8_CCE() with onCCE = 0.
pub extern fn RfcSAPUCToUTF8(
    /// Pointer to SAP_UC data to be converted
    sapuc: [*]const SapUc,
    /// Number of characters to convert
    sapucLength: c_uint,
    /// Pre-allocated output buffer, which will receive the result. Output will be null-terminated.
    utf8: [*]Byte,
    /// Needs to be filled with the size of the given output buffer in bytes.
    /// If the given buffer turns out to be too small (return code RFC_BUFFER_TOO_SMALL), it will be filled
    /// with the required buffer size that would be necessary to convert the given input data.
    utf8Size: *c_uint,
    /// If the output buffer was large enough, resultLength will be filled with the
    /// length of the output string in bytes.
    resultLength: *c_uint,
    /// RFC_OK or RFC_BUFFER_TOO_SMALL
    error_info: ?*ErrorInfo,
) ReturnCode;

/// Converts data in SAP_UC format to UTF-8 format
///
/// The function can deal with values that cannot be converted, i.e. invalid UTF16 codepoints. By setting onCCE to 0, the function
/// will stop the conversion and return an error. By setting onCCE to 2, the function will replace the invalid codepoint with
/// the given substitue.
/// This is similiar to the connection parameters ON_CCE and CFIT in the sapnwrfc.ini.
pub extern fn RfcSAPUCToUTF8_CCE(
    /// Pointer to SAP_UC data to be converted
    sapuc: [*]const SapUc,
    /// Number of characters to convert
    sapucLength: c_uint,
    /// Pre-allocated output buffer, which will receive the result. Output will be null-terminated.
    utf8: [*]Byte,
    /// Needs to be filled with the size of the given output buffer in bytes.
    /// If the given buffer turns out to be too small (return code RFC_BUFFER_TOO_SMALL), it will be filled
    /// with the required buffer size that would be necessary to convert the given input data.
    utf8Size: *c_uint,
    /// If the output buffer was large enough, resultLength will be filled with the
    /// length of the output string in bytes.
    resultLength: *c_uint,
    /// Flag for dealing with failed conversion
    onCCE: c_ushort,
    /// Codepoint of substitue character, if onCCE = 2
    substitute: SapUInt,
    error_info: ?*ErrorInfo,
) ReturnCode;

/// Converts a 2-char SAP language code to the 1-char SAP language code.
pub extern fn RfcLanguageIsoToSap(
    /// Pointer to the 2-char array with SAP LAISO code to convert
    laiso: [*]const SapUc,
    /// Pointer to the 1 char for SAP SPRAS key
    lang: *SapUc,
    error_info: ?*ErrorInfo,
) ReturnCode;

/// Converts a 1-char SAP language key to the 2-char SAP language code.
pub extern fn RfcLanguageSapToIso(
    /// Pointer to the 1 char with SAP SPRAS key to convert
    lang: *const SapUc,
    /// Pointer to the 2-char array for SAP LAISO code
    laiso: [*]SapUc,
    error_info: ?*ErrorInfo,
) ReturnCode;
