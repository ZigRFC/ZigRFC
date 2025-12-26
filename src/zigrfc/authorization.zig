const ReturnCode = @import("commons.zig").ReturnCode;
const ErrorInfo = @import("commons.zig").ErrorInfo;

const SapUc = @import("commons.zig").SapUc;
const SapRaw = @import("commons.zig").SapRaw;

const Connection = @import("connection.zig").Connection;

// ==================================================
// Structures
// ==================================================
/// Structure passed to the RFC_SERVER_AUTHORIZATION_HANDLER giving some
/// security related information about the calling ABAP partner of an incoming RFC call.
pub const SecurityAttributes = extern struct {
    /// Name of the called function module
    function_name: ?[*]SapUc = null,
    /// Calling ABAP system ID
    sys_id: ?[*]SapUc = null,
    /// ABAP Client ("Mandant")
    client: ?[*]SapUc = null,
    /// ABAP User
    user: ?[*]SapUc = null,
    /// Name of the calling APAB program (report, module pool)
    prog_name: ?[*]SapUc = null,
    /// SNC name of the calling ABAP system, if SNC is enabled. Use this only for display or logging purposes.
    snc_name: ?[*]SapUc = null,
    /// Logon ticket of the ABAP user, if SSO2 or assertion tickets are enabled
    sso_ticket: ?[*]SapUc = null,
    /// Canonical representation of the SNC name of the calling ABAP system, if SNC is enabled. Use this for comparisons and access checks.
    snc_acl_key: ?[*]SapRaw = null,
    /// Length of the above SNC AclKey
    snc_acl_key_length: c_uint = 0,
};

// ==================================================
// Functions signatures
// ==================================================
pub const OnAuthorizationCheck = ?*const fn (rfc_handle: *Connection, sec_attributes: *SecurityAttributes, error_info: ?*ErrorInfo) callconv(.c) ReturnCode;

// ==================================================
// Functions
// ==================================================
pub extern fn RfcInstallAuthorizationCheckHandler(onAuthorizationCheck: OnAuthorizationCheck, error_info: ?*ErrorInfo) ReturnCode;
