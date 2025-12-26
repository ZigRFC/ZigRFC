# ZigRFC
SAP NW RFC bindings for Zig

### Requirements
- You might need to install Visual C++ Redistributable.

- Get SAP NW RFC SDK from https://support.sap.com/en/product/connectors/nwrfcsdk.html.

- Add following line to `build.zig` (assuming .lib is unpacked to `src/dll` relative to `build.zig`):
  ```zig
  exe.addObjectFile(b.path("src/dll/sapnwrfc.lib"));
  ```

- Make sure .dll files are in the same folder as .exe you are trying to run. You might use following command to copy all dll files on build:
  ```zig
    b.installDirectory(.{
        .source_dir = b.path("src/dll"),
        .install_dir = .prefix,
        .install_subdir = "bin",
        .include_extensions = &.{ "dll" },
    });
  ```
  
### Installation
1. Add dependency to `build.zig.zon`
   - Via zig fetch command `zig fetch --save git+https://github.com/ZigRFC/ZigRFC`    

   - Manually - download repo to e.g. "rfc" folder and add following to `build.zig.zon` file:
    ```zig
        .dependencies = .{
            .rfc = .{
                .path = "rfc",
            },
        },
    ```
2. Add dependency to `build.zig`
   ```zig
      const depe = b.dependency("rfc", .{
          .target = target,
          .optimize = optimize,
      });

     //Add import to given exe/module
     exe.root_module.addImport("rfc", depe.module("rfc"));

     //Alternatively, add directly to given imports
      .imports = &.{
          .{ .name = "rfc", .module = depe.module("rfc") },
      },
   ```
3. Import in code
   ```zig
   const rfc = @import("rfc");
   ``` 

### Usage
TODO...
