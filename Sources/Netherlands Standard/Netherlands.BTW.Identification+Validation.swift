import ISO_7064

extension Netherlands.BTW.Identification {

    /// Validates `text` as `NL`, nine digits, `B`, and two digits that pass
    /// the eleven test or MOD 97-10.
    public init(_ text: some StringProtocol) throws(Error) {
        let scalars = Array(text.unicodeScalars)
        guard scalars.count == 14 else {
            throw .invalidLength(scalars.count)
        }
        let digits = ("0" as Unicode.Scalar)..."9"
        guard
            scalars[0] == "N", scalars[1] == "L", scalars[11] == "B",
            scalars[2...10].allSatisfy(digits.contains),
            scalars[12...13].allSatisfy(digits.contains)
        else {
            throw .invalidFormat
        }
        let value = String(text)
        guard !scalars[2...10].allSatisfy({ $0 == "0" }) else {
            throw .invalidChecksum
        }
        guard Netherlands.Elfproef.isSatisfied(by: scalars[2...10]) || ISO_7064.MOD_97_10.isValid(value) else {
            throw .invalidChecksum
        }
        self.value = value
    }
}

extension Netherlands.BTW.Identification: CustomStringConvertible {

    public var description: String { value }
}
