import Netherlands_Standard
import Testing

extension Netherlands.KVK.Number {
    @Suite struct Test {
        @Suite struct Unit {}
        @Suite struct `Edge Case` {}
    }
}

extension Netherlands.KVK.Number.Test.Unit {

    @Test(arguments: ["69599084", "68750110", "01234567"])
    func `eight digits are accepted`(text: String) throws {
        #expect(try Netherlands.KVK.Number(text).value == text)
    }
}

extension Netherlands.KVK.Number.Test.`Edge Case` {

    @Test
    func `seven digits and the twelve-digit vestigingsnummer are refused`() {
        #expect(throws: Netherlands.KVK.Number.Error.invalidLength(7)) {
            try Netherlands.KVK.Number("6959908")
        }
        #expect(throws: Netherlands.KVK.Number.Error.invalidLength(12)) {
            try Netherlands.KVK.Number("000012345678")
        }
    }

    @Test
    func `letters and separators are refused`() {
        #expect(throws: Netherlands.KVK.Number.Error.invalidCharacter) {
            try Netherlands.KVK.Number("KvK69599084")
        }
        #expect(throws: Netherlands.KVK.Number.Error.invalidCharacter) {
            try Netherlands.KVK.Number("6959 9084")
        }
    }
}
