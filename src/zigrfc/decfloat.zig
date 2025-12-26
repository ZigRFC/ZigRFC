// ==================================================
// Enums
// ==================================================

/// See DecFloat_InitializeDBmode()
const Mode = enum(c_int) {
    /// Initial
    initial = 0,
    ///Rounding necessary for DF16_DEC, DF34_DEC */
    round_for_dec = 1,
    ///  /**< The DB supports decimal floating-point types. */
    native = 2,
};

/// Error return codes.
///
/// (The return codes are set to the value decNumber has.)
///
/// A note on error handling:
/// Often, DECF_INEXACT and DECF_UNDERFLOW can be handled in the same way as DECF_OK.
/// If DECF_NO_MEMORY occurs, the caller should abort.
const ReturnCode = enum(c_int) {
    /// decNumber shared library could not be loaded; not relevant for SAP Kernel.
    not_supported = -2,
    ///  decNumber shared library has wrong version; not relevant for SAP Kernel. */
    wrong_version = -1,
    ///  no exception occurred */
    ok = 0,
    /// an inexact exception occurred (number was rounded) */
    inexact,
    /// an underflow exception occurred (number was rounded such that the result is zero) */
    underflow,
    /// an overflow exception occurred (number was out of range, e.g., exponent too big) */
    overflow,
    /// a conversion syntax exception occurred */
    conv_syntax,
    /// a division by zero exception occurred */
    div_zero,
    /// an invalid operation exception occurred */
    invalid_op,
    /// a memory allocation error occurred */
    no_memory,
};

///Rounding modes (IEEE 854 compliant).
///
///Please compare with libDecimal.h before edit
const RoundMode = enum(c_int) {
    /// round towards +infinity */
    round_ceiling = 0,
    /// round away from 0 */
    round_up = 1,
    /// 0.5 rounds up */
    round_half_up = 2,
    /// 0.5 rounds to nearest even */
    round_half_even = 3,
    /// 0.5 rounds down */
    round_half_down = 4,
    /// round towards 0 (truncate) */
    round_down = 5,
    /// round towards -infinity */
    round_floor = 6,
    /// enum must be less than this */
    round_max = 7,
};

// ==================================================
// Structs
// ==================================================
pub const SapUc = c_ushort;
pub const SapUTF8 = u8;
pub const SapRaw = u8;
pub const SapSRaw = i8;
pub const SapInt = c_int;
pub const SapShort = c_short;
pub const SapLLong = c_longlong;
pub const SapULLong = c_ulonglong;
pub const SapBool = u8;
pub const SapDouble = f64;
pub const DecFloat34Buff = [43]SapUc;
pub const DecFloat16Buff = [25]SapUc;
pub const DecFloat16Raw = [8]SapRaw;
pub const DecFloat34Raw = [16]SapRaw;
pub const DecFRounding = c_uint;

pub const PlatformMaxT = [16]SapSRaw;

pub const SapMaxAlign = extern union {
    align_1: c_long,
    align_2: f64,
    align_3: ?*anyopaque,
    align_4: PlatformMaxT,
};

// ==================================================
// DecFloat16
// ==================================================
extern fn DecFloat16RoundForDEC(dfp16: *DecFloat16, length: c_int, dec_places: c_int) ReturnCode;
extern fn DecFloat16CompareForDEC(unroundedDf: DecFloat16, dbValue: DecFloat16, dec_places: c_int, p_rc: *ReturnCode) SapInt;
extern fn DecFloat16_Add(dfp16_res: ?*DecFloat16, dfp16_lhs: DecFloat16, dfp16_rhs: DecFloat16) ReturnCode;
extern fn DecFloat16_Sub(dfp16_res: ?*DecFloat16, dfp16_lhs: DecFloat16, dfp16_rhs: DecFloat16) ReturnCode;
extern fn DecFloat16_Mult(dfp16_res: ?*DecFloat16, dfp16_lhs: DecFloat16, dfp16_rhs: DecFloat16) ReturnCode;
extern fn DecFloat16_Div(dfp16_res: ?*DecFloat16, dfp16_lhs: DecFloat16, dfp16_rhs: DecFloat16) ReturnCode;
extern fn DecFloat16_DIV(dfp16_res: ?*DecFloat16, dfp16_lhs: DecFloat16, dfp16_rhs: DecFloat16) ReturnCode;
extern fn DecFloat16_MOD(dfp16_res: ?*DecFloat16, dfp16_lhs: DecFloat16, dfp16_rhs: DecFloat16) ReturnCode;
extern fn DecFloat16_EQ(dfp16_lhs: DecFloat16, dfp16_rhs: DecFloat16, prc: *ReturnCode) SapBool;
extern fn DecFloat16_GT(dfp16_lhs: DecFloat16, dfp16_rhs: DecFloat16, prc: *ReturnCode) SapBool;
extern fn DecFloat16_LT(dfp16_lhs: DecFloat16, dfp16_rhs: DecFloat16, prc: *ReturnCode) SapBool;
extern fn DecFloat16Compare(dfp16_lhs: DecFloat16, dfp16_rhs: DecFloat16, p_rc: *ReturnCode) SapInt;
extern fn DecFloat16RoundDec(dfp16: *DecFloat16, dec: SapInt, dec_f_round: DecFRounding) ReturnCode;
extern fn DecFloat16RoundPrec(dfp16: *DecFloat16, prec: SapInt, dec_f_round: DecFRounding) ReturnCode;
extern fn DecFloat16RescaleDec(dfp16: *DecFloat16, dec: SapInt, dec_f_round: DecFRounding) ReturnCode;
extern fn DecFloat16RescalePrec(dfp16: *DecFloat16, prec: SapInt, dec_f_round: DecFRounding) ReturnCode;
extern fn DecFloat16IsInfinite(dfp16: DecFloat16) SapBool;
extern fn DecFloat16IsFinite(dfp16: DecFloat16) SapBool;
extern fn DecFloat16IsNaN(dfp16: DecFloat16) SapBool;
extern fn DecFloat16Zero(dfp16: *DecFloat16) *DecFloat16;
extern fn DecFloat16Ceil(dfp16: DecFloat16, p_rc: *ReturnCode) DecFloat16;
extern fn DecFloat16Floor(dfp16: DecFloat16, p_rc: *ReturnCode) DecFloat16;
extern fn DecFloat16ToDecFloat16Neutral(dfp16_neutral: *DecFloat16, dfp16: DecFloat16) ReturnCode;
extern fn DecFloat16NeutralToDecFloat16(dfp16: *DecFloat16, dfp16_neutral: DecFloat16) ReturnCode;
extern fn DecFloat16Normalize(dfp16: *DecFloat16) ReturnCode;
extern fn DecFloat16ToNormDecFloat16(norm_dfp16: *DecFloat16, dfp16: DecFloat16) ReturnCode;
extern fn DecFloat16RoundForDECToPrecision(dfp16: *DecFloat16, precision: c_int, dec_places: c_int) ReturnCode;
extern fn DecFloat16_Sqrt(dfp16_res: ?*DecFloat16, dfp16: DecFloat16) ReturnCode;
extern fn DecFloat16_Exp(dfp16_res: ?*DecFloat16, dfp16: DecFloat16) ReturnCode;
extern fn DecFloat16_Ln(dfp16_res: ?*DecFloat16, dfp16: DecFloat16) ReturnCode;
extern fn DecFloat16_Log10(dfp16_res: ?*DecFloat16, dfp16: DecFloat16) ReturnCode;
extern fn DecFloat16NextMinus(dfp16_res: ?*DecFloat16, dfp16: DecFloat16) ReturnCode;
extern fn DecFloat16NextPlus(dfp16_res: ?*DecFloat16, dfp16: DecFloat16) ReturnCode;
// ==================================================
// DecFloat16 - to
// ==================================================
extern fn DecFloat16ToString(dfp16: DecFloat16, numstr: *DecFloat16Buff) ReturnCode;
extern fn DecFloat16ToDecFloat16Raw(dfp16raw_res: *DecFloat16Raw, scale: *SapShort, dfp16: DecFloat16) ReturnCode;
extern fn DecFloat16ToDecFloat16RawDB(dfp16raw_res: *DecFloat16Raw, scale: *SapShort, dfp16: DecFloat16) ReturnCode;
extern fn NormDecFloat16ToDecFloat16Raw(dfp16raw_res: *DecFloat16Raw, dfp16: DecFloat16) ReturnCode;
extern fn DecFloat16GetExponent(exponent: *SapInt, dfp16: DecFloat16) ReturnCode;
extern fn DecFloat16GetNumOfDigits(digits: *SapInt, dfp16: DecFloat16) ReturnCode;
extern fn DecFloat16ToSAP_INT(i: *SapInt, dfp16: DecFloat16) ReturnCode;
extern fn DecFloat16ToSAP_LLONG(l: *SapLLong, dfp16: DecFloat16) ReturnCode;
extern fn DecFloat16ToSAP_DOUBLE(d: *SapDouble, dfp16: DecFloat16) ReturnCode;
extern fn DecFloat16ToBCD(bcd_res: *SapRaw, dfp16: DecFloat16, length: c_int, dec_places: c_int) ReturnCode;
extern fn DecFloat16ToDecFloat34(dfp34_res: ?*DecFloat34, dfp16: DecFloat16) ReturnCode;
// ==================================================
// DecFloat16 - from
// ==================================================
extern fn BCDToDecFloat16(dfp16_res: ?*DecFloat16, bcd: *SapRaw, length: c_int, dec_places: c_int) ReturnCode;
extern fn DecFloat16RawToDecFloat16(dfp16_res: ?*DecFloat16, dfp16raw: *SapRaw, scale: SapShort) ReturnCode;
extern fn DecFloat16RawToDecFloat16DB(dfp16_res: ?*DecFloat16, dfp16raw: *SapRaw, scale: SapShort) ReturnCode;
extern fn DecFloat16RawToNormDecFloat16(dfp16_res: ?*DecFloat16, dfp16raw: *SapRaw) ReturnCode;
extern fn SAP_LLONGToDecFloat16(dfp16_res: ?*DecFloat16, l: SapLLong) ReturnCode;
extern fn SAP_INTToDecFloat16(dfp16_res: ?*DecFloat16, i: SapInt) ReturnCode;
extern fn SAP_DOUBLEToDecFloat16(dfp16_res: ?*DecFloat16, i: SapDouble) ReturnCode;
extern fn StringToDecFloat16(numstr: *const SapUc, dfp16: *DecFloat16) ReturnCode;
extern fn GetMinDecFloat16() DecFloat16;

