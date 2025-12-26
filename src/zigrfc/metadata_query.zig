const mem = @import("std").mem;

const ReturnCode = @import("commons.zig").ReturnCode;
const ErrorInfo = @import("commons.zig").ErrorInfo;

const Char = @import("commons.zig").Char;
const SapUc = @import("commons.zig").SapUc;
const AbapName = @import("desc.zig").AbapName;

// ==================================================
// Enums
// ==================================================
pub const ObjType = enum(c_int) {
    function,
    type,
    class,
};

// ==================================================
// Structs
// ==================================================
pub const QueryResultHandle = ?*anyopaque;

pub const QueryResultEntry = extern struct {
    name: AbapName = mem.zeroes(AbapName),
    error_message: [512]SapUc = mem.zeroes([512]SapUc),
};

// ==================================================
// Functions
// ==================================================
/// Creates the metadata query result
///
/// Metadata query results contain the names of functions, types and classes queried successfully, and the corresponding
/// errors, if the query failed.
pub extern fn RfcCreateMetadataQueryResult(errorInfo: [*c]ErrorInfo) QueryResultHandle;

/// Destroys the metadata query result
///
/// Releases all resources allocated by the metadata query result.
pub extern fn RfcDestroyMetadataQueryResult(handle: QueryResultHandle, error_info: [*c]ErrorInfo) ReturnCode;

/// Describes the metadata query result
///
/// Returns the number of succeeded and failed entries in the metadata query result. The entries' content can be read with
/// RfcGetMetadataQueryFailedEntry() and RfcGetMetadataQuerySucceededEntry().
pub extern fn RfcDescribeMetadataQueryResult(handle: QueryResultHandle, @"type": ObjType, successful: [*c]c_uint, failed: [*c]c_uint, error_info: [*c]ErrorInfo) ReturnCode;

/// Returns the error entry from the metadata query result
///
/// Returns the object name and the error text, if an error occurred during the query.
pub extern fn RfcGetMetadataQueryFailedEntry(
    handle: QueryResultHandle,
    @"type": ObjType,
    /// Index of the requested object. Must be between 0 and "failed - 1", where "failed" is the value
    /// returned from RfcDescribeMetadataQueryResult() for the given RFC_METADATA_OBJ_TYPE.
    index: c_uint,
    ///  Pointer to the allocated structure to store the name of the metadata object and the error text
    entry: ?*QueryResultEntry,
    error_info: ?*ErrorInfo,
) ReturnCode;

/// Returns a succeeded entry from the metadata query result
///
/// Returns the object name of a successfully queried object.
pub extern fn RfcGetMetadataQuerySucceededEntry(
    handle: QueryResultHandle,
    @"type": ObjType,
    /// Index of the requested object. Must be between 0 and "successful - 1", where "successful" is the value
    /// returned from RfcDescribeMetadataQueryResult() for the given RFC_METADATA_OBJ_TYPE.
    index: c_uint,
    /// Pointer to the allocated buffer to store the name of the metadata object
    succeed_obj: [*]Char,
    error_info: ?*ErrorInfo,
) ReturnCode;
