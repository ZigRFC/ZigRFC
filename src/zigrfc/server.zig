const mem = @import("std").mem;

const ReturnCode = @import("commons.zig").ReturnCode;
const ErrorInfo = @import("commons.zig").ErrorInfo;

const SapUc = @import("commons.zig").SapUc;
const TId = @import("commons.zig").TId;

const ConnectionParameter = @import("connection.zig").Parameter;
const Connection = @import("connection.zig").Connection;
const ConnectionAttributes = @import("connection.zig").Attributes;
const Function = @import("data_container.zig").Function;
const FunctionDesc = @import("desc.zig").FunctionDesc;
const Throughput = @import("throughput.zig").Throughput;
const UnitIdentifier = @import("unit.zig").Identifier;
const UnitAttributes = @import("unit.zig").Attributes;

// ==================================================
// Enums
// ==================================================
/// Used in RfcGetServerContext() for inquiring the type of
/// an incoming function call from the backend.
pub const CallType = enum(c_int) {
    /// It's a standard synchronous RFC call.
    synchronous,
    /// This function call is part of a transactional LUW (tRFC).
    transactional,
    /// This function call is part of a queued LUW (qRFC).
    queued,
    /// This function call is part of a background LUW (bgRFC).
    background_unit,
};

///  Used in state information in order to indicate the different types of RFC programs, RFC Server types, etc.
pub const ProtocolType = enum(c_int) {
    /// Unspecified
    unkown,
    /// RFC Client
    client,
    /// Started RFC Server
    started_server,
    /// Registered RFC Server
    registered_server,
    /// Multi-count registered RFC Server
    multi_count_registered_server,
    /// TCP Client
    tcp_socket_client,
    /// TCP Server
    tcp_socket_server,
    /// Websocket RFC Client
    websocket_client,
    /// Websocket RFC Server
    websocket_server,
    /// Websocket RFC Client
    proxy_websocket_client,
};

extern fn RfcGetServerStateAsString(serverState: ServerState) [*:0]const SapUc;
/// Used in state information in order to indicate the current state of an RFC Server.
pub const ServerState = enum(c_int) {
    /// The server object has been created, but nothing has been done with it yet.
    initial,
    /// The server has been started, but startup is not yet complete and the server is not yet able to receive/serve requests. Should quickly switch to RUNNING or BROKEN.
    starting,
    /// Means at least one registration is still able to accept request from the gateway (in case of Registered Server), or that the server port is open and listening (in case of TCP Socket Server).
    running,
    /// Means that all registrations are dead, e.g. because of gateway being down (in case of Registered Server), or that for some reason server port could not be opened (in case of TCP Socket Server).
    broken,
    /// The server has been stopped via RfcShutdownServer() (with a timeout > 0) and is still busy processing ongoing requests. It is however no longer accepting new requests.
    /// Should switch to STOPPED, once the ongoing requests are finished.
    stopping,
    /// The server has been stopped via RfcShutdownServer() and is currently not processing nor accepting any requests. The object, however, is still valid and can be started again anytime with RfcLaunchServer().
    stopped,

    /// Converts an RFC_SERVER_STATE state indicator to a human readable string for logging purposes.
    pub fn AsString(self: ServerState) [*:0]const SapUc {
        return RfcGetServerStateAsString(self);
    }
};

extern fn RfcGetSessionEventAsString(sessionEvent: SessionEvent) [*:0]const SapUc;
/// Used in a server session change listener to notify the application whenever a new user session on the server gets started or ends.
pub const SessionEvent = enum(c_int) {
    /// A new stateful user session has been created on the server. This can be done either by the server itself via RfcSetServerStateful(), or by the backend via function module SET_REG_PROPERTY
    created,
    /// A function call came in from the backend and started processing. This event can probably be ignored by 99% of the applications.
    activated,
    /// A function call completed processing. This event can probably be ignored by 99% of the applications.
    passivated,
    /// A stateful user session has been destroyed, either by the server itself via RfcSetServerStateful(),
    ///  or by the backend via function module SET_REG_PROPERTY,
    /// or because the connection was closed (e.g. the corresponding ABAP user session ended or explicitly closed the connection),
    /// or because the connection was broken by network error/system failure etc.
    /// The application should now clean up all memory/resources allocated for the given session ID.
    destroyed,

    /// Converts an RFC_SESSION_EVENT to a human readable string for logging purposes.
    pub fn GetAsString(self: SessionEvent) [*:0]const SapUc {
        return RfcGetSessionEventAsString(self);
    }
};