pub const DecFloat16 = extern union {
    bytes: [8]SapRaw,
    @"align": SapDouble,
    /// If decFloatDBmode == DECF_DBmode_roundForDEC:
    /// Round a 64-bit IEEE 754r decimal floating point value according to
    /// dec_places and check that it fits into the BCD type specified.
    /// When returning from this function, dfp16 has at most dec_places
    /// decimal places, but it may have less.
    pub fn RoundForDEC(
        self: *DecFloat16,
        /// Length of BCD buffer in bytes -> precision (2*length-1) or DECF_OVERFLOW
        length: c_int,
        /// Number of decimal places (Nachkommastellen) of the BCD number
        dec_places: c_int,
    ) ReturnCode {
        return DecFloat16RoundForDEC(self, length, dec_places);
    }
    /// If decFloatDBmode == DECF_DBmode_roundForDEC:
    /// Round a 64-bit IEEE 754r decimal floating point value according to
    /// dec_places and check that it fits into the BCD type specified.
    /// When returning from this function, dfp16 has at most dec_places
    /// decimal places, but it may have less.
    pub fn RoundForDECToPrecision(
        self: *DecFloat16,
        /// max nr of digits of result, otherwise overflow, may be even or odd
        precision: c_int,
        /// Number of decimal places (Nachkommastellen) of the BCD number
        dec_places: c_int,
    ) ReturnCode {
        return DecFloat16RoundForDECToPrecision(self, precision, dec_places);
    }
    /// Compare an IEEE value with a DF16_DEC value.
    ///
    /// If decFloatDBmode == DECF_DBmode_roundForDEC:
    /// This function rounds an IEEE value according the specified number of
    /// decimal places (Nachkommastellen) and compares the result with
    /// another DecFloat value. (The latter is assumed to be a DF16_DEC
    /// value which has already been rounded.)
    /// If decFloatDBmode == DECF_DBmode_native, both values are not rounded,
    /// but just compared.=
    ///
    /// `return`             -1 if (rounded) IEEE value <  dbValue
    ///                      0  if (rounded) IEEE value numerically equal to dbValue
    ///                      1  if (rounded) IEEE value >  dbValue.
    ///
    /// If p_rc is DECF_INVALID_OP, the return value is guaranteed to be non-zero.
    pub fn CompareForDEC(self: DecFloat16, db_value: DecFloat16, dec_places: c_int, p_rc: *ReturnCode) SapInt {
        return DecFloat16CompareForDEC(self, db_value, dec_places, p_rc);
    }
    /// Computes the sum of two DecFloat16 numbers.
    ///
    /// The number *dfp16_res is set to dfp16_lhs + dfp16_rhs.
    pub fn Add(self: DecFloat16, dfp16_rhs: DecFloat16, result: ?*DecFloat16) ReturnCode {
        return DecFloat16_Add(result, self, dfp16_rhs);
    }
    /// Computes the difference of two DecFloat16 numbers.
    ///
    /// The number *dfp16_res is set to dfp16_lhs - dfp16_rhs.
    pub fn Sub(self: DecFloat16, dfp16_rhs: DecFloat16, result: ?*DecFloat16) ReturnCode {
        return DecFloat16_Sub(result, self, dfp16_rhs);
    }
    /// Computes the multiplication of two DecFloat16 numbers.
    ///
    /// The number *dfp16_res is set to dfp16_lhs/// dfp16_rhs.
    pub fn Mult(self: DecFloat16, dfp16_rhs: DecFloat16, result: ?*DecFloat16) ReturnCode {
        return DecFloat16_Mult(result, self, dfp16_rhs);
    }

    /// Computes the division of two DecFloat16 numbers.
    ///
    /// The number *dfp16_res is set to dfp16_lhs / dfp16_rhs.
    pub fn Div(self: DecFloat16, dfp16_rhs: DecFloat16, result: ?*DecFloat16) ReturnCode {
        return DecFloat16_Div(result, self, dfp16_rhs);
    }
    /// Computes the DIV operator.
    /// Note: In ABAP, DIV is defined differently, see ab_Decf34Div().
    pub fn DIV(self: DecFloat16, dfp16_rhs: DecFloat16, result: ?*DecFloat16) ReturnCode {
        return DecFloat16_DIV(result, self, dfp16_rhs);
    }
    /// Computes the MOD operator.
    /// Note: In ABAP, MOD is defined differently, see ab_Decf34Mod().
    pub fn MOD(self: DecFloat16, dfp16_rhs: DecFloat16, result: ?*DecFloat16) ReturnCode {
        return DecFloat16_MOD(result, self, dfp16_rhs);
    }
    /// Equality operation for DecFloat16 numbers.
    ///
    /// This function checks whether two DecFloat16 numbers
    /// are numerically equal, i.e. it is independent of the
    /// scale of the numbers.
    /// (In the ABAP runtime, consider using ab_decf16Eq().)
    ///
    /// `return`  TRUE,FALSE
    pub fn EQ(self: DecFloat16, dfp16_rhs: DecFloat16, prc: *ReturnCode) SapBool {
        return DecFloat16_EQ(self, dfp16_rhs, prc);
    }
    /// Relational ">" operation for DecFloat16 numbers.
    ///
    /// This function checks whether a DecFloat16 number
    /// is numerically greater than another,  independent of the
    /// scale of the numbers.
    ///
    /// `return`  TRUE,FALSE
    pub fn GT(self: DecFloat16, dfp16_rhs: DecFloat16, prc: *ReturnCode) SapBool {
        return DecFloat16_GT(self, dfp16_rhs, prc);
    }
    /// Relational "<" operation for DecFloat16 numbers.
    ///
    /// This function checks whether a DecFloat16 number
    /// is numerically less than another,  independent of the
    /// scale of the numbers.
    ///
    /// `return`  TRUE,FALSE
    pub fn LT(self: DecFloat16, dfp16_rhs: DecFloat16, prc: *ReturnCode) SapBool {
        return DecFloat16_LT(self, dfp16_rhs, prc);
    }
    /// This function compares two DecFloat16 numbers numerically.
    ///
    /// If dfp16_lhs  < dfp16_rhs then the function returns -1.
    /// If dfp16_lhs == dfp16_rhs then the function returns  0.
    /// If dfp16_lhs  > dfp16_rhs then the function returns  1.
    pub fn Compare(self: DecFloat16, dfp16_rhs: DecFloat16, p_rc: *ReturnCode) SapInt {
        return DecFloat16Compare(self, dfp16_rhs, p_rc);
    }
    pub fn RoundDec(self: *DecFloat16, dec: SapInt, dec_f_round: DecFRounding) ReturnCode {
        return DecFloat16RoundDec(self, dec, dec_f_round);
    }
    pub fn RoundPrec(self: *DecFloat16, prec: SapInt, dec_f_round: DecFRounding) ReturnCode {
        return DecFloat16RoundPrec(self, prec, dec_f_round);
    }
    pub fn RescaleDec(self: *DecFloat16, dec: SapInt, dec_f_round: DecFRounding) ReturnCode {
        return DecFloat16RescaleDec(self, dec, dec_f_round);
    }
    pub fn RescalePrec(self: *DecFloat16, prec: SapInt, dec_f_round: DecFRounding) ReturnCode {
        return DecFloat16RescalePrec(self, prec, dec_f_round);
    }
    pub fn IsInfinite(self: DecFloat16) SapBool {
        return DecFloat16IsInfinite(self);
    }
    pub fn IsFinite(self: DecFloat16) SapBool {
        return DecFloat16IsFinite(self);
    }
    pub fn IsNaN(self: DecFloat16) SapBool {
        return DecFloat16IsNaN(self);
    }
    pub fn Zero(self: *DecFloat16) *DecFloat16 {
        return DecFloat16Zero(self);
    }
    pub fn Ceil(self: DecFloat16, p_rc: *ReturnCode) DecFloat16 {
        return DecFloat16Ceil(self, p_rc);
    }
    pub fn Floor(self: DecFloat16, p_rc: *ReturnCode) DecFloat16 {
        return DecFloat16Floor(self, p_rc);
    }
    /// Converts a DecFloat16 number into its preferred network byte order.
    ///
    /// The preferred neutral network byte order is Big-Endian.
    pub fn ToDecFloat16Neutral(self: DecFloat16, result: ?*DecFloat16) ReturnCode {
        return DecFloat16ToDecFloat16Neutral(result, self);
    }
    /// Converts a neutral DecFloat16 number into its machine-dependent encoding (big- or little-endian).
    ///
    /// The preferred neutral network byte order is Big-Endian.
    pub fn NeutralToDecFloat16(self: DecFloat16, result: ?*DecFloat16) ReturnCode {
        return DecFloat16NeutralToDecFloat16(result, self);
    }
    /// In-place normalization of a DecFloat16 number.
    ///
    /// Cf. DecFloat16ToNormDecFloat16().
    pub fn Normalize(self: *DecFloat16) ReturnCode {
        return DecFloat16Normalize(self);
    }
    /// Converts a DecFloat16 number to a normalized DecFloat16 number.
    ///
    /// The result is stored in norm_dfp16.
    /// Trailing zeros are removed (without changing the numerical value).
    /// If the number is zero, the sign is removed.
    pub fn ToNormDecFloat16(self: DecFloat16, result: ?*DecFloat16) ReturnCode {
        return DecFloat16ToNormDecFloat16(result, self);
    }

    /// Returns the square root of a DecFloat16.
    ///
    /// The number *dfp16_res is set to the square root of dfp16, rounded if necessary, to
    /// 16 digits using the DECF_ROUND_HALF_EVEN rounding mode.
    pub fn Sqrt(self: DecFloat16, result: ?*DecFloat16) ReturnCode {
        return DecFloat16_Sqrt(result, self);
    }
    /// Exponential function for DecFloat16 numbers.
    ///
    /// The number is set to e raised to the power of rhs, rounded if necessary using
    /// the round-half-even rounding algorithm.
    ///
    /// Finite results will always be full precision and inexact, except when rhs is a zero or
    /// -Infinity (giving 1 or 0 respectively). Inexact results will almost always be correctly
    /// rounded, but may be up to 1 ulp (unit in last place) in error in rare cases.
    ///
    /// This is a mathematical function; the 10**6 restrictions on precision and range apply as
    /// described above.
    pub fn Exp(self: DecFloat16, result: ?*DecFloat16) ReturnCode {
        return DecFloat16_Exp(result, self);
    }
    /// Natural logarithm function for DecFloat16 numbers.
    ///
    /// The number is set to the natural logarithm (in base e) of rhs, rounded if necessary using
    /// the round-half-even rounding algorithm.
    ///
    /// Finite results will always be full precision and inexact, except when rhs is a zero or
    /// -Infinity (giving 1 or 0 respectively). Inexact results will almost always be correctly
    /// rounded, but may be up to 1 ulp (unit in last place) in error in rare cases.
    ///
    /// This is a mathematical function; the 10**6 restrictions on precision and range apply as
    /// described above.
    pub fn Ln(self: DecFloat16, result: ?*DecFloat16) ReturnCode {
        return DecFloat16_Ln(result, self);
    }
    /// Logarithm in base 10 function for DecFloat16 numbers.
    ///
    /// The number is set to the logarithm in base 10 of rhs, rounded if necessary using
    /// the round-half-even rounding algorithm.
    ///
    /// Finite results will always be full precision and inexact, except when rhs is a zero or
    /// -Infinity (giving 1 or 0 respectively). Inexact results will almost always be correctly
    /// rounded, but may be up to 1 ulp (unit in last place) in error in rare cases.
    ///
    /// This is a mathematical function; the 10**6 restrictions on precision and range apply as
    /// described above.
    pub fn Log10(self: DecFloat16, result: ?*DecFloat16) ReturnCode {
        return DecFloat16_Log10(result, self);
    }
    /// Returns the "next" DecFloat16 number to dfp16 in the direction of -Infinity
    ///
    ///  Returns the "next" DecFloat16 number to dfp16 in the direction of -Infinity according
    ///  to the IEEE 754r rules for "nextDown".
    ///
    pub fn NextMinus(self: DecFloat16, result: ?*DecFloat16) ReturnCode {
        return DecFloat16NextMinus(result, self);
    }
    /// Returns the "next" DecFloat16 number to dfp16 in the direction of Infinity
    ///
    ///  Returns the "next" DecFloat16 number to dfp16 in the direction of -Infinity according
    ///  to the IEEE 754r rules for "nextDown".
    pub fn NextPlus(self: DecFloat16, result: ?*DecFloat16) ReturnCode {
        return DecFloat16NextPlus(result, self);
    }

    // ==================================================
    // to
    // ==================================================
    /// Convert DecFloat16 to String.
    ///
    /// This function converts a DecFloat16 number into a string of type SAP_UC*.
    /// The caller is responsible for the memory handling.
    pub fn ToString(self: DecFloat16, numstr: *DecFloat16Buff) ReturnCode {
        return DecFloat16ToString(self, numstr);
    }
    /// Convert 64-bit IEEE 754r decimal floating point variable to 8-byte binary sortable format and store scale information.
    ///
    /// This function converts a DecFloat16 into an SAP-proprietary format that can be sorted by memcpy.
    /// For this purpose, this function has to normalize the DecFloat16 (e.g., 1.50 -> 1.5).
    /// The scale information is stored in a separate variable.
    /// (In the ABAP runtime, use ab_DecFloat16ToDecFloat16Raw().)
    pub fn ToDecFloat16Raw(self: DecFloat16, scale: *SapShort, dfp16raw_res: *DecFloat16Raw) ReturnCode {
        return DecFloat16ToDecFloat16Raw(dfp16raw_res, scale, self);
    }
    ///  Same as DecFloat16ToDecFloat16Raw
    pub fn ToDecFloat16RawDB(self: DecFloat16, scale: *SapShort, dfp16raw_res: *DecFloat16Raw) ReturnCode {
        return DecFloat16ToDecFloat16RawDB(dfp16raw_res, scale, self);
    }
    /// Convert 64-bit IEEE 754r decimal floating point variable to 8-byte binary sortable format without scale information.
    ///
    /// This function converts a DecFloat16 into an SAP-proprietary format that can be sorted by memcpy.
    /// For this purpose, this function has to normalize the DecFloat16 (e.g., 1.50 -> 1.5).
    /// (In the ABAP runtime, you may use ab_NormDecFloat16ToDecFloat16Raw().)
    ///
    pub fn NormToDecFloat16Raw(self: DecFloat16, dfp16raw_res: *DecFloat16Raw) ReturnCode {
        return NormDecFloat16ToDecFloat16Raw(dfp16raw_res, self);
    }
    ///  Get the exponent of a Decfloat number.
    ///
    /// These functions deliver the exponent that occurs if the number is written as
    ///     `integer * 10 ^ exponent`.
    /// Example: 1234.50 has the exponent -2 (since the representation is 123450E-2).
    /// For NaNs and Infinities, the result is undefined.
    ///
    /// Note: CL_ABAP_MATH=>GET_SCALE returns the exponent with reversed sign.
    pub fn GetExponent(self: DecFloat16, exponent: *SapInt) ReturnCode {
        return DecFloat16GetExponent(exponent, self);
    }
    pub fn GetNumOfDigits(self: DecFloat16, digits: *SapInt) ReturnCode {
        return DecFloat16GetNumOfDigits(digits, self);
    }
    ///    Convert DecFloat16 to 4-byte or 8-byte integer.
    /// (In the ABAP runtime, use ab_decf16ToI() or ab_decf16ToI8().)
    pub fn ToSapInt(self: DecFloat16, i: *SapInt) ReturnCode {
        return DecFloat16ToSAP_INT(i, self);
    }
    ///    Convert DecFloat16 to 8-byte integer.
    /// (In the ABAP runtime, use ab_decf16ToI() or ab_decf16ToI8().)
    pub fn ToSapLLong(self: DecFloat16, i: *SapLLong) ReturnCode {
        return DecFloat16ToSAP_LLONG(i, self);
    }
    ///    Convert DecFloat to 8-byte binary float.
    /// The rounding behavior is platform dependent.
    /// (In the ABAP runtime, consider using ab_decf16ToF() or ab_decf34ToF().)
    pub fn DecFloat16ToSapDouble(self: DecFloat16, d: *SapDouble) ReturnCode {
        return DecFloat16ToSAP_DOUBLE(d, self);
    }
    /// Convert to ABAP type P (BCD).
    ///
    /// Convert a 64-bit IEEE 754r decimal floating point variable into the
    /// ABAP type P.
    pub fn ToBCD(
        self: DecFloat16,
        bcd_res: [*]SapRaw,
        ///Length of BCD buffer in bytes
        length: c_int,
        dec_places: c_int,
    ) ReturnCode {
        return DecFloat16ToBCD(bcd_res, self, length, dec_places);
    }
    /// Convert DecFloat16 to DecFloat34
    pub fn ToDecFloat34(self: DecFloat16, dfp34_res: ?*DecFloat34) ReturnCode {
        return DecFloat16ToDecFloat34(dfp34_res, self);
    }
    // ==================================================
    // from
    // ==================================================
    /// Convert from ABAP type P (BCD) to 64-bit IEEE 754r
    ///
    /// Convert a BCD number (ABAP type P) into a 64-bit IEEE 754r decimal
    /// floating point variable.
    pub fn FromBCD(
        bcd: [*]SapRaw,
        ///  Length of BCD number in bytes
        length: c_int,
        dec_places: c_int,
        result: ?*DecFloat16,
    ) ReturnCode {
        return BCDToDecFloat16(result, bcd, length, dec_places);
    }
    /// Convert 8-byte binary sortable format into 64-bit IEEE 754r decimal floating point variable.
    ///
    /// In order set the scale of the IEEE 754r variable, this function needs
    /// additional information about the scale.
    /// In ABAP, this functionality is available as CL_ABAP_DECFLOAT_RAW=>DECFR16_TO_DECF16.
    pub fn FromDecFloat16Raw(
        /// A 8-byte sortable decimal floating point variable.
        dfp16raw: [*]SapRaw,
        /// The desired scale. If scale == -32768, the result will be
        /// normalized, e.g. 1.5 rather than 1.50. Invalid values for
        /// scale will be treated graciously.
        scale: SapShort,
        result: ?*DecFloat16,
    ) ReturnCode {
        return DecFloat16RawToDecFloat16(result, dfp16raw, scale);
    }
    ///  Same as DecFloat16RawToDecFloat16
    pub fn FromDecFloat16RawToDecFloat16DB(dfp16raw: *SapRaw, scale: SapShort, result: ?*DecFloat16) ReturnCode {
        return DecFloat16RawToDecFloat16DB(result, dfp16raw, scale);
    }
    /// Convert 8-byte binary sortable format into 64-bit IEEE 754r decimal floating point variable.
    ///
    /// The result will be normalized, e.g., 1.5 rather than 1.50.
    pub fn FromDecFloat16RawToNormDecFloat16(
        /// An 8-byte sortable decimal floating point variable
        dfp16raw: [*]SapRaw,
        result: ?*DecFloat16,
    ) ReturnCode {
        return DecFloat16RawToNormDecFloat16(result, dfp16raw);
    }
    /// Convert 8-byte integer to DecFloat16.
    /// (In the ABAP runtime, use ab_i8ToDecf16().)
    pub fn FromSapLLong(l: SapLLong, result: ?*DecFloat16) ReturnCode {
        return SAP_LLONGToDecFloat16(result, l);
    }
    ///    Convert 4-byte integer to DecFloat16.
    /// (In the ABAP runtime, use ab_iToDecf16().)
    pub fn FromSapInt(i: SapInt, result: ?*DecFloat16) ReturnCode {
        return SAP_INTToDecFloat16(result, i);
    }
    ///    Convert 8-byte binary float to DecFloat.
    /// The rounding behavior is platform dependent.
    ///
    /// ATTENTION: The behavior for NaNs and Infinities is platform dependent.
    /// (In the ABAP runtime, consider using ab_fToDecf16() or ab_fToDecf34().)
    pub fn FromSapDouble(i: SapDouble, result: ?*DecFloat16) ReturnCode {
        return SAP_DOUBLEToDecFloat16(result, i);
    }
    /// Convert (numeric) String to Decfloat16.
    ///
    /// This function converts a numeric string of type SAP_UC/// into a Decfloat16 number.
    /// (In the ABAP runtime, use ab_ctodecf16().)
    pub fn FromString(numstr: [*]const SapUc, dfp16: *DecFloat16) ReturnCode {
        return StringToDecFloat16(numstr, dfp16);
    }
    /// Minimum IEEE 754r value = -Infinity
    pub fn FromMin() DecFloat16 {
        return GetMinDecFloat16();
    }
};

