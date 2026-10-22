import ISO_7064

extension Netherlands.BTW.Identification {
    public init(_ text: some StringProtocol) throws(Netherlands.BTW.Identification.Error) {
        let bytes = Array(text.utf8)
        guard bytes.count == 14 else {
            throw .invalidLength(bytes.count)
        }
        let digit = UInt8(ascii: "0")...UInt8(ascii: "9")
        guard
            bytes[0] == UInt8(ascii: "N"), bytes[1] == UInt8(ascii: "L"), bytes[11] == UInt8(ascii: "B"),
            bytes[2...10].allSatisfy(digit.contains),
            bytes[12...13].allSatisfy(digit.contains)
        else {
            throw .invalidFormat
        }
        let fiscal = bytes[2...10]
        guard !fiscal.allSatisfy({ $0 == UInt8(ascii: "0") }) else {
            throw .invalidChecksum
        }
        let value = String(text)
        guard Netherlands.Elfproef.isSatisfied(by: fiscal) || ISO_7064.MOD_97_10.isValid(value) else {
            throw .invalidChecksum
        }
        self.value = value
    }
}

extension Netherlands.BTW.Identification: CustomStringConvertible {
    public var description: String { value }
}
