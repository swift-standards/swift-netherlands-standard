extension Netherlands.RSIN {
    public enum Error: Swift::Error, Sendable, Equatable {
        case invalidLength(Int)
        case invalidCharacter
        case invalidChecksum
    }
}
