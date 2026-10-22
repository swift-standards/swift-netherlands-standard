extension Netherlands.BTW.Identification {
    public enum Error: Swift::Error, Sendable, Equatable {
        case invalidLength(Int)
        case invalidFormat
        case invalidChecksum
    }
}