// ==================================================
// Structs
// ==================================================

/// Used in RfcGetServerContext() for obtaining more information about the
/// current incoming function call.
pub const Context = extern struct {
    /// Specifies the type of function call. Depending on the value of this field, some of the other fields of this struct may be filled.
    type: CallType = mem.zeroes(CallType),
    /// If type is RFC_TRANSACTIONAL or RFC_QUEUED, this field is filled with the 24 digit TID of the tRFC/qRFC unit.
    tid: TId = mem.zeroes(TId),
    /// If type is RFC_BACKGROUND_UNIT, this pointer is set to the unit identifier of the LUW. Note: the pointer is valid only during the execution context of your server function.
    unit_identifier: ?*UnitIdentifier = null,
    /// If type is RFC_BACKGROUND_UNIT, this pointer is set to the unit attributes of the LUW. Note: the pointer is valid only during the execution context of your server function.
    unit_attributes: ?*UnitAttributes = null,
    /// Specifies whether the current server connection is processing stateful RFC requests (assigned permanently to one fixed ABAP user session).
    is_stateful: c_uint = 0,
    /// Contains a unique zero-terminated session ID, identifying the ABAP or external user session. Can be used in stateful servers to store session context in a hashmap.
    session_id: [33]SapUc = mem.zeroes([33]SapUc),
    /// Number of entries in the queue name list (see below)
    queue_names_count: c_uint = 0,
    /// If the current call is a bgRFC or qRFC with inbound queue(s) (receiver side queuing), this field contains the list of queue names.
    /// Important: this pointer is valid only within the current call context (server function invocation).
    /// After the current call is finished, the memory will be freed again!
    /// If you need the data at a later time, you need to copy it into your own memory
    queue_names: ?[*]?[*:0]SapUc = null,
};

/// Information about an RFC Server returned by RfcGetServerAttributes().
pub const Attributes = extern struct {
    /// This server's name as given when creating the server.
    server_name: [*:0]SapUc = null,
    /// This RFC server's type. Will be one of RFC_MULTI_COUNT_REGISTERED_SERVER or RFC_TCP_SOCKET_SERVER.
    type: ProtocolType = mem.zeroes(ProtocolType),
    /// The current number of active registrations (in case of a Registered Server) or the maximum number of parallel connections the server will accept (in case of a TCP Socket Server).
    registration_count: c_uint = 0,
    /// This server's state.
    state: ServerState = mem.zeroes(ServerState),
    /// The number of requests currently being processed.
    current_busy_count: c_uint = 0,
    /// The maximum number of requests the server has been processing in parallel since it has been created.
    peak_busy_count: c_uint = 0,
};

/// Notifies an RFC Server that a stateful user session has just been created or destroyed.
pub const SessionChange = extern struct {
    /// Session ID of the user session in question
    session_id: [31]SapUc = mem.zeroes([31]SapUc),
    /// What has been done with that session
    event: SessionEvent = mem.zeroes(SessionEvent),
};

/// Notifies the application that an RFC Server changed its state (e.g. got started, got shutdown, lost its connection to the backend etc.).
pub const StateChange = extern struct {
    /// Previous state of the given server
    oldstate: ServerState = mem.zeroes(ServerState),
    /// New state of the given server
    newstate: ServerState = mem.zeroes(ServerState),
};

/// Allows to retrieve monitoring information about all busy or idle connections of an automated RFC Server via RfcGetServerConnectionMonitorData().
pub const ServerMonitorData = extern struct {
    /// Pointer to an RFC_ATTRIBUTES structure containing information about this particular client connection.
    client_info: ?*Attributes = null,
    /// 1, if this connection is currently processing a call, 0, if it is idle.
    is_active: c_int = 0,
    /// If this connection is currently processing a call, this flag indicates, whether it is a stateful or stateless call: 0 = stateless, 1 = stateful.
    is_stateful: c_int = 0,
    /// Name of the ABAP function module currently being processed over this connection (if the connection is currently active), or empty (if the connection is idle).
    function_module_name: [128]SapUc = mem.zeroes([128]SapUc),
    /// Point of time of the last activity on this connection (if the connection is currently idle), or not used (if the connection is busy).
    last_activity: c_longlong = 0,
};