// ==================================================
// DecFloat34
// ==================================================

extern fn DecFloat34RoundForDEC(dfp34: *DecFloat34, length: c_int, dec_places: c_int) ReturnCode;
extern fn DecFloat34RoundForDECToPrecision(dfp34: *DecFloat34, precision: c_int, dec_places: c_int) ReturnCode;
extern fn DecFloat34CompareForDEC(unroundedDf: DecFloat34, dbValue: DecFloat34, dec_places: c_int, p_rc: *ReturnCode) SapInt;
extern fn DecFloat34_Add(dfp34_res: ?*DecFloat34, dfp34_lhs: DecFloat34, dfp34_rhs: DecFloat34) ReturnCode;
extern fn DecFloat34_Sub(dfp34_res: ?*DecFloat34, dfp34_lhs: DecFloat34, dfp34_rhs: DecFloat34) ReturnCode;
extern fn DecFloat34_Mult(dfp34_res: ?*DecFloat34, dfp34_lhs: DecFloat34, dfp34_rhs: DecFloat34) ReturnCode;
extern fn DecFloat34_Div(dfp34_res: ?*DecFloat34, dfp34_lhs: DecFloat34, dfp34_rhs: DecFloat34) ReturnCode;
extern fn DecFloat34_DIV(dfp34_res: ?*DecFloat34, dfp34_lhs: DecFloat34, dfp34_rhs: DecFloat34) ReturnCode;
extern fn DecFloat34_MOD(dfp34_res: ?*DecFloat34, dfp34_lhs: DecFloat34, dfp34_rhs: DecFloat34) ReturnCode;
extern fn DecFloat34_EQ(dfp34_lhs: DecFloat34, dfp34_rhs: DecFloat34, prc: *ReturnCode) SapBool;
extern fn DecFloat34_GT(dfp34_lhs: DecFloat34, dfp34_rhs: DecFloat34, prc: *ReturnCode) SapBool;
extern fn DecFloat34_LT(dfp34_lhs: DecFloat34, dfp34_rhs: DecFloat34, prc: *ReturnCode) SapBool;
extern fn DecFloat34Compare(dfp34_lhs: DecFloat34, dfp34_rhs: DecFloat34, p_rc: *ReturnCode) SapInt;
extern fn DecFloat34RoundDec(dfp34: *DecFloat34, dec: SapInt, dec_f_round: DecFRounding) ReturnCode;
extern fn DecFloat34RoundPrec(dfp34: *DecFloat34, prec: SapInt, dec_f_round: DecFRounding) ReturnCode;
extern fn DecFloat34RescaleDec(dfp34: *DecFloat34, dec: SapInt, dec_f_round: DecFRounding) ReturnCode;
extern fn DecFloat34RescalePrec(dfp34: *DecFloat34, prec: SapInt, dec_f_round: DecFRounding) ReturnCode;
extern fn DecFloat34IsInfinite(dfp34: DecFloat34) SapBool;
extern fn DecFloat34IsFinite(dfp34: DecFloat34) SapBool;
extern fn DecFloat34IsNaN(dfp34: DecFloat34) SapBool;
extern fn DecFloat34Zero(dfp34: *DecFloat34) *DecFloat34;
extern fn DecFloat34Ceil(dfp34: DecFloat34, p_rc: *ReturnCode) DecFloat34;
extern fn DecFloat34Floor(dfp34: DecFloat34, p_rc: *ReturnCode) DecFloat34;
extern fn DecFloat34ToDecFloat34Neutral(dfp34_neutral: *DecFloat34, dfp34: DecFloat34) ReturnCode;
extern fn DecFloat34NeutralToDecFloat34(dfp34: *DecFloat34, dfp34_neutral: DecFloat34) ReturnCode;
extern fn DecFloat34Normalize(dfp34: *DecFloat34) ReturnCode;
extern fn DecFloat34ToNormDecFloat34(norm_dfp34: *DecFloat34, dfp34: DecFloat34) ReturnCode;
extern fn DecFloat34_Sqrt(dfp34_res: ?*DecFloat34, dfp34: DecFloat34) ReturnCode;
extern fn DecFloat34_Exp(dfp34_res: ?*DecFloat34, dfp34: DecFloat34) ReturnCode;
extern fn DecFloat34_Ln(dfp34_res: ?*DecFloat34, dfp16: DecFloat34) ReturnCode;
extern fn DecFloat34_Log10(dfp34_res: ?*DecFloat34, dfp16: DecFloat34) ReturnCode;
extern fn DecFloat34NextMinus(dfp34_res: ?*DecFloat34, dfp34: DecFloat34) ReturnCode;
extern fn DecFloat34NextPlus(dfp34_res: ?*DecFloat34, dfp34: DecFloat34) ReturnCode;
// ==================================================
// DecFloat34 - to
// ==================================================
extern fn DecFloat34ToDecFloat34Raw(dfp34raw_res: *DecFloat34Raw, scale: *SapShort, dfp34: DecFloat34) ReturnCode;
extern fn DecFloat34ToDecFloat34RawDB(dfp34raw_res: *DecFloat34Raw, scale: *SapShort, dfp34: DecFloat34) ReturnCode;
extern fn NormDecFloat34ToDecFloat34Raw(dfp34raw_res: *DecFloat34Raw, dfp34: DecFloat34) ReturnCode;
extern fn DecFloat34GetExponent(exponent: *SapInt, dfp34: DecFloat34) ReturnCode;
extern fn DecFloat34GetNumOfDigits(digits: *SapInt, dfp34: DecFloat34) ReturnCode;
extern fn DecFloat34ToSapInt(i: *SapInt, dfp34: DecFloat34) ReturnCode;
extern fn DecFloat34ToSAP_LLONG(l: *SapLLong, dfp34: DecFloat34) ReturnCode;
extern fn DecFloat34ToSAP_DOUBLE(d: *SapDouble, dfp34: DecFloat34) ReturnCode;
extern fn DecFloat34ToBCD(bcd_res: *SapRaw, dfp34: DecFloat34, length: c_int, dec_places: c_int) ReturnCode;
extern fn DecFloat34ToDecFloat16(dfp16_res: ?*DecFloat16, dfp34: DecFloat34) ReturnCode;
extern fn DecFloat34ToSAP_INT(i: *SapInt, dfp16: DecFloat34) ReturnCode;
// ==================================================
// DecFloat34 - from
// ==================================================
extern fn SAP_INTToDecFloat34(dfp34_res: ?*DecFloat34, i: SapInt) ReturnCode;
extern fn SAP_LLONGToDecFloat34(dfp34_res: ?*DecFloat34, l: SapLLong) ReturnCode;
extern fn DecFloat34ToString(dfp34: DecFloat34, numstr: *DecFloat34Buff) ReturnCode;
extern fn DecFloat34RawToDecFloat34(dfp34_res: ?*DecFloat34, dfp34raw: *SapRaw, scale: SapShort) ReturnCode;
extern fn DecFloat34RawToDecFloat34DB(dfp34_res: ?*DecFloat34, dfp34raw: *SapRaw, scale: SapShort) ReturnCode;
extern fn DecFloat34RawToNormDecFloat34(dfp34_res: ?*DecFloat34, dfp34raw: *SapRaw) ReturnCode;
extern fn SAP_DOUBLEToDecFloat34(dfp34_res: ?*DecFloat34, i: SapDouble) ReturnCode;
extern fn StringToDecFloat34(numstr: *const SapUc, dfp34: *DecFloat34) ReturnCode;
extern fn BCDToDecFloat34(dfp34_res: ?*DecFloat34, bcd: *SapRaw, length: c_int, dec_places: c_int) ReturnCode;
extern fn DecFloat34StrDiv(divident: *const SapUTF8, divisor: *const SapUTF8, allocateFn: Decfl34AllocateCallBack, result: ?*DecFloat34) ReturnCode;
extern fn GetMinDecFloat34() DecFloat34;

