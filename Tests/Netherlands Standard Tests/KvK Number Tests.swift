import Testing

import Netherlands_Standard

extension Netherlands.KvK.Number {
    @Suite struct Test {
        @Suite struct Unit {}
        @Suite struct `Edge Case` {}
    }
}

extension Netherlands.KvK.Number.Test.Unit {

    @Test(arguments: ["69599084", "68750110", "01234567"])
    func `eight digits are accepted`(text: String) throws {
        #expect(try Netherlands.KvK.Number(text).value == text)
    }
}

extension Netherlands.KvK.Number.Test.`Edge Case` {

    @Test
    func `seven digits and the twelve-digit vestigingsnummer are refused`() {
        #expect(throws: Netherlands.KvK.Number.Error.invalidLength(7)) {
            try Netherlands.KvK.Number("6959908")
        }
        #expect(throws: Netherlands.KvK.Number.Error.invalidLength(12)) {
            try Netherlands.KvK.Number("000012345678")
        }
    }

    @Test
    func `letters and separators are refused`() {
        #expect(throws: Netherlands.KvK.Number.Error.invalidCharacter("K")) {
            try Netherlands.KvK.Number("KvK69599084")
        }
        #expect(throws: Netherlands.KvK.Number.Error.invalidCharacter(" ")) {
            try Netherlands.KvK.Number("6959 9084")
        }
    }
}
