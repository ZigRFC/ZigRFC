const ReturnCode = @import("commons.zig").ReturnCode;
const ErrorInfo = @import("commons.zig").ErrorInfo;

const SapULLong = @import("commons.zig").SapULLong;

const Function = @import("data_container.zig").Function;
const Connection = @import("connection.zig").Connection;

// ==================================================
// Throughput
// ==================================================
extern fn RfcDestroyThroughput(throughput: *Throughput, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcResetThroughput(throughput: *Throughput, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetNumberOfCalls(throughput: *Throughput, number_of_calls: *SapULLong, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetTotalTime(throughput: *Throughput, total_time: *SapULLong, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetSerializationTime(throughput: *Throughput, serialization_time: *SapULLong, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetDeserializationTime(throughput: *Throughput, deserialization_time: *SapULLong, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetApplicationTime(throughput: *Throughput, application_time: *SapULLong, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetServerTime(throughput: *Throughput, server_time: *SapULLong, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetNetworkWritingTime(throughput: *Throughput, writing_time: *SapULLong, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetNetworkReadingTime(throughput: *Throughput, reading_time: *SapULLong, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetSentBytes(throughput: *Throughput, sent_bytes: *SapULLong, error_info: ?*ErrorInfo) ReturnCode;
extern fn RfcGetReceivedBytes(throughput: *Throughput, received_bytes: *SapULLong, error_info: ?*ErrorInfo) ReturnCode;

pub const Throughput = extern struct {
    handle: ?*anyopaque = null,
    /// Releases all memory used by the throughput object.
    ///
    /// **warning** Be careful: if you have attached the throughput to a connection (RFC_CONNECTION_HANDLE) or
    /// server (RFC_SERVER_HANDLE) you have to remove the throughput from the connection or server before deleting it.
    /// Alternatively you can close the connection or shutdown the server before destroying the throughput object.
    pub fn DestroyThroughput(self: *Throughput, error_info: ?*ErrorInfo) ReturnCode {
        return RfcDestroyThroughput(self, error_info);
    }

    /// Resets the data so far collected and aggregated by the throughput object.
    pub fn ResetThroughput(self: *Throughput, error_info: ?*ErrorInfo) ReturnCode {
        return RfcResetThroughput(self, error_info);
    }
    /// Returns the cumulated number of calls the throughput object recorded since it was attached or since the last reset.
    ///
    /// If a throughput object is attached to several connections or servers, this is the amount of calls that all these connections
    /// and servers have processed up to now.
    pub fn GetNumberOfCalls(self: *Throughput, number_of_calls: *SapULLong, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetNumberOfCalls(self, number_of_calls, error_info);
    }

    /// Returns the cumulated time of call durations the throughput object recorded since it was attached or since the last reset.
    ///
    /// If a throughput object is attached to several connections or servers, this is the total time of all processed calls.
    /// This time includes serialization, deserialization, reading from network, writing to network and time consumed in the backend.
    /// In case of a server it also includes time accepting a connection.
    /// An approximation of the time for transmission and execution in the backend is defined by
    ///
    /// `totalTime - serializationTime - deserializationTime (- applicationTime)`
    pub fn GetTotalTime(self: *Throughput, total_time_ms: *SapULLong, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetTotalTime(self, total_time_ms, error_info);
    }
    /// Returns the cumulated serializationtime the throughput object recorded since it was attached or since the last reset.
    ///
    /// If a throughput object is attached to several connections or servers, this is the serialization time of all processed calls.
    /// Serialization time is defined as the time needed for transforming C/C++ data types into a byte stream that can be sent
    /// over the network. This includes time needed for codepage conversions, endianness conversions etc., but not the time consumed
    /// by writing to the network.
    pub fn GetSerializationTime(self: *Throughput, serialization_time_ms: *SapULLong, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetSerializationTime(self, serialization_time_ms, error_info);
    }
    /// Returns the cumulated deserialization time the throughput object recorded since it was attached or since the last reset.
    ///
    /// If a throughput object is attached to several connections or servers, this is the deserialization time of all processed calls.
    /// Deserialization time is defined as the time needed for transforming a byte stream received from the network connection into
    /// C/C++ data types that can be used by the application. This includes time needed for codepage conversions, endianness conversions etc.,
    /// but not the time consumed by reading from the network.
    pub fn GetDeserializationTime(self: *Throughput, deserialization_time_ms: *SapULLong, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetDeserializationTime(self, deserialization_time_ms, error_info);
    }
    /// Returns the cumulated time of the C implementations of ABAP function modules that the throughput object recorded
    /// since it was attached or since the last reset.
    ///
    /// This value is collected only in the case of server connections. (In the client case, function modules are of course
    /// implemented in ABAP, not in C, and their time is included in the backend time.)
    /// If a throughput is attached to several connections or servers, this is the application time of all invoked calls.
    pub fn GetApplicationTime(self: *Throughput, application_time_ms: *SapULLong, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetApplicationTime(self, application_time_ms, error_info);
    }
    /// Returns the cumulated execution time of the requests at the server, that the throughput object recorded
    /// since it was attached or since the last reset.
    ///
    /// If a throughput object is attached to several connections or servers, this is the server time of all processed calls.
    /// This value is measured at the backend by the partner and transmitted in the RFC data payload.
    pub fn GetServerTime(self: *Throughput, server_time_ms: *SapULLong, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetServerTime(self, server_time_ms, error_info);
    }
    /// Returns the cumulated time that is used to write to network during the requests, that the throughput object recorded
    /// since it was attached or since the last reset.
    ///
    /// If a throughput object is attached to several connections or servers, this is the time used to write to network of all processed calls.
    /// The time measures calls to underlying libraries such an NI functions and operating socket functions. Those times might not correctly represent the time
    /// that is needed to send the data, as there are asynchronous IO functions used or the OS is responsible for sending the data.
    pub fn GetNetworkWritingTime(self: *Throughput, writingTime_ms: *SapULLong, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetNetworkWritingTime(self, writingTime_ms, error_info);
    }
    /// Returns the cumulated time that is used to read from the network during the requests, that the throughput object recorded
    /// since it was attached or since the last reset.
    ///
    /// If a throughput object is attached to several connections or servers, this is the time used to read from the network of all processed calls.
    /// The time measures calls to underlying libraries such an NI functions and operating socket functions. Those times might not correctly represent the time
    /// that is needed to receive the data, as there are asynchronous IO functions used or the OS is responsible for receiving the data.
    pub fn GetNetworkReadingTime(self: *Throughput, reading_time_ms: *SapULLong, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetNetworkReadingTime(self, reading_time_ms, error_info);
    }
    /// Returns the cumulated amount of sent bytes the throughput object recorded since it was attached or since the last reset.
    ///
    /// If a throughput is attached to several connections or servers, this is the amount of bytes sent by all processed calls.
    pub fn GetSentBytes(self: *Throughput, sent_bytes: *SapULLong, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetSentBytes(self, sent_bytes, error_info);
    }

    /// Returns the cumulated amount of received bytes the throughput object recorded since it was attached or since the last reset.
    ///
    /// If a throughput is attached to several connections or servers, this is the amount of bytes received by all processed calls.
    pub fn GetReceivedBytes(self: *Throughput, received_bytes: *SapULLong, error_info: ?*ErrorInfo) ReturnCode {
        return RfcGetReceivedBytes(self, received_bytes, error_info);
    }
};

// ==================================================
// Functions
// ==================================================
/// Creates a throughput object that can be used to measure performance relevant data of connections and servers.
///
/// The created throughput object can be attached to a connection (via RfcSetThroughputOnConnection()) or an automated server (via RfcSetThroughputOnServer())
/// and will collect performance relevant data from the outgoing or incoming calls. The throughput object will monitor all relevant data until it is removed from the
/// connection or server or the object it is attached to is destroyed, i.e. the connection is closed. Note that only one throughput per connection (or server)
/// is possible. On the contrary one throughput can be attached to many connections (and/or servers).
///
/// There are serveral functions that handle the throughput and its lifetime like RfcRemoveThroughputFromConnection() or RfcResetThroughput().
/// Additionally there are RfcGetX functions to obtain the aggregated data from the throughput.
pub extern fn RfcCreateThroughput(error_info: ?*ErrorInfo) ?*Throughput;