pub const DecFloat34 = extern union {
    bytes: [16]SapRaw,
    @"align": SapMaxAlign,

    /// Round IEEE value such that it fits into ABAP type P (BCD).
    ///
    /// If decFloatDBmode == DECF_DBmode_roundForDEC:
    /// Round a 128-bit IEEE 754r decimal floating point value according to
    /// dec_places and check that it fits into the BCD type specified.
    pub fn RoundForDEC(
        self: *DecFloat34,
        /// Length of BCD buffer in bytes -> precision (2*length-1) or DECF_OVERFLOW
        length: c_int,
        /// Number of decimal places (Nachkommastellen) of the BCD number
        dec_places: c_int,
    ) ReturnCode {
        return DecFloat34RoundForDEC(self, length, dec_places);
    }

    /// Round IEEE value such that it fits into ABAP type P (BCD) or HDB DEC(precision,dec_places)..
    ///
    /// If decFloatDBmode == DECF_DBmode_roundForDEC:
    /// Round a 128-bit IEEE 754r decimal floating point value according to
    /// dec_places and check that it fits into the BCD type specified.
    pub fn RoundForDECToPrecision(
        self: *DecFloat34,
        /// max nr of digits of result, otherwise overflow, may be even or odd
        precision: c_int,
        /// Number of decimal places (Nachkommastellen) of the BCD number
        dec_places: c_int,
    ) ReturnCode {
        return DecFloat34RoundForDECToPrecision(self, precision, dec_places);
    }
    /// Compare an IEEE value with a DF34_DEC value.
    ///
    /// If decFloatDBmode == DECF_DBmode_roundForDEC:
    /// This function rounds an IEEE value according the specified number of
    /// decimal places (Nachkommastellen) and compares the result with
    /// another DecFloat value. (The latter is assumed to be a DF34_DEC
    /// value which has already been rounded.)
    /// If decFloatDBmode == DECF_DBmode_native, both values are not rounded,
    /// but just compared.
    ///
    /// `return`              -1 if (rounded) IEEE value <  dbValue
    ///                      0  if (rounded) IEEE value numerically equal to dbValue
    ///                      1  if (rounded) IEEE value >  dbValue.
    ///                      If p_rc is DECF_OVERFLOW or DECF_INVALID_OP,
    ///                      the return value is guaranteed to be non-zero.
    pub fn CompareForDEC(self: DecFloat34, db_value: DecFloat34, dec_places: c_int, p_rc: *ReturnCode) SapInt {
        return DecFloat34CompareForDEC(self, db_value, dec_places, p_rc);
    }
    /// Computes the sum of two DecFloat34 numbers.
    ///
    /// The number *dfp34_res is set to dfp34_lhs + dfp34_rhs.
    pub fn Add(self: DecFloat34, dfp34_rhs: DecFloat34, result: ?*DecFloat34) ReturnCode {
        return DecFloat34_Add(result, self, dfp34_rhs);
    }
    /// Computes the difference of two DecFloat34 numbers.
    ///
    /// The number *dfp34_res is set to dfp34_lhs - dfp34_rhs.
    pub fn Sub(self: DecFloat34, dfp34_rhs: DecFloat34, result: ?*DecFloat34) ReturnCode {
        return DecFloat34_Sub(result, self, dfp34_rhs);
    }
    /// Computes the multiplication of two DecFloat34 numbers.
    ///
    /// The number *dfp34_res is set to dfp34_lhs/// dfp34_rhs.
    pub fn Mult(self: DecFloat34, dfp34_rhs: DecFloat34, result: ?*DecFloat34) ReturnCode {
        return DecFloat34_Mult(result, self, dfp34_rhs);
    }

    /// Computes the division of two DecFloat34 numbers.
    ///
    /// The number *dfp34_res is set to dfp34_lhs / dfp34_rhs.
    pub fn Div(self: DecFloat34, dfp34_rhs: DecFloat34, result: ?*DecFloat34) ReturnCode {
        return DecFloat34_Div(result, self, dfp34_rhs);
    }
    /// Computes the DIV operator.
    /// Note: In ABAP, DIV is defined differently, see ab_Decf34Div().
    pub fn DIV(self: DecFloat34, dfp34_rhs: DecFloat34, result: ?*DecFloat34) ReturnCode {
        return DecFloat34_DIV(result, self, dfp34_rhs);
    }
    /// Computes the MOD operator.
    /// Note: In ABAP, MOD is defined differently, see ab_Decf34Mod().
    pub fn MOD(self: DecFloat34, dfp34_rhs: DecFloat34, result: ?*DecFloat34) ReturnCode {
        return DecFloat34_MOD(result, self, dfp34_rhs);
    }
    /// Equality operation for DecFloat34 numbers.
    ///
    /// This function checks whether two DecFloat34 numbers
    /// are numerically equal, i.e. it is independent of the
    /// scale of the numbers.
    /// (In the ABAP runtime, consider using ab_decf34Eq().)
    ///
    /// `return`  TRUE,FALSE
    pub fn EQ(self: DecFloat34, dfp34_rhs: DecFloat34, prc: *ReturnCode) SapBool {
        return DecFloat34_EQ(self, dfp34_rhs, prc);
    }
    /// Relational ">" operation for DecFloat34 numbers.
    ///
    /// This function checks whether a DecFloat34 number
    /// is numerically greater than another,  independent of the
    /// scale of the numbers.
    ///
    /// `return`  TRUE,FALSE
    pub fn GT(self: DecFloat34, dfp34_rhs: DecFloat34, prc: *ReturnCode) SapBool {
        return DecFloat34_GT(self, dfp34_rhs, prc);
    }
    /// Relational "<" operation for DecFloat34 numbers.
    ///
    /// This function checks whether a DecFloat34 number
    /// is numerically less than another,  independent of the
    /// scale of the numbers.
    ///
    /// `return`  TRUE,FALSE
    pub fn LT(self: DecFloat34, dfp34_rhs: DecFloat34, prc: *ReturnCode) SapBool {
        return DecFloat34_LT(self, dfp34_rhs, prc);
    }
    /// This function compares two DecFloat34 numbers numerically.
    ///
    /// If dfp34_lhs  < dfp34_rhs then the function returns -1.
    /// If dfp34_lhs == dfp34_rhs then the function returns  0.
    /// If dfp34_lhs  > dfp34_rhs then the function returns  1.
    pub fn Compare(self: DecFloat34, dfp34_rhs: DecFloat34, p_rc: *ReturnCode) SapInt {
        return DecFloat34Compare(self, dfp34_rhs, p_rc);
    }
    pub fn RoundDec(self: *DecFloat34, dec: SapInt, dec_f_round: DecFRounding) ReturnCode {
        return DecFloat34RoundDec(self, dec, dec_f_round);
    }
    pub fn RoundPrec(self: *DecFloat34, prec: SapInt, dec_f_round: DecFRounding) ReturnCode {
        return DecFloat34RoundPrec(self, prec, dec_f_round);
    }
    pub fn RescaleDec(self: *DecFloat34, dec: SapInt, dec_f_round: DecFRounding) ReturnCode {
        return DecFloat34RescaleDec(self, dec, dec_f_round);
    }
    pub fn RescalePrec(self: *DecFloat34, prec: SapInt, dec_f_round: DecFRounding) ReturnCode {
        return DecFloat34RescalePrec(self, prec, dec_f_round);
    }
    pub fn IsInfinite(self: DecFloat34) SapBool {
        return DecFloat34IsInfinite(self);
    }
    pub fn IsFinite(self: DecFloat34) SapBool {
        return DecFloat34IsFinite(self);
    }
    pub fn IsNaN(self: DecFloat34) SapBool {
        return DecFloat34IsNaN(self);
    }
    pub fn Zero(self: *DecFloat34) *DecFloat34 {
        return DecFloat34Zero(self);
    }
    pub fn Ceil(self: DecFloat34, p_rc: *ReturnCode) DecFloat34 {
        return DecFloat34Ceil(self, p_rc);
    }
    pub fn Floor(self: DecFloat34, p_rc: *ReturnCode) DecFloat34 {
        return DecFloat34Floor(self, p_rc);
    }
    /// Converts a DecFloat34 number into its preferred network byte order.
    ///
    /// The preferred neutral network byte order is Big-Endian.
    pub fn ToDecFloat34Neutral(self: DecFloat34, result: ?*DecFloat34) ReturnCode {
        return DecFloat34ToDecFloat34Neutral(result, self);
    }
    /// Converts a neutral DecFloat34 number into its machine-dependent encoding (big- or little-endian).
    ///
    /// The preferred neutral network byte order is Big-Endian.
    pub fn NeutralToDecFloat34(self: DecFloat34, result: ?*DecFloat34) ReturnCode {
        return DecFloat34NeutralToDecFloat34(result, self);
    }
    /// In-place normalization of a DecFloat34 number.
    ///
    /// Cf. DecFloat34ToNormDecFloat34().
    pub fn Normalize(self: *DecFloat34) ReturnCode {
        return DecFloat34Normalize(self);
    }
    /// Converts a DecFloat34 number to a normalized DecFloat34 number.
    ///
    /// The result is stored in norm_dfp34.
    /// Trailing zeros are removed (without changing the numerical value).
    /// If the number is zero, the sign is removed.
    pub fn ToNormDecFloat34(self: DecFloat34, result: ?*DecFloat34) ReturnCode {
        return DecFloat34ToNormDecFloat34(result, self);
    }

    /// Returns the square root of a DecFloat34.
    ///
    /// The number *dfp34_res is set to the square root of dfp34, rounded if necessary, to
    /// 34 digits using the DECF_ROUND_HALF_EVEN rounding mode.
    pub fn Sqrt(self: DecFloat34, result: ?*DecFloat34) ReturnCode {
        return DecFloat34_Sqrt(result, self);
    }
    /// Exponential function for DecFloat34 numbers.
    ///
    /// The number is set to e raised to the power of rhs, rounded if necessary using
    /// the round-half-even rounding algorithm.
    ///
    /// Finite results will always be full precision and inexact, except when rhs is a zero or
    /// -Infinity (giving 1 or 0 respectively). Inexact results will almost always be correctly
    /// rounded, but may be up to 1 ulp (unit in last place) in error in rare cases.
    ///
    /// This is a mathematical function; the 10**6 restrictions on precision and range apply as
    /// described above.
    pub fn Exp(self: DecFloat34, result: ?*DecFloat34) ReturnCode {
        return DecFloat34_Exp(result, self);
    }
    /// Natural logarithm function for DecFloat34 numbers.
    ///
    /// The number is set to the natural logarithm (in base e) of rhs, rounded if necessary using
    /// the round-half-even rounding algorithm.
    ///
    /// Finite results will always be full precision and inexact, except when rhs is a zero or
    /// -Infinity (giving 1 or 0 respectively). Inexact results will almost always be correctly
    /// rounded, but may be up to 1 ulp (unit in last place) in error in rare cases.
    ///
    /// This is a mathematical function; the 10**6 restrictions on precision and range apply as
    /// described above.
    pub fn Ln(self: DecFloat34, result: ?*DecFloat34) ReturnCode {
        return DecFloat34_Ln(result, self);
    }
    /// Logarithm in base 10 function for DecFloat34 numbers.
    ///
    /// The number is set to the logarithm in base 10 of rhs, rounded if necessary using
    /// the round-half-even rounding algorithm.
    ///
    /// Finite results will always be full precision and inexact, except when rhs is a zero or
    /// -Infinity (giving 1 or 0 respectively). Inexact results will almost always be correctly
    /// rounded, but may be up to 1 ulp (unit in last place) in error in rare cases.
    ///
    /// This is a mathematical function; the 10**6 restrictions on precision and range apply as
    /// described above.
    pub fn Log10(self: DecFloat34, result: ?*DecFloat34) ReturnCode {
        return DecFloat34_Log10(result, self);
    }
    /// Returns the "next" DecFloat34 number to dfp34 in the direction of -Infinity
    ///
    ///  Returns the "next" DecFloat34 number to dfp34 in the direction of -Infinity according
    ///  to the IEEE 754r rules for "nextDown".
    ///
    pub fn NextMinus(self: DecFloat34, result: ?*DecFloat34) ReturnCode {
        return DecFloat34NextMinus(result, self);
    }
    /// Returns the "next" DecFloat34 number to dfp34 in the direction of Infinity
    ///
    ///  Returns the "next" DecFloat34 number to dfp34 in the direction of -Infinity according
    ///  to the IEEE 754r rules for "nextDown".
    pub fn NextPlus(self: DecFloat34, result: ?*DecFloat34) ReturnCode {
        return DecFloat34NextPlus(result, self);
    }
    // ==================================================
    // TO
    // ==================================================
    /// Convert DecFloat34 to String.
    ///
    /// This function converts a DecFloat34 number into a string of type SAP_UC*.
    /// The caller is responsible for the memory handling.
    pub fn ToString(self: DecFloat34, numstr: *DecFloat34Buff) ReturnCode {
        return DecFloat34ToString(self, numstr);
    }
    /// Convert 128-bit IEEE 754r decimal floating point variable to 16-byte binary sortable format and store scale information.
    ///
    /// This function converts a DecFloat34 into an SAP-proprietary format that can be sorted by memcpy.
    /// For this purpose, this function has to normalize the DecFloat34 (e.g., 1.50 -> 1.5).
    /// The scale information is stored in a separate variable.
    /// (In the ABAP runtime, use ab_DecFloat34ToDecFloat34Raw().)
    pub fn ToDecFloat34Raw(self: DecFloat34, scale: *SapShort, dfp34raw_res: *DecFloat34Raw) ReturnCode {
        return DecFloat34ToDecFloat34Raw(dfp34raw_res, scale, self);
    }
    ///  Same as DecFloat34ToDecFloat34Raw
    pub fn ToDecFloat34RawDB(self: DecFloat34, scale: *SapShort, dfp34raw_res: *DecFloat34Raw) ReturnCode {
        return DecFloat34ToDecFloat34RawDB(dfp34raw_res, scale, self);
    }
    /// Convert 128-bit IEEE 754r decimal floating point variable to 16-byte binary sortable format without scale information.
    ///
    /// This function converts a DecFloat34 into an SAP-proprietary format that can be sorted by memcpy.
    /// For this purpose, this function has to normalize the DecFloat34 (e.g., 1.50 -> 1.5).
    /// (In the ABAP runtime, you may use ab_NormDecFloat34ToDecFloat34Raw().)
    pub fn NormToDecFloat34Raw(self: DecFloat34, dfp34raw_res: *DecFloat34Raw) ReturnCode {
        return NormDecFloat34ToDecFloat34Raw(dfp34raw_res, self);
    }
    ///  Get the exponent of a Decfloat number.
    ///
    /// These functions deliver the exponent that occurs if the number is written as
    ///     <integer>/// 10 ^ <exponent>.
    /// Example: 1234.50 has the exponent -2 (since the representation is 123450E-2).
    /// For NaNs and Infinities, the result is undefined.
    ///
    /// Note: CL_ABAP_MATH=>GET_SCALE returns the exponent with reversed sign.
    pub fn GetExponent(self: DecFloat34, exponent: *SapInt) ReturnCode {
        return DecFloat34GetExponent(exponent, self);
    }
    pub fn GetNumOfDigits(self: DecFloat34, digits: *SapInt) ReturnCode {
        return DecFloat34GetNumOfDigits(digits, self);
    }
    ///    Convert DecFloat34 to 4-byte or 8-byte integer.
    /// (In the ABAP runtime, use ab_decf34ToI() or ab_decf34ToI8().)
    pub fn ToSapInt(self: DecFloat34, i: *SapInt) ReturnCode {
        return DecFloat34ToSAP_INT(i, self);
    }
    ///    Convert DecFloat34 to 8-byte integer.
    /// (In the ABAP runtime, use ab_decf34ToI() or ab_decf34ToI8().)
    pub fn ToSapLLong(self: DecFloat34, i: *SapLLong) ReturnCode {
        return DecFloat34ToSAP_LLONG(i, self);
    }
    ///    Convert DecFloat to 8-byte binary float.
    /// The rounding behavior is platform dependent.
    /// (In the ABAP runtime, consider using ab_decf16ToF() or ab_decf34ToF().)
    pub fn DecFloat34ToSapDouble(self: DecFloat34, d: *SapDouble) ReturnCode {
        return DecFloat34ToSAP_DOUBLE(d, self);
    }
    /// Convert to ABAP type P (BCD).
    ///
    /// Convert a 128-bit IEEE 754r decimal floating point variable into the
    /// ABAP type P.
    pub fn ToBCD(
        self: DecFloat34,
        bcd_res: [*]SapRaw,
        ///Length of BCD buffer in bytes
        length: c_int,
        dec_places: c_int,
    ) ReturnCode {
        return DecFloat34ToBCD(bcd_res, self, length, dec_places);
    }
    ///  Convert DecFloat34 to DecFloat16
    pub fn ToDecFloat16(self: DecFloat34, dfp16_res: ?*DecFloat16) ReturnCode {
        return DecFloat34ToDecFloat16(dfp16_res, self);
    }

    // ==================================================
    // FROM
    // ==================================================
    /// Convert from ABAP type P (BCD) to 128-bit IEEE 754r
    ///
    /// Convert a BCD number (ABAP type P) into a 128-bit IEEE 754r decimal
    /// floating point variable.
    pub fn FromBCD(
        bcd: [*]SapRaw,
        /// Length of BCD number in bytes
        length: c_int,
        dec_places: c_int,
        result: ?*DecFloat34,
    ) ReturnCode {
        return BCDToDecFloat34(result, bcd, length, dec_places);
    }
    /// Convert 16-byte binary sortable format into 128-bit IEEE 754r decimal floating point variable.
    ///
    /// In order set the scale information of the IEEE 754r variable, this function needs
    /// additional information about the scale.
    /// In ABAP, this functionality is available as CL_ABAP_DECFLOAT_RAW=>DECFR34_TO_DECF34.
    pub fn FromDecFloat34Raw(
        /// A 16-byte sortable decimal floating point variable.
        dfp16raw: [*]SapRaw,
        /// The desired scale. If scale == -32768, the result will be
        /// normalized, e.g. 1.5 rather than 1.50. Invalid values for
        /// scale will be treated graciously
        scale: SapShort,
        result: ?*DecFloat34,
    ) ReturnCode {
        return DecFloat34RawToDecFloat34(result, dfp16raw, scale);
    }
    ///  Same as DecFloat34RawToDecFloat34
    pub fn FromDecFloat34RawToDecFloat34DB(dfp34raw: [*]SapRaw, scale: SapShort, result: ?*DecFloat34) ReturnCode {
        return DecFloat34RawToDecFloat34DB(result, dfp34raw, scale);
    }
    /// Convert 16-byte binary sortable format into 128-bit IEEE 754r decimal floating point variable.
    ///
    /// The result will be normalized, e.g., 1.5 rather than 1.50.
    pub fn FromDecFloat34RawToNormDecFloat34(dfp34raw: [*]SapRaw, result: ?*DecFloat34) ReturnCode {
        return DecFloat34RawToNormDecFloat34(result, dfp34raw);
    }
    /// Convert 8-byte integer to DecFloat16.
    /// (In the ABAP runtime, use ab_i8ToDecf16().)
    pub fn FromSapLLong(l: SapLLong, result: ?*DecFloat34) ReturnCode {
        return SAP_LLONGToDecFloat34(result, l);
    }
    /// Convert 4-byte or 8-byte integer to DecFloat34.
    /// (In the ABAP runtime, use ab_iToDecf34() or ab_i8ToDecf34().)
    pub fn FromSapInt(i: SapInt, result: ?*DecFloat34) ReturnCode {
        return SAP_INTToDecFloat34(result, i);
    }
    /// Convert 8-byte binary float to DecFloat.
    /// The rounding behavior is platform dependent.
    ///
    /// ATTENTION: The behavior for NaNs and Infinities is platform dependent.
    /// (In the ABAP runtime, consider using ab_fToDecf16() or ab_fToDecf34().)
    pub fn FromSapDouble(i: SapDouble, result: ?*DecFloat34) ReturnCode {
        return SAP_DOUBLEToDecFloat34(result, i);
    }
    /// Convert DecFloat34 to String.
    ///
    /// This function converts a DecFloat34 number into a string of type SAP_UC*.
    /// The caller is responsible for the memory handling.
    pub fn FromString(numstr: *const SapUc, dfp34: *DecFloat34) ReturnCode {
        return StringToDecFloat34(numstr, dfp34);
    }
    pub fn FromStrDiv(divident: *const SapUTF8, divisor: *const SapUTF8, allocateFn: Decfl34AllocateCallBack, result: ?*DecFloat34) ReturnCode {
        return DecFloat34StrDiv(divident, divisor, allocateFn, result);
    }
    /// Minimum IEEE 754r value = -Infinity
    pub fn FromMin() DecFloat34 {
        return GetMinDecFloat34();
    }
};

// ==================================================
// Functions signatures
// ==================================================
pub const Decfl34AllocateCallBack = ?*const fn (SapULLong) ?*anyopaque;

// ==================================================
// Functions
// ==================================================
/// Initialize a flag that indicates whether the database supports
/// decimal floating-point types or just the SAP-proprietary types
/// DF16_DEC, DF34_DEC (fixed-point on the DB, rounding necessary), and
/// DF16_RAW, DF34_RAW (binary sortable raw fields on the DB).
/// The flag is evaluated in very few special functions only.
pub extern fn DecFloat_InitializeDBmode(decfDBmode: Mode) void;

/// Decimal Floating Point Shared Library Initialization
///
/// This function loads the decNumber shared library libicudecnumber$(SHLIB_EXT)
/// and initializes the global decimal floating point environment.
/// This function does nothing if the static library sapdecflib is used.
pub extern fn InitDecFloatLib() ReturnCode;

/// Returns the result of raising the base to the power of the exponent.
///
/// The exponent can be a fractional number.
pub extern fn DecFloat34_fPow(dfp34_res: ?*DecFloat34, base: DecFloat34, exponent: DecFloat34) ReturnCode;
