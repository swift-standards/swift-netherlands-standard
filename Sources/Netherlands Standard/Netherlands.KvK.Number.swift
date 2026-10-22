extension Netherlands.KvK {

    /// A KvK-nummer: the number the Handelsregister assigns to a registered
    /// enterprise or legal entity.
    ///
    /// A KvK-nummer is eight digits, leading zeros included. It carries no
    /// check digit, so validation is structural only. It is distinct from the
    /// twelve-digit vestigingsnummer that identifies one establishment.
    public struct Number: Sendable, Hashable {

        /// The eight digits.
        public let value: String
    }
}
