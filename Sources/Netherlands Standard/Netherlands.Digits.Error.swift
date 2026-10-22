extension Netherlands.Digits {

    internal enum Error: Swift.Error, Sendable, Equatable {

        /// The text has a different number of characters than required.
        case invalidLength(Int)

        /// The text contains a character other than `0`–`9`.
        case invalidCharacter(Unicode.Scalar)
    }
}
