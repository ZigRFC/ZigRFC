const mem = @import("std").mem;

const ReturnCode = @import("commons.zig").ReturnCode;
const ErrorInfo = @import("commons.zig").ErrorInfo;

const SapUc = @import("commons.zig").SapUc;
const Char = @import("commons.zig").Char;
const Byte = @import("commons.zig").Byte;

const Function = @import("data_container.zig").Function;
const Structure = @import("data_container.zig").Structure;
const Table = @import("data_container.zig").Table;
const AbapObject = @import("data_container.zig").AbapObject;

pub const FILE = extern struct {
    _Placeholder: ?*anyopaque = null,
};

// ==================================================
// Enums
// ==================================================
extern fn RfcGetTypeAsString(@"type": Type) [*:0]const SapUc;
/// RFCTYPE is used in field descriptions (#FIELD_DESC) and parameter descriptions
/// (#PARAMETER_DESC) and denotes the ABAP data type of the corresponding field/parameter.
pub const Type = enum(c_int) {
    /// 1-byte or multibyte character, fixed size, blank padded
    char = 0,
    /// Date ( YYYYYMMDD )
    date = 1,
    /// Packed number, any length between 1 and 16 bytes
    bcd = 2,
    /// Time (HHMMSS)
    time = 3,
    /// Raw data, binary, fixed length, zero padded.
    byte = 4,
    /// Internal table
    table = 5,
    /// Digits, fixed size, leading '0' padded.
    num = 6,
    /// Floating point, double precision
    float = 7,
    /// 4-byte integer
    int = 8,
    /// 2-byte integer. Obsolete, not directly supported by ABAP/4
    int2 = 9,
    /// 1-byte integer, unsigned. Obsolete, not directly supported by ABAP/4
    int1 = 10,
    /// Not supported data type.
    null = 14,
    /// ABAP object.
    abapobject = 16,
    /// ABAP structure
    structure = 17,
    /// IEEE 754r decimal floating point, 8 bytes
    decf16 = 23,
    /// IEEE 754r decimal floating point, 16 bytes
    decf34 = 24,
    /// No longer used!
    xmldata = 28,
    /// Variable-length, null-terminated string
    string = 29,
    /// Variable-length raw string, length in bytes
    xstring = 30,
    /// 8-byte integer
    int8,
    /// timestamp/long, 8-byte integer
    utclong,
    /// timestamp/second, 8-byte integer
    utcsecond,
    /// timestamp/minute, 8-byte integer
    utcminute,
    /// date/day , 4-byte integer
    dtday,
    /// date/week, 4-byte integer
    dtweek,
    /// date/month, 4-byte integer
    dtmonth,
    /// time/second, 4-byte integer
    tsecond,
    /// time/minute, 2-byte integer
    tminute,
    /// calendar day, 2-byte integer
    cday,
    /// boxed structure, note: not supported by nw rfc lib
    box,
    /// boxed client dependent structure, note: not supported by nw rfc lib
    generic_box,
    /// the max. value of rfctypes
    _max_value,
    /// Converts an RFCTYPE data type indicator to a human readable string for logging purposes.
    pub fn GetAsString(self: Type) [*:0]const SapUc {
        return RfcGetTypeAsString(self);
    }
};

extern fn RfcGetDirectionAsString(direction: Direction) [*:0]const SapUc;
/// Used in #PARAMETER_DESC::direction for specifying the direction of a function module parameter.
pub const Direction = enum(c_int) {
    /// Import parameter. This corresponds to ABAP IMPORTING parameter.
    import = 0x01,
    /// Export parameter. This corresponds to ABAP EXPORTING parameter.
    @"export" = 0x02,
    /// Import and export parameter. This corresponds to ABAP CHANGING parameter.
    changing = .import | .@"export",
    /// Table parameter. This corresponds to ABAP TABLES parameter.
    tables = 0x04 | .changing,

    ///   Converts an RFC_DIRECTION direction indicator to a human readable string for logging purposes.
    pub fn GetAsString(self: Direction) [*:0]const SapUc {
        return RfcGetDirectionAsString(self);
    }
};

