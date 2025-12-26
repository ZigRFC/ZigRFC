const ReturnCode = @import("commons.zig").ReturnCode;
const ErrorInfo = @import("commons.zig").ErrorInfo;

const SapUc = @import("commons.zig").SapUc;

/// Sets the absolute path to the sapcrypto library to enable TLS encryption via Websocket Rfc.
///
/// The parameter pathToLibrary needs also to contain the name of the library.
/// This function has the same effect as the sapnwrfc.ini parameter TLS_SAPCRYPTOLIB.
/// This API cannot reset a new path to the library during runtime. Once set, the path is definitive.
pub extern fn RfcLoadCryptoLibrary(
    /// Absolute path to library (.so or .dll).
    path_to_library: [*]const SapUc,
    error_info: ?*ErrorInfo,
) ReturnCode;

/// Sets the global idle time interval of a Websocket connection in seconds after which
/// a keep alive Websocket ping packet is sent.
///
/// This function has the same effect as the sapnwrfc.ini parameter RFC_WEBSOCKET_PING_INTERVAL.
/// The default value is 300; valid values are 0 [off] and a range from 10 [ten seconds] to 86400 [one day].
pub extern fn RfcSetWebsocketPingInterval(ping_interval_s: c_uint, error_info: ?*ErrorInfo) ReturnCode;

/// Sets the global timeout for a WebSocket keep alive ping reply packet in seconds.
///
/// This function has the same effect as the sapnwrfc.ini parameter RFC_WEBSOCKET_PONG_TIMEOUT.
/// If no such so-called pong packet is received from the communication partner as a reply to a previously sent
/// WebSocket keep alive ping packet within this timeout period, the connection is considered as broken and will be closed.
/// The default value is 60; valid values are 0 [off] and a range from 10 [ten seconds] to 3600 [one hour].
/// The timeout value should be set lower than the ping interval, so only one ping is active at a time.
pub extern fn RfcSetWebsocketPongTimeout(pong_timeout_s: c_uint, error_info: ?*ErrorInfo) ReturnCode;
