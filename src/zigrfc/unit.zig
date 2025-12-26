const mem = @import("std").mem;

const ReturnCode = @import("commons.zig").ReturnCode;
const ErrorInfo = @import("commons.zig").ErrorInfo;

const SapUc = @import("commons.zig").SapUc;
const UnitId = @import("commons.zig").UnitId;
const Date = @import("commons.zig").Date;
const Time = @import("commons.zig").Time;

const Function = @import("data_container.zig").Function;
const Connection = @import("connection.zig").Connection;

// ==================================================
// Enums
// ==================================================
/// Used in RfcGetUnitState() for inquiring the processing status of a background Unit that
/// we (or someone else) sent into this backend.
pub const State = enum(c_int) {
    /// No information for this unit ID and unit type can be found in the target system. If you are sure, that target system, unit ID and unit type are correct, it means that your previous attempt did not even reach the target system. Send the unit again. However, if you get this status after the Confirm step has already been executed, it means that everything is ok. Don't re-execute in this case!
    not_found,
    /// Backend system is still in the process of persisting (or executing if type 'T') the payload data. Give it some more time and check the state again later. If this takes "too long", an admin should probably have a look at why there is no progress here.
    in_process,
    /// Data has been persisted (or executed if type 'T') ok on receiver side. Confirm event may now be triggered.
    commited,
    /// An error of any type has occurred. Unit needs to be resent.
    rolled_back,
    /// Temporary state between the Confirm event and the time, when the status data will be erased for good. Nothing to be done. Just delete the payload and status information on your side.
    confirmed,
};

// ==================================================
// Structs
// ==================================================
/// For convenience combines a unit's ID and its type.
pub const Identifier = extern struct {
    /// 'T' for "transactional" behavior (unit is executed synchronously), 'Q' for "queued" behavior (unit is written into a queue and executed asynchronously)
    unit_type: SapUc = 0,
    /// The 32 digit unit ID of the background unit.
    unit_id: UnitId = mem.zeroes(UnitId),
};

/// If the external program is the sender of the bgRFC unit, this structure is used to set a
/// bunch of special attributes that determine, how a bgRFC Unit will be processed in the backend.
/// The fields user, client, tCode and program are optional. If left empty, the NW RFC lib will
/// fill them with default values. The fields hostname, sendingDate and sendingTime should not be
/// filled, the lib fills them, when the unit is submitted.
///
/// If the external program is the receiver of the bgRFC unit, you can use RfcGetServerContext()
/// to obtain the values that were sent by the backend.
pub const Attributes = extern struct {
    /// If != 0, the backend will write kernel traces, while executing this unit.
    kernel_trace: c_short = 0,
    /// If != 0, the backend will write statistic records, while executing this unit.
    sat_trace: c_short = 0,
    /// If != 0, the backend will keep a "history" for this unit.
    unit_history: c_short = 0,
    /// Used only for type Q: If != 0, the unit will be written to the queue, but not processed. The unit can then be started manually in the ABAP debugger.
    lock: c_short = 0,
    /// Per default the backend will check during execution of a unit, whether one
    /// of the unit's function modules triggers an explicit or implicit COMMIT WORK.
    /// In this case the unit is aborted with an error, because the transactional
    /// integrity of this unit cannot be guaranteed. By setting "noCommitCheck" to
    /// true (!=0), this behavior can be suppressed, meaning the unit will be executed
    /// anyway, even if one of its function modules "misbehaves" and triggers a COMMIT WORK.
    no_commit_check: c_short = 0,
    /// Sender User (optional). Default is current operating system User.
    user: [13]SapUc = mem.zeroes([13]SapUc),
    /// Sender Client ("Mandant") (optional). Default is "000".
    client: [4]SapUc = mem.zeroes([4]SapUc),
    /// Sender Transaction Code (optional). Default is "".
    t_code: [21]SapUc = mem.zeroes([21]SapUc),
    /// Sender Program (optional). Default is current executable name.
    program: [41]SapUc = mem.zeroes([41]SapUc),
    /// Sender hostname. Used only when the external program is server. In the client case the nwrfclib fills this automatically.
    hostname: [41]SapUc = mem.zeroes([41]SapUc),
    /// Sending date in UTC (GMT-0). Used only when the external program is server. In the client case the nwrfclib fills this automatically.
    sending_date: Date = mem.zeroes(Date),
    /// Sending time in UTC (GMT-0). Used only when the external program is server. In the client case the nwrfclib fills this automatically.
    sending_time: Time = mem.zeroes(Time),
};

