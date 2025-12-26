const ReturnCode = @import("commons.zig").ReturnCode;
const ErrorInfo = @import("commons.zig").ErrorInfo;

pub const SapUc = @import("commons.zig").SapUc;

pub const Connection = @import("connection.zig").Connection;
// ==================================================
// Trace
// ==================================================
/// Sets the current trace level of the specified RFC connection or destination to the new value.
///
/// If both of connection and destination are NULL, this function sets the "global"
/// trace level. See below.
///
/// In general RFC trace can be activated/deactivated in 6 different ways:
/// - By setting the parameter RFC_TRACE=[0|1|2|3|4] in the DEFAULT section of the sapnwrfc.ini file.
///   This value applies to all destinations, for which no explicit trace level has been set.
///   ("Global" trace level.)
/// - By setting the parameter TRACE=[0|1|2|3|4] in a specific destination section of sapnwrfc.ini.
///   it applies to that destination only and overrules the "global" trace level from the DEFAULT section.
/// - By setting the environment variable RFC_TRACE=[0|1|2|3|4]. This overrules the setting from the
///   DEFAULT section of sapnwrfc.ini.
/// - Via %RfcSetTraceLevel(). If connection and destination are NULL, this function sets the global
///   trace level and overrules the value from the DEFAULT section of sapnwrfc.ini as well as the environment
///   variable RFC_TRACE. If connection is non-NULL, it sets the trace level for the current connection only,
///   and if destination is non-NULL, it sets the trace level for that destination, overruling the value from
///   this destination's section in the sapnwrfc.ini file.
/// - By passing a {name=TRACE, value=[0|1|2|3|4]} pair in the RFC_CONNECTION_PARAMETER array used in
///   RfcOpenConnection(), RfcRegisterServer() or RfcStartServer(). If that RFC_CONNECTION_PARAMETER array
///   also contains a {name=DEST, value=...} pair, the trace parameter from the array overrules the value
///   from this destination's sapnwrfc.ini section.
/// - In case the program is a server program: by activating the trace flag for the corresponding destination
///   in SM59. The trace setting on backend side is then "inherited" by the external side.
///
///  For more information on trace settings see the sample sapnwrfc.ini file contained in the demo folder.
pub extern fn RfcSetTraceLevel(
    /// A handle to a currently open RFC connection (client or server connection).
    /// The new trace level will be effective immediately.
    connection: *Connection,
    /// Null-terminated string specifying a client or server destination as defined
    /// via a DEST=... entry in sapnwrfc.ini. The new trace level will be used for new connections
    /// to that destination opened after the %RfcSetTraceLevel() call. Already existing connections to
    /// that destination will not be effected.
    destination: [*:0]SapUc,
    /// The new trace level. Must be between 0 and 4. The meaning of those four values
    /// is as follows:
    /// - 0: Off. Only severe errors are logged to the dev_rfc.trc file.
    /// - 1: Brief. All API calls (except for the setter and getter functions) and important attributes
    ///      like codepages, RFC headers, logon parameters are traced. Trace is written to a file named
    ///      rfc&lt;pid&gt;.trc or rfc&lt;pid&gt;_&lt;tid&gt;.trc, depending on whether tracing is done
    ///      on a "per-process" basis or a "per-thread" basis. &lt;pid&gt; is the current process ID,
    ///      &lt;tid&gt; the current thread ID.
    /// - 2: Verbose. In addition to 1, the values of the "scalar" RFC parameters as well as the contents
    ///      of the network containers are traced. Scalar parameters are primitive types (CHAR, INT, FLOAT, etc)
    ///      and flat structures.
    /// - 3: Detailed. In addition to 2 the contents of nested structures and tables and hexdumps
    /// - 4: Full. In addition to 3 all API calls of setter and getter functions and table operations
    ///      are traced.
    trace_level: c_uint,
    error_info: ?*ErrorInfo,
) ReturnCode;

/// Changes the character encoding to be used in trace files.
///
/// This function has the same effect as the sapnwrfc.ini parameter RFC_TRACE_ENCODING.
/// See the documentation of that parameter in the sample ini file contained in the
/// demo directory of the NW RFC SDK.
///
/// This API call affects only new trace files that will be opened after the call.
/// The character encoding of already existing trace files is not changed in order to
/// prevent confusion and garbage data...
pub extern fn RfcSetTraceEncoding(
    /// The new encoding. Possible values are "UTF-16", "UTF-8" and
    /// "DEFAULT". On Windows UTF-16 is recommended for faster performance. "DEFAULT" corresponds
    /// to the operating system's default character encoding, which is CP1252 or ISO-8859-1 on
    /// most Windows systems and UTF-8 on most Linux systems.
    trace_encoding: [*:0]SapUc,
    error_info: ?*ErrorInfo,
) ReturnCode;

/// Changes the directory where the NW RFC lib should write trace files.
///
/// This function has the same effect as the sapnwrfc.ini parameter RFC_TRACE_DIR.
/// See the documentation of that parameter in the sample ini file contained in the
/// demo directory of the NW RFC SDK.
///
/// \note This API call affects only new trace files that will be opened after the call.
/// The directory of already existing trace files is not changed in order to
/// prevent confusion and garbage data...
pub extern fn RfcSetTraceDir(
    /// The new directory. Can be an absolute or relative path name.
    /// The directory needs to exist prior to calling this API. The NW RFC lib will not
    /// attempt to create non-existing directories.
    trace_dir: [*:0]SapUc,
    error_info: ?*ErrorInfo,
) ReturnCode;

