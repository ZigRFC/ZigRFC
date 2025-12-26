const ReturnCode = @import("commons.zig").ReturnCode;
const ErrorInfo = @import("commons.zig").ErrorInfo;

const SapUc = @import("commons.zig").SapUc;

const ConnectionParameter = @import("connection.zig").Parameter;
// ==================================================
// Ini
// ==================================================

/// Sets the directory in which to search for the sapnwrfc.ini file.
///
/// By default the sapnwrfc library searches for the sapnwrfc.ini in the current
/// working directory of the process. If you want to keep it in a different directory,
/// use this function to tell the sapnwrfc library about the new path.
/// \note After you have changed the directory, the NW RFC lib automatically loads
/// the contents of the new sapnwrfc.ini file from that directory.
pub extern fn RfcSetIniPath(
    /// The full (absolute) path of the directory, in which the sapnwrfc
    /// library should look for the sapnwrfc.ini file. A path relative to the current
    /// working directory of the process also works.
    pathName: [*c]const SapUc,
    error_info: ?*ErrorInfo,
) ReturnCode;

/// Reloads the contents of the sapnwrfc.ini file into memory.
///
/// Searches the directory given by RfcSetIniPath() (or the current working directory)
/// for the file sapnwrfc.ini and loads its contents into memory. Reloading the sapnwrfc.ini
/// file is only necessary after the file has been manually edited
/// If you want to use a sapnwrfc.ini file in a different location, consider using %RfcSetIniPath().
///
/// Note: If a file with the name sapnwrfc.ini does not exist in the given directory, this is not
/// considered an error! Default settings are used in this case.
pub extern fn RfcReloadIniFile(error_info: ?*ErrorInfo) ReturnCode;

// ==================================================
// SAP Logon
// ==================================================

/// Returns a list of names of all SAP Systems maintained in SAPLogon (saplogon.ini or SAPUILandscape.xml).
///
/// On Windows systems, where SAPLogon is installed, the logon parameters defined in saplogon.ini can be used for opening connections
/// to those backend systems. This routine retrieves a list of all available SAP systems. Each key in the list can be used as a value
/// for RFC_CONNECTION_PARAMETER.value, where RFC_CONNECTION_PARAMETER.name = "SAPLOGON_ID".
/// For more information see the documentation of the SAPLOGON_ID parameter in the sample sapnwrfc.ini file.
///
/// If the API returns successfully, you should call RfcFreeSaplogonEntries() with the same inputs, once you no longer need the
/// SAPLogon IDs, so that the memory occupied by them can be cleaned up.
///
/// Sample code illustrating how to use the SAPLogon IDs:
/// \return RFC_MEMORY_INSUFFICIENT, if unable to malloc memory for the ID list; RFC_NOT_FOUND, if saplogon.ini could not be found on that system or is empty.
pub extern fn RfcGetSaplogonEntries(
    /// Receives a pointer to a SAP_UC* array containing the SAPLogon IDs.
    saplogonIDList: [*c][*c][*c]SapUc,
    /// Will be filled with the number of SAPLogon IDs in the list.
    numSaplogonIDs: [*c]c_uint,
    error_info: ?*ErrorInfo,
) ReturnCode;

/// Frees a list of SAPLogon IDs obtained from RfcGetSaplogonEntries().
///
/// When you no longer need the SAPLogon IDs obtained from RfcGetSaplogonEntries(), you should call this function with the same
/// arguments that got filled by RfcGetSaplogonEntries(). This will free any internal memory occupied by the list of SAPLogon IDs.
///
/// \return Nothing that can go wrong here really.
pub extern fn RfcFreeSaplogonEntries(
    /// Points to an SAP_UC* array that was previously filled by RfcGetSaplogonEntries(). Will be set to NULL.
    saplogonIDList: [*c][*c][*c]SapUc,
    /// Points to the length of the SAPLogon ID list. Will be set to 0.
    numSaplogonIDs: [*c]c_uint,
    error_info: ?*ErrorInfo,
) ReturnCode;

/// Retrieves all connection parameters corresponding to the given ID from the saplogon.ini or SAPUILandscape.xml file.
///
/// The ID needs to be one of those returned by RfcGetSaplogonEntries(). It is the same as can also be used as connection
/// parameter SAPLOGON_ID.
///
/// \return Nothing that can go wrong here really.
pub extern fn RfcGetSaplogonEntry(
    /// A SAPLogon ID uniquely identifying a certain saplogon.ini or SAPUILandscape.xml entry.
    saplogonID: [*c]SapUc,
    /// Receives a pointer to a RFC_CONNECTION_PARAMETER array containing the parameters of the given SAPLogon ID.
    entryParameters: [*c][*c]ConnectionParameter,
    /// Will be filled with the number of connection parameters in the array.
    numParameters: [*c]c_uint,
    error_info: ?*ErrorInfo,
) ReturnCode;

/// Frees an array of connection parameters obtained from RfcGetSaplogonEntry().
///
/// When you no longer need the connection parameters obtained from RfcGetSaplogonEntries(), you should call this function with the same
/// arguments that got filled by RfcGetSaplogonEntry(). This will free any internal memory occupied by the array of parameters.
///
/// \return Nothing that can go wrong here really.
pub extern fn RfcFreeSaplogonEntry(
    /// Points to an RFC_CONNECTION_PARAMETER array that was previously filled by RfcGetSaplogonEntry(). Will be set to NULL.
    entryParameters: [*c][*c]ConnectionParameter,
    /// Points to the length of the connection parameter array. Will be set to 0.
    numParameters: [*c]c_uint,
    error_info: ?*ErrorInfo,
) ReturnCode;

/// Sets the global logon timeout in seconds.
///
/// Sets the timeout for how long the logon in the ABAP backend can take during RfcOpenConnection().
/// The valid range of values is [1,3600].
/// The default value is 60 seconds.
///
/// The timeout can also be set via RFC_GLOBAL_LOGON_TIMEOUT in the DEFAULT section of the sapnwrfc.ini file.
pub extern fn RfcSetGlobalLogonTimeout(logonTimeout: c_uint, errorInfo: [*c]ErrorInfo) ReturnCode;

/// Set Timeout for Message Server Response
///
/// During Group Logon and during Group Registration (registration of an RFC server at multiple gateways),
/// the NW RFC library sends requests to the message server, asking for the currently "least busy" application
/// server (load balancing) or for a list of all application servers contained in a group.
/// This timeout specifies, how long the NW RFC library will wait for the corresponding responses from the
/// message server, before aborting with a timeout error.
pub extern fn RfcSetMessageServerResponseTimeout(timeout: c_uint, errorInfo: [*c]ErrorInfo) ReturnCode;

/// Sets the maximum number of concurrent CPIC conversations.
///
/// The API can only be called if there are no current CPIC conversations active. A number smaller than the current maximum
/// will be ignored.
/// The default value is 203.
///
/// The number can also be increased by setting MAX_CPIC_CONVERSATIONS in the DEFAULT section of the sapnwrfc.ini file.
pub extern fn RfcSetMaximumCpicConversations(maxCpicConversations: c_uint, errorInfo: [*c]ErrorInfo) ReturnCode;
/// Gets the maximum number of parallel CPIC conversations.
///
/// The default value is 203.
pub extern fn RfcGetMaximumCpicConversations(maxCpicConversations: [*c]c_uint, errorInfo: [*c]ErrorInfo) ReturnCode;
