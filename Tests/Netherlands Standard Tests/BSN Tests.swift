import Netherlands_Standard
import Testing

extension Netherlands.BSN {
    @Suite struct Test {
        @Suite struct Unit {}
        @Suite struct `Edge Case` {}
    }
}

extension Netherlands.BSN.Test.Unit {

    @Test(arguments: ["111222333", "123456782", "999999990"])
    func `numbers that pass the eleven test are accepted`(text: String) throws {
        #expect(try Netherlands.BSN(text).value == text)
    }

    @Test(arguments: ["123456789", "111222334", "123456728"])
    func `numbers that fail the eleven test are refused`(text: String) {
        #expect(throws: Netherlands.BSN.Error.invalidChecksum) {
            try Netherlands.BSN(text)
        }
    }
}

extension Netherlands.BSN.Test.`Edge Case` {

    @Test
    func `eight-digit numbers need their leading zero`() {
        #expect(throws: Netherlands.BSN.Error.invalidLength(8)) {
            try Netherlands.BSN("11222333")
        }
        #expect(throws: Netherlands.BSN.Error.invalidLength(10)) {
            try Netherlands.BSN("1112223330")
        }
    }

    @Test
    func `separators and letters are refused`() {
        #expect(throws: Netherlands.BSN.Error.invalidCharacter) {
            try Netherlands.BSN("1112.22.333")
        }
        #expect(throws: Netherlands.BSN.Error.invalidCharacter) {
            try Netherlands.BSN("11122233O")
        }
    }

    @Test
    func `non-ASCII digits are refused`() {
        #expect(throws: Netherlands.BSN.Error.invalidCharacter) {
            try Netherlands.BSN("11122233١")
        }
    }

    @Test
    func `nine zeros, the placeholder forms print, are refused`() {
        #expect(throws: Netherlands.BSN.Error.invalidChecksum) {
            try Netherlands.BSN("000000000")
        }
    }
}
