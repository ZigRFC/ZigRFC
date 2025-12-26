const mem = @import("std").mem;

const ReturnCode = @import("commons.zig").ReturnCode;
const ErrorInfo = @import("commons.zig").ErrorInfo;

const SapUc = @import("commons.zig").SapUc;
const SapRaw = @import("commons.zig").SapRaw;

const Function = @import("data_container.zig").Function;

const FunctionDesc = @import("desc.zig").FunctionDesc;
const ClassDesc = @import("desc.zig").ClassDesc;
const TypeDesc = @import("desc.zig").TypeDesc;

const MetadataQueryResultHandle = @import("metadata_query.zig").QueryResultHandle;

const ServerContext = @import("server.zig").Context;
const Transaction = @import("transaction.zig").Transaction;

const Unit = @import("unit.zig").Unit;
const UnitState = @import("unit.zig").State;
const UnitIdentifier = @import("unit.zig").Identifier;
const UnitAttributes = @import("unit.zig").Attributes;

const Throughput = @import("throughput.zig").Throughput;

// ==================================================
// Structs
// ==================================================
/// Structure returned by RfcGetConnectionAttributes() giving some
/// information about the partner system on the other side of this RFC connection.
pub const Attributes = extern struct {
    /// RFC destination
    dest: [65]SapUc = mem.zeroes([65]SapUc),
    /// Own host name
    host: [101]SapUc = mem.zeroes([101]SapUc),
    /// Partner host name
    partner_host: [101]SapUc = mem.zeroes([101]SapUc),
    /// R/3 system number
    sys_number: [3]SapUc = mem.zeroes([3]SapUc),
    /// R/3 system ID
    sys_id: [9]SapUc = mem.zeroes([9]SapUc),
    /// Client ("Mandant")
    client: [4]SapUc = mem.zeroes([4]SapUc),
    /// User
    user: [13]SapUc = mem.zeroes([13]SapUc),
    /// Language
    language: [3]SapUc = mem.zeroes([3]SapUc),
    /// Trace level (0-3)
    trace: [2]SapUc = mem.zeroes([2]SapUc),
    /// 2-byte ISO-Language
    iso_language: [3]SapUc = mem.zeroes([3]SapUc),
    /// Own code page
    codepage: [5]SapUc = mem.zeroes([5]SapUc),
    /// Partner code page
    partner_codepage: [5]SapUc = mem.zeroes([5]SapUc),
    /// C/S: RFC Client / RFC Server
    rfc_role: [2]SapUc = mem.zeroes([2]SapUc),
    /// 2/3/E/R: R/2,R/3,Ext,Reg.Ext
    type: [2]SapUc = mem.zeroes([2]SapUc),
    /// 2/3/E/R: R/2,R/3,Ext,Reg.Ext
    partner_type: [2]SapUc = mem.zeroes([2]SapUc),
    /// My system release
    rel: [5]SapUc = mem.zeroes([5]SapUc),
    /// Partner system release
    partner_rel: [5]SapUc = mem.zeroes([5]SapUc),
    /// Partner kernel release
    kernel_rel: [5]SapUc = mem.zeroes([5]SapUc),
    /// CPI-C Conversation ID
    cpic_conv_id: [9]SapUc = mem.zeroes([9]SapUc),
    /// Name of the calling APAB program (report, module pool)
    prog_name: [129]SapUc = mem.zeroes([129]SapUc),
    /// Number of bytes per character in the backend's current codepage. Note this is different from the semantics of the PCS parameter.
    partner_bytes_per_char: [2]SapUc = mem.zeroes([2]SapUc),
    ///  Partner system code page
    partner_systemc_odepage: [5]SapUc = mem.zeroes([5]SapUc),
    /// Partner IP
    partner_ip: [16]SapUc = mem.zeroes([16]SapUc),
    /// Partner IPv6
    partner_ipv6: [46]SapUc = mem.zeroes([46]SapUc),
    /// Reserved for later use
    reserved: [17]SapUc = mem.zeroes([17]SapUc),
};

/// Structure used for connecting to a backend system via RfcOpenConnection() or
/// RfcRegisterServer(). For a list of supported parameters see these two functions or the file sapnwrfc.ini, which gives a complete list of all possible connection parameters.
pub const Parameter = extern struct {
    /// The name of the connection parameter, like ashost, user, client.
    name: [*c]const SapUc = null,
    /// The value of the given parameter.
    value: [*c]const SapUc = null,
};

