extension Netherlands.KvK.Number {

    /// Validates `text` as eight digits.
    public init(_ text: some StringProtocol) throws(Error) {
        do throws(Netherlands.Digits.Error) {
            self.value = String(try Netherlands.Digits.validate(text, count: 8))
        } catch {
            switch error {
            case .invalidLength(let count): throw .invalidLength(count)
            case .invalidCharacter(let scalar): throw .invalidCharacter(scalar)
            }
        }
    }
}

extension Netherlands.KvK.Number: CustomStringConvertible {

    public var description: String { value }
}
