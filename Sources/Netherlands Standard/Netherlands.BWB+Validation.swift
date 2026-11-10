extension Netherlands.BWB {
    public init(_ text: some StringProtocol) throws(Netherlands.BWB.Error) {
        let bytes = Array(text.utf8)
        guard bytes.count == 11 else {
            throw .invalidLength(bytes.count)
        }
        let prefix = String(decoding: bytes[0..<4], as: UTF8.self)
        guard let kind = Netherlands.BWB.Kind.allCases.first(where: { "BWB" + String($0.letter) == prefix }) else {
            throw .invalidPrefix(prefix)
        }
        guard bytes[4...].allSatisfy((UInt8(ascii: "0")...UInt8(ascii: "9")).contains) else {
            throw .invalidCharacter
        }
        self.value = String(text)
        self.kind = kind
    }
}

extension Netherlands.BWB: CustomStringConvertible {
    public var description: String { value }
}
