const ReturnCode = @import("commons.zig").ReturnCode;
const ErrorInfo = @import("commons.zig").ErrorInfo;

const SapUc = @import("commons.zig").SapUc;

const Function = @import("data_container.zig").Function;
const Connection = @import("connection.zig").Connection;

// ==================================================
// Transaction
// ==================================================
extern fn RfcInvokeInTransaction(t_handle: *Transaction, func_handle: *Function, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSubmitTransaction(t_handle: *Transaction, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcConfirmTransaction(t_handle: *Transaction, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcDestroyTransaction(t_handle: *Transaction, error_info: ?*ErrorInfo) ReturnCode;

/// Handle to a data container for a tRFC/qRFC LUW.
/// Can be filled with several RFC_FUNCTION_HANDLEs.
pub const Transaction = extern struct {
    handle: ?*anyopaque = null,

    /// Adds a function module call to a transaction. Can be used multiple times on one tHandle.
    ///
    /// `self` A transaction handle created via RfcCreateTransaction().
    pub fn Invoke(
        self: *Transaction,
        /// An RFC_FUNCTION_HANDLE, whose IMPORTING, CHANGING and TABLES parameters have been filled.
        ///
        /// **note** that tRFC/qRFC calls have no return values, so the EXPORTING parameters of this function handle will
        /// not be filled, nor will the changes to the CHANGING/TABLES parameters be returned.
        func_handle: *Function,
        /// Actually there is nothing that can go wrong here except for invalid handles and out of memory.
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcInvokeInTransaction(self, func_handle, error_info);
    }

    /// Executes the entire LUW in the backend system as an "atomic unit".
    ///
    /// This step can be repeated until it finally succeeds (RFC_OK). The transaction handling in the backend
    /// system protects against duplicates (until you remove the TID from the backend's status tables using
    /// RfcConfirmTransaction()).
    ///
    /// `self` A transaction handle filled with one or several function modules.
    pub fn Submit(self: *Transaction, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSubmitTransaction(self, error_info);
    }

    /// Removes the TID contained in the RFC_TRANSACTION_HANDLE from the backend's ARFCRSTATE table.
    ///
    /// After RfcSubmitTransaction() has finally succeeded, call %RfcConfirmTransaction() to clean up the
    /// transaction handling table in the backend.
    ///
    /// **warning** Attention: after this call, the backend is no longer protected against this TID. So another
    /// RfcSubmitTransaction() with the same transaction handle would result in a duplicate.
    ///
    /// **warning** You may retry the Confirm step, if you get an error here, but do not retry the Submit step!
    ///
    /// `self` A transaction handle that has successfully been submitted.
    pub fn Confirm(self: *Transaction, error_info: ?*ErrorInfo) ReturnCode {
        return RfcConfirmTransaction(self, error_info);
    }

    /// Releases the memory of the transaction container.
    pub fn Destroy(self: *Transaction, error_info: ?*ErrorInfo) ReturnCode {
        return RfcDestroyTransaction(self, error_info);
    }
};

// ==================================================
// Funtions signatures
// ==================================================
pub const OnCheckTransaction = ?*const fn (rfc_handle: *Connection, tid: [*:0]const SapUc) callconv(.c) ReturnCode;
pub const OnCommitTransaction = ?*const fn (rfc_handle: *Connection, tid: [*:0]const SapUc) callconv(.c) ReturnCode;
pub const OnRollbackTransaction = ?*const fn (rfc_handle: *Connection, tid: [*:0]const SapUc) callconv(.c) ReturnCode;
pub const OnConfirmTransaction = ?*const fn (rfc_handle: *Connection, tid: [*:0]const SapUc) callconv(.c) ReturnCode;

// ==================================================
// Functions
// ==================================================
/// Installs the necessary callback functions for processing incoming tRFC/qRFC calls.
///
/// These functions need to be implemented by you and will be used by the RFC runtime in the following way:
/// -# The RFC_ON_CHECK_TRANSACTION function is called when a local transaction is starting. Since a transactional
/// RFC call can be issued many times by the client system, the function is responsible for storing the transaction ID
/// in permanent storage. The return value should be one of the following:
/// - RFC_OK Transaction ID stored, transaction can be started.
/// - RFC_EXECUTED This transaction has already been processed successfully in an earlier attempt. Skip the execution now.
/// - RFC_EXTERNAL_FAILURE Currently unable to access my permanent storage. Raise an exception in the sending system, so
///     that the sending system will try to resend the transaction at a later time.
/// - The next step will be the execution of the RFC_SERVER_FUNCTIONs for all function modules contained in the LUW.
/// - If one of the RFC_SERVER_FUNCTION implementations returns an error code, RFC_ON_ROLLBACK_TRANSACTION is called.
///     Here you should roll back all the work of all the previous RFC_SERVER_FUNCTIONs. (The easiest way is to do
///     a database ROLLBACK WORK here.)
///     If all RFC_SERVER_FUNCTIONs complete successfully, RFC_ON_COMMIT_TRANSACTION is called at the end.
///     Persist all the changes here (e.g. do a COMMIT WORK).
///     **Note** Normally you'll only have "one-function-module LUWs", e.g. IDocs. In this case the RFC_SERVER_FUNCTION
///     can already commit/rollback its own work, before returning RFC_OK or an error code. So the two functions
///     RFC_ON_ROLLBACK_TRANSACTION and RFC_ON_COMMIT_TRANSACTION can be empty in this case.
/// - In the end RFC_ON_CONFIRM_TRANSACTION will be called. All information stored about that transaction can now be
///     discarded by the server, as it no longer needs to protect itself against duplicates.
///     In general this function can be used to delete the transaction ID from permanent storage.
///
/// If you pass NULL as "sysId", the transaction handlers will be used for tRFC calls from any backend system,
/// for which no explicit handlers have been installed.
pub extern fn RfcInstallTransactionHandlers(
    /// System ID of the SAP system for which to use this set of transaction handlers, or NULL.
    sysId: ?[*]const SapUc,
    on_check_function: OnCheckTransaction,
    on_commit_function: OnCommitTransaction,
    on_rollback_function: OnRollbackTransaction,
    on_confirm_function: OnConfirmTransaction,
    error_info: ?*ErrorInfo,
) ReturnCode;
