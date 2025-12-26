const mem = @import("std").mem;

// ==================================================
// Return code
// ==================================================
extern fn RfcGetRcAsString(rc: ReturnCode) [*:0]const SapUc;

///RFC return codes used by all functions that do not directly return a handle.
///Also used as error indicator in the structure #ERROR_INFO::code.
pub const ReturnCode = enum(c_int) {
    /// Everything O.K. Used by every function
    ok,
    /// Error in Network & Communication layer
    communication_failure,
    /// Unable to logon to SAP system. Invalid password, user locked, etc.
    logon_failure,
    /// SAP system runtime error (SYSTEM_FAILURE): Shortdump on the backend side
    abap_runtime_failure,
    /// The called function module raised an E-, A- or X-Message
    abap_message,
    /// The called function module raised an Exception (RAISE or MESSAGE ... RAISING)
    abap_exception,
    /// Connection closed by the other side
    closed,
    /// No longer used
    canceled,
    /// Time out
    timeout,
    /// Memory insufficient
    memory_insufficient,
    /// Version mismatch
    version_mismatch,
    /// The received data has an unsupported format
    invalid_protocol,
    /// A problem while serializing or deserializing RFM parameters
    serialization_failure,
    /// An invalid handle was passed to an API call
    invalid_handle,
    /// RfcListenAndDispatch did not receive an RFC request during the timeout period
    retry,
    /// Error in external custom code. (E.g. in the function handlers or tRFC handlers.) Results in SYSTEM_FAILURE
    external_failure,
    /// Inbound tRFC Call already executed (needs to be returned from ON_CHECK_TRANSACTION in case the TID is already known and successfully processed before.)
    executed,
    /// Function or structure definition not found (Metadata API)
    not_found,
    /// The operation is not supported on that handle
    not_supported,
    /// The operation is not supported on that handle at the current point of time (e.g. trying a callback on a server handle, while not in a call)
    illegal_state,
    /// An invalid parameter was passed to an API call, (e.g. invalid name, type or length)
    invalid_parameter,
    /// Codepage conversion error
    codepage_conversion_failure,
    /// Error while converting a parameter to the correct data type
    conversion_failure,
    /// The given buffer was to small to hold the entire parameter. Data has been truncated.
    buffer_too_small,
    /// Trying to move the current position before the first row of the table
    table_move_bof,
    /// Trying to move the current position after the last row of the table
    table_move_eof,
    /// Failed to start and attach SAPGUI to the RFC connection
    start_sapgui_failure,
    /// The called function module raised a class based exception
    abap_class_exception,
    /// "Something" went wrong, but I don't know what...
    unknown_error,
    /// Authorization check error
    authorization_failure,
    /// The authentication handler (ON_AUTHENTICATION_CHECK) failed to authenticate the user trying to log on
    authentication_failure,
    /// Error when dealing with functions provided by the cryptolibrary
    cryptolib_failure,
    /// Error when dealing with io functions, streams etc
    io_failure,
    /// Requesting or freeing critical sections or mutex failed
    locking_failure,
    /// Don't use
    _rc_max_value,

    /// Converts an RFC_RC return code to a human readable string for logging purposes.
    pub fn AsString(rc: ReturnCode) [*:0]const SapUc {
        return RfcGetRcAsString(rc);
    }
};

// ==================================================
// SAP types
// ==================================================
pub const SapUc = c_ushort;
pub const SapChar = c_ushort;
pub const SapRaw = u8;
pub const SapSRaw = i8;
pub const SapUShort = c_ushort;
pub const SapUInt = c_uint;
pub const SapInt = c_int;
pub const SapShort = c_short;
pub const SapLLong = c_longlong;
pub const SapULLong = c_ulonglong;
pub const SapBool = u8;
pub const SapDouble = f64;
pub const Int8 = c_longlong;

// ==================================================
// RFC scalar data types
// ==================================================