// ==================================================
// Funtions signatures
// ==================================================
pub const ServerStateChangeListener = ?*const fn (server_handle: *Server, state_change: *StateChange) callconv(.c) void;
pub const ServerSessionChangeListener = ?*const fn (server_handle: *Server, session_change: *SessionChange) callconv(.c) ReturnCode;
pub const ServerErrorListener = ?*const fn (server_handle: *Server, client_info: *Attributes, error_info: *ErrorInfo) callconv(.c) void;
pub const ServerFunction = ?*const fn (rfc_handle: *Connection, func_handle: *Function, error_info: *ErrorInfo) callconv(.c) ReturnCode;
pub const FuncDescCallback = ?*const fn (function_name: [*:0]const SapUc, rfc_attributes: Attributes, func_desc_handle: *FunctionDesc) callconv(.c) ReturnCode;

// ==================================================
// Server
// ==================================================

extern fn RfcDestroyServer(server_handle: *Server, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcLaunchServer(server_handle: *Server, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcShutdownServer(server_handle: *Server, timeout: c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetServerAttributes(server_handle: *Server, server_attributes: *Attributes, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetServerConnectionMonitorData(server_handle: *Server, number_of_connections: *c_uint, connection_data: ?[*]*ServerMonitorData, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcDestroyServerConnectionMonitorData(number_of_connections: c_uint, connection_data: *ServerMonitorData, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcAddServerErrorListener(server_handle: *Server, error_listener: ServerErrorListener, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcAddServerStateChangedListener(server_handle: *Server, state_change_listener: ServerStateChangeListener, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcAddServerSessionChangedListener(server_handle: *Server, session_change_listener: ServerSessionChangeListener, error_info: ?*ErrorInfo) ReturnCode;

extern fn RfcSetThroughputOnServer(server_handle: *Server, throughput: *Throughput, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetThroughputFromServer(server_handle: *Server, error_info: ?*ErrorInfo) ?*Throughput;
extern fn RfcRemoveThroughputFromServer(server_handle: *Server, error_info: ?*ErrorInfo) ReturnCode;

/// Handle to an automated ("multi-count") RFC Server, which can manage multiple parallel listening server sessions.
/// Returned by RfcCreateServer().
pub const Server = extern struct {
    handle: ?*anyopaque = null,

    /// Cleans up and destroys an automatic server object, once you are done with it.
    ///
    /// Any internal resources of this server object are released. Therefore make sure not to use the RFC_SERVER_HANDLE in any further API calls
    /// (RfcLaunchServer(), RfcShutdownServer(), etc), after you have destroyed it.
    pub fn Destroy(self: *Server, error_info: ?*ErrorInfo) ReturnCode {
        return RfcDestroyServer(self, error_info);
    }

    /// Starts up an automatic server, so that it starts waiting for incoming requests and processes them.
    pub fn Launch(self: *Server, error_info: ?*ErrorInfo) ReturnCode {
        return RfcLaunchServer(self, error_info);
    }

    /// Stops an automatic server, so that it no longer accepts incoming requests.
    ///
    /// If timeout is set to 0, the server stops immediately, aborting any currently ongoing RFC requests. If you want to give any possibly ongoing requests a
    /// chance to complete, before stopping the server, provide a timeout > 0. %RfcShutdownServer() will then block until all current requests are completed
    /// or the timeout period is over, whichever occurs first. In any case, the server will immediately stop accepting new requests as soon as you call this function.
    ///
    /// If at a later point you want this server to resume listening for requests, you can start it again by calling RfcLaunchServer(). However, once you have
    /// cleaned up the server with RfcDestroyServer(), you must no longer attempt to use it in further RfcLaunchServer() (or other) calls.
    pub fn Shutdown(
        self: *Server,
        /// Number of seconds to wait in order to give currently ongoing RFC requests time to complete.
        timeout_s: c_uint,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcShutdownServer(self, timeout_s, error_info);
    }

    /// Retrieves detailed information about a multi-count Registered Server or a TCP Socket Server.
    ///
    /// See RFC_SERVER_ATTRIBUTES for more details.
    pub fn GetAttributes(self: *Server, server_attributes: *Attributes, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetServerAttributes(self, server_attributes, error_info);
    }

    /// Retrieves detailed information about all clients currently connected to a multi-count Registered Server or a TCP Socket Server.
    ///
    /// For every connected client you get its connection attributes (hostname, SID, user, client) as well as the current function module name,
    /// if the connection is busy, or the last activity time, if it is idle.
    /// Make sure to release the memory again with RfcDestroyServerConnectionMonitorData(), after you are done with it.
    pub fn GetServerConnectionMonitorData(self: *Server, number_of_connections: *c_uint, connection_data: ?[*]*ServerMonitorData, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetServerConnectionMonitorData(self, number_of_connections, connection_data, error_info);
    }

    /// Releases all internal memory hold by monitor data object.
    ///
    /// Use this to free the data obtained from RfcGetServerConnectionMonitorData() once you no longer need it.
    pub fn DestroyServerConnectionMonitorData(self: *Server, number_of_connections: c_uint, connection_data: [*c]ServerMonitorData, error_info: ?*ErrorInfo) ReturnCode {
        _ = self;
        return RfcDestroyServerConnectionMonitorData(number_of_connections, connection_data, error_info);
    }

    /// Adds an error listener to this server.
    ///
    /// An error listener is a callback function of type RFC_SERVER_ERROR_LISTENER. The server will execute this function, whenever a
    /// severe technical error happens outside the processing of function modules, e.g. network problems with the gateway or with the
    /// connected clients.
    pub fn AddErrorListener(self: *Server, error_listener: ServerErrorListener, error_info: ?*ErrorInfo) ReturnCode {
        return RfcAddServerErrorListener(self, error_listener, error_info);
    }

    /// Adds a state change listener to this server.
    ///
    /// A state change listener is a callback function of type RFC_SERVER_STATE_CHANGE_LISTENER. The server will execute this function,
    /// whenever the server's state changes, e.g. from STARTED to ALIVE, or from ALIVE to STOPPING.
    pub fn AddStateChangedListener(self: *Server, state_change_listener: ServerStateChangeListener, error_info: ?*ErrorInfo) ReturnCode {
        return RfcAddServerStateChangedListener(self, state_change_listener, error_info);
    }

    /// Adds a session change listener to this server.
    ///
    /// A session change listener is a callback function of type RFC_SESSION_STATE_CHANGE_LISTENER. The server will execute this function,
    /// whenever a stateful user session starts or ends. A "stateful user session" is basically a one-to-one binding between a SAP user session
    /// on ABAP side and some kind of "user session" in your C program. State information can be kept on C side inbetween separate function
    /// calls from ABAP.
    ///
    /// The server will also execute this function, whenever an ABAP function call begins or ends inside an existing stateful user session.
    /// For most applications, this probably does not matter, so this event can be ignored. There may however be cases, where some cleanup
    /// or reduction of consumed resources can be done, while a stateful user session is idle.
    ///
    /// There are two ways to start a stateful user session:
    /// - The ABAP side requests to start a stateful sequence by calling RFM RFC_SET_REG_SERVER_PROPERTY with parameter EXCLUSIV = 'Y'
    /// - The C program, while currently processing a request from ABAP, can set the current connection to stateful via RfcSetServerStateful()
    ///
    /// There are four ways a stateful user session can end:
    /// - The ABAP side ends the stateful sequence by calling RFM RFC_SET_REG_SERVER_PROPERTY with parameter EXCLUSIV = 'N'
    /// - The C program, while currently processing a request from ABAP, can end the current stateful session via RfcSetServerStateful()
    /// - The SAP user session on ABAP side ends.\n
    ///    This can be, because the SAP user logs out, or ends the current internal mode by pressing the "yellow arrow" or "red cross" button
    ///    or by switching to a new transaction via \\n in the OK-code field.
    /// - Either the ABAP session or the C session runs into a severe problem (SYSTEM_FAILURE), upon which both sides get reset and the
    ///    connection between the two sides gets closed.
    /// - The network connection gets destroyed by network problems, system crash etc.
    ///
    /// An application that wants to work with stateful sessions, needs to react as follows to the various events:
    /// - RFC_SESSION_CREATED\n
    ///    Do the necessary initialization of data or resources (like a database connection, etc.).
    /// - RFC_SESSION_PASSIVATED\n
    ///    Most applications won't need this and can therefore ignore this event. One example, where this may be useful, is:
    ///    if the function calls going on in this session are few and far between, but they occupy a lot of memory, it might be a good idea
    ///    to flush the session state out to disc here, and load it back into memory, when the session gets activated again.
    /// - RFC_SESSION_ACTIVATED\n
    ///    This is the counterpart to RFC_SESSION_PASSIVATED. In most cases it can safely be ignored. For an example where it might be
    ///    useful to use it, see above.
    /// - RFC_SESSION_DESTROYED\n
    ///    Do the necessary cleanup of data and other resources that have been used while processing the function calls of this session.
    pub fn AddSessionChangedListener(self: *Server, session_change_listener: ServerSessionChangeListener, error_info: ?*ErrorInfo) ReturnCode {
        return RfcAddServerSessionChangedListener(self, session_change_listener, error_info);
    }
    /// Attaches a throughput object to an automated server.
    ///
    /// Once attached to a server the throughput object will collect data of the function calls received by this server.
    /// As the automated server handles its connections by itself, it will also attach the throughput to all of its connections
    /// and to all connections that might be re-opened.
    /// If there is already another throughput attached to the server, the old one will be replaced by the given one.
    /// The below chart shows a simplified view how the different time measurements apply for a call received by the server.
    ///
    /// Client                                            automated Server                                                    Client
    ///
    ///         call begin       (accepting)   reading   deserialization   C-application   serialization   writing       call end
    ///       ____________|_   _____________|_________|_________________|_______________|_______________|_________   _|___________
    ///
    pub fn SetThroughputOnServer(self: *Server, throughput: *Throughput, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetThroughputOnServer(self, throughput, error_info);
    }
    /// Returns the currently attached throughput object from a server, if any.
    ///
    /// Returns null if none is attached.
    pub fn GetThroughputFromServer(self: *Server, error_info: ?*ErrorInfo) ?*Throughput {
        return RfcGetThroughputFromServer(self, error_info);
    }
    /// Removes the throughput from an automated server. The server will no longer be monitored.
    pub fn RemoveThroughputFromServer(self: *Server, error_info: ?*ErrorInfo) ReturnCode {
        return RfcRemoveThroughputFromServer(self, error_info);
    }
};

/// This function can be used to start "automatic" servers.
///
/// In contrast to RfcRegisterServer(), which registers one single server connection at a SAP gateway, %RfcCreateServer() can be used
/// to create a server object that manages multiple server connections in parallel, that takes care of automatically
/// re-registering a connection in case it gets broken by network problems, etc. and that takes care of the dispatch-loop
/// internally, so that application programmers no longer need to implement that error-prone task themselves. This means,
/// you no longer need to use RfcListenAndDispatch() and no longer need to worry about creating multiple threads with such a
/// listen- and dispatch-loop, if you want to process multiple parallel requests. All you need to do is starting an RFC_SERVER_HANDLE
/// with RfcLaunchServer(), and it will listen for incoming requests on n parallel threads (as given by the parameter REG_COUNT).
///
/// In addition, you can start not only a usual registered Server that registers at an RFC gateway, but also a standalone Server
/// that listens for requests on a network port and can be accessed by both, SAP systems and other external C-, Java- or .NET-based
/// RFC client programs. Which kind of server is started, depends on the connection parameters:
///
/// Registered Server:
/// Here you need to supply the standard parameters you would also use with RfcRegisterServer(). E.g. GWHOST, GWSERV and PROGRAM_ID,
/// followed potentially by parameters for SNC, Trace, SAPRouter, etc. In addition you can supply the parameters REG_COUNT and MAX_REG_COUNT,
/// if you want to process multiple requests in parallel (multiple gateway registrations). MAX_REG_COUNT is needed only for "stateful"
/// RFC servers (see the sample sapnwrfc.ini for details).
/// Alternatively to registering at only one fixed gateway, you can also provide parameters for "group registration". Then the server will
/// register REG_COUNT connections at every gateway of the given logon group. Again see chapter 3 in the sapnwrfc.ini file.
///
///
/// For all types of servers you need to specify the parameter SERVER_NAME. This is a freely choosable name used for monitoring purposes.
///
/// After a server object has been created, it can be started and stopped any number of times via RfcLaunchServer() and RfcShutdownServer().
/// When the server is no longer needed, it must be cleaned up with RfcDestroyServer().
pub extern fn RfcCreateServer(
    /// Array of network parameters needed for starting the server.
    connection_params: [*]const ConnectionParameter,
    /// Number of elements contained in the RFC_CONNECTION_PARAMETER array.
    param_count: c_uint,
    error_info: ?*ErrorInfo,
) ?*Server;

/// Installs a callback function of type RFC_SERVER_FUNCTION, which will be triggered when a request for
/// the function module corresponding to funcDescHandle comes in from the R/3 system corresponding to sysId.
///
/// If you pass NULL as "sysId", the serverFunction will be used for calls from any backend system.
///
/// The main inputs of RFC_SERVER_FUNCTION are as follows:
/// - RFC_CONNECTION_HANDLE A connection handle, which can be used to query logon information about
///     the current (backend) user or to make callbacks into the backend.
/// - RFC_FUNCTION_HANDLE A data container that represents the current function call. Read the importing
///     parameters, which came from the backend, from this container via the RfcGetX functions and
///     write the exporting parameters, which are to be returned to the backend, into this container
///     using the RfcSetX functions.
///     The memory of that container is automatically released by the RFC Runtime after the
///     RFC_SERVER_FUNCTION returns.
/// - RFC_ERROR_INFO* If you want to return an ABAP Exception or ABAP Message to the backend, fill the
///     parameters of that container and return RFC_ABAP_EXCEPTION or RFC_ABAP_MESSAGE from
///     your RFC_SERVER_FUNCTION implementation.
///
/// If you want to return a SYSTEM_FAILURE to the backend, fill the message parameter of
/// this container and return RFC_EXTERNAL_FAILURE from your RFC_SERVER_FUNCTION implementation.
/// If your RFC_SERVER_FUNCTION implementation processed the function call successfully, you should return RFC_OK.
pub extern fn RfcInstallServerFunction(
    /// System ID of the R/3 system, for which this function module implementation shall be used.
    /// If you set this to NULL, this server function will be used for calls from all backends, for whose SysID no
    /// explicit server function has been installed.
    sys_id: ?[*:0]const SapUc,
    /// A function description giving the name of the function module and its parameters.\n
    /// Note that the NW RFC library does not create a copy of this function description. So if you are using
    /// self-defined (hard-coded) function descriptions (see RfcCreateFunctionDesc()), then you need to make
    /// sure, that these function descriptions are not destroyed as long as they are still used in a server
    /// function installation!
    func_desc_handle: *FunctionDesc,
    /// Pointer to a C function of type RFC_SERVER_FUNCTION. If you pass a null-pointer here,
    /// any previously installed server function for the given function module will be uninstalled.
    server_function: ServerFunction,
    /// Not much that can go wrong here.
    error_info: ?*ErrorInfo,
) ReturnCode;

/// Installs a generic callback function of type RFC_SERVER_FUNCTION together with a callback
/// function of type RFC_FUNC_DESC_CALLBACK for obtaining the metadata description of unknown function modules.
///
/// The RFC Runtime calls the callback function RFC_SERVER_FUNCTION, if it receives a function call, for whose
/// function module name no matching callback function has been installed via RfcInstallServerFunction()
/// (neither for the current system ID nor for SysID=NULL).
///
/// In addition to the handler function you need to provide a second callback function: RFC_FUNC_DESC_CALLBACK.
/// The RFC runtime calls it to obtain an RFC_FUNCTION_DESC_HANDLE for the current function module from you.
/// So this function either needs to return hardcoded meta data or needs to be able to perform a DDIC lookup
/// using a valid client connection and RfcGetFunctionDesc(). If your implementation of RFC_FUNC_DESC_CALLBACK
/// is not able to provide a function description for the current function module name, it should return RFC_NOT_FOUND.
/// The RFC runtime will then notify the backend, that this function module cannot be processed by your
/// RFC server.
pub extern fn RfcInstallGenericServerFunction(
    /// A pointer to a function that can handle "all" function modules.
    server_function: ServerFunction,
    /// A pointer to a function that can provide metadata descriptions of "all" function modules.
    funcDescProvider: FuncDescCallback,
    /// Again not much that can go wrong at this point.
    error_info: ?*ErrorInfo,
) ReturnCode;
