extension Netherlands.BSN {
    public init(_ text: some StringProtocol) throws(Netherlands.BSN.Error) {
        let value: String
        do throws(Netherlands.Digits.Error) {
            value = try Netherlands.Digits.validate(text, count: 9)
        } catch {
            switch error {
            case .invalidLength(let count):
                throw .invalidLength(count)

            case .invalidCharacter:
                throw .invalidCharacter
            }
        }
        guard Netherlands.Elfproef.isSatisfied(by: value.utf8) else {
            throw .invalidChecksum
        }
        self.value = value
    }
}

extension Netherlands.BSN: CustomStringConvertible {
    public var description: String { value }
}
