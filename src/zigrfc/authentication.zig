const ReturnCode = @import("commons.zig").ReturnCode;
const ErrorInfo = @import("commons.zig").ErrorInfo;

const SapUc = @import("commons.zig").SapUc;
const SapRaw = @import("commons.zig").SapRaw;
const SapULLong = @import("commons.zig").SapULLong;

const ConnectionAttributes = @import("connection.zig").Attributes;
const Connection = @import("connection.zig").Connection;

// ==================================================
// Enums
// ==================================================
/// Type of authentication method used by the backend authentication handler (ON_AUTHENTICATION_CHECK).
pub const AuthenticationType = enum(c_int) {
    /// No authentication data was provided
    none,
    /// Authentication with user and password
    basic,
    /// Authentication with x509 certificate
    x509,
    /// Authentication with assertion ticket
    sso,
};

// ==================================================
// Structs
// ==================================================
/// Compact structure containing relevant information about the x509 certificate provided by the RFC client. Can be accessed by the
/// authentication handler (RFC_ON_AUTHENTICATION_CHECK) and used for validating the user trying to log on.
pub const CertificateData = extern struct {
    /// Distinguished name of the user of the certificate
    subject: ?[*]const SapUc = null,
    /// Distinguished name of the certificate authority (CA) that issued the certificate
    issuer: ?[*]const SapUc = null,
    /// UTC Expiration date on which the certificate is no longer considered valid
    valid_to: SapULLong = 0,
    /// UTC Starting date since the certificate is valid
    valid_from: SapULLong = 0,
    /// Fingerprint of the public key
    signature: ?[*]const SapUc = null,
    /// Pointer to the next certificate in the chain if any
    next: ?[*]CertificateData = null,
};

// ==================================================
// Functions signatures
// ==================================================

pub const OnAuthenticationCheck = ?*const fn (rfc_attributes: ConnectionAttributes, authentication_handle: AuthenticationHandle, error_info: ?*ErrorInfo) callconv(.c) ReturnCode;
pub const PmCallback = ?*const fn (rfc_handle: *Connection, function_name: [*]const SapUc, epp_buffer: [*]SapRaw, epp_buffer_size: usize, epp_length: *usize) callconv(.c) ReturnCode;
pub const OnPasswordChange = ?*const fn (sysId: [*]const SapUc, user: [*]const SapUc, client: [*]const SapUc, password: [*]SapUc, password_length: c_uint, new_password: [*]SapUc, new_password_length: c_uint, cause: ?*ErrorInfo) callconv(.c) ReturnCode;

// ==================================================
// Authentication
// ==================================================
pub extern fn RfcGetAuthenticationType(authenticationHandle: AuthenticationHandle, @"type": *AuthenticationType, error_info: ?*ErrorInfo) ReturnCode;
pub extern fn RfcGetAuthenticationUser(authenticationHandle: AuthenticationHandle, user: [*c][*c]const SapUc, length: *c_uint, error_info: ?*ErrorInfo) ReturnCode;
pub extern fn RfcGetAuthenticationPassword(authenticationHandle: AuthenticationHandle, password: [*c][*c]const SapUc, length: *c_uint, error_info: ?*ErrorInfo) ReturnCode;
pub extern fn RfcGetAuthenticationAssertionTicket(authenticationHandle: AuthenticationHandle, assertion_ticket: [*c][*c]const SapUc, length: *c_uint, error_info: ?*ErrorInfo) ReturnCode;
pub extern fn RfcGetAuthenticationCertificateData(authenticationHandle: AuthenticationHandle, certificate_data: [*c][*c]const CertificateData, error_info: ?*ErrorInfo) ReturnCode;

