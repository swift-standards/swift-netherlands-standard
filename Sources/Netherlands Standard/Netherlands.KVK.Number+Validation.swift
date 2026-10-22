extension Netherlands.KVK.Number {
    public init(_ text: some StringProtocol) throws(Netherlands.KVK.Number.Error) {
        do throws(Netherlands.Digits.Error) {
            self.value = try Netherlands.Digits.validate(text, count: 8)
        } catch {
            switch error {
            case .invalidLength(let count):
                throw .invalidLength(count)

            case .invalidCharacter:
                throw .invalidCharacter
            }
        }
    }
}

extension Netherlands.KVK.Number: CustomStringConvertible {
    public var description: String { value }
}
