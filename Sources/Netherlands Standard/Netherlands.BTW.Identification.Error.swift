extension Netherlands.BTW.Identification {

    public enum Error: Swift.Error, Sendable, Equatable {

        /// The text is not fourteen characters long.
        case invalidLength(Int)

        /// The text is not `NL`, nine digits, `B`, and two digits.
        case invalidFormat

        /// The number passes neither the eleven test nor MOD 97-10, or its nine
        /// digits are all zero.
        case invalidChecksum
    }
}