// ==================================================
// Structs
// ==================================================
/// Name of ABAP function, function parameter or field in a structure. (null-terminated)
pub const AbapName = [31]Char;
/// Default value of a function module parameter. (null-terminated)
pub const ParameterDefValue = [31]Char;
/// Parameter description for a function module parameter. (null-terminated)
pub const ParameterText = [80]Char;
/// Default value of a function module parameter. (null-terminated)
pub const ClassAttributeDefValue = [31]Char;
/// Default value of a function module parameter. (null-terminated)
pub const ClassName = [31]Char;
/// Default value of a function module parameter. (null-terminated)
pub const ClassAttributeDescription = [512]Char;

/// Structure for reading (RfcGetFieldDescByIndex() or RfcGetFieldDescByName())
/// or defining (RfcAddTypeField()) the properties of a field in a structure/table.
pub const FieldDesc = extern struct {
    /// Field name, null-terminated string
    name: AbapName = mem.zeroes(AbapName),
    /// Field data type
    type: Type = mem.zeroes(Type),
    /// Field length in bytes in a 1-byte-per-SAP_CHAR system
    nuc_length: c_uint = 0,
    /// Field offset in bytes in a 1-byte-per-SAP_CHAR system
    nuc_offset: c_uint = 0,
    /// Field length in bytes in a 2-byte-per-SAP_CHAR system
    uc_length: c_uint = 0,
    /// Field offset in bytes in a 2-byte-per-SAP_CHAR system
    uc_offset: c_uint = 0,
    /// If the field is of type "packed number" (BCD), this member gives the number of decimals.
    decimals: c_uint = 0,
    /// Pointer to an RFC_STRUCTURE_DESC structure for the nested sub-type if the type field is RFCTYPE_STRUCTURE or RFCTYPE_TABLE ////
    type_desc_handle: *TypeDesc = null,
    /// Not used by the NW RFC library. This parameter can be used by applications that want to store additional information in the repository (like F4 help values, e.g.).
    extended_description: ?*anyopaque = null,
};

/// Structure for reading (RfcGetParameterDescByIndex() or RfcGetParameterDescByName())
/// or defining (RfcAddParameter()) the properties of a parameter in a function module.
pub const ParameterDesc = extern struct {
    /// Parameter name, null-terminated string
    name: AbapName = mem.zeroes(AbapName),
    /// Parameter data type
    type: type = mem.zeroes(type),
    /// Specifies whether the parameter is an input, output or bi-directional parameter
    direction: Direction = mem.zeroes(Direction),
    /// Parameter length in bytes in a 1-byte-per-SAP_CHAR system
    nuc_length: c_uint = 0,
    /// Parameter length in bytes in a 2-byte-per-SAP_CHAR system
    uc_length: c_uint = 0,
    /// Gives the number of decimals in case of a packed number (BCD)
    decimals: c_uint = 0,
    /// Handle to the structure definition in case this parameter is a structure or table
    type_desc_handle: *TypeDesc = null,
    /// Default value as defined in SE37
    default_value: ParameterDefValue = mem.zeroes(ParameterDefValue),
    /// Description text of the parameter as defined in SE37. Null-terminated string.
    parameter_text: ParameterText = mem.zeroes(ParameterText),
    /// Specifies whether this parameter is defined as optional in SE37. 1 is optional, 0 non-optional
    optional: Byte = 0,
    /// This field can be used by the application programmer (i.e. you) to store arbitrary extra information.
    extended_description: ?*anyopaque = null,
};

/// Structure for reading (RfcGetExceptionDescByIndex() or RfcGetExceptionDescByName())
/// or defining (RfcAddException()) the properties of an exception key in a function module.
pub const ExceptionDesc = extern struct {
    key: [128]SapUc = mem.zeroes([128]SapUc),
    message: [512]SapUc = mem.zeroes([512]SapUc),
};

