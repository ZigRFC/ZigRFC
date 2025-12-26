const ReturnCode = @import("commons.zig").ReturnCode;
const ErrorInfo = @import("commons.zig").ErrorInfo;

const SapUc = @import("commons.zig").SapUc;
const SapRaw = @import("commons.zig").SapRaw;
const Int8 = @import("commons.zig").Int8;

const Char = @import("commons.zig").Char;
const Byte = @import("commons.zig").Byte;
const Num = @import("commons.zig").Num;
const Bcd = @import("commons.zig").Bcd;
const Int1 = @import("commons.zig").Int1;
const Int2 = @import("commons.zig").Int2;
const Int = @import("commons.zig").Int;
const Float = @import("commons.zig").Float;
const Date = @import("commons.zig").Date;
const Time = @import("commons.zig").Time;
const DecF16 = @import("commons.zig").DecF16;
const DecF34 = @import("commons.zig").DecF34;
const UtcLong = @import("commons.zig").UtcLong;
const UtcSecond = @import("commons.zig").UtcSecond;
const UtcMinute = @import("commons.zig").UtcMinute;

const TypeDesc = @import("desc.zig").TypeDesc;
const FunctionDesc = @import("desc.zig").FunctionDesc;
const ClassDesc = @import("desc.zig").ClassDesc;

const Connection = @import("connection.zig").Connection;

// ==================================================
// Data containers
// ==================================================

