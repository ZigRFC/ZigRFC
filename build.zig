const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    _ = b.addModule("rfc_raw", .{
        .root_source_file = b.path("src/root_raw.zig"),
        .target = target,
        .optimize = optimize,
    });

    _ = b.addModule("rfc", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });
}
