extension Netherlands.Digits {
    internal enum Error: Swift::Error, Sendable, Equatable {
        case invalidLength(Int)
        case invalidCharacter
    }
}
