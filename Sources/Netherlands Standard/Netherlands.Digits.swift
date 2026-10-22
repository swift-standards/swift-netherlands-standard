extension Netherlands {

    /// The all-digit form the BSN, RSIN, and KvK-nummer share: a fixed number
    /// of scalars `0`–`9`.
    internal enum Digits {}
}

extension Netherlands.Digits {

    /// The scalars of `text`, checked to be exactly `count` digits `0`–`9`.
    internal static func validate(
        _ text: some StringProtocol,
        count: Int
    ) throws(Error) -> String.UnicodeScalarView {
        let scalars = text.unicodeScalars
        for scalar in scalars where !("0"..."9").contains(scalar) {
            throw .invalidCharacter(scalar)
        }
        guard scalars.count == count else {
            throw .invalidLength(scalars.count)
        }
        return String.UnicodeScalarView(scalars)
    }
}