// ==================================================
// Connection
// ==================================================
extern fn RfcCloseConnection(self: *Connection, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcIsConnectionHandleValid(self: *Connection, is_valid: *c_int, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcCancel(self: *Connection, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcResetServerContext(self: *Connection, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcPing(self: *Connection, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetConnectionAttributes(self: *Connection, attr: *Attributes, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetServerContext(self: *Connection, context: *ServerContext, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetSapRouter(self: *Connection, sapRouter: [*]SapUc, length: *c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetPartnerExternalIP(self: *Connection, partner_external_ip: [*]SapUc, length: *c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetLocalAddress(self: *Connection, local_address: [*]SapUc, length: *c_uint, local_port: *c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetPartnerSSOTicket(self: *Connection, sso_ticket: [*]SapUc, length: *c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetPartnerSNCName(self: *Connection, sncName: [*]SapUc, length: c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetPartnerSNCKey(self: *Connection, sncKey: [*]SapRaw, length: *c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcListenAndDispatch(self: *Connection, timeout_s: c_int, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcInvoke(self: *Connection, func_handle: *Function, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetServerStateful(self: *Connection, is_stateful: c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetTransactionID(self: *Connection, tid: [*]SapUc, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcCreateTransaction(self: *Connection, tid: [*]SapUc, queueName: [*c]const SapUc, error_info: ?*ErrorInfo) ?*Transaction;
extern fn RfcConfirmTransactionID(self: *Connection, tid: [*]SapUc, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetUnitID(self: *Connection, uid: [*]SapUc, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcCreateUnit(self: *Connection, uid: [*]SapUc, queue_names: ?[*][*]const SapUc, queue_name_count: c_uint, unit_attr: *const UnitAttributes, identifier: *UnitIdentifier, error_info: ?*ErrorInfo) ?*Unit;
extern fn RfcConfirmUnit(self: *Connection, identifier: *UnitIdentifier, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetUnitState(self: *Connection, identifier: *UnitIdentifier, state: *UnitState, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetFunctionDesc(self: *Connection, func_name: [*:0]const SapUc, error_info: ?*ErrorInfo) ?*FunctionDesc;
extern fn RfcGetTypeDesc(self: *Connection, type_name: [*:0]const SapUc, error_info: ?*ErrorInfo) ?*TypeDesc;
extern fn RfcGetClassDesc(self: *Connection, class_name: [*:0]const SapUc, error_info: ?*ErrorInfo) ?*ClassDesc;

extern fn RfcMetadataBatchQuery(rfcHandle: *Connection, function_names: ?[*][*]const SapUc, function_count: c_uint, type_names: ?[*][*]const SapUc, type_count: c_uint, class_names: ?[*][*]const SapUc, class_count: c_uint, handle: MetadataQueryResultHandle, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetThroughputOnConnection(rfcHandle: *Connection, throughput: *Throughput, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetThroughputFromConnection(rfcHandle: *Connection, error_info: ?*ErrorInfo) ?*Throughput;
extern fn RfcRemoveThroughputFromConnection(rfcHandle: *Connection, error_info: ?*ErrorInfo) ReturnCode;

/// Handle to an RFC connection (client connection or server connection).
/// Returned by RfcOpenConnection() or RfcRegisterServer().
pub const Connection = extern struct {
    handle: ?*anyopaque = null,

    /// Closes an RFC connection
    ///
    /// Can be used to close client connections as well as server connections, when they are no longer needed.
    pub fn Close(self: *Connection, error_info: ?*ErrorInfo) ReturnCode {
        return RfcCloseConnection(self, error_info);
    }

    /// Checks an RFC connection
    ///
    /// Can be used to check whether a client/server connection has already been closed,
    /// or whether the NW RFC library still "considers" the connection to be open.
    /// Note that this does not guarantee that the connection is indeed still alive:
    /// A firewall may silently have closed the connection without notifying the endpoints.
    /// If you want to find out, whether the connection is still alive, you'll have to
    /// use the more expensive RfcPing().
    pub fn IsHandleValid(
        self: *Connection,
        /// 1, if the connection is still found in the internal connection management, 0 otherwise.
        is_valid: *c_int,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcIsConnectionHandleValid(self, is_valid, error_info);
    }

    /// Cancels the RFC call which is currently being called over the given RFC connection and closes the connection
    ///
    /// Can be used only on an RFC client connection and needs to be called from a different thread than the one currently executing the RFC call.
    ///
    /// RFC client connection which is currently blocked in RfcInvoke().
    ///
    /// `return` RFC_OK, if cancel was requested; RFC_ILLEGAL_STATE, if the connection is currently not in a call; or RFC_NOT_SUPPORTED, if the handle is a server handle.
    pub fn Cancel(self: *Connection, error_info: ?*ErrorInfo) ReturnCode {
        return RfcCancel(self, error_info);
    }

    /// RFC_RC SAP_API RfcResetServerContext
    ///
    /// Resets the SAP server context ("user context / ABAP session context") associated with the given client
    /// connection, but does not close the connection.
    ///
    /// The client connection, whose server context is to be reset.
    pub fn ResetServerContext(self: *Connection, error_info: ?*ErrorInfo) ReturnCode {
        return RfcResetServerContext(self, error_info);
    }

    /// Ping the remote communication partner through the passed connection handle.
    ///
    /// Sends a ping to the backend in order to check, whether the connection is still alive.
    /// Can be used on both, client connections as well as server connections.
    /// \warning Do not use inside a server function implementation.
    pub fn Ping(self: *Connection, error_info: ?*ErrorInfo) ReturnCode {
        return RfcPing(self, error_info);
    }

    /// Returns details about the current client or server connection.
    ///
    /// Consider that in case you are a server and call RfcListenAndDispatch(), the partner fields
    /// of the attributes will be cleared. The reason is, although we might be only connected to a
    /// gateway of one application server, the function module can be also called from the other
    /// application servers of the system if configured accordingly in the SM59 destination.
    ///
    /// I.e. expect only valid partner information from within a function module. Outside of the
    /// function module, e.g. in the loop where RfcListenAndDispatch is called, you will get
    /// cleared partner information in most of the cases except case RFC_OK, which means that you
    /// were just called by an application server.
    ///
    /// See documentation of RFC_ATTRIBUTES.
    pub fn GetAttributes(self: *Connection, attr: *Attributes, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetConnectionAttributes(self, attr, error_info);
    }

    /// Inside a server function, returns details about the current execution context.
    ///
    /// See documentation of RFC_SERVER_CONTEXT.
    pub fn GetServerContext(self: *Connection, context: *ServerContext, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetServerContext(self, context, error_info);
    }

    /// Gets the SAPRouter, if any.
    ///
    /// `return` RFC_BUFFER_TOO_SMALL, if the provided sapRouter buffer was too small. RFC_OK otherwise.
    pub fn GetSapRouter(
        self: *Connection,
        /// Pre-allocated buffer
        sap_router: [*]SapUc,
        /// Needs to be filled with the buffer length of sapRouter. The return value will be the string
        /// length of the returned sapRouter (if buffer was large enough) or the required buffer size (if RFC_BUFFER_TOO_SMALL).
        /// In the first case, the length value will be the string length without the terminating zero, in the second case it will be the
        /// required buffer size including the terminating zero.
        length: *c_uint,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcGetSapRouter(self, sap_router, length, error_info);
    }

    /// Gets the external IP address of the communication partner.
    ///
    /// In scenarios where NAT (Network Address Translation) is performed between the LAN segment, where the external RFC program is
    /// running, and the LAN segment, where the backend system is running, the RFC_ATTRIBUTES (members "partnerHost", "partnerIP" or "partnerIPv6")
    /// will always contain the hostname/address returned by the backend system, which is the address as it is known inside the internal LAN segment.
    /// However, this address is usually unusable/invalid inside the external LAN segment. External programs that need a valid "external" IP address
    /// of the current communication partner, can use this API to obtain it.
    /// If no NAT is used in the current scenario, the value returned by this API will be equal to partnerIP/partnerIPv6 from the RFC_ATTRIBUTES.
    ///
    /// `return` RFC_BUFFER_TOO_SMALL, if the provided partnerExternalIP buffer was too small.
    /// RFC_INVALID_HANDLE, if the given rfcHandle is not connected.
    /// RFC_INVALID_PARAMETER, if one of the input values is invalid.
    /// RFC_OK otherwise.
    pub fn GetPartnerExternalIP(
        self: *Connection,
        /// Pre-allocated buffer
        partner_external_ip: [*]SapUc,
        /// Needs to be filled with the buffer length of partnerExternalIP. The return value will be the string
        /// length of the returned external IP (if buffer was large enough) or the required buffer size (if RFC_BUFFER_TOO_SMALL).
        /// In the first case, the length value will be the string length without the terminating zero, in the second case it will be the
        /// required buffer size including the terminating zero.
        length: *c_uint,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcGetPartnerExternalIP(self, partner_external_ip, length, error_info);
    }

    /// Gets the IP address of the local network interface used by this connection.
    ///
    /// On servers with multiple network interfaces, it may be useful to know, via which interface the current connection has been established.
    ///
    /// `return` RFC_BUFFER_TOO_SMALL, if the provided partnerExternalIP buffer was too small.
    /// RFC_INVALID_HANDLE, if the given rfcHandle is not connected.
    /// RFC_INVALID_PARAMETER, if one of the input values is invalid.
    /// RFC_EXTERNAL_FAILURE, if a network level error occurs.
    /// RFC_OK otherwise.
    pub fn GetLocalAddress(
        self: *Connection,
        /// Pre-allocated buffer. If you use a buffer of length at least 46, it will always be sufficient,
        /// even in case of IPv6 addresses.
        local_address: [*]SapUc,
        /// Needs to be filled with the buffer length of partnerExternalIP. The return value will be the string
        /// length of the returned external IP (if buffer was large enough) or the required buffer size (if RFC_BUFFER_TOO_SMALL).
        /// In the first case, the length value will be the string length without the terminating zero, in the second case it will be the
        /// required buffer size including the terminating zero.
        length: *c_uint,
        /// The local port used for the network connection.
        local_port: *c_uint,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcGetLocalAddress(self, local_address, length, local_port, error_info);
    }

    /// Gets the partner's SSO2 ticket, if any.
    ///
    /// Can be used in two cases: call it inside the implementation of a server function and pass the server connection as rfcHandle,
    /// if you want to obtain the ticket sent from the ABAP side. For this to work, one of the flags "Send Logon Ticket" or "Send
    /// Assertion Ticket" (or similar) needs to be activated in the definition of the corresponding RFC destination in SM59.
    /// Or call it after RfcOpenConnection() and pass the client connection as rfcHandle, to obtain the ticket issued for the currrently
    /// logged in user. For this to work, the connection must be opened with parameter GETSSO2=1 and the profile parameter
    /// login/create_sso2_ticket must be set to a value different from "0" in the backend.
    ///
    /// `return` RFC_RC
    /// \warning
    pub fn GetPartnerSSOTicket(
        self: *Connection,
        /// Pre-allocated buffer, which will receive the backend user's SSO2 ticket (signed user information in base64 format)
        sso_ticket: [*]SapUc,
        /// Needs to be filled with the buffer length of ssoTicket. The return value will be the string
        /// length of the returned ticket (if buffer was large enough) or the required buffer size (if RFC_BUFFER_TOO_SMALL).
        /// In the first case, the length value will be the string length without the terminating zero, in the second case it will be the
        /// required buffer size including the terminating zero.
        length: *c_uint,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcGetPartnerSSOTicket(self, sso_ticket, length, error_info);
    }

    /// Gets the partner's SNC name, if any.
    ///
    /// RFC server connection. If this function is executed on a client connection, RFC_ILLEGAL_STATE will be returned.
    pub fn GetPartnerSNCName(
        self: *Connection,
        /// Pre-allocated buffer, which will receive the backend user's SNC name (null-terminated string).
        sncName: [*]SapUc,
        /// Size of the pre-allocated buffer. This information is coming from the GSS library, therefore
        /// unfortunately the feature of assigning the used/required length to an output parameter is not possible in this case.
        /// The maximum length of an SNC name is 256.
        length: c_uint,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcGetPartnerSNCName(self, sncName, length, error_info);
    }

    /// Gets partner's SNC key, if any.
    ///
    /// RFC server connection. If this function is executed on a client connection, RFC_ILLEGAL_STATE will be returned.
    pub fn GetPartnerSNCKey(
        /// RFC server connection. If this function is executed on a client connection, RFC_ILLEGAL_STATE will be returned.
        self: *Connection,
        /// Pre-allocated buffer, which will receive the backend user's SNC key.
        snc_key: [*]SapRaw,
        /// Needs to be filled with the buffer length of ssoTicket. The return value will be the byte
        /// length of the returned key (if buffer was large enough). Unfortunately in case of RFC_BUFFER_TOO_SMALL
        /// the required size is not returned by the GSS library.
        /// The maximum length of an SNC key is 1024.
        length: *c_uint,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcGetPartnerSNCKey(self, snc_key, length, error_info);
    }

    /// Listens on a server connection handle and waits for incoming RFC calls from the R/3 system.
    ///
    /// The mechanism for dispatching incoming function calls works as follows:
    /// First %RfcListenAndDispatch() checks, whether for the current combination of R/3 SystemID and function
    /// module name a callback function has been installed via RfcInstallServerFunction(). If not, it checks,
    /// whether a callback function for SystemID=NULL has been installed via RfcInstallServerFunction().If not,
    /// it checks, whether a global callback function has been installed via RfcInstallGenericServerFunction().
    ///
    /// If a callback function has been found, the RFC call will be dispatched to that function for processing,
    /// and %RfcListenAndDispatch() returns the return code of the callback function.
    /// Otherwise %RfcListenAndDispatch() returns a SYSTEM_FAILURE to the R/3 backend and the return code
    /// RFC_NOT_FOUND to the caller.
    ///
    /// In general the return codes of %RfcListenAndDispatch() have the following meaning:
    /// - RFC_OK A function call was processed successfully.
    /// - RFC_RETRY No function call came in within the specified timeout period. ("timeout" is given in seconds.)
    /// - RFC_ABAP_EXCEPTION A function call was processed and ended with a defined ABAP Exception, which has
    /// been returned to the backend.
    ///
    /// In the above three cases "rfcHandle" is still open and can be used to listen for the next request.
    ///
    /// - RFC_ABAP_MESSAGE A function call was started to be processed, but was aborted with an ABAP A-, E- or X-Message.
    ///  The message parameters have been returned to the backend (and can be evaluated there via
    ///  the sy-msgid, sy-msgtype, sy-msgno, sy-msgv1, ..., sy-msgv4 parameters).
    /// - RFC_EXTERNAL_FAILURE A function call was started to be processed, but was aborted with a "SYSTEM_FAILURE",
    ///  which has been returned to the backend.
    /// - RFC_COMMUNICATION_FAILURE The connection broke down while processing the function call. No response
    ///  has been sent to the backend.
    /// - RFC_CLOSED The connection has been closed by the backend side (SMGW, SM04). No response
    ///  has been sent to the backend.
    /// - RFC_NOT_FOUND No handler has been found for the current function module name. A SYSTEM_FAILURE has
    ///  been returned to the R/3 backend.
    ///
    /// In these five cases the connection has been closed, so the "rfcHandle" needs to be refreshed via RfcRegisterServer.
    ///
    /// - RFC_INVALID_HANDLE "rfcHandle" is invalid or points to a connection that has already been closed.
    ///
    /// Server connection on which to listen for incoming requests.
    pub fn ListenAndDispatch(
        /// Server connection on which to listen for incoming requests.
        self: *Connection,
        /// Number of seconds to wait for an incoming request.
        timeout_s: c_int,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcListenAndDispatch(self, timeout_s, error_info);
    }

    /// Executes a function module in the backend system.
    ///
    /// The return codes have the following meaning:
    /// - RFC_OK The function call was executed successfully.
    /// - RFC_ABAP_EXCEPTION The function call was executed and ended with a defined ABAP Exception. The key of the
    ///  exception can be obtained from errorInfo->key.
    ///
    /// In the above two cases "rfcHandle" is still open and can be used to execute further function call.
    ///
    /// - RFC_ABAP_MESSAGE The function call was started to be processed, but was aborted with an ABAP Message.
    ///  The message parameters can be obtained from errorInfo->abapMsgClass, errorInfo->abapMsgType,
    ///  errorInfo->abapMsgNumber, errorInfo->abapMsgV1, ..., errorInfo->abapMsgV4.
    /// - RFC_ABAP_RUNTIME_FAILURE The function call was started to be processed, but was aborted with a SYSTEM_FAILURE
    ///  (e.g division by zero, unhandled exception, etc in the backend system).
    ///  Details can be obtained from errorInfo->message.
    /// - RFC_COMMUNICATION_FAILURE The connection broke down while processing the function call.
    ///  Details can be obtained from errorInfo->message.
    ///
    /// In these three cases the connection has been closed, so the "rfcHandle" needs to be refreshed via RfcOpenConnection.
    ///
    /// - RFC_INVALID_HANDLE "rfcHandle" is invalid or points to a connection that has already been closed.
    ///
    /// Client connection over which to execute the function module.
    pub fn Invoke(
        /// Client connection over which to execute the function module.
        self: *Connection,
        ///  Data container containing the input data for the function module.
        ///  %RfcInvoke() will write the FM's output data into this container.
        func_handle: *Function,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcInvoke(self, func_handle, error_info);
    }

    /// Sets this client's operation mode to statefull or stateless.
    ///
    /// When a client session operates in stateless mode, which is the default, it does not keep state information inbetween several
    /// RFC requests over the same connection. By setting it to stateful, you can change that so that all requests over one connection
    /// run inside one single "user session".
    ///
    /// `note` This can be used only for connection handles being managed by an automated (multi-count) server. If you try to use it
    /// on an ordinary connection created with RfcRegisterServer() or RfcStartServer(), you will get an RFC_ILLEGAL_STATE error.
    ///
    /// A handle to the current client connection. Use the one that gets passed to you in your RFC_SERVER_FUNCTION implementation.
    pub fn SetServerStateful(
        self: *Connection,
        /// Specifies whether the server should operate in stateful mode ("1") or in stateless mode ("0").
        is_stateful: c_uint,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        RfcSetServerStateful(self, is_stateful, error_info);
    }

    /// Retrieves a unique 24-digit transaction ID from the backend.
    /// If you specify NULL as connection handle, the API will attempt to generate a TID locally using the
    /// operating system's UUID algorithms. (Currently not possible on AIX systems.)
    ///
    /// Client connection to a backend or NULL, if you want to create a TID locally.
    pub fn GetTransactionID(
        self: *Connection,
        /// Will be filled with the transaction ID.
        tid: [*]SapUc,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcGetTransactionID(self, tid, error_info);
    }

    /// Creates a container for executing a (multi-step) transactional call.
    ///
    /// If queueName is NULL, tRFC will be used, otherwise qRFC. Use RfcInvokeInTransaction() to
    /// add one (or more) function modules to the transactional call. When sending this transactional
    /// call to the backend via RfcSubmitTransaction(), the backend will then treat
    /// all function modules in the RFC_TRANSACTION_HANDLE as one LUW.
    ///
    /// Client connection to the backend, into which you want to send this tRFC/qRFC LUW.
    ///
    /// `return` A data container that can be filled with several function modules.
    pub fn CreateTransaction(
        self: *Connection,
        /// A unique 24 character ID.
        tid: [*]SapUc,
        /// For tRFC set this to NULL, for qRFC specify the name of a qRFC inbound queue in the backend.
        queue_name: ?[*]const SapUc,
        error_info: ?*ErrorInfo,
    ) ?*Transaction {
        return RfcCreateTransaction(self, tid, queue_name, error_info);
    }

    /// Convenience function to remove the TID contained in a previous RFC_TRANSACTION_HANDLE from the backend's ARFCRSTATE table,
    /// without the need of still having the RFC_TRANSACTION_HANDLE at hand.
    ///
    /// After RfcSubmitTransaction() has finally succeeded, call %RfcConfirmTransactionID() to clean up the
    /// transaction handling table in the backend. This function can be called after the RFC_TRANSACTION_HANDLE has
    /// already been deleted.
    /// \warning Attention: after this call, the backend is no longer protected against this TID. So another
    /// RfcSubmitTransaction() with the same transaction handle would result in a duplicate.
    ///
    ///
    /// A connection into the same system, into which the corresponding transaction has been sent via RfcSubmitTransaction().
    ///
    /// \warning You may retry the Confirm step, if you get an error here, but do not retry the Submit step!
    pub fn ConfirmTransactionID(self: *Connection, tid: [*]SapUc, error_info: ?*ErrorInfo) ReturnCode {
        return RfcConfirmTransactionID(self, tid, error_info);
    }

    /// Create a 32 digit bgRFC unit ID.
    ///
    /// This function fills the given RFC_UNITID with a 32 digit hexadecimal GUID and zero-terminates it.
    /// If you want the GUID to be generated by the backend, pass a valid rfcHandle, if you want the
    /// NW RFC library to generate one locally (using the appropriate OS functions), pass NULL as
    /// connection handle. In both cases the GUID is suitable for sending bgRFC units into an SAP system.
    ///
    ///
    /// rfcHandle An open RFC connection into the system that is to create the unit ID, or NULL.
    pub fn GetUnitID(
        self: *Connection,
        /// Preallocated buffer that will receive the 32 digits of the unit ID and a terminating zero.
        uid: [*]SapUc,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcGetUnitID(self, uid, error_info);
    }

    /// Create a bgRFC unit.
    ///
    /// Creates a data container that can later be filled with one or more function modules comprising the
    /// bgRFC unit. The backend will execute these function modules as an atomic unit.
    /// The connection handle specifies the target system, to which the unit will later be sent. The unit ID
    /// has been created in the previous step (or is an old one in case of retrying a failed unit).
    /// Via queueNames and queueNameCount you can specify the list of bgRFC queues, into which this unit
    /// shall later be inserted. If no queues are given (queueNameCount == 0), a synchronous unit is created
    /// (type 'T') that will later be executed immediately. Otherwise an asynchronous unit (type 'Q') is created,
    /// which will be inserted into the named queues and executed asynchronously by the bgRFC scheduler.
    ///
    ///
    /// `self` An open RFC connection into the system that will later receive the unit.
    ///
    /// `return` RFC_OK or RFC_MEMORY_INSUFFICIENT
    pub fn CreateUnit(
        self: *Connection,
        ///  A 32 digit unique identifier of the unit.
        uid: [*]SapUc,
        /// A list of bgRFC queues in the backend or NULL.
        queue_names: ?[*][*]const SapUc,
        /// The length of the queueNames list.
        queue_name_count: c_uint,
        /// A set of attributes that specify the behaviour of the unit in the backend.
        /// See RFC_UNIT_ATTRIBUTES for more information.
        unit_attr: *const UnitAttributes,
        /// This identifier can be used in later calls to RfcConfirmUnit() and RfcGetUnitState().
        /// It is important that these functions are called with the correct unit type ('T' or 'Q'), otherwise
        /// the backend system won't find the status information corresponding to the uid... Therefore the
        /// NW RFC lib bundles the uid and the correct unit type here for your convenience.
        identifier: *UnitIdentifier,
        error_info: ?*ErrorInfo,
    ) ?*Unit {
        return RfcCreateUnit(self, uid, queue_names, queue_name_count, unit_attr, identifier, error_info);
    }

    /// Removes the UID from the backend's status management.
    ///
    /// After RfcSubmitUnit() returned successfully, you should use this function to cleanup
    /// the status information for this unit on backend side. However, be careful: if you have
    /// a three-tier architecture, don't bundle Submit and Confirm into one single logical step.
    /// Otherwise you run the risk, that the middle tier (the NW RFC lib) successfully executes
    /// both, the Submit and the Confirm, but on the way back to the first tier an error occurs
    /// and the first tier can not be sure that the unit was really executed in the backend and
    /// therefore decides to re-execute it. This will now result in a duplicate execution in the
    /// backend, because the Confirm step in the first try has already deleted the UID in the
    /// backend, and consequently the backend is no longer protected against re-execution of this
    /// UID. In a three-tier architecture, the first tier should trigger both steps separately:
    /// first the Submit, and after it knows that the Submit was successful, the Confirm.
    /// Also in case the Confirm runs into an error, do NOT execute the Submit again, never!
    /// You may try the Confirm again at a later point, but otherwise just ignore the error.
    /// Better a left-over entry in the status information table than a duplicate unit...
    ///
    /// A connection into the same system, into which the corresponding bgRFC unit
    /// has been sent via RfcSubmitUnit().
    ///
    /// `return` RFC_OK, RFC_INVALID_HANDLE, RFC_COMMUNICATION_FAILURE
    pub fn ConfirmUnit(
        self: *Connection,
        /// The correct combination of UID and type of the unit. Best use the output
        /// you get from RfcCreateUnit().
        identifier: *UnitIdentifier,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcConfirmUnit(self, identifier, error_info);
    }

    /// Retrieves the processing status of the given background unit from the backend system's status management.
    ///
    /// A connection into the same system, into which the corresponding bgRFC unit
    /// has been sent via RfcSubmitUnit().
    ///
    /// `return` RFC_RC
    pub fn GetUnitState(
        self: *Connection,
        /// The correct combination of UID and type of the unit. Best use the output
        /// you get from RfcCreateUnit().
        identifier: *UnitIdentifier,
        /// `out` The state of the unit. See RFC_UNIT_STATE for more details.
        state: *UnitState,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcGetUnitState(self, identifier, state, error_info);
    }

    /// Returns the function description that is valid for the system to which rfcHandle points to.
    ///
    /// If the function description is already in the repository cache for that system ID, it will be
    /// returned immediately (from the cache), otherwise it will be looked up in the system's DDIC using
    /// the rfcHandle. The result from the DDIC lookup will then be placed into the cache for later use.
    ///
    /// The RFC Runtime maintains a cache for every R/3 System ID, as the meta data could be different
    /// from R/3 release to R/3 release.
    /// This is the main API that should be used.
    ///
    /// Open client connection to the R/3 System, for which you need the function module description.
    pub fn GetFunctionDesc(self: *Connection, func_name: [*:0]const SapUc, error_info: ?*ErrorInfo) ?*FunctionDesc {
        return RfcGetFunctionDesc(self, func_name, error_info);
    }

    /// Returns the structure description that is valid for the system to which rfcHandle points to.
    ///
    /// If the structure description is already in the repository cache for that system ID, it will be
    /// returned immediately (from the cache), otherwise it will be looked up in the system's DDIC using
    /// the rfcHandle. The result from the DDIC lookup will then be placed into the cache for later use.
    ///
    /// The RFC Runtime maintains a cache for every R/3 System ID, as the meta data could be different
    /// from R/3 release to R/3 release.
    /// `note` Normally it should not be necessary to lookup separate structure descriptions. They are
    /// already looked up as part of the function module, in which they are used.
    ///
    ///  `self` rfcHandle Open client connection to the R/3 System, for which you need the structure description.
    pub fn GetTypeDesc(self: *Connection, type_name: [*:0]const SapUc, error_info: ?*ErrorInfo) ?*TypeDesc {
        return RfcGetTypeDesc(self, type_name, error_info);
    }

    /// Returns the class description that is valid for the system to which rfcHandle points to.
    ///
    /// If the class description is already in the repository cache for that system ID, it will be
    /// returned immediately (from the cache), otherwise it will be looked up in the system's DDIC using
    /// the rfcHandle. The result from the DDIC lookup will then be placed into the cache for later use.
    ///
    /// The RFC Runtime maintains a cache for every R/3 System ID, as the meta data could be different
    /// from R/3 release to R/3 release.
    /// This is the main API that should be used.
    ///
    /// `self`  Open client connection to the R/3 System, for which you need the class description.
    pub fn GetClassDesc(self: *Connection, class_name: [*:0]const SapUc, error_info: ?*ErrorInfo) ?*ClassDesc {
        return RfcGetClassDesc(self, class_name, error_info);
    }
    /// Queries the meta data for function, type and class lists.
    ///
    /// Queries the meta data for function, type and class lists. All meta data is fetched using one roundtrip,
    /// the result is cached in the repository cache.
    ///
    ///  **note** You can use this feature only, if your backend system supports it. SAP Note 1456826 describes the
    /// required minimum support package level that the backend system must have. If the backend system supports
    /// it, open the RFC_CONNECTION_HANDLE with the additional logon parameter USE_REPOSITORY_ROUNDTRIP_OPTIMIZATION=1,
    /// before you pass it to %RfcMetadataBatchQuery().
    pub fn MetadataBatchQuery(self: *Connection, function_names: ?[*][*]const SapUc, function_count: c_uint, type_names: ?[*][*]const SapUc, type_count: c_uint, class_names: ?[*][*]const SapUc, class_count: c_uint, handle: MetadataQueryResultHandle, error_info: ?*ErrorInfo) ReturnCode {
        return RfcMetadataBatchQuery(self, function_names, function_count, type_names, type_count, class_names, class_count, handle, error_info);
    }
    /// Attaches a throughput object to a connection to be monitored by the throughput object.
    ///
    /// Once attached to a connection, the throughput object will collect data of the function calls invoked via this connection.
    /// If there is already another throughput obejct attached to the connection, the old one will be replaced by the given one.
    /// The below chart shows a simplified view how the different time measurements apply for a client call.
    ///
    /// Client                                            Server (backend)                                       Client
    ///
    ///          API begin   serialization   writing       server time        reading    deserialization   API end
    ///       ____________|_______________|_________   _|_____________|_   |__________|_________________|____________
    ///
    /// When using the column-based serialization, the monitoring is more fractured.
    ///
    /// Client                                            Server (backend)                                       Client
    ///
    ///        API begin   serialization                   server time           deserialization      API end
    ///       ____________|I___I   I___I   I___I|       _|_____________|_      |I___I   I___I   I___I|____________
    ///                          writing                                      reading
    ///                        |I_I     I_I     I_I||                       |I_I     I_I     I_I|
    ///
    pub fn SetThroughputOnConnection(self: *Connection, throughput: *Throughput, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetThroughputOnConnection(self, throughput, error_info);
    }
    /// Returns the currently attached throughput object from a connection, if any.
    ///
    /// Returns null if none is attached.
    pub fn GetThroughputFromConnection(self: *Connection, error_info: ?*ErrorInfo) ?*Throughput {
        return RfcGetThroughputFromConnection(self, error_info);
    }
    /// Removes the throughput object from a connection. The connection will no longer be monitored.
    pub fn RemoveThroughputFromConnection(self: *Connection, error_info: ?*ErrorInfo) ReturnCode {
        return RfcRemoveThroughputFromConnection(self, error_info);
    }
};

// ==================================================
// Functions
// ==================================================

/// Opens an RFC client connection for invoking ABAP function modules in an R/3 backend.
///
/// Opens a client connection to an SAP System. The connectionParams may contain the following name-value pairs:
/// - client, user, passwd, lang, trace
///
/// and additionally one of
/// -# Direct application server logon: ashost, sysnr.
/// -# Logon with load balancing: mshost, msserv, sysid, group.\n
///     msserv is needed only, if the service of the message server is
///     not defined as sapms<SYSID> in /etc/services.
///
/// When logging on with SNC, user&passwd are to be replaced by
/// - snc_qop, snc_myname, snc_partnername and optionally snc_lib.
///
/// (If snc_lib is not specified, the underlying SNC layer uses the "global" GSS library
/// defined via environment variable SNC_LIB or SNC_LIB_64.)
///
/// When logging on with SSO Ticket, you can use mysapsso2 instead of user&passwd.
/// The old SSO format (mysapsso) is no longer supported.
///
///
/// Alternatively the connection parameters can be defined in the config file
/// sapnwrfc.ini. In this case you just pass the parameter dest=... and all
/// parameters that are missing in the sapnwrfc.ini entry into %RfcOpenConnection().
///
/// For a complete list of logon parameters to be used in connectionParams as well as in the
/// sapnwrfc.ini file, see the sample sapnwrfc.ini file in the SDK's demo folder.
///
/// If the logon was ok, %RfcOpenConnection() returns a client connection handle, which can be used in RfcInvoke().
/// Otherwise the return value is NULL and errorInfo contains a detailed error description.
/// errorInfo code will be one of:
/// - RFC_INVALID_PARAMETER One of the connectionParams was invalid
/// - RFC_COMMUNICATION_FAILURE Something is wrong with the network or network settings
/// - RFC_LOGON_FAILURE Invalid user/password/ticket/certificate
/// - RFC_ABAP_RUNTIME_FAILURE Something is wrong with the R/3 backend
/// - RFC_MEMORY_INSUFFICIENT A malloc failed when trying to allocate a temporary buffer
///
/// `return` A handle to an RFC client connection that can be used for invoking ABAP function modules in the backend.
pub extern fn RfcOpenConnection(
    /// An array of RFC_CONNECTION_PARAMETERs with the names as described above
    /// and the values as necessary in your landscape.
    connection_params: [*]const Parameter,
    /// Number of parameters in the above array.
    param_count: c_uint,
    error_info: ?*ErrorInfo,
) ?*Connection;

/// Registers a server connection at an SAP gateway.
///
/// The connectionParams may contain the following name-value pairs:
/// - gwhost, gwserv, program_id, trace, and the parameters for SNC communication as in RfcOpenConnection().
///
/// Program_id corresponds to an RFC destination in SM59 of type "T" in registration mode.
///
/// For a complete list of logon parameters to be used in connectionParams as well as in the
/// sapnwrfc.ini file, see the sample sapnwrfc.ini file in the SDK's demo folder.
///
/// If the connection registration was ok, %RfcRegisterServer() returns a server connection handle, which can
/// be used in RfcListenAndDispatch().
/// Otherwise the return value is NULL and errorInfo contains information similar to the RfcOpenConnection() case.
///
/// `return` A handle to an RFC server connection that can be used for listening for function module requests from the backend.
pub extern fn RfcRegisterServer(
    /// An array of RFC_CONNECTION_PARAMETERs with the names as described above
    /// and the values as necessary in your landscape.
    connection_params: [*]const Parameter,
    /// Number of parameters in the above array.
    param_count: c_uint,
    error_info: ?*ErrorInfo,
) ?*Connection;

/// Allows a program to be used as an RFC server which is started by the backend on demand.
///
/// This API needs to be called, if the server program is to be started by the R/3 application server.
/// (RFC destination in SM59 of type "T" in startup mode.)
/// argc and argv are the inputs of the mainU function. The R/3 application server passes the correct command line to
/// the program, when starting it up, so you only need to forward these two parameters to %RfcStartServer().
/// connectionParams is optional and is only needed, if you want to add additional logon parameters to the
/// ones coming from the command line, e.g for activating trace.
///
/// Like RfcRegisterServer(), the function returns a server connection handle that can be used in RfcListenAndDispatch().
/// The mechanism of this kind of RFC destination thus works as follows:
/// - The R/3 application server opens a telnet connection to the host, where your server program is located, and
///     starts the program with the necessary logon parameters. (Or creates a child process, if the startup
///     method is "Start on application server".)
/// - Your server program calls RfcStartServer, which opens an RFC connection back to the R/3 system.
/// - The R/3 system then makes the function call over that RFC connection.
///
/// The main differences of "startup mode" compared to the "registration mode" are:
/// - Advantage: no logon parameters need to be maintained in the server program. (Unless you want to open
///    an additional client connection for looking up function module metadata (RFC_FUNCTION_DESC_HANDLEs) in the
///    R/3 DDIC.)
/// - Disadvantage: every single function call creates a new process and possibly a remote shell connection in addition to
///    the actual RFC connection.
///
/// `return` A handle to an RFC server connection that can be used for listening for function module requests from the backend.
pub extern fn RfcStartServer(
    /// From mainU() (command line supplied by backend)
    argc: c_int,
    /// From mainU() (command line supplied by backend)
    argv: [*][*]SapUc,
    /// May optionally contain additional logon parameters
    connection_params: [*]const Parameter,
    /// Length of the connection parameter array above
    param_count: c_uint,
    error_info: ?*ErrorInfo,
) ?*Connection;
