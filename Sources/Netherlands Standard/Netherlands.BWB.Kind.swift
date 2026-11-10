extension Netherlands.BWB {
    public enum Kind: Sendable, Hashable, CaseIterable {
        case regulation
        case treaty
    }
}

extension Netherlands.BWB.Kind {
    public var letter: Character {
        switch self {
        case .regulation: "R"
        case .treaty: "V"
        }
    }
}
