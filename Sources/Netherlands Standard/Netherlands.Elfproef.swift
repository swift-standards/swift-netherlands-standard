extension Netherlands {

    /// The eleven test (elfproef) on nine decimal digits.
    ///
    /// The digits, weighted 9, 8, 7, 6, 5, 4, 3, 2 and −1 from left to right,
    /// must sum to a multiple of 11. The burgerservicenummer, the RSIN, and
    /// the fiscal number inside a btw-identificatienummer all use it.
    ///
    /// Nine zeros sum to zero, a multiple of 11, yet are never issued: they
    /// are the placeholder forms and templates print. The test refuses them.
    internal enum Elfproef {}
}

extension Netherlands.Elfproef {

    /// Whether `digits`, nine scalars `0`–`9`, pass the eleven test.
    internal static func isSatisfied(by digits: some Collection<Unicode.Scalar>) -> Bool {
        let weights = [9, 8, 7, 6, 5, 4, 3, 2, -1]
        let sum = zip(digits, weights).map { digit, weight in
            Int(digit.value - ("0" as Unicode.Scalar).value) * weight
        }.reduce(0, +)
        return digits.count == weights.count && sum != 0 && sum % 11 == 0
    }
}
