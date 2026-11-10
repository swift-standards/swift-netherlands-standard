extension Netherlands.BWB {
    public enum Error: Swift::Error, Sendable, Equatable {
        case invalidLength(Int)
        case invalidPrefix(String)
        case invalidCharacter
    }
}