/// Characters, CHAR
pub const Char = SapUc;
/// Digits, NUM          ///SAPUNICODEOK_CHARTYPE////
pub const Num = Char;
/// Raw data, BYTE
pub const Byte = SapRaw;
/// Packed numbers, BCD  ///SAPUNICODEOK_CHARTYPE////
pub const Bcd = SapRaw;
/// 1 byte integer, INT1
pub const Int1 = SapRaw;
/// 2 byte integer, INT2
pub const Int2 = c_short;
/// 4 byte integer, INT
pub const Int = c_int;
/// Floating point, double precision, FLOAT
pub const Float = f64;
/// Date, DATE (YYYYMMDD)
pub const Date = [8]Char;
/// Time, TIME (HHMMSS)
pub const Time = [6]Char;
/// ieee 754r decimal floating point, 8 bytes
pub const DecF16 = @import("decfloat.zig").DecFloat16;
/// ieee 754r decimal floating point, 16 bytes
pub const DecF34 = @import("decfloat.zig").DecFloat34;
/// timestamp/long
pub const UtcLong = Int8;
/// timestamp/second
pub const UtcSecond = Int8;
/// timestamp/minute
pub const UtcMinute = Int8;
/// date/day
pub const DtDay = c_int;
/// date/week
pub const DtWekk = c_int;
/// date/month
pub const DtMonth = c_int;
/// time/second
pub const TSecond = c_int;
/// time/minute
pub const TMinute = c_short;
/// calendar day: day and month
pub const CDay = c_short;
/// Used for TIDs in inbound and outbound tRFC/qRFC
pub const TId = [25]SapUc;
/// Used for Unit IDs in inbound and outbound bgRFC
pub const UnitId = [33]SapUc;

// ==================================================
// Error
// ==================================================

/// Groups several error conditions together, depending on the "layer" to which they belong.
/// Used in the structure #ERROR_INFO::group.
pub const ErrorGroup = enum(c_int) {
    /// OK
    ok,
    /// ABAP Exception raised in ABAP function modules
    abap_application_failure,
    /// ABAP Message raised in ABAP function modules or in ABAP runtime of the backend (e.g Kernel)
    abap_runtime_failure,
    /// Error message raised when logon fails
    logon_failure,
    /// Problems with the network connection (or backend broke down and killed the connection)
    communication_failure,
    /// Problems in the RFC runtime of the external program (i.e "this" library)
    external_runtime_failure,
    /// Problems in the external program (e.g in the external server implementation)
    external_application_failure,
    /// Problems raised in the authorization check handler provided by the external server implementation
    external_authorization_failure,
    /// Problems raised by the authentication handler (ON_AUTHENTICATION_CHECK)
    external_authentication_failure,
    /// Problems when dealing with functions provided by the cryptolibrary
    cryptolib_failure,
    /// Requesting or freeing critical sections or mutex failed
    locking_failure,
};

/// Used in all functions of the NW RFC library to return detailed information about
/// an error that has just occurred. This can be an error that the communication partner
/// sent back to us, an error that occurred in the network layer or operating system,
/// an internal error in the NW RFC library or an error that the application programmer
/// (i.e. you) has committed...
///
/// Within a server function implementation, the application programmer (you) can return
/// this structure to the RFC library in order to specify the error type & message that
/// you want to send back to the backend.
pub const ErrorInfo = extern struct {
    /// Error code. Should be the same as the API returns if the API has return type enums.ReturnCode
    code: ReturnCode = mem.zeroes(ReturnCode),
    /// Error group
    group: ErrorGroup = mem.zeroes(ErrorGroup),
    /// Error key
    key: [128]SapUc = mem.zeroes([128]SapUc),
    /// Error message
    message: [512]SapUc = mem.zeroes([512]SapUc),
    /// ABAP message ID , or class
    abap_msg_class: [21]SapUc = mem.zeroes([21]SapUc),
    /// ABAP message type, e.g. 'E', 'A' or 'X'
    abap_msg_type: [2]SapUc = mem.zeroes([2]SapUc),
    /// ABAP message number
    abap_msg_number: [4]Num = mem.zeroes([4]Num),
    /// ABAP message details field 1, corresponds to SY-MSGV1
    abap_msg_v1: [51]SapUc = mem.zeroes([51]SapUc),
    /// ABAP message details field 2, corresponds to SY-MSGV2
    abap_msg_v2: [51]SapUc = mem.zeroes([51]SapUc),
    /// ABAP message details field 2, corresponds to SY-MSGV3
    abap_msg_v3: [51]SapUc = mem.zeroes([51]SapUc),
    /// ABAP message details field 4, corresponds to SY-MSGV4
    abap_msg_v4: [51]SapUc = mem.zeroes([51]SapUc),
};