// ==================================================
// Descriptions
// ==================================================
extern fn RfcCreateFunction(func_desc_handle: *FunctionDesc, error_info: ?*ErrorInfo) ?*Function;
extern fn RfcCreateStructure(type_desc_handle: *TypeDesc, error_info: ?*ErrorInfo) ?*Structure;
extern fn RfcCreateTable(type_desc_handle: *TypeDesc, error_info: ?*ErrorInfo) ?*Table;
extern fn RfcCreateAbapObject(class_descHandle: *ClassDesc, error_info: ?*ErrorInfo) ?*AbapObject;

extern fn RfcAddTypeField(type_handle: *TypeDesc, field_descr: *const FieldDesc, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetTypeLength(type_handle: *TypeDesc, nuc_byte_length: c_uint, uc_byte_length: c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetTypeName(type_handle: *TypeDesc, buffer_for_name: [*]Char, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetFieldCount(type_handle: *TypeDesc, count: *c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetFieldDescByIndex(type_handle: *TypeDesc, index: c_uint, field_descr: *FieldDesc, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetFieldDescByName(type_handle: *TypeDesc, name: [*:0]const SapUc, field_descr: *FieldDesc, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetTypeLength(type_handle: *TypeDesc, nuc_byte_length: *c_uint, uc_byte_length: *c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcDestroyTypeDesc(type_handle: *TypeDesc, error_info: ?*ErrorInfo) ReturnCode;

extern fn RfcGetFunctionName(func_desc: *FunctionDesc, buffer_for_name: [*]Char, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcAddParameter(func_desc: *FunctionDesc, param_desc: *const ParameterDesc, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetParameterCount(func_desc: *FunctionDesc, count: *c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetParameterDescByIndex(func_desc: *FunctionDesc, index: c_uint, param_desc: *ParameterDesc, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetParameterDescByName(func_desc: *FunctionDesc, name: [*:0]const SapUc, param_desc: *ParameterDesc, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcAddException(func_desc: *FunctionDesc, excDesc: *const ExceptionDesc, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetExceptionCount(func_desc: *FunctionDesc, count: *c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetExceptionDescByIndex(func_desc: *FunctionDesc, index: c_uint, exc_desc: *ExceptionDesc, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetExceptionDescByName(func_desc: *FunctionDesc, name: [*:0]const SapUc, exc_desc: *ExceptionDesc, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcEnableBASXML(func_desc: *FunctionDesc, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcIsBASXMLSupported(func_desc: *FunctionDesc, is_enabled: *c_int, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcDestroyFunctionDesc(func_desc: *FunctionDesc, error_info: ?*ErrorInfo) ReturnCode;

extern fn RfcGetClassName(class_desc: *ClassDesc, buffer_for_name: [*]Char, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcAddClassAttribute(class_desc: *ClassDesc, attr_desc: *const ClassAttributeDescription, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetClassAttributesCount(class_desc: *ClassDesc, count: *c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetClassAttributeDescByIndex(class_desc: *ClassDesc, index: c_uint, attrDesc: *ClassAttributeDescription, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetClassAttributeDescByName(class_desc: *ClassDesc, name: [*:0]const SapUc, attr_desc: *ClassAttributeDescription, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetParentClassByIndex(class_desc: *ClassDesc, name: *ClassName, index: c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetParentClassesCount(class_desc: *ClassDesc, parent_classes_count: *c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcAddParentClass(class_desc: *ClassDesc, name: *const ClassName, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetImplementedInterfaceByIndex(class_desc: *ClassDesc, index: c_uint, name: [*c]Char, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetImplementedInterfacesCount(class_desc: *ClassDesc, implemented_interfaces_count: *c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcAddImplementedInterface(class_desc: *ClassDesc, name: *ClassName, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcDestroyClassDesc(class_handle: *ClassDesc, error_info: ?*ErrorInfo) ReturnCode;

/// Handle to a cached metadata description of a structure or table type.
pub const TypeDesc = extern struct {
    handle: ?*anyopaque = null,

    /// Creates a data container for a structure.
    pub fn CreateStructure(self: *TypeDesc, error_info: ?*ErrorInfo) ?*Structure {
        return RfcCreateStructure(self, error_info);
    }

    /// Creates a data container for a table.
    pub fn CreateTable(self: *TypeDesc, error_info: ?*ErrorInfo) ?*Table {
        return RfcCreateTable(self, error_info);
    }
    /// Creates an empty type description with the given name.
    ///
    /// API for creating hard-coded metadata descriptions, e.g. for function modules that
    /// don't exist in the R/3 backend.
    /// Add field descriptions to the type description using RfcAddTypeField() and at the end
    /// set the total byte length of the structure using RfcSetTypeLength().
    ///
    /// **warning** It is not easy to get the total length right, as you also need to take
    /// alignment bytes into account...
    ///
    /// Finished type definitions can then be used for creating data containers (RfcCreateStructure()
    /// or RfcCreateTable()) and for adding field/table descriptions to a function module description
    /// (in RFC_PARAMETER_DESCs in RfcAddParameter()).
    ///
    /// After the handle was used for creating a container, any modifications are forbidden.
    pub fn AddTypeField(self: *TypeDesc, field_descr: *const FieldDesc, error_info: ?*ErrorInfo) ReturnCode {
        return RfcAddTypeField(self, field_descr, error_info);
    }
    /// Sets the total byte length of the type description.
    ///
    /// Before a type description can be used, this function needs to be called.
    /// The RFC library does not automatically calculate the correct length based on
    /// the fields that have been added, because this task is non-trivial and possibly
    /// platform dependend. (Especially if the structure contains sub-structures.)
    ///
    /// For integer and floating point types the correct alignments need to be taken into
    /// account (start address divisible by 4 or 8), fixed sub-structures are inlined,
    /// complex structures are referenced by an 8-byte pointer, etc. In general you will need
    /// to do a bit of trial and error, before you get it right.
    ///
    /// If you really need more details/tips for the process of hardcoding metadata, see
    /// this article: https://wiki.scn.sap.com/wiki/x/FD67Gg.
    pub fn SetTypeLength(
        self: *TypeDesc,
        /// Total byte length of the structure in a non-Unicode system (1 byte per CHAR).
        nuc_byte_length: c_uint,
        // Total byte length of the structure in a Unicode system (2 bytes per CHAR).
        uc_byte_length: c_uint,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcSetTypeLength(self, nuc_byte_length, uc_byte_length, error_info);
    }
    /// Returns the name of the type.
    pub fn GetTypeName(self: *TypeDesc, buffer_for_name: [*]Char, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetTypeName(self, buffer_for_name, error_info);
    }
    /// Returns the number of fields in a structure definition.
    pub fn GetFieldCount(self: *TypeDesc, count: *c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetFieldCount(self, count, error_info);
    }
    /// Reads the field description of the structure's ith field.
    ///
    /// Useful mostly when looping over the fields of a structure.
    pub fn GetFieldDescByIndex(self: *TypeDesc, index: c_uint, field_descr: *FieldDesc, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetFieldDescByIndex(self, index, field_descr, error_info);
    }
    /// Reads the field description of a field given by name.
    pub fn GetFieldDescByName(self: *TypeDesc, name: [*:0]const SapUc, field_descr: *FieldDesc, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetFieldDescByName(self, name, field_descr, error_info);
    }
    /// Returns the total byte length of a structure definition.
    pub fn GetTypeLength(self: *TypeDesc, nucByteLength: *c_uint, ucByteLength: *c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetTypeLength(self, nucByteLength, ucByteLength, error_info);
    }
    /// Deletes the type description and releases the allocated resources.
    ///
    /// Only descriptions, which are not stored in a repository cache and not used by the application, can be deleted.
    /// Deleting a cached description will cause an error, and deleting a description that is still in use, will lead
    /// to a crash.
    pub fn DestroyTypeDesc(self: *TypeDesc, error_info: ?*ErrorInfo) ReturnCode {
        return RfcDestroyTypeDesc(self, error_info);
    }
};

/// Handle to a cached metadata description of a function module.
pub const FunctionDesc = extern struct {
    handle: ?*anyopaque = null,

    /// Creates a data container that can be used to execute function calls in the backend via RfcInvoke().
    ///
    /// The importing parameters can be set using the RfcSetX functions. After the RfcInvoke() call returned
    /// successfully, the exporting parameters can be read from this data container via the RfcGetX functions.
    pub fn CreateFunction(self: *FunctionDesc, error_info: ?*ErrorInfo) ?*Function {
        return RfcCreateFunction(self, error_info);
    }
    /// Returns a function module's DDIC name.
    pub fn GetFunctionName(self: *FunctionDesc, buffer_for_name: [*]Char, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetFunctionName(self, buffer_for_name, error_info);
    }
    /// Adds a new parameter (IMPORTING, EXPORTING, CHANGING, TABLES) to the function description.
    ///
    ///  **note** After the function description has been used via RfcCreateFunction() or RfcAddFunctionDesc(),
    /// it can no longer be modified!
    pub fn AddParameter(self: *FunctionDesc, param_desc: *const ParameterDesc, error_info: ?*ErrorInfo) ReturnCode {
        return RfcAddParameter(self, param_desc, error_info);
    }
    /// Returns the number of parameters in the function module definition.
    pub fn GetParameterCount(self: *FunctionDesc, count: *c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetParameterCount(self, count, error_info);
    }
    /// Reads the metadata description of the function module's ith parameter.
    ///
    /// **note** Mostly be useful when looping over all parameters of a function module.
    ///  \in func_desc The function module's metadata description.
    pub fn GetParameterDescByIndex(self: *FunctionDesc, index: c_uint, param_desc: *ParameterDesc, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetParameterDescByIndex(self, index, param_desc, error_info);
    }
    /// Reads the metadata description of a function module parameter given by name.
    pub fn GetParameterDescByName(self: *FunctionDesc, name: [*:0]const SapUc, param_desc: *ParameterDesc, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetParameterDescByName(self, name, param_desc, error_info);
    }
    /// Adds a new ABAP Exception to the function description.
    ///  **note** After the function description has been used via RfcCreateFunction() or RfcAddFunctionDesc(),
    /// it can no longer be modified!
    pub fn AddException(self: *FunctionDesc, exc_desc: *const ExceptionDesc, error_info: ?*ErrorInfo) ReturnCode {
        return RfcAddException(self, exc_desc, error_info);
    }
    /// Returns the number of ABAP Exceptions of the function module.
    pub fn GetExceptionCount(self: *FunctionDesc, count: *c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetExceptionCount(self, count, error_info);
    }
    /// Reads the metadata description of the function module's ith ABAP Exception.
    pub fn GetExceptionDescByIndex(self: *FunctionDesc, index: c_uint, exc_desc: *ExceptionDesc, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetExceptionDescByIndex(self, index, exc_desc, error_info);
    }
    /// Reads the metadata description of a function module's ABAP Exception given by name.
    pub fn GetExceptionDescByName(self: *FunctionDesc, name: [*:0]const SapUc, exc_desc: *ExceptionDesc, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetExceptionDescByName(self, name, exc_desc, error_info);
    }
    /// Enables this function module for the basXML serialization format.
    ///
    /// R/3 Systems from kernel release 7.10 on support a new serialization format: basXML (binary ABAP serialization).
    /// Calling %RfcEnableBASXML() allows the RFC library to transport this function module's data via the
    /// basXML format, if the target backend supports it and the connection parameter NO_BASXML is either not set or set to "0".
    pub fn EnableBASXML(self: *FunctionDesc, error_info: ?*ErrorInfo) ReturnCode {
        return RfcEnableBASXML(self, error_info);
    }
    /// Returns whether this function module has been enabled for basXML.
    ///
    /// See RfcEnableBASXML()
    ///
    /// 0 = false, 1 = true.
    pub fn IsBASXMLSupported(self: *FunctionDesc, is_enabled: *c_int, error_info: ?*ErrorInfo) ReturnCode {
        return RfcIsBASXMLSupported(self, is_enabled, error_info);
    }
    /// Deletes the function description and releases the allocated resources.
    ///
    /// Only descriptions, which are not stored in a repository cache and not used by the application, can be deleted.
    /// Deleting a cached description will cause an error, and deleting a description that is still in use, will lead
    /// to a crash.
    pub fn DestroyFunctionDesc(self: *FunctionDesc, error_info: ?*ErrorInfo) ReturnCode {
        return RfcDestroyFunctionDesc(self, error_info);
    }
};

/// Handle to a cached metadata description of a class.
pub const ClassDesc = extern struct {
    handle: ?*anyopaque = null,

    /// Creates an ABAP object handle with the given class description handle.
    pub fn CreateAbapObject(self: *ClassDesc, error_info: ?*ErrorInfo) ?*AbapObject {
        return RfcCreateAbapObject(self, error_info);
    }

    /// Returns the class's DDIC name.
    pub fn GetClassName(self: *ClassDesc, buffer_for_name: [*]Char, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetClassName(self, buffer_for_name, error_info);
    }
    /// Adds a new attribute (field, structure, table, method) to the class description.
    ///
    ///  **note** After the function description has been used via RfcCreateAbapObject() or RfcAddClassDesc(),
    /// it can no longer be modified!
    pub fn AddClassAttribute(self: *ClassDesc, attr_desc: *const ClassAttributeDescription, error_info: ?*ErrorInfo) ReturnCode {
        return RfcAddClassAttribute(self, attr_desc, error_info);
    }
    /// Returns the number of parameters in the function module definition.
    pub fn GetClassAttributesCount(self: *ClassDesc, count: *c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetClassAttributesCount(self, count, error_info);
    }
    /// Reads the metadata description of the class attribute.
    ///
    /// **note** Is useful mostly when looping over all attributes of a class.
    pub fn GetClassAttributeDescByIndex(self: *ClassDesc, index: c_uint, attr_desc: *ClassAttributeDescription, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetClassAttributeDescByIndex(self, index, attr_desc, error_info);
    }
    /// Reads the metadata description of a class attribute given by name.
    pub fn GetClassAttributeDescByName(self: *ClassDesc, name: [*:0]const SapUc, attr_desc: *ClassAttributeDescription, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetClassAttributeDescByName(self, name, attr_desc, error_info);
    }
    /// Returns the parent classes of the given class.
    pub fn GetParentClassByIndex(self: *ClassDesc, name: *ClassName, index: c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetParentClassByIndex(self, name, index, error_info);
    }
    /// Returns the number of parent classes of the given class.
    pub fn GetParentClassesCount(self: *ClassDesc, parent_classes_count: *c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetParentClassesCount(self, parent_classes_count, error_info);
    }
    /// Sets the parent classes of the given class.
    pub fn AddParentClass(self: *ClassDesc, name: *const ClassName, error_info: ?*ErrorInfo) ReturnCode {
        return RfcAddParentClass(self, name, error_info);
    }
    /// Returns the implemented interfaces of the given class.
    pub fn GetImplementedInterfaceByIndex(self: *ClassDesc, index: c_uint, name: [*c]Char, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetImplementedInterfaceByIndex(self, index, name, error_info);
    }
    /// Returns the number of parent interfaces of the given class.
    pub fn GetImplementedInterfacesCount(self: *ClassDesc, implemented_interfaces_count: *c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetImplementedInterfacesCount(self, implemented_interfaces_count, error_info);
    }
    /// Adds an interface to the list of implemented interfaces of the given class.
    pub fn AddImplementedInterface(self: *ClassDesc, name: *ClassName, error_info: ?*ErrorInfo) ReturnCode {
        return RfcAddImplementedInterface(self, name, error_info);
    }
    /// Deletes the class description and releases the allocated resources.
    ///
    /// Only descriptions, which are not stored in a repository cache and not used by the application, can be deleted.
    /// Deleting a cached description will cause an error, and deleting a description that is still in use, will lead
    /// to a crash.
    pub fn DestroyClassDesc(self: *ClassDesc, error_info: ?*ErrorInfo) ReturnCode {
        return RfcDestroyClassDesc(self, error_info);
    }
};

// ==================================================
// Functions
// ==================================================
/// Looks for a cached function description.
///
/// This API should be used with care and is only for special scenarios, for example:
/// - You know for sure, that a function description has already been cached via RfcGetFunctionDesc(),
///     and don't want to open an extra rfcHandle that will never be used.
///     In this case simply use the SAP System ID as the repositoryID.
/// - You have created a hard-coded repository via RfcAddFunctionDesc(), which contains function modules
///     that do not exist in the backend's DDIC.
///
///  If repositoryID is NULL, the "default repository" is used.
pub extern fn RfcGetCachedFunctionDesc(repository_id: ?[*:0]const SapUc, func_name: [*:0]const SapUc, error_info: ?*ErrorInfo) *FunctionDesc;
/// Adds a function description to the cache for the specified R/3 System.
///
/// This API should be used with care and is only for special scenarios, e.g. if you want to
/// write an RFC server that offers function modules, which do not exist in the R/3 system's DDIC.
///
/// If repositoryID is NULL, the description is added to the "default repository".
pub extern fn RfcAddFunctionDesc(repository_id: ?[*:0]const SapUc, func_desc: *FunctionDesc, error_info: ?*ErrorInfo) ReturnCode;

/// Removes and deletes a function description from the cache for the specified R/3 System.
///
/// This API can be used, e.g. if the signature (imports, exports, etc.) of a function module has
/// been changed in the backend, while the external RFC program is still running. If the RFC library
/// continues using the old cached metadata description, garbage values (if fields have been deleted
/// from the function module) or missing values (if new fields have been added to the function module)
/// will result.
/// Already existing function modules will use the old description, after the description was removed and deleted
/// from the cache.
/// If repositoryID is NULL, the description is removed from the "default repository".
pub extern fn RfcRemoveFunctionDesc(repository_id: ?[*:0]const SapUc, function_name: [*:0]const SapUc, error_info: ?*ErrorInfo) ReturnCode;

/// Looks for a cached structure/table description.
///
/// Similar to RfcGetTypeDesc(), but it only looks into the cache. Again it should almost never
/// be necessary to get a metadata description of a single structure.
pub extern fn RfcGetCachedTypeDesc(repository_id: ?[*:0]const SapUc, type_name: [*:0]const SapUc, error_info: ?*ErrorInfo) *TypeDesc;

/// Adds a type description to the cache.
///
/// If repositoryID is NULL, the description is added to the "default repository".
pub extern fn RfcAddTypeDesc(repository_id: ?[*:0]const SapUc, type_handle: *TypeDesc, error_info: ?*ErrorInfo) ReturnCode;
/// Removes and deletes a type description from the cache.
///
/// Already existing function modules will use the old description, after the description was removed and deleted
/// from the cache.
///
/// If repositoryID is NULL, the description is added to the "default repository".
pub extern fn RfcRemoveTypeDesc(repository_id: ?[*:0]const SapUc, type_name: [*:0]const SapUc, error_info: ?*ErrorInfo) ReturnCode;
/// Looks for a cached class description.
///
/// This API should be used with care and is only for special scenarios, for example:
/// - You know for sure, that a class description has already been cached via RfcGetClassDesc(),
///     and don't want to open an extra rfcHandle that will never be used.
///     In this case simply use the SAP System ID as the repositoryID.
/// - You have created a hard-coded repository via RfcAddClassDesc(), which contains classes
///     that do not exist in the backend's DDIC.
///
///  If repositoryID is NULL, the "default repository" is used.
pub extern fn RfcGetCachedClassDesc(repository_id: ?[*:0]const SapUc, class_name: [*:0]const SapUc, error_info: ?*ErrorInfo) *ClassDesc;

/// Adds a class description to the cache for the specified R/3 System.
///
/// This API should be used with care and is only for special scenarios, e.g. if you want to
/// write an RFC server that offers/uses classes, which do not exist in the R/3 system's DDIC.
///
/// If repositoryID is NULL, the description is added to the "default repository".
pub extern fn RfcAddClassDesc(repository_id: ?[*:0]const SapUc, class_desc: *ClassDesc, error_info: ?*ErrorInfo) ReturnCode;
/// Removes and deletes a class description from the cache for the specified R/3 System.
///
/// Already existing function modules will use the old description, after the description was removed and deleted
/// from the cache.
///
/// If repositoryID is NULL, the description is removed from the "default repository".
pub extern fn RfcRemoveClassDesc(repository_id: ?[*:0]const SapUc, className: [*:0]const SapUc, error_info: ?*ErrorInfo) ReturnCode;
/// Removes all metadata from the repository cache of the specified R/3 System.
///
/// If repositoryID is NULL, the "default repository" is cleared.
pub extern fn RfcClearRepository(repository_id: ?[*:0]const SapUc, error_info: ?*ErrorInfo) ReturnCode;
/// Stores the currently cached objects of a repository into a JSON formatted text file.
///
/// This function will create a JSON formatted text file that contains all currently cached function module descriptions with their parameters,
/// so it can be reloaded at another time (see RfcLoadRepository()) without opening connections to the backend and fetching metadata from the DDIC.
/// This JSON file can also be used by the SAP .NET Connector and SAP Java Connector.
pub extern fn RfcSaveRepository(
    repository_id: ?[*:0]const SapUc,
    /// FILE pointer opened by the user.
    target_stream: *FILE,
    error_info: ?*ErrorInfo,
) ReturnCode;
/// Retrieves metadata from a JSON formatted text file and creates the according repository to use for function calls.
///
/// This function will create a repository with the given ID - or a default repository, if the ID is NULL - and populate it with
/// the function descriptions and parameter descriptions contained in the JSON formatted text file (see RfcSaveRepository()).
/// That way the RFC program does not need to fetch the metadata from the backend DDIC, which is useful, if you want to
/// improve the startup performance of your program or if your program is an RFC server that does not have login parameters
/// for the backend.
/// It is also possible to use JSON files created by SAP .NET Connector and SAP Java Connector.
///
/// **note** Special care needs to be taken to guarantee that the loaded metadata indeed matches the function and structure
/// descriptions defined in the backend system(s) against which it is to be used. Otherwise the risk of data corruption is very high.
///
/// **note** If a repository with the given ID already exists, %RfcLoadRepository() will delete it and replace it with the contents
/// of the JSON file.
pub extern fn RfcLoadRepository(
    repository_id: ?[*:0]const SapUc,
    /// FILE pointer opened by the user.
    target_stream: *FILE,
    error_info: ?*ErrorInfo,
) ReturnCode;
/// Creates an empty type description with the given name.
///
/// API for creating hard-coded metadata descriptions, e.g. for function modules that
/// don't exist in the R/3 backend.
/// Add field descriptions to the type description using RfcAddTypeField() and at the end
/// set the total byte length of the structure using RfcSetTypeLength().
///
/// **warning** It is not easy to get the total length right, as you also need to take
/// alignment bytes into account...
///
/// Finished type definitions can then be used for creating data containers (RfcCreateStructure()
/// or RfcCreateTable()) and for adding field/table descriptions to a function module description
/// (in RFC_PARAMETER_DESCs in RfcAddParameter()).
///
/// After the handle was used for creating a container, any modifications are forbidden.
pub extern fn RfcCreateTypeDesc(
    /// An (arbitrary) name for the type.
    name: [*c]const SapUc,
    error_info: ?*ErrorInfo,
) *TypeDesc;

/// Creates an empty function description with the given name.
///
/// Add parameter descriptions and exception descriptions to the new RFC_FUNCTION_DESC_HANDLE
/// via RfcAddParameter() and RfcAddException().
///
/// After the handle was used for creating a container, any modifications are forbidden.
pub extern fn RfcCreateFunctionDesc(name: [*:0]const SapUc, error_info: ?*ErrorInfo) *FunctionDesc;

/// Creates an empty class description with the given name.
///
/// Add attribute descriptions to the new RFC_CLASS_DESC_HANDLE via RfcAddAttribute().\n
///
/// After the handle was used for creating a container, any modifications are forbidden.
pub extern fn RfcCreateClassDesc(name: [*:0]const SapUc, error_info: ?*ErrorInfo) *ClassDesc;
