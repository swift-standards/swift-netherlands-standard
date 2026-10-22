extension Netherlands {

    /// A burgerservicenummer: the citizen service number, as the Wet algemene
    /// bepalingen burgerservicenummer establishes it.
    ///
    /// A BSN is nine digits that pass the eleven test. Older eight-digit
    /// numbers are written with a leading zero.
    ///
    /// The only way to obtain a value is the validating initializer. A valid
    /// number is not necessarily issued.
    public struct BSN: Sendable, Hashable {

        /// The nine digits.
        public let value: String
    }
}
