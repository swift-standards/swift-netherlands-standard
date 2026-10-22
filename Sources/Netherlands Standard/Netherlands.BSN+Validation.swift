extension Netherlands.BSN {

    /// Validates `text` as nine digits that pass the eleven test.
    public init(_ text: some StringProtocol) throws(Error) {
        let digits: String.UnicodeScalarView
        do throws(Netherlands.Digits.Error) {
            digits = try Netherlands.Digits.validate(text, count: 9)
        } catch {
            switch error {
            case .invalidLength(let count): throw .invalidLength(count)
            case .invalidCharacter(let scalar): throw .invalidCharacter(scalar)
            }
        }
        guard Netherlands.Elfproef.isSatisfied(by: digits) else {
            throw .invalidChecksum
        }
        self.value = String(digits)
    }
}

extension Netherlands.BSN: CustomStringConvertible {

    public var description: String { value }
}