// ==================================================
// Unit
// ==================================================
extern fn RfcInvokeInUnit(unit_handle: *Unit, func_handle: [*c]Function, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSubmitUnit(unit_handle: *Unit, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcDestroyUnit(unit_handle: *Unit, error_info: ?*ErrorInfo) ReturnCode;

/// Handle to a data container for a bgRFC LUW.
/// Can be filled with several RFC_FUNCTION_HANDLEs.
pub const Unit = extern struct {
    handle: ?*anyopaque = null,

    /// Adds a function module to a bgRFC unit.
    ///
    /// Serializes the payload of the function module data container into bgRFC format and inserts
    /// it into the data container for the bgRFC unit. The funcHandle can afterwards be freed
    /// using RfcDestroyFunction(), because the data is copied, not referenced.
    ///
    /// **note** Despite the name "invoke", nothing is executed in the backend system, yet!
    ///
    /// `self` A valid (unsubmitted) bgRFC unit, to which the given function module shall be added.
    pub fn Invoke(
        self: *Unit,
        /// A function module, whose payload (IMPORTING/CHANGING/TABLES) shall be added to the unit.
        func_handle: *Function,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcInvokeInUnit(self, func_handle, error_info);
    }

    /// Executes a bgRFC unit in the backend.
    ///
    /// Sends the bgRFC unit into the backend, where it will be executed synchronously or persisted
    /// in the given inbound queues and executed asynchronously by the bgRFC scheduler, depending on
    /// whether the unit type is 'T' or 'Q'.
    /// If the type is 'T', this function will wait until the unit is completely executed and then
    /// return the success or error information. If the type is 'Q', this function only inserts the
    /// unit into the specified queues and then returns. Processing of the unit in the backend system
    /// happens asynchronously. The return code of this function indicates, whether the unit could
    /// be persisted in the given queues successfully. In order to get information about the processing
    /// status of the unit, use RfcGetUnitState() at a later point.
    ///
    /// **note** Despite the name "invoke", nothing is executed in the backend system, yet!
    ///
    /// `self` A valid (unsubmitted) bgRFC unit, which shall be sent into the backend system.
    pub fn Submit(self: *Unit, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSubmitUnit(self, error_info);
    }

    /// Releases the memory of the bgRFC unit container.
    pub fn Destroy(self: *Unit, error_info: ?*ErrorInfo) ReturnCode {
        return RfcDestroyUnit(self, error_info);
    }
};

// ==================================================
// Funtions signatures
// ==================================================
pub const OnCheckUnit = ?*const fn (rfc_handle: *Connection, identifier: *const Identifier) callconv(.c) ReturnCode;
pub const OnCommitUnit = ?*const fn (rfc_handle: *Connection, identifier: *const Identifier) callconv(.c) ReturnCode;
pub const OnRollbackUnit = ?*const fn (rfc_handle: *Connection, identifier: *const Identifier) callconv(.c) ReturnCode;
pub const OnConfirmUnit = ?*const fn (rfc_handle: *Connection, identifier: *const Identifier) callconv(.c) ReturnCode;
pub const OnGetUnitState = ?*const fn (rfc_handle: *Connection, identifier: *const Identifier, unit_state: *State) callconv(.c) ReturnCode;

// ==================================================
// Funtions
// ==================================================
/// Installs the necessary callback functions for processing incoming bgRFC calls.
///
/// These functions need to be implemented by you and will be used by the RFC runtime in the following way:
/// - The RFC_ON_CHECK_UNIT function is called when a local background unit is starting. Since a background
///     RFC call can be issued many times by the client system, the function is responsible for storing the unit ID
///     and type in permanent storage. The return value should be one of the following:
///     - RFC_OK Unit ID stored, LUW can be started.
///     - RFC_EXECUTED This LUW has already been processed successfully in an earlier attempt. Skip the execution now.
///     - RFC_EXTERNAL_FAILURE Currently unable to access my permanent storage. Raise an exception in the sending system, so
///     that the sending system will try to resend the unit at a later time.
/// - The next step will be the execution of the RFC_SERVER_FUNCTIONs for all function modules contained in the LUW.
/// - If one of the RFC_SERVER_FUNCTION implementations returns an error code, RFC_ON_ROLLBACK_UNIT is called.
///     Here you should roll back all the work of all the previous RFC_SERVER_FUNCTIONs. (The easiest way is to do
///     a database ROLLBACK WORK here.)\n
///     If all RFC_SERVER_FUNCTIONs complete successfully, RFC_ON_COMMIT_UNIT is called at the end.
///     Persist all the changes here (e.g. do a COMMIT WORK).\n
///     Note: Normally you'll only have "one-function-module LUWs", e.g. IDocs. In this case the RFC_SERVER_FUNCTION
///     can already commit/rollback its own work, before returning RFC_OK or an error code. So the two functions
///     RFC_ON_ROLLBACK_UNIT and RFC_ON_COMMIT_UNIT can be empty in this case.
/// - In the end RFC_ON_CONFIRM_UNIT will be called. All information stored about that LUW can now be
///     discarded by the server, as it no longer needs to protect itself against duplicates.
///     In general this function can be used to delete the unit ID from permanent storage.
/// - At various points in the processing of a background unit, the backend system may or may not inquire
///     the status of the currently (or previously) processed unit by calling RFC_ON_GET_UNIT_STATE. Your implementation
///     of this function should check your permanent storage for status information about the given unit ID and
///     fill the RFC_UNIT_STATE* accordingly.
///
/// If you pass NULL as "sysId", the transaction handlers will be used for bgRFC calls from any backend system,
/// for which no explicit handlers have been installed.
pub extern fn RfcInstallBgRfcHandlers(
    ///   System ID of the SAP system for which to use this set of transaction handlers, or NULL.
    sys_id: ?[*]const SapUc,
    on_check_function: OnCheckUnit,
    on_commit_function: OnCommitUnit,
    on_rollback_function: OnRollbackUnit,
    on_confirm_function: OnConfirmUnit,
    on_get_state_function: OnGetUnitState,
    error_info: ?*ErrorInfo,
) ReturnCode;
