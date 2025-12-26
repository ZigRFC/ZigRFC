const std = @import("std");

pub const ReturnCode = @import("zigrfc/commons.zig").ReturnCode;
pub const ErrorInfo = @import("zigrfc/commons.zig").ErrorInfo;

pub const authorization = @import("zigrfc/authorization.zig");
pub const commons = @import("zigrfc/commons.zig");
pub const connection = @import("zigrfc/connection.zig");
pub const conversions = @import("zigrfc/conversions.zig");
pub const decfloat = @import("zigrfc/decfloat.zig");
pub const desc = @import("zigrfc/desc.zig");
pub const ini = @import("zigrfc/ini.zig");
pub const metadata_query = @import("zigrfc/metadata_query.zig");
pub const server = @import("zigrfc/server.zig");
pub const snc = @import("zigrfc/snc.zig");
pub const trace = @import("zigrfc/trace.zig");
pub const transaction = @import("zigrfc/transaction.zig");
pub const unit = @import("zigrfc/unit.zig");
pub const websocket = @import("zigrfc/websocket.zig");

/// Get information about currently loaded sapnwrfc library.
///
/// Fills the provided unsigneds with the SAP release values, e.g. *majorVersion = 7500,
/// *minorVersion = 0, *patchLevel = 44.
pub extern fn RfcGetVersion(major_version: *c_uint, minor_version: *c_uint, patch_level: *c_uint) [*]const commons.SapUc;

pub fn PrintErrorToLog(error_info: *ErrorInfo) !void {
    var buffer: [1024]u8 = undefined;
    const secondArgStart = try std.unicode.utf16LeToUtf8(buffer[0..], &error_info.key);
    const thirdArgStart = try std.unicode.utf16LeToUtf8(buffer[secondArgStart..], &error_info.message);

    std.log.err("Key={s}; Message={s}", .{
        buffer[0..secondArgStart],
        buffer[secondArgStart..thirdArgStart],
    });
}