extern fn RfcDestroyFunction(func_handle: *Function, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetParameterActive(func_handle: *Function, paramName: [*c]const SapUc, isActive: c_int, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcIsParameterActive(func_handle: *Function, paramName: [*c]const SapUc, isActive: [*c]c_int, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetAbapClassException(func_handle: *Function, error_info: ?*ErrorInfo) *AbapObject;
extern fn RfcSetAbapClassException(func_handle: *Function, excp_handle: *AbapObject, exception_text: [*c]const SapUc, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcDescribeFunction(func_handle: *Function, error_info: ?*ErrorInfo) *FunctionDesc;
extern fn RfcEnableAbapClassException(func_handle: *Function, rfc_handle_repository: *Connection, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcIsAbapClassExceptionEnabled(func_handle: *Function, isEnabled: [*c]c_int, error_info: ?*ErrorInfo) ReturnCode;

extern fn RfcCloneStructure(src_structure_handle: *Structure, error_info: ?*ErrorInfo) *Structure;
extern fn RfcDestroyStructure(struct_handle: *Structure, error_info: ?*ErrorInfo) ReturnCode;

extern fn RfcCloneTable(srcTable: *Table, error_info: ?*ErrorInfo) *Table;
extern fn RfcDestroyTable(table_handle: *Table, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetCurrentRow(table_handle: *Table, error_info: ?*ErrorInfo) *Structure;
extern fn RfcAppendNewRow(table_handle: *Table, error_info: ?*ErrorInfo) *Structure;
extern fn RfcReserveCapacity(table_handle: *Table, num_rows: c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcAppendNewRows(table_handle: *Table, num_rows: c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcInsertNewRow(table_handle: *Table, error_info: ?*ErrorInfo) *Structure;
extern fn RfcAppendRow(table_handle: *Table, struct_handle: *Structure, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcInsertRow(table_handle: *Table, struct_handle: *Structure, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcDeleteCurrentRow(table_handle: *Table, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcDeleteAllRows(table_handle: *Table, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcMoveToFirstRow(table_handle: *Table, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcMoveToLastRow(table_handle: *Table, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcMoveToNextRow(table_handle: *Table, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcMoveToPreviousRow(table_handle: *Table, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcMoveTo(table_handle: *Table, index: c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetRowCount(table_handle: *Table, rowCount: *c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetRowType(table_handle: *Table, error_info: ?*ErrorInfo) *TypeDesc;

extern fn RfcGetChars(dataHandle: *DataContainer, name: [*c]const SapUc, charBuffer: [*c]Char, bufferLength: c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetCharsByIndex(dataHandle: *DataContainer, index: c_uint, charBuffer: [*c]Char, bufferLength: c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetNum(dataHandle: *DataContainer, name: [*c]const SapUc, charBuffer: [*c]Num, bufferLength: c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetNumByIndex(dataHandle: *DataContainer, index: c_uint, charBuffer: [*c]Num, bufferLength: c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetDate(dataHandle: *DataContainer, name: [*c]const SapUc, emptyDate: [*c]Char, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetDateByIndex(dataHandle: *DataContainer, index: c_uint, emptyDate: [*c]Char, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetTime(dataHandle: *DataContainer, name: [*c]const SapUc, emptyTime: [*c]Char, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetTimeByIndex(dataHandle: *DataContainer, index: c_uint, emptyTime: [*c]Char, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetString(dataHandle: *DataContainer, name: [*c]const SapUc, stringBuffer: [*c]SapUc, bufferLength: c_uint, string_length: *c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetStringByIndex(dataHandle: *DataContainer, index: c_uint, stringBuffer: [*c]SapUc, bufferLength: c_uint, string_length: *c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetBytes(dataHandle: *DataContainer, name: [*c]const SapUc, byteBuffer: [*c]SapRaw, bufferLength: c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetBytesByIndex(dataHandle: *DataContainer, index: c_uint, byteBuffer: [*c]SapRaw, bufferLength: c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetXString(dataHandle: *DataContainer, name: [*c]const SapUc, byteBuffer: [*c]SapRaw, bufferLength: c_uint, xstring_length: *c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetXStringByIndex(dataHandle: *DataContainer, index: c_uint, byteBuffer: [*c]SapRaw, bufferLength: c_uint, xstring_length: *c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetInt(dataHandle: *DataContainer, name: [*c]const SapUc, value: *Int, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetIntByIndex(dataHandle: *DataContainer, index: c_uint, value: *Int, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetInt1(dataHandle: *DataContainer, name: [*c]const SapUc, value: *Int1, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetInt1ByIndex(dataHandle: *DataContainer, index: c_uint, value: *Int1, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetInt2(dataHandle: *DataContainer, name: [*c]const SapUc, value: *Int2, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetInt2ByIndex(dataHandle: *DataContainer, index: c_uint, value: *Int2, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetInt8(dataHandle: *DataContainer, name: [*c]const SapUc, value: *Int8, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetInt8ByIndex(dataHandle: *DataContainer, index: c_uint, value: *Int8, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetFloat(dataHandle: *DataContainer, name: [*c]const SapUc, value: *Float, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetFloatByIndex(dataHandle: *DataContainer, index: c_uint, value: *Float, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetDecF16(dataHandle: *DataContainer, name: [*c]const SapUc, value: *DecF16, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetDecF16ByIndex(dataHandle: *DataContainer, index: c_uint, value: *DecF16, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetDecF34(dataHandle: *DataContainer, name: [*c]const SapUc, value: *DecF34, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetDecF34ByIndex(dataHandle: *DataContainer, index: c_uint, value: *DecF34, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetStructure(dataHandle: *DataContainer, name: [*c]const SapUc, struct_handle: *Structure, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetStructureByIndex(dataHandle: *DataContainer, index: c_uint, struct_handle: *Structure, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetStructureIntoCharBuffer(dataHandle: *DataContainer, charBuffer: [*c]SapUc, bufferLength: c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetTable(dataHandle: *DataContainer, name: [*c]const SapUc, table_handle: *Table, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetTableByIndex(dataHandle: *DataContainer, index: c_uint, table_handle: *Table, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetAbapObject(dataHandle: *DataContainer, name: [*c]const SapUc, objHandle: *AbapObject, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetAbapObjectByIndex(dataHandle: *DataContainer, index: c_uint, objHandle: *AbapObject, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetStringLength(dataHandle: *DataContainer, name: [*c]const SapUc, string_length: *c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetStringLengthByIndex(dataHandle: *DataContainer, index: c_uint, string_length: *c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetChars(dataHandle: *DataContainer, name: [*c]const SapUc, char_value: [*]const Char, value_length: c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetCharsByIndex(dataHandle: *DataContainer, index: c_uint, char_value: [*]const Char, value_length: c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetNum(dataHandle: *DataContainer, name: [*c]const SapUc, char_value: [*]const Num, value_length: c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetNumByIndex(dataHandle: *DataContainer, index: c_uint, char_value: [*]const Num, value_length: c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetString(dataHandle: *DataContainer, name: [*c]const SapUc, string_value: [*]const SapUc, value_length: c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetStringByIndex(dataHandle: *DataContainer, index: c_uint, string_value: [*]const SapUc, value_length: c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetDate(dataHandle: *DataContainer, name: [*c]const SapUc, date: [*c]const Char, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetDateByIndex(dataHandle: *DataContainer, index: c_uint, date: [*c]const Char, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetTime(dataHandle: *DataContainer, name: [*c]const SapUc, time: [*c]const Char, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetTimeByIndex(dataHandle: *DataContainer, index: c_uint, time: [*c]const Char, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetBytes(dataHandle: *DataContainer, name: [*c]const SapUc, byte_value: [*]const SapRaw, value_length: c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetBytesByIndex(dataHandle: *DataContainer, index: c_uint, byte_value: [*]const SapRaw, value_length: c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetXString(dataHandle: *DataContainer, name: [*c]const SapUc, byte_value: [*]const SapRaw, value_length: c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetXStringByIndex(dataHandle: *DataContainer, index: c_uint, byte_value: [*]const SapRaw, value_length: c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetInt(dataHandle: *DataContainer, name: [*c]const SapUc, value: Int, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetIntByIndex(dataHandle: *DataContainer, index: c_uint, value: Int, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetInt1(dataHandle: *DataContainer, name: [*c]const SapUc, value: Int1, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetInt1ByIndex(dataHandle: *DataContainer, index: c_uint, value: Int1, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetInt2(dataHandle: *DataContainer, name: [*c]const SapUc, value: Int2, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetInt2ByIndex(dataHandle: *DataContainer, index: c_uint, value: Int2, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetInt8(dataHandle: *DataContainer, name: [*c]const SapUc, value: Int8, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetInt8ByIndex(dataHandle: *DataContainer, index: c_uint, value: Int8, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetFloat(dataHandle: *DataContainer, name: [*c]const SapUc, value: Float, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetFloatByIndex(dataHandle: *DataContainer, index: c_uint, value: Float, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetDecF16(dataHandle: *DataContainer, name: [*c]const SapUc, value: DecF16, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetDecF16ByIndex(dataHandle: *DataContainer, index: c_uint, value: DecF16, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetDecF34(dataHandle: *DataContainer, name: [*c]const SapUc, value: DecF34, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetDecF34ByIndex(dataHandle: *DataContainer, index: c_uint, value: DecF34, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetStructure(dataHandle: *DataContainer, name: [*c]const SapUc, value: *Structure, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetStructureByIndex(dataHandle: *DataContainer, index: c_uint, value: *Structure, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetStructureFromCharBuffer(dataHandle: *DataContainer, char_buffer: [*]SapUc, buffer_length: c_uint, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetTable(dataHandle: *DataContainer, name: [*c]const SapUc, value: *Table, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetTableByIndex(dataHandle: *DataContainer, index: c_uint, value: *Table, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetAbapObject(dataHandle: *DataContainer, name: [*c]const SapUc, value: *AbapObject, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcSetAbapObjectByIndex(dataHandle: *DataContainer, index: c_uint, value: *AbapObject, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcDescribeType(dataHandle: *DataContainer, error_info: ?*ErrorInfo) *TypeDesc;

extern fn RfcDestroyAbapObject(objHandle: *AbapObject, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcDescribeAbapObject(objectHandle: *AbapObject, error_info: ?*ErrorInfo) *ClassDesc;

/// Handle to a data container for a structure.
pub const Structure = DataContainer;

/// Handle to a data container for a function module.
pub const Function = DataContainer;

/// Handle to a data container for a table.
pub const Table = DataContainer;

/// Handle to a data container for a table.
pub const AbapObject = DataContainer;

/// Handle to a general data container (structure, table or function module).
pub const DataContainer = extern struct {
    handle: ?*anyopaque = null,

    // ==================================================
    // Function
    // ==================================================

    /// Releases all memory used by the data container.
    ///
    /// **warning** Be careful: if you have obtained a handle to a structure (RFC_STRUCTURE_HANDLE) or
    /// table parameter (RFC_TABLE_HANDLE) from that function module, that handle will be invalid afterwards,
    /// as that memory will be released as well!
    pub fn DestroyFunction(
        self: *DataContainer,
        /// Not much that can go wrong here.
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcDestroyFunction(self, error_info);
    }

    /// Allows to deactivate certain parameters in the function module interface.
    ///
    /// This is particularly useful for BAPIs which have many large tables, in which you are not interested.
    /// Deactivate those and leave only those tables active, in which you are interested. This reduces
    /// network traffic and memory consumption in your application considerably.
    ///
    /// **note** This functionality can be used for input and output parameters. If the parameter is an input,
    /// no data for that parameter will be sent to the backend. If it's an output, the backend will be
    /// informed not to return data for that parameter.
    pub fn SetParameterActive(
        self: *DataContainer,
        ///The name of a parameter of this function module.
        paramName: [*c]const SapUc,
        /// 1 = activate, 0 = deactivate.
        isActive: c_int,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcSetParameterActive(self, paramName, isActive, error_info);
    }

    /// Query whether a parameter is active.
    ///
    /// Useful for example in a server function implementation: Before creating a large table,
    /// you may want to check, whether the client (the backend system), has requested that table at all.
    pub fn IsParameterActive(
        self: *DataContainer,
        ///The name of a parameter of this function module.
        paramName: [*c]const SapUc,
        /// 1 = activate, 0 = deactivate.
        isActive: [*c]c_int,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcIsParameterActive(self, paramName, isActive, error_info);
    }

    /// Gets the ABAP exception object handle from the given function handle.
    ///
    /// If a call to #RfcInvoke() returned RFC_ABAP_CLASS_EXCEPTION, the RFC client calls this function afterwards with the original function handle
    /// in order to get access to the details of the class exception.
    ///
    /// `self` Function module data container.
    pub fn GetAbapClassException(self: *Function, error_info: ?*ErrorInfo) *AbapObject {
        return RfcGetAbapClassException(self, error_info);
    }
    /// Sets the ABAP exception object handle to the given function handle.
    ///
    /// If an RFC server function wants to throw an ABAP class exception, it calls this function before it returns with RFC_ABAP_CLASS_EXCEPTION.
    ///
    /// `self` Function module data container.
    pub fn SetAbapClassException(self: *Function, excpHandle: *AbapObject, exceptionText: [*c]const SapUc, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetAbapClassException(self, excpHandle, exceptionText, error_info);
    }
    /// Returns the metadata description for the given function module.
    ///
    /// `self` Function module data container.
    pub fn DescribeFunction(self: *Function, error_info: ?*ErrorInfo) *FunctionDesc {
        return RfcDescribeFunction(self, error_info);
    }
    /// Enables this function handle for ABAP class exception support.
    ///
    /// R/3 Systems from kernel release 7.11 on support ABAP class exceptions.
    /// Calling %RfcEnableAbapClassException() allows an RFC client to inform the ABAP backend that it can handle ABAP class exceptions
    /// for the current function call using this function handle. If the ABAP backend supports class-based exceptions as well,
    /// it can now safely throw such an exception.\n
    /// Needs to be called before the corresponding RfcInvoke().
    ///
    /// `self` Function module data container.
    pub fn EnableAbapClassException(
        self: *Function,
        /// RFC connection handle to the repository system from where the missing metadata can be
        /// dynamically retrieved during de-serializing the received ABAP class exceptions. This handle can be NULL but should not be
        /// the same that is used for the RFC call itself.
        rfcHandleRepository: *Connection,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcEnableAbapClassException(self, rfcHandleRepository, error_info);
    }

    /// Checks whether this function handle has been enabled for ABAP class exception support.
    ///
    /// R/3 Systems from kernel release 7.11 on support ABAP class exception.
    /// Typically, an RFC server can use this function in order to find out, whether the function module currently being processed has
    /// ABAP class exceptions enabled in the ABAP backend. Only if this is the case, can the RFC Server safely throw an ABAP class exception.
    ///
    /// `self` Function module data container.
    pub fn IsAbapClassExceptionEnabled(
        self: *Function,
        /// Flag indicating whether the function handle has been enabled for ABAP class based exception support.
        isEnabled: [*c]c_int,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcIsAbapClassExceptionEnabled(self, isEnabled, error_info);
    }

    // ==================================================
    // Structure
    // ==================================================
    /// Clones a sructure including the data in it.
    pub fn CloneStructure(self: *Structure, error_info: ?*ErrorInfo) *Structure {
        return RfcCloneStructure(self, error_info);
    }

    /// Releases all memory for a particular structure
    ///
    /// **warning** Do not call this function on structures, which you have obtained from another data container
    /// (e.g. a function module) via RfcGetStructure(). In that case the memory will be released, when the
    /// parent container will be destroyed. If you destroy a child structure separately, you will get a
    /// segmentation fault, when the parent structure is destroyed!
    pub fn DestroyStructure(self: *Structure, error_info: ?*ErrorInfo) ReturnCode {
        return RfcDestroyStructure(self, error_info);
    }

    // ==================================================
    // Table
    // ==================================================
    /// Clones a table including all the data in it. (Use with care...)
    pub fn CloneTable(self: *Table, error_info: ?*ErrorInfo) *Table {
        return RfcCloneTable(self, error_info);
    }
    /// Releases the memory of a table and all its lines.
    ///
    /// **warning** Be careful: if you still have a reference to a certain table line (an RFC_STRUCTURE_HANDLE you got
    /// from RfcGetCurrentRow() / RfcAppendNewRow() / RfcInsertNewRow()), this handle will be invalid after %RfcDestroyTable()!
    /// Using a handle to a table line after the table has been destroyed, will lead to a segmentation fault.
    pub fn DestroyTable(self: *Table, error_info: ?*ErrorInfo) ReturnCode {
        return RfcDestroyTable(self, error_info);
    }
    /// Returns the table row, on which the "table cursor" is currently positioned.
    ///
    /// **note** that the rows are numbered from 0 to n-1, not from 1 to n, as it's done in ABAP.
    ///
    /// **warning** Do not destroy the returned RFC_STRUCTURE_HANDLE
    pub fn GetCurrentRow(self: *Table, error_info: ?*ErrorInfo) *Structure {
        return RfcGetCurrentRow(self, error_info);
    }
    /// Appends a new empty row at the end of the table and moves the table cursor to that row.
    ///
    /// `return` A handle to the newly created row.
    pub fn AppendNewRow(self: *Table, error_info: ?*ErrorInfo) *Structure {
        return RfcAppendNewRow(self, error_info);
    }
    /// Reserves memory without changing the size of a table so that new rows can be appended without new memory allocation.
    ///
    /// `return` RFC_OK, RFC_INVALID_HANDLE or RFC_MEMORY_INSUFFICIENT.
    pub fn ReserveCapacity(self: *Table, num_rows: c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcReserveCapacity(self, num_rows, error_info);
    }
    /// Appends a set of new empty rows at the end of the table and moves the table cursor to the first new row.
    ///
    /// `return` RFC_OK, RFC_INVALID_HANDLE or RFC_MEMORY_INSUFFICIENT.
    pub fn AppendNewRows(self: *Table, num_rows: c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcAppendNewRows(self, num_rows, error_info);
    }
    /// Inserts a new empty row at the current position of the table cursor.
    ///
    /// The row, on which the table cursor is currently positioned, and all following rows are moved
    /// one index "down". E.g. if the table currently has rows nos 0 - n-1 and the cursor points to row i,
    /// then the rows i - n-1 are moved to positions i+1 - n, and the new row is inserted at position i.
    ///
    /// `return` A handle to the newly created row.
    pub fn InsertNewRow(self: *Table, error_info: ?*ErrorInfo) *Structure {
        return RfcInsertNewRow(self, error_info);
    }
    /// Appends an existing row to the end of the table and moves the table cursor to that row.
    pub fn AppendRow(self: *Table, struct_handle: *Structure, error_info: ?*ErrorInfo) ReturnCode {
        return RfcAppendRow(self, struct_handle, error_info);
    }
    /// Inserts an existing row at the current position of the table cursor.
    ///
    /// The row, on which the table cursor is currently positioned, and all following rows are moved
    /// one index "down". E.g. if the table currently has rows nos 0 - n-1 and the cursor points to row i,
    /// then the rows i - n-1 are moved to positions i+1 - n, and the given row is inserted at position i.
    pub fn InsertRow(self: *Table, struct_handle: *Structure, error_info: ?*ErrorInfo) ReturnCode {
        return RfcInsertRow(self, struct_handle, error_info);
    }
    /// Deletes the row, on which the table cursor is currently positioned.
    ///
    /// If the row cursor is currently at an index i between 0 - n-2, then row i will be deleted and the
    /// rows i+1 - n-1 will be moved on index "up", e.g. will now be rows i - n-2. The table cursor will
    /// remain fixed at index i.
    ///
    /// If the cursor is currently on the last row (n-1), then that row will be deleted, all other position
    /// will remain unchanged, and the table cursor will move up to n-2 (the new last row of the table).
    pub fn DeleteCurrentRow(self: *Table, error_info: ?*ErrorInfo) ReturnCode {
        return RfcDeleteCurrentRow(self, error_info);
    }
    /// Deletes all rows from the table.
    pub fn DeleteAllRows(self: *Table, error_info: ?*ErrorInfo) ReturnCode {
        return RfcDeleteAllRows(self, error_info);
    }
    /// Positions the table cursor at the first row (or at index "-1", if the table is empty).
    pub fn MoveToFirstRow(self: *Table, error_info: ?*ErrorInfo) ReturnCode {
        return RfcMoveToFirstRow(self, error_info);
    }
    /// Positions the table cursor at the first row (or at index "-1", if the table is empty).
    pub fn MoveToLastRow(self: *Table, error_info: ?*ErrorInfo) ReturnCode {
        return RfcMoveToLastRow(self, error_info);
    }
    /// Increments the table cursor by one.
    pub fn MoveToNextRow(self: *Table, error_info: ?*ErrorInfo) ReturnCode {
        return RfcMoveToNextRow(self, error_info);
    }
    /// Decrements the table cursor by one.
    pub fn MoveToPreviousRow(self: *Table, error_info: ?*ErrorInfo) ReturnCode {
        return RfcMoveToPreviousRow(self, error_info);
    }
    /// Sets the table cursor to a specific index.
    pub fn MoveTo(self: *Table, index: c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcMoveTo(self, index, error_info);
    }
    /// Returns the number of rows in a table.
    pub fn GetRowCount(self: *Table, rowCount: *c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetRowCount(self, rowCount, error_info);
    }
    /// Returns a type description handle describing the line type (metadata) of this table.
    pub fn GetRowType(self: *Table, error_info: ?*ErrorInfo) *TypeDesc {
        return RfcGetRowType(self, error_info);
    }

    // ==================================================
    // Common
    // ==================================================
    /// Returns the value of the specified field as char array.
    ///
    /// The charBuffer will be filled with a string representation of the given field. The remaining
    /// places in the buffer will be filled with trailing spaces. In case the buffer is too small,
    /// the function will return RFC_BUFFER_TOO_SMALL. The result will not be null-terminated.
    ///
    /// The field specified by name needs to be of one of the following data types. If the field
    /// has one of the listed non-char-like data types, the RFC library will convert the field value
    /// to string format.
    ///
    /// Example:
    /// If "name" specifies a field of type INT4 with the value 4711 and charBuffer is an SAP_CHAR[10],
    /// then the buffer will be filled as follows: "4711      ".
    ///
    /// **note** If the target field has type BYTE or XSTRING, the bytes will be
    /// converted to a hex encoded string representation.
    ///
    /// - RFCTYPE_CHAR
    /// - RFCTYPE_STRING
    /// - RFCTYPE_NUM
    /// - RFCTYPE_DATE
    /// - RFCTYPE_TIME
    /// - RFCTYPE_INTx
    /// - RFCTYPE_FLOAT
    /// - RFCTYPE_BCD
    /// - RFCTYPE_DECFxx
    /// - RFCTYPE_BYTE
    /// - RFCTYPE_XSTRING
    /// - RFCTYPE_UTCLONG
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetChars(self: *DataContainer, name: [*c]const SapUc, charBuffer: [*c]Char, bufferLength: c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetChars(self, name, charBuffer, bufferLength, error_info);
    }
    /// Returns the value of the specified field as char array.
    ///
    /// This function works exactly like RfcGetChars(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    pub fn GetCharsByIndex(self: *DataContainer, index: c_uint, charBuffer: [*c]Char, bufferLength: c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetCharsByIndex(self, index, charBuffer, bufferLength, error_info);
    }
    /// Returns the value of the specified field as num-char array (digits only).
    ///
    /// The charBuffer will be filled with a string representation of the field (from right to left).
    /// The remaining places in the buffer will be filled with leading zero digits. In case
    /// the buffer is too small, the function will return RFC_BUFFER_TOO_SMALL. The result is not
    /// null-terminated.
    ///
    /// The field specified by name needs to be of one of the following data types. If the field
    /// has one of the listed non-char-like data types, the RFC library will convert the field value
    /// to string format.
    ///
    /// Example:
    /// If "name" specifies a field of type INT4 with the value 4711 and charBuffer is an SAP_CHAR[10],
    /// then the buffer will be filled as follows: "0000004711".
    ///
    /// - RFCTYPE_CHAR
    /// - RFCTYPE_STRING
    /// - RFCTYPE_NUM
    /// - RFCTYPE_DATE
    /// - RFCTYPE_TIME
    /// - RFCTYPE_INTx
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetNum(self: *DataContainer, name: [*c]const SapUc, charBuffer: [*c]Num, bufferLength: c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetNum(self, name, charBuffer, bufferLength, error_info);
    }
    /// Returns the value of the specified field as num-char array (digits only).
    ///
    /// This function works exactly like RfcGetNum(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetNumByIndex(self: *DataContainer, index: c_uint, charBuffer: [*c]Num, bufferLength: c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetNumByIndex(self, index, charBuffer, bufferLength, error_info);
    }
    /// Reads a DATE field.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetDate(self: *DataContainer, name: [*c]const SapUc, emptyDate: [*c]Char, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetDate(self, name, emptyDate, error_info);
    }
    /// Reads a DATE field.
    ///
    /// This function works exactly like RfcGetDate(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetDateByIndex(self: *DataContainer, index: c_uint, emptyDate: [*c]Char, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetDateByIndex(self, index, emptyDate, error_info);
    }
    /// Reads a TIME field.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetTime(self: *DataContainer, name: [*c]const SapUc, emptyTime: [*c]Char, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetTime(self, name, emptyTime, error_info);
    }
    /// Reads a TIME field.
    ///
    /// This function works exactly like RfcGetTime(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetTimeByIndex(self: *DataContainer, index: c_uint, emptyTime: [*c]Char, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetTimeByIndex(self, index, emptyTime, error_info);
    }
    /// Returns the value of the specified field as null-terminated string.
    ///
    /// The charBuffer will be filled with a null-terminated string representation of the field value.
    /// In case the buffer is too small, e.g. no place for string termination, the function will
    /// return RFC_BUFFER_TOO_SMALL. string_length contains the number of written characters, or the
    /// required number of characters in case RFC_BUFFER_TOO_SMALL was thrown.
    /// The result will be null-terminated.
    ///
    /// The field specified by name needs to be of one of the following data types. If the field
    /// has one of the listed non-char-like data types, the RFC library will convert the field value
    /// to string format.
    ///
    /// Example:
    /// If "name" specifies a field of type INT4 with the value 4711 and stringBuffer is an SAP_UC[10],
    /// then the buffer will be filled as follows: "4711\0xxxxx". (x: left unchanged.)
    ///
    /// **note** If the target field has type BYTE or XSTRING, the bytes will be
    /// converted to a hex encoded string representation.
    ///
    /// - RFCTYPE_CHAR
    /// - RFCTYPE_STRING
    /// - RFCTYPE_NUM
    /// - RFCTYPE_DATE
    /// - RFCTYPE_TIME
    /// - RFCTYPE_INTx
    /// - RFCTYPE_FLOAT
    /// - RFCTYPE_BCD
    /// - RFCTYPE_DECFxx
    /// - RFCTYPE_BYTE
    /// - RFCTYPE_XSTRING
    /// - RFCTYPE_UTCLONG
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetString(
        self: *DataContainer,
        name: [*c]const SapUc,
        stringBuffer: [*c]SapUc,
        bufferLength: c_uint,
        /// Always returns the string's length, no matter whether the stringBuffer had
        /// been large enough or not. (Note that if you want to try again after an RFC_BUFFER_TOO_SMALL,
        /// you need to make the stringBuffer at least *string_length + 1 in order to account for the terminating null.)
        string_length: *c_uint,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcGetString(self, name, stringBuffer, bufferLength, string_length, error_info);
    }

    /// Returns the value of the specified field as null-terminated string.
    ///
    /// This function works exactly like RfcGetString(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetStringByIndex(
        self: *DataContainer,
        index: c_uint,
        stringBuffer: [*c]SapUc,
        bufferLength: c_uint,
        ///Always returns the string's length, no matter whether the stringBuffer had
        /// been large enough or not. (Note that if you want to try again after an RFC_BUFFER_TOO_SMALL,
        /// you need to make the stringBuffer at least *string_length + 1 in order to account for the termnating null.)
        string_length: *c_uint,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcGetStringByIndex(self, index, stringBuffer, bufferLength, string_length, error_info);
    }
    /// Returns the value of the specified field as byte array.
    ///
    /// Should mainly be used with fields of type RAW (RFCTYPE_BYTE), but also works with
    /// a number of other data types. In case of numerical data types it simply gives the
    /// binary representation of the value, in case of character data types it gives the
    /// UTF-16 representation (little endian/big endian, depending on the host platform).
    /// In case the buffer is too small, the function will return RFC_BUFFER_TOO_SMALL.
    /// In case the buffer is longer than the field, it will be filled with 0x00 values.
    /// Example: The field is of type INT4 and contains the value 4711, byteBuffer is an SAP_RAW[10].
    /// Then the buffer will be filled as follows: 67 12 00 00 00 00 00 00 00 00 (little endian system)
    /// or 00 00 12 67 00 00 00 00 00 00 (big endian system).
    ///
    /// The field specified by name needs to be of one of the following data types:
    /// - RFCTYPE_BYTE
    /// - RFCTYPE_XSTRING
    /// - RFCTYPE_CHAR
    /// - RFCTYPE_NUM
    /// - RFCTYPE_DATE
    /// - RFCTYPE_TIME
    /// - RFCTYPE_INTx
    /// - RFCTYPE_FLOAT
    /// - RFCTYPE_BCD
    /// - RFCTYPE_DECFxx
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetBytes(self: *DataContainer, name: [*c]const SapUc, byteBuffer: [*c]SapRaw, bufferLength: c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetBytes(self, name, byteBuffer, bufferLength, error_info);
    }
    /// Returns the value of the specified field as byte array.
    ///
    /// This function works exactly like RfcGetBytes(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetBytesByIndex(self: *DataContainer, index: c_uint, byteBuffer: [*c]SapRaw, bufferLength: c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetBytesByIndex(self, index, byteBuffer, bufferLength, error_info);
    }
    /// Returns the value of the specified field as byte array.
    ///
    /// In case the buffer is too small, the function will return RFC_BUFFER_TOO_SMALL.
    /// xstring_length contains the number of written bytes, or the required number of bytes
    /// in case of RFC_BUFFER_TOO_SMALL.
    /// The remaining buffer won't be changed.
    ///  Example: The field is of type INT4 and contains the value 4711, byteBuffer is an SAP_RAW[10].
    /// Then the buffer will be filled as follows: 67 12 00 00 x x x x x x (little endian system)
    /// or 00 00 12 67 x x x x x x (big endian system). (x: unchanged) In both cases *xstring_length
    /// will be 4.
    ///  The field specified by name needs to be of one of the following data types:
    /// - RFCTYPE_BYTE
    /// - RFCTYPE_XSTRING
    /// - RFCTYPE_CHAR
    /// - RFCTYPE_NUM
    /// - RFCTYPE_DATE
    /// - RFCTYPE_TIME
    /// - RFCTYPE_INTx
    /// - RFCTYPE_FLOAT
    /// - RFCTYPE_BCD
    /// - RFCTYPE_DECFxx
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetXString(
        self: *DataContainer,
        name: [*c]const SapUc,
        byteBuffer: [*c]SapRaw,
        bufferLength: c_uint,
        /// Byte length of the result (in both cases, no matter whether the byteBuffer had
        /// been large enough or not).
        xstring_length: *c_uint,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcGetXString(self, name, byteBuffer, bufferLength, xstring_length, error_info);
    }
    /// Returns the value of the specified field as byte array.
    ///
    /// This function works exactly like RfcGetXString(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetXStringByIndex(
        self: *DataContainer,
        index: c_uint,
        byteBuffer: [*c]SapRaw,
        bufferLength: c_uint,
        /// Byte length of the result (in both cases, no matter whether the byteBuffer had
        /// been large enough or not).
        xstring_length: *c_uint,
        error_info: ?*ErrorInfo,
    ) ReturnCode {
        return RfcGetXStringByIndex(self, index, byteBuffer, bufferLength, xstring_length, error_info);
    }
    /// Returns the value of the specified field as RFC_INT (signed).
    ///
    /// If the field is a character type, an "atoi-like" conversion is performed. If the field is of type
    /// RFCTYPE_BYTE/RFCTYPE_XSTRING, this function interprets the bytes in big-endian byte order when
    /// converting them to int. Note that in this case the byte length of the field value must not exceed 4!
    ///  The field specified by name needs to be of one of the following data types:
    ///
    /// - RFCTYPE_INT8
    /// - RFCTYPE_INT
    /// - RFCTYPE_INT2
    /// - RFCTYPE_INT1
    /// - RFCTYPE_BYTE is interpreted as big endian sequence of an int
    /// - RFCTYPE_XSTRING is interpreted as big endian sequence of an int
    /// - RFCTYPE_FLOAT
    /// - RFCTYPE_CHAR
    /// - RFCTYPE_NUM
    /// - RFCTYPE_STRING
    /// - RFCTYPE_BCD
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetInt(self: *DataContainer, name: [*c]const SapUc, value: *Int, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetInt(self, name, value, error_info);
    }
    /// Returns the value of the specified field as RFC_INT (signed).
    ///
    /// This function works exactly like RfcGetInt(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetIntByIndex(self: *DataContainer, index: c_uint, value: *Int, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetIntByIndex(self, index, value, error_info);
    }
    /// Returns the value of a field as an unsigned one byte integer.
    ///
    /// The current field value must not be bigger than 255, otherwise you'll get an RFC_CONVERSION_ERROR.
    /// If the field is of type RFCTYPE_BYTE/RFCTYPE_XSTRING, the field length must be 1 byte.
    ///
    /// The field specified by name needs to be of one of the following data types:
    ///
    /// - RFCTYPE_INT8
    /// - RFCTYPE_INT
    /// - RFCTYPE_INT2
    /// - RFCTYPE_INT1
    /// - RFCTYPE_BYTE
    /// - RFCTYPE_XSTRING
    /// - RFCTYPE_FLOAT
    /// - RFCTYPE_BCD
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetInt1(self: *DataContainer, name: [*c]const SapUc, value: *Int1, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetInt1(self, name, value, error_info);
    }
    /// Returns the value of a field as an unsigned one byte integer.
    ///
    /// This function works exactly like RfcGetInt1(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetInt1ByIndex(self: *DataContainer, index: c_uint, value: *Int1, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetInt1ByIndex(self, index, value, error_info);
    }
    /// Returns the field value as a signed two byte integer.
    ///
    /// The current field value must be between -32768 and 32767, otherwise you'll get an RFC_CONVERSION_ERROR.
    /// If the field is of type RFCTYPE_BYTE/RFCTYPE_XSTRING, the field length must be 1 or 2 bytes.
    ///
    /// The field specified by name needs to be of one of the following data types:
    ///
    /// - RFCTYPE_INT8
    /// - RFCTYPE_INT
    /// - RFCTYPE_INT2
    /// - RFCTYPE_INT1
    /// - RFCTYPE_BYTE     is interpreted as big endian sequence of a short
    /// - RFCTYPE_XSTRING  is interpreted as big endian sequence of a short
    /// - RFCTYPE_FLOAT
    /// - RFCTYPE_BCD
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetInt2(self: *DataContainer, name: [*c]const SapUc, value: *Int2, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetInt2(self, name, value, error_info);
    }
    /// Returns the field value as a signed two byte integer.
    ///
    /// This function works exactly like RfcGetInt2(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetInt2ByIndex(self: *DataContainer, index: c_uint, value: *Int2, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetInt2ByIndex(self, index, value, error_info);
    }
    /// Returns the field value as a signed eight byte integer.
    ///
    /// If the field is of type RFCTYPE_BYTE/RFCTYPE_XSTRING, the field length must be 1, 2, 4 or 8 bytes.
    ///
    /// The field specified by name needs to be of one of the following data types:
    /// - RFCTYPE_INT8
    /// - RFCTYPE_INT
    /// - RFCTYPE_INT2
    /// - RFCTYPE_INT1
    /// - RFCTYPE_BYTE     is interpreted as big endian sequence of a long long
    /// - RFCTYPE_XSTRING  is interpreted as big endian sequence of a long long
    /// - RFCTYPE_UTCLONG
    /// - RFCTYPE_FLOAT
    /// - RFCTYPE_CHAR
    /// - RFCTYPE_NUM
    /// - RFCTYPE_STRING
    /// - RFCTYPE_BCD
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetInt8(self: *DataContainer, name: [*c]const SapUc, value: *Int8, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetInt8(self, name, value, error_info);
    }
    /// Returns the field value as a signed eight byte integer.
    ///
    /// This function works exactly like RfcGetInt8(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetInt8ByIndex(self: *DataContainer, index: c_uint, value: *Int8, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetInt8ByIndex(self, index, value, error_info);
    }
    /// Returns the value of the given field as an RFC_FLOAT.
    ///  The field specified by name needs to be of one of the following data types:
    /// - RFCTYPE_FLOAT
    /// - RFCTYPE_BCD
    /// - RFCTYPE_DECF16
    /// - RFCTYPE_DECF34
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetFloat(self: *DataContainer, name: [*c]const SapUc, value: *Float, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetFloat(self, name, value, error_info);
    }
    /// Returns the value of the given field as an RFC_FLOAT.
    ///
    ///  This function works exactly like RfcGetFloat(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetFloatByIndex(self: *DataContainer, index: c_uint, value: *Float, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetFloatByIndex(self, index, value, error_info);
    }
    /// Returns the field as an 8 byte IEEE 754r decimal floating point.
    ///
    /// See the header sapdecf.h for how to work with RFC_DECF16 objects. If the field has a binary
    /// data type, its field length needs to be 8 bytes.
    ///
    /// The field specified by name needs to be of one of the following data types:
    /// - RFCTYPE_DECF16
    /// - RFCTYPE_DECF34
    /// - RFCTYPE_FLOAT
    /// - RFCTYPE_BCD
    /// - RFCTYPE_INT8
    /// - RFCTYPE_INT
    /// - RFCTYPE_INT2
    /// - RFCTYPE_INT1
    /// - RFCTYPE_CHAR
    /// - RFCTYPE_NUM
    /// - RFCTYPE_STRING
    /// - RFCTYPE_BYTE     is interpreted as IEEE 754r format
    /// - RFCTYPE_XSTRING  is interpreted as IEEE 754r format
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetDecF16(self: *DataContainer, name: [*c]const SapUc, value: *DecF16, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetDecF16(self, name, value, error_info);
    }
    /// Returns the field as an 8 byte IEEE 754r decimal floating point.
    ///
    /// This function works exactly like RfcGetDecF16(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetDecF16ByIndex(self: *DataContainer, index: c_uint, value: *DecF16, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetDecF16ByIndex(self, index, value, error_info);
    }
    /// Returns the field as a 16 byte IEEE 754r decimal floating point.
    ///
    /// See the header sapdecf.h for how to work with RFC_DECF16 objects. If the field has a binary
    /// data type, its field length needs to be 16 bytes.
    ///
    /// The field specified by name needs to be of one of the following data types:
    /// - RFCTYPE_DECF16
    /// - RFCTYPE_DECF34
    /// - RFCTYPE_FLOAT
    /// - RFCTYPE_BCD
    /// - RFCTYPE_INT8
    /// - RFCTYPE_INT
    /// - RFCTYPE_INT2
    /// - RFCTYPE_INT1
    /// - RFCTYPE_CHAR
    /// - RFCTYPE_NUM
    /// - RFCTYPE_STRING
    /// - RFCTYPE_BYTE     is interpreted as IEEE 754r format
    /// - RFCTYPE_XSTRING  is interpreted as IEEE 754r format
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetDecF34(self: *DataContainer, name: [*c]const SapUc, value: *DecF34, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetDecF34(self, name, value, error_info);
    }
    /// Returns the field as a 16 byte IEEE 754r decimal floating point.
    ///
    /// This function works exactly like RfcGetDecF34(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetDecF34ByIndex(self: *DataContainer, index: c_uint, value: *DecF34, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetDecF34ByIndex(self, index, value, error_info);
    }
    /// Returns a handle to a structure.
    ///
    /// The field specified by name must be of type RFCTYPE_STRUCTURE. If that field has not yet
    /// been accessed/filled previously, a new empty structure is created from the metadata of the
    /// parent data container ("dataHandle") and returned.
    ///
    /// **warning** The memory of that data container will be released, when the parent container gets
    /// destroyed. So don't destroy the returned structure handle, nor continue to use it, after the
    /// parent has been destroyed!
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetStructure(self: *DataContainer, name: [*c]const SapUc, struct_handle: *Structure, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetStructure(self, name, struct_handle, error_info);
    }
    /// Returns a handle to a structure.
    ///
    /// This function works exactly like RfcGetStructure(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetStructureByIndex(self: *DataContainer, index: c_uint, struct_handle: *Structure, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetStructureByIndex(self, index, struct_handle, error_info);
    }
    /// Returns the entire structure value as a single char buffer.
    ///
    /// The charBuffer will be filled with the data of the structure as if it were a single char field.
    ///
    /// In case the buffer is too small, the function will return RFC_BUFFER_TOO_SMALL.
    /// The result will <b>not</b> be null-terminated.
    ///
    /// This mimics the way structures have been handled by the classic RFC library librfc32.
    /// It can conveniently be used for fetching an RFC structure into a C struct, which has been defined
    /// like in the ABAP DDIC.
    /// In addition to programming convenience, it should also improve runtime performance compared to fetching
    /// each single field one-by-one.
    ///
    /// This function can only be applied to structures/tables if they contain char-like fields (CHAR, NUMC, DATE, TIME)
    /// The result will be aligned exactly as on ABAP side, including padding bytes.
    ///
    /// `self` A data container (structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the structure data of the current row.
    pub fn GetStructureIntoCharBuffer(self: *DataContainer, charBuffer: [*c]SapUc, bufferLength: c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetStructureIntoCharBuffer(self, charBuffer, bufferLength, error_info);
    }
    /// Returns a handle to a table.
    ///
    /// The field specified by name must be of type RFCTYPE_TABLE. If that field has not yet
    /// been accessed/filled previously, a new empty structure is created from the metadata of the
    /// parent data container ("dataHandle") and returned.
    /// **warning** The memory of that data container will be released, when the parent container gets
    /// destroyed. So don't destroy the returned table handle, nor continue to use it, after the
    /// parent has been destroyed!
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetTable(self: *DataContainer, name: [*c]const SapUc, table_handle: *Table, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetTable(self, name, table_handle, error_info);
    }
    /// Returns a handle to a table.
    ///
    /// This function works exactly like RfcGetTable(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetTableByIndex(self: *DataContainer, index: c_uint, table_handle: *Table, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetTableByIndex(self, index, table_handle, error_info);
    }
    /// Returns a handle to an abap object.
    ///
    /// The field specified by name must be of type RFCTYPE_ABAPOBJECT. If that field has not yet
    /// been filled previously, NULL is returned.
    /// **warning** The memory of that data container will be released, when the parent container gets
    /// destroyed. So don't destroy the returned table handle, nor continue to use it, after the
    /// parent has been destroyed!
    ///
    /// `self` A data container (function handle, structure handle, table handle or object handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetAbapObject(self: *DataContainer, name: [*c]const SapUc, objHandle: *AbapObject, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetAbapObject(self, name, objHandle, error_info);
    }
    /// Returns a handle to an abap object.
    ///
    /// This function works exactly like RfcGetAbapObject(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle, table handle or object handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetAbapObjectByIndex(self: *DataContainer, index: c_uint, objHandle: *AbapObject, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetAbapObjectByIndex(self, index, objHandle, error_info);
    }
    /// Returns the length of the value of a STRING or XSTRING parameter.
    ///
    /// The field specified by name must be of type RFCTYPE_STRING or RFCTYPE_XSTRING. If that field is
    /// of type STRING, the returned length is measured in characters, otherwise in bytes.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetStringLength(self: *DataContainer, name: [*c]const SapUc, string_length: *c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetStringLength(self, name, string_length, error_info);
    }
    /// Returns the length of the value of a STRING or XSTRING parameter.
    ///
    /// This function works exactly like RfcGetStringLength(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the field value of the current row.
    pub fn GetStringLengthByIndex(self: *DataContainer, index: c_uint, string_length: *c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetStringLengthByIndex(self, index, string_length, error_info);
    }

    /// Sets the given char value (charValue/value_length) into the field.
    ///
    /// The field specified by name needs to be of one of the following data types:
    /// - RFCTYPE_CHAR
    /// - RFCTYPE_STRING
    /// - RFCTYPE_NUM
    /// - RFCTYPE_DATE
    /// - RFCTYPE_TIME
    /// - RFCTYPE_INTx
    /// - RFCTYPE_FLOAT
    /// - RFCTYPE_BCD
    /// - RFCTYPE_DECFxx
    /// - RFCTYPE_BYTE
    /// - RFCTYPE_XSTRING
    /// - RFCTYPE_UTCLONG
    ///
    /// **note** If the target field is a numerical type, the RFC library tries to convert the string
    /// to a number. If the target field has type BYTE or XSTRING, the char value will be interpreted as
    /// hex encoded string representation of the bytes. Its length needs to be even in that case.\n
    /// Example: the 8 characters "CAFEBABE" will be converted to 4 bytes 0xCA 0xFE 0xBA 0xBE.
    ///
    /// If the value cannot be converted to the desired target type, RFC_CONVERSION_ERROR will be
    /// returned.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetChars(self: *DataContainer, name: [*c]const SapUc, char_value: [*]const Char, value_length: c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetChars(self, name, char_value, value_length, error_info);
    }
    /// Sets the given char value (charValue/value_length) into the field.
    ///
    /// This function works exactly like RfcSetChars(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetCharsByIndex(self: *DataContainer, index: c_uint, char_value: [*]const Char, value_length: c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetCharsByIndex(self, index, char_value, value_length, error_info);
    }
    /// Sets the value of a NUMC field.
    ///  The field specified by name needs to be of one of the following data types:
    /// - RFCTYPE_CHAR
    /// - RFCTYPE_STRING
    /// - RFCTYPE_NUM
    /// - RFCTYPE_INTx
    /// - RFCTYPE_UTCLONG
    /// - RFCTYPE_FLOAT
    /// - RFCTYPE_DECFxx
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetNum(self: *DataContainer, name: [*c]const SapUc, char_value: [*]const Num, value_length: c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetNum(self, name, char_value, value_length, error_info);
    }
    /// Sets the value of a NUMC field.
    ///
    /// This function works exactly like RfcSetNum(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetNumByIndex(self: *DataContainer, index: c_uint, char_value: [*]const Num, value_length: c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetNumByIndex(self, index, char_value, value_length, error_info);
    }
    /// Sets the given string value (stringValue/value_length) into the field.
    ///
    /// The field specified by name needs to be of one of the following data types:
    /// - RFCTYPE_CHAR
    /// - RFCTYPE_STRING
    /// - RFCTYPE_NUM
    /// - RFCTYPE_DATE
    /// - RFCTYPE_TIME
    /// - RFCTYPE_INTx
    /// - RFCTYPE_FLOAT
    /// - RFCTYPE_BCD
    /// - RFCTYPE_DECFxx
    /// - RFCTYPE_BYTE
    /// - RFCTYPE_XSTRING
    /// - RFCTYPE_UTCLONG
    ///
    /// **note** If the target field is a numerical type, the RFC library tries to convert the string
    /// to a number. If the target field has type BYTE or XSTRING, the char value will be interpreted as
    /// hex encoded string representation of the bytes. Its length needs to be even in that case.
    ///
    /// Example: the 8 characters "CAFEBABE" will be converted to 4 bytes 0xCA 0xFE 0xBA 0xBE.
    ///
    /// If the value cannot be converted to the desired target type, RFC_CONVERSION_ERROR will be
    /// returned.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetString(self: *DataContainer, name: [*c]const SapUc, string_value: [*]const SapUc, value_length: c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetString(self, name, string_value, value_length, error_info);
    }
    /// Sets the given string value (stringValue/value_length) into the field.
    ///
    /// This function works exactly like RfcSetString(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetStringByIndex(self: *DataContainer, index: c_uint, string_value: [*]const SapUc, value_length: c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetStringByIndex(self, index, string_value, value_length, error_info);
    }
    /// Sets the value of a DATE field.
    ///  The target field needs to be of type RFCTYPE_DATE.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetDate(self: *DataContainer, name: [*c]const SapUc, date: [*c]const Char, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetDate(self, name, date, error_info);
    }
    /// Sets the value of a DATE field.
    ///
    /// This function works exactly like RfcSetDate(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetDateByIndex(self: *DataContainer, index: c_uint, date: [*c]const Char, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetDateByIndex(self, index, date, error_info);
    }
    /// Sets the value of a TIME field.
    ///
    /// The target field needs to be of type RFCTYPE_TIME.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetTime(self: *DataContainer, name: [*c]const SapUc, time: [*c]const Char, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetTime(self, name, time, error_info);
    }
    /// Sets the value of a TIME field.
    ///
    /// This function works exactly like RfcSetTime(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetTimeByIndex(self: *DataContainer, index: c_uint, time: [*c]const Char, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetTimeByIndex(self, index, time, error_info);
    }
    /// Sets the given byte value (byte_value/value_length) into the field.
    ///
    /// The field specified by name needs to be of one of the following data types:
    /// - RFCTYPE_BYTE
    /// - RFCTYPE_XSTRING
    /// - RFCTYPE_CHAR
    /// - RFCTYPE_STRING
    /// - RFCTYPE_INTx
    /// - RFCTYPE_FLOAT
    /// - RFCTYPE_BCD
    /// - RFCTYPE_DECFxx
    ///
    /// **note**: If the target field has type CHAR or STRING, the byte value
    /// will be stored as a hex representation of the bytes.
    ///
    /// If the target field has a numerical type, the byte value will be
    /// assigned only if the given value_length matches the field length.
    ///
    /// In order to use this feature, you need to know exactly what you are doing...
    ///
    /// E.g. when setting 8 bytes into an RFC_FLOAT field, you need to understand the
    /// IEEE floating point format. Better only use this function for setting RAW fields.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetBytes(self: *DataContainer, name: [*c]const SapUc, byte_value: [*]const SapRaw, value_length: c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetBytes(self, name, byte_value, value_length, error_info);
    }
    /// Sets the given byte value (byte_value/value_length) into the field.
    ///
    /// This function works exactly like RfcSetBytes(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetBytesByIndex(self: *DataContainer, index: c_uint, byte_value: [*]const SapRaw, value_length: c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetBytesByIndex(self, index, byte_value, value_length, error_info);
    }
    /// Sets the given byte value (byte_value/value_length) into the field.
    ///
    /// The field specified by name needs to be of one of the following data types:
    /// - RFCTYPE_BYTE
    /// - RFCTYPE_XSTRING
    /// - RFCTYPE_CHAR
    /// - RFCTYPE_STRING
    /// - RFCTYPE_INTx
    /// - RFCTYPE_FLOAT
    /// - RFCTYPE_BCD
    /// - RFCTYPE_DECFxx
    /// **note**: If the target field has type CHAR or STRING, the byte value
    /// will be stored as a hex representation of the bytes.
    ///
    /// If the target field has a numerical type, the byte value will be
    /// assigned only if the given value_length matches the field length.
    /// In order to use this feature, you need to know exactly what you are doing...
    /// E.g. when setting 8 bytes into an RFC_FLOAT field, you need to understand the
    /// IEEE floating point format. Better only use this function for setting RAW fields.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetXString(self: *DataContainer, name: [*c]const SapUc, byte_value: [*]const SapRaw, value_length: c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetXString(self, name, byte_value, value_length, error_info);
    }
    /// Sets the given byte value (byte_value/value_length) into the field.
    ///
    /// This function works exactly like RfcSetXString(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetXStringByIndex(self: *DataContainer, index: c_uint, byte_value: [*]const SapRaw, value_length: c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetXStringByIndex(self, index, byte_value, value_length, error_info);
    }
    /// Sets the value of an INT4 field.
    ///
    /// The field specified by name needs to be of one of the following data types:
    /// - RFCTYPE_CHAR
    /// - RFCTYPE_STRING
    /// - RFCTYPE_INTx
    /// - RFCTYPE_DECFxx
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetInt(self: *DataContainer, name: [*c]const SapUc, value: Int, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetInt(self, name, value, error_info);
    }
    /// Sets the value of an INT4 field.
    ///
    /// This function works exactly like RfcSetInt(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetIntByIndex(self: *DataContainer, index: c_uint, value: Int, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetIntByIndex(self, index, value, error_info);
    }
    /// Sets the value of an INT1 field.
    ///
    /// The field specified by name needs to be of one of the following data types:
    /// - RFCTYPE_CHAR
    /// - RFCTYPE_STRING
    /// - RFCTYPE_INTx
    /// - RFCTYPE_DECFxx
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetInt1(self: *DataContainer, name: [*c]const SapUc, value: Int1, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetInt1(self, name, value, error_info);
    }
    /// Sets the value of an INT1 field.
    ///
    /// This function works exactly like RfcSetInt1(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetInt1ByIndex(self: *DataContainer, index: c_uint, value: Int1, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetInt1ByIndex(self, index, value, error_info);
    }
    /// Sets the value of an INT2 field.
    ///
    /// The field specified by name needs to be of one of the following data types:
    /// - RFCTYPE_CHAR
    /// - RFCTYPE_STRING
    /// - RFCTYPE_INTx
    /// - RFCTYPE_DECFxx
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetInt2(self: *DataContainer, name: [*c]const SapUc, value: Int2, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetInt2(self, name, value, error_info);
    }
    /// Sets the value of an INT2 field.
    ///
    /// This function works exactly like RfcSetInt2(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetInt2ByIndex(self: *DataContainer, index: c_uint, value: Int2, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetInt2ByIndex(self, index, value, error_info);
    }
    /// Sets the value of an INT8 field.
    ///
    /// The field specified by name needs to be of one of the following data types:
    /// - RFCTYPE_CHAR
    /// - RFCTYPE_STRING
    /// - RFCTYPE_INTx
    /// - RFCTYPE_DECFxx
    /// - RFCTYPE_UTCLONG.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetInt8(self: *DataContainer, name: [*c]const SapUc, value: Int8, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetInt8(self, name, value, error_info);
    }
    /// Sets the value of an INT8 field.
    ///
    /// This function works exactly like RfcSetInt8(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetInt8ByIndex(self: *DataContainer, index: c_uint, value: Int8, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetInt8ByIndex(self, index, value, error_info);
    }
    /// Sets a floating point field.
    ///
    /// The field specified by name needs to be of one of the following data types:
    /// - RFCTYPE_FLOAT
    /// - RFCTYPE_BCD
    /// - RFCTYPE_CHAR
    /// - RFCTYPE_STRING
    /// - RFCTYPE_NUM
    /// - RFCTYPE_DECF16
    /// - RFCTYPE_DECF34
    ///
    /// **note** If the target field is CHAR or STRING, the value will be converted to a string in
    /// scientific notation. If it is NUMC, it will be truncated to the next integer.
    ///
    ///  `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetFloat(self: *DataContainer, name: [*c]const SapUc, value: Float, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetFloat(self, name, value, error_info);
    }
    /// Sets a floating point field.
    ///
    /// This function works exactly like RfcSetFloat(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetFloatByIndex(self: *DataContainer, index: c_uint, value: Float, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetFloatByIndex(self, index, value, error_info);
    }
    /// Sets the value of an 8 byte decfloat object into a field.
    ///
    /// The field specified by name needs to be of one of the following data types:
    /// - RFCTYPE_DECF16
    /// - RFCTYPE_DECF34
    /// - RFCTYPE_FLOAT
    /// - RFCTYPE_BCD
    /// - RFCTYPE_INT
    /// - RFCTYPE_INT2
    /// - RFCTYPE_INT1
    /// - RFCTYPE_CHAR
    /// - RFCTYPE_NUM
    /// - RFCTYPE_STRING
    /// - RFCTYPE_BYTE     Needs to be 8 byte long.
    /// - RFCTYPE_XSTRING
    ///
    /// **note** If the target field is CHAR or STRING, the value will be converted to a string in
    /// scientific notation. If it is NUMC, it will be truncated to the next integer.
    ///
    ///  `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetDecF16(self: *DataContainer, name: [*c]const SapUc, value: DecF16, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetDecF16(self, name, value, error_info);
    }
    /// Sets the value of an 8 byte decfloat object into a field.
    ///
    /// This function works exactly like RfcSetDecF16(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetDecF16ByIndex(self: *DataContainer, index: c_uint, value: DecF16, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetDecF16ByIndex(self, index, value, error_info);
    }
    /// Sets the value of a 16 byte decfloat object into a field.
    ///
    /// The field specified by name needs to be of one of the following data types:
    /// - RFCTYPE_DECF16
    /// - RFCTYPE_DECF34
    /// - RFCTYPE_FLOAT
    /// - RFCTYPE_BCD
    /// - RFCTYPE_INT
    /// - RFCTYPE_INT2
    /// - RFCTYPE_INT1
    /// - RFCTYPE_CHAR
    /// - RFCTYPE_NUM
    /// - RFCTYPE_STRING
    /// - RFCTYPE_BYTE     Needs to be 8 byte long.
    /// - RFCTYPE_XSTRING
    ///
    /// **note** If the target field is CHAR or STRING, the value will be converted to a string in
    /// scientific notation. If it is NUMC, it will be truncated to the next integer.
    ///
    ///  `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetDecF34(self: *DataContainer, name: [*c]const SapUc, value: DecF34, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetDecF34(self, name, value, error_info);
    }
    /// Sets the value of a 16 byte decfloat object into a field.
    ///
    /// This function works exactly like RfcSetDecF34(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetDecF34ByIndex(self: *DataContainer, index: c_uint, value: DecF34, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetDecF34ByIndex(self, index, value, error_info);
    }
    /// Copies the given structure into the target structure of the parent container.
    ///
    /// The target field needs to be of type RFCTYPE_STRUCTURE.
    ///
    /// **note** If you want to avoid the copy operation, use RfcGetStructure() and set the subfields here,
    /// instead of the sequence RfcCreateStructure()/ setting the subfields/ #RfcSetStructure().
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetStructure(self: *DataContainer, name: [*c]const SapUc, value: *Structure, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetStructure(self, name, value, error_info);
    }
    /// Copies the given structure into the target structure of the parent container.
    ///
    /// This function works exactly like RfcSetStructure(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetStructureByIndex(self: *DataContainer, index: c_uint, value: *Structure, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetStructureByIndex(self, index, value, error_info);
    }
    /// Set single char value buffer to the entire structure.
    ///
    /// The structure will be filled with the data of bufferas if it were a single char field.
    ///
    /// In case the buffer is too small, the function will return RFC_BUFFER_TOO_SMALL.
    /// The result will <b>not</b> be null-terminated.
    ///
    /// This mimics the way structures have been handled by the classic RFC library librfc32.
    /// It can conveniently be used for fetching an RFC structure into a C struct, which has been defined
    /// like in the ABAP DDIC.
    /// In addition to programming convenience, it should also improve runtime performance compared to fetching
    /// each single field one-by-one.
    ///
    /// This function can only be applied to structures/tables if they contain char-like fields (CHAR, NUMC, DATE, TIME)
    /// The result will be aligned exactly as on ABAP side, including padding bytes.
    ///
    /// \out dataHandle A data container (structure handle or table handle). If dataHandle
    /// is a table handle, the function will read the structure data of the current row.
    pub fn SetStructureFromCharBuffer(self: *DataContainer, char_buffer: [*]SapUc, buffer_length: c_uint, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetStructureFromCharBuffer(self, char_buffer, buffer_length, error_info);
    }
    /// Copies the given table into the target table of the parent container.
    ///
    /// The target field needs to be of type RFCTYPE_TABLE.
    ///
    /// **note** If you want to avoid the copy operation, use RfcGetTable() and set the subfields here,
    /// instead of the sequence RfcCreateTable()/ setting the subfields/ #RfcSetTable().
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetTable(self: *DataContainer, name: [*c]const SapUc, value: *Table, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetTable(self, name, value, error_info);
    }
    /// Copies the given table into the target table of the parent container.
    ///
    /// This function works exactly like RfcSetTable(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle or table handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetTableByIndex(self: *DataContainer, index: c_uint, value: *Table, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetTableByIndex(self, index, value, error_info);
    }
    /// Copies the object into the target object of the parent container.
    ///
    /// The target field needs to be of type RFCTYPE_ABAPOBJECT.
    ///
    /// **note** If you want to avoid the copy operation, use RfcGetAbapObject() and if the instance already exists set the subfields here,
    /// instead of the sequence RfcCreateAbapObject()/ setting the subfields/ #RfcSetAbapObject().
    ///
    /// `self` A data container (function handle, structure handle, table handle or object handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetAbapObject(self: *DataContainer, name: [*c]const SapUc, value: *AbapObject, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetAbapObject(self, name, value, error_info);
    }
    /// Copies the object into the target object of the parent container.
    ///
    /// This function works exactly like RfcSetAbapObject(), the difference being that the field is
    /// addressed by its index within the structure/table/function module. The first field has index 0,
    /// last field has index n-1, the order of the fields is as defined in the ABAP DDIC.
    ///
    /// `self` A data container (function handle, structure handle, table handle or object handle). If dataHandle
    /// is a table handle, the function will set the field value of the current row.
    pub fn SetAbapObjectByIndex(self: *DataContainer, index: c_uint, value: *AbapObject, error_info: ?*ErrorInfo) ReturnCode {
        return RfcSetAbapObjectByIndex(self, index, value, error_info);
    }

    /// Returns the metadata description of the given structure or table (RFC_STRUCTURE_HANDLE or RFC_TABLE_HANDLE).
    ///
    /// `self` A structure or table.
    ///
    /// `return` The type description of the given structure (in case dataHandle is a structure), or the
    /// type description of the table line type (in case dataHandle is a table).
    pub fn DescribeType(self: *DataContainer, error_info: ?*ErrorInfo) *TypeDesc {
        return RfcDescribeType(self, error_info);
    }
    // ==================================================
    // ABAP Object
    // ==================================================
    /// Destroys an ABAP object handle.
    pub fn DestroyAbapObject(self: *AbapObject, error_info: ?*ErrorInfo) ReturnCode {
        return RfcDestroyAbapObject(self, error_info);
    }

    /// Returns the metadata description of the given ABAP object handle.
    pub fn DescribeAbapObject(self: *AbapObject, error_info: ?*ErrorInfo) *ClassDesc {
        return RfcDescribeAbapObject(self, error_info);
    }
};
