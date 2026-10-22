extension Netherlands {
    internal enum Digits {}
}

extension Netherlands.Digits {
    internal static func validate(
        _ text: some StringProtocol,
        count: Int
    ) throws(Netherlands.Digits.Error) -> String {
        let bytes = text.utf8
        guard bytes.allSatisfy((UInt8(ascii: "0")...UInt8(ascii: "9")).contains) else {
            throw .invalidCharacter
        }
        guard bytes.count == count else {
            throw .invalidLength(bytes.count)
        }
        return String(text)
    }
}
