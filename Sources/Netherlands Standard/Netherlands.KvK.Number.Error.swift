extension Netherlands.KvK.Number {

    public enum Error: Swift.Error, Sendable, Equatable {

        /// The text is not eight characters long.
        case invalidLength(Int)

        /// The text contains a character other than `0`–`9`.
        case invalidCharacter(Unicode.Scalar)
    }
}
