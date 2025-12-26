# ZigRFC
Zig bindings for SAP NW RFC SDK, based on version 7.50 patch level 18.

I more or less tried to make them more Zig idiomatic. You might also import and use C headers, but they are less pleasant to work with and lack documentation (see [/src/root_raw.zig](/src/root_raw.zig)).

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

#### Client example
https://github.com/ZigRFC/examples_client 

#### Minimal example
Assuming all SDK files and ZigRFC library were added correctly, following example
```zig
const std = @import("std");
const rfc = @import("rfc");

const W = std.unicode.utf8ToUtf16LeStringLiteral;

pub fn main() !void {
    var login_params: [6]rfc.connection.Parameter = undefined;
    var error_info: rfc.ErrorInfo = undefined;

    login_params[0].name = W("ashost");
    login_params[0].value = W("value");

    const connection = rfc.connection.RfcOpenConnection(&login_params, 1, &error_info);
    if (connection == null) {
        try rfc.PrintErrorToLog(&error_info);
    }
}
```
should produce
```console
error: Key=RFC_INVALID_PARAMETER; Message=ASHOST needs SYSNR to be specified
```