/// Changes the way the NW RFC lib writes trace files.
///
/// This function has the same effect as the sapnwrfc.ini parameter RFC_TRACE_TYPE.
/// See the documentation of that parameter in the sample ini file contained in the
/// demo directory of the NW RFC SDK.
///
/// \note This API call closes currently open trace files and then changes to
/// "one file per process" or one "file per thread".
/// If the NW RFC lib is already using the given trace type, it does nothing.
pub extern fn RfcSetTraceType(
    /// Must be either "PROCESS" or "THREAD".
    trace_type: [*:0]SapUc,
    error_info: ?*ErrorInfo,
) ReturnCode;

///  Sets the global CPIC trace level used by the underlying CPIC libabry to write CPIC tracing information
///  to the CPIC trace file cpic_<pid>.trc, where pid is the process ID of the current process. The CPIC trace file
///  is located in the same directory where the RFC trace files are located.
///
///  This function has the same effect as the sapnwrfc.ini parameter CPIC_TRACE_LEVEL.
///  See the documentation of that parameter in the sample ini file contained in the
///  demo directory of the NW RFC SDK.
pub extern fn RfcSetCpicTraceLevel(
    ///Must be a value between 0 to 3, where 0 turns tracing off.
    trace_level: c_uint,
    error_info: ?*ErrorInfo,
) ReturnCode;

///Activates the CPIC keepalive
pub extern fn RfcSetCpicKeepalive(
    ///Must be a value between 10 and 3600, where 0 turns the cpic keepalive off.
    timeout: c_uint,
    error_info: ?*ErrorInfo,
) ReturnCode;

/// Sets the global CPIC pong timeout for the keepalive.
///
/// This function sets the global CPIC pong timeout for the keepalive, which is the maximum time the system will wait for a pong response
/// after sending a ping. If the timeout is set to 0, the pong timeout will be deactivated.
/// This function has the same effect as the sapnwrfc.ini parameter CPIC_PONG_TIMEOUT.
pub extern fn RfcSetCpicPongTimeout(
    /// The pong timeout in seconds. Valid values are between 10 and 3600 seconds, or 0 to deactivate the timeout.
    timeout: c_uint,
    error_info: ?*ErrorInfo,
) ReturnCode;

/// Sets the global Websocket trace level used by the underlying NI libabry to write tracing information
/// to the trace file ws_rfc_<pid>.trc, where pid is the process ID of the current process. The NI trace file
/// is located in the same directory where the RFC trace files are located.
///
/// This function has the same effect as the sapnwrfc.ini parameter RFC_SOCKET_TRACE.
/// See the documentation of that parameter in the sample ini file contained in the
/// demo directory of the NW RFC SDK.
/// Nevertheless this API cannot set a trace level below the global socket trace level set by environment variable
/// or the ini file.
pub extern fn RfcSetSocketTraceLevel(
    /// Must be a value between 0 to 3, where 0 turns tracing off.
    trace_level: c_uint,
    error_info: ?*ErrorInfo,
) ReturnCode;

/// Sets the maximum size of the trace file, after which the current file is closed and "rolled over" to a new file.
///
/// This function has the same effect as the sapnwrfc.ini parameter RFC_TRACE_MAX_FILE_SIZE. By default
/// two files of a maximum of 512 MB are stored.
/// However this function cannot set the size below a minimum value of 20 MB or the value set by RFC_TRACE_MAX_FILE_SIZE
/// from the sapnwrfc.ini.
///
/// As unit of measure you can use "M" for Megabytes or "G" for Gigabytes, for example 1024 and M.
pub extern fn RfcSetMaximumTraceFileSize(
    /// Size in specified unit
    size: c_uint,
    /// Unit of measurement
    unit: SapUc,
    error_info: ?*ErrorInfo,
) ReturnCode;

/// Sets the maximum size of stored old trace files, after which the current file is closed and "rolled over" to a new file.
///
/// This function has the same effect as the sapnwrfc.ini parameter RFC_TRACE_MAX_STORED_FILES.
/// An additional "roll" to a new file after the maximum is reached, triggers a deletion of the oldest file.
/// The old stored files are marked with the opening timestamp in the file name, when a "roll over" is done.
/// By default two files are stored. The current trace file is not yet marked with the time stamp.
/// However this function cannot set the size to zero, (it will result in an error,) or to a value lower than the one set
/// by RFC_TRACE_MAX_STORED_FILES from the sapnwrfc.ini.
/// By setting this value to -1, the limit is disabled and and an infinite amount of concurrent files can
/// be kept, i.e. no files will be deleted by the NW RFC library.
///
/// Attention: Lowering the value might delete some old files, if there are currently more stored
/// files than permitted by the new (lower) value.
pub extern fn RfcSetMaximumStoredTraceFiles(
    /// Maximum size of stored old trace
    number_of_files: c_int,
    error_info: ?*ErrorInfo,
) ReturnCode;