/// Handle to an authentication object which gives access to relevant authentication data received from the client.
/// This data can be used to authenticate users in the authentication handler (RFC_ON_AUTHENTICATION_CHECK).
/// Passed into the authentication handler (RFC_ON_AUTHENTICATION_CHECK) by the NW RFC library
pub const AuthenticationHandle = [*c]AuthenticationHandleStruct;
pub const AuthenticationHandleStruct = extern struct {
    handle: ?*anyopaque = null,

    /// Gets the type of authentication data received from the backend in RFC_ON_AUTHENTICATION_CHECK.
    ///
    /// If a handler of type RFC_ON_AUTHENTICATION_CHECK is installed, this getter returns the type of authentication data that was received from
    /// the backend. The authentication method can be customized in the SM59 destination in the backend. The received authentication data is stored
    /// in the authentication handle, which can then by queried by the authentication handler RFC_ON_AUTHENTICATION_CHECK.
    pub fn GetType(self: *AuthenticationHandleStruct, @"type": *AuthenticationType, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetAuthenticationType(self, @"type", error_info);
    }

    /// Gets the user to authenticate in RFC_ON_AUTHENTICATION_CHECK if any is received.
    ///
    /// If a handler of type RFC_ON_AUTHENTICATION_CHECK is installed, this getter returns the user to authenticate set in the destination in the backend.
    /// This could also be the alias user.
    /// The received authentication data is stored in the authentication handle, which can then by queried by
    /// the authentication handler RFC_ON_AUTHENTICATION_CHECK.
    pub fn GetUser(self: *AuthenticationHandleStruct, user: [*c][*c]const SapUc, length: *c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetAuthenticationUser(self, user, length, error_info);
    }

    /// Gets the password for authentication in RFC_ON_AUTHENTICATION_CHECK if basic authentication method was setup in the backend.
    ///
    /// If a handler of type RFC_ON_AUTHENTICATION_CHECK is installed, this getter returns the password for authentication set in the destination in the backend, i.e.
    /// basic authentication was setup.
    /// The received authentication data is stored in the authentication handle, which can then by queried by
    /// the authentication handler RFC_ON_AUTHENTICATION_CHECK.
    pub fn GetPassword(
        self: *AuthenticationHandleStruct,
        /// The user's password for basic authentication. NULL if otherwise.
        password: [*c][*c]const SapUc,
        length: *c_uint,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcGetAuthenticationPassword(self, password, length, error_info);
    }

    /// Gets the assertionTicket for authentication in RFC_ON_AUTHENTICATION_CHECK if SSO based authentication method was setup in the backend.
    ///
    /// If a handler of type RFC_ON_AUTHENTICATION_CHECK is installed, this getter returns the assertionTicket for authentication set in the destination in the backend, i.e.
    /// SSO authentication was setup.
    /// The received authentication data is stored in the authentication handle, which can then by queried by
    /// the authentication handler RFC_ON_AUTHENTICATION_CHECK.
    pub fn GetAssertionTicket(
        self: *AuthenticationHandleStruct,
        /// Assertion ticket for SSO authentication. NULL if otherwise.
        assertion_ticket: [*c][*c]const SapUc,
        length: *c_uint,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcGetAuthenticationAssertionTicket(self, assertion_ticket, length, error_info);
    }

    /// Gets the certificate chain for authentication in RFC_ON_AUTHENTICATION_CHECK if x509 authentication method was setup in the backend.
    ///
    /// If a handler of type RFC_ON_AUTHENTICATION_CHECK is installed, this getter returns the certificate chain for authentication set in the destination in the backend, i.e.
    /// x509 authentication was setup. The certificate chain is stored as a singly linked list.
    /// The received authentication data is stored in the authentication handle, which can then by queried by
    /// the authentication handler RFC_ON_AUTHENTICATION_CHECK.
    pub fn GetCertificateData(
        self: *AuthenticationHandleStruct,
        /// Singly linked list of certificate attributes for x509 authentication. NULL if otherwise.
        certificate_data: [*c][*c]const CertificateData,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcGetAuthenticationCertificateData(self, certificate_data, error_info);
    }
};

// ==================================================
// Functions
// ==================================================

/// Installs an optional function for performing authentication checks on incoming login attempts.
///
/// After an RFC connection is opened to the RFC library, and before the first RFC call is executed over
/// this connection, the RFC library calls this callback function, if installed.
/// Here you can implement a central authentication check, defining exactly which entity
/// is allowed to execute the function in your RFC server program.
/// The actual function module implementations can then concentrate on their business logic and don't
/// need to pay attention to access and authentication checks.
pub extern fn RfcInstallAuthenticationCheckHandler(
    /// Pointer to a function of type RFC_ON_AUTHENTICATION_CHECK. The RFC lib calls this function, whenever a new RFC connection to this server is first opened by the client.
    onAuthenticationCheck: OnAuthenticationCheck,
    error_info: ?*ErrorInfo,
) ReturnCode;

/// Installs the necessary callback functions for processing Extended Passport (EPP) events.
///
/// Extended Passports is a feature that supersedes Distributed Statistical Records (DSRs).
/// It allows to track certain performance attributes across system boundaries. These callback functions
/// allow the application to exchange passports with the backend system. The actual data contained in the
/// passports, can be processed with the eppslib library.
///
/// **note** Normal RFC applications should never need to deal with this topic at all...
pub extern fn RfcInstallPassportManager(
    /// The RFC lib calls this function, before it sends a client request into the backend. Here you can provide the passport that is to be sent along with the RFC request.
    on_client_call_start: PmCallback,
    /// The RFC lib calls this function, after the RFC response was received from the backend. You can read the updated passport information.
    on_client_call_end: PmCallback,
    /// The RFC lib calls this function, when it received an RFC request from the backend. Here you can read the passport that accompanied the request.
    on_server_call_start: PmCallback,
    /// The RFC lib calls this function, before it will send the response to the above request back to the backend. You can update the passport data with information about processing performance of the current call.
    on_server_call_end: PmCallback,
    error_info: ?*ErrorInfo,
) ReturnCode;

/// Installs an optional callback function for processing password change events.
///
/// Whenever a logon attempt is made with a user, whose password is still initial, the backend system
/// challenges this user to change his/her password. If this happens during a call to RfcOpenConnection(),
/// the RFC library calls this callback function (if installed), and allows you to change the user's password.
/// In your implementation, you can either return RFC_EXTERNAL_FAILURE, if you can't/don't want to change
/// the password. In that case RfcOpenConnection() will end with RFC_LOGON_FAILURE and any additional text from
/// errorInfo->message will be returned to the application. Or you can fill the old and new password with correct
/// values and return RFC_OK, upon which the RFC library will attempt to change the password accordingly.
///
/// **note** See also the documentation of the logon parameter PASSWORD_CHANGE_ENFORCED in the sample sapnwrfc.ini file,
/// which specifies, whether the application is allowed to get by without a PasswordChangeHandler and keep using
/// the initial/expired password for login.
pub extern fn RfcInstallPasswordChangeHandler(
    /// The RFC lib calls this function, whenever an initial password is detected during a call to RfcOpenConnection().
    on_password_change: OnPasswordChange,
    error_info: ?*ErrorInfo,
) ReturnCode;
