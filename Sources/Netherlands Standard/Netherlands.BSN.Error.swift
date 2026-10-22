extension Netherlands.BSN {

    public enum Error: Swift.Error, Sendable, Equatable {

        /// The text is not nine characters long.
        case invalidLength(Int)

        /// The text contains a character other than `0`–`9`.
        case invalidCharacter(Unicode.Scalar)

        /// The digits fail the eleven test.
        case invalidChecksum
    }
}
