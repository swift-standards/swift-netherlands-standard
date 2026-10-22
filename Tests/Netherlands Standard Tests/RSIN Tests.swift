import Testing

import Netherlands_Standard

extension Netherlands.RSIN {
    @Suite struct Test {
        @Suite struct Unit {}
        @Suite struct `Edge Case` {}
    }
}

extension Netherlands.RSIN.Test.Unit {

    @Test(arguments: ["111222333", "123456782"])
    func `numbers that pass the eleven test are accepted`(text: String) throws {
        #expect(try Netherlands.RSIN(text).value == text)
    }

    @Test
    func `numbers that fail the eleven test are refused`() {
        #expect(throws: Netherlands.RSIN.Error.invalidChecksum) {
            try Netherlands.RSIN("123456789")
        }
    }
}

extension Netherlands.RSIN.Test.`Edge Case` {

    @Test
    func `the wrong number of digits is refused`() {
        #expect(throws: Netherlands.RSIN.Error.invalidLength(0)) {
            try Netherlands.RSIN("")
        }
        #expect(throws: Netherlands.RSIN.Error.invalidCharacter(" ")) {
            try Netherlands.RSIN("111 222 333")
        }
    }

    @Test
    func `nine zeros, the placeholder forms print, are refused`() {
        #expect(throws: Netherlands.RSIN.Error.invalidChecksum) {
            try Netherlands.RSIN("000000000")
        }
    }
}
