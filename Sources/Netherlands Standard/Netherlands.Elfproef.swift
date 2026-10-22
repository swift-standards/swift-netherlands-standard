extension Netherlands {
    internal enum Elfproef {}
}

extension Netherlands.Elfproef {
    internal static func isSatisfied(by digits: some Swift::Collection<UInt8>) -> Bool {
        let weights = [9, 8, 7, 6, 5, 4, 3, 2, -1]
        let sum = zip(digits, weights).map { digit, weight in
            Int(digit - UInt8(ascii: "0")) * weight
        }.reduce(0, +)
        return digits.count == weights.count && sum != 0 && sum % 11 == 0
    }
}
