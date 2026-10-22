extension Netherlands {

    /// A rechtspersonen en samenwerkingsverbanden informatienummer (RSIN): the
    /// number the Handelsregister assigns to a legal entity or partnership.
    ///
    /// An RSIN is nine digits that pass the eleven test, drawn from the same
    /// number range as the burgerservicenummer.
    ///
    /// The only way to obtain a value is the validating initializer. A valid
    /// number is not necessarily issued.
    public struct RSIN: Sendable, Hashable {

        /// The nine digits.
        public let value: String
    }
}
