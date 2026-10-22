extension Netherlands.BTW {

    /// A btw-identificatienummer: the Dutch VAT identification number.
    ///
    /// The number is `NL`, nine digits, `B`, and two digits, as in
    /// `NL000099998B57`. The Belastingdienst issues two kinds:
    ///
    /// - numbers whose nine digits are the holder's fiscal number (RSIN), which
    ///   pass the eleven test;
    /// - numbers issued to sole proprietors from 2020, whose whole text passes
    ///   ISO 7064 MOD 97-10 with the letters converted as in an IBAN.
    ///
    /// A number is valid when it passes either check. Nine zero digits are the
    /// placeholder forms print and are refused, though `NL000000000B73`
    /// satisfies MOD 97-10. The only way to obtain a
    /// value is the validating initializer. A valid number is not necessarily
    /// issued.
    public struct Identification: Sendable, Hashable {

        /// The fourteen characters, `NL` through the two-digit suffix.
        public let value: String
    }
}
