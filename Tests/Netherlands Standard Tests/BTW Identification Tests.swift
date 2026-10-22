import Testing

import Netherlands_Standard

extension Netherlands.BTW.Identification {
    @Suite struct Test {
        @Suite struct Unit {}
        @Suite struct `Edge Case` {}
    }
}

extension Netherlands.BTW.Identification.Test.Unit {

    @Test
    func `the Belastingdienst's sole-proprietor example passes MOD 97-10`() throws {
        #expect(try Netherlands.BTW.Identification("NL000099998B57").value == "NL000099998B57")
    }

    @Test(arguments: ["NL123456782B01", "NL111222333B01"])
    func `numbers whose fiscal number passes the eleven test are accepted`(text: String) throws {
        #expect(try Netherlands.BTW.Identification(text).value == text)
    }

    @Test(arguments: ["NL123456789B01", "NL000099998B58"])
    func `numbers passing neither check are refused`(text: String) {
        #expect(throws: Netherlands.BTW.Identification.Error.invalidChecksum) {
            try Netherlands.BTW.Identification(text)
        }
    }
}

extension Netherlands.BTW.Identification.Test.`Edge Case` {

    @Test
    func `the fiscal number alone is refused`() {
        #expect(throws: Netherlands.BTW.Identification.Error.invalidLength(9)) {
            try Netherlands.BTW.Identification("123456782")
        }
    }

    @Test(arguments: ["BE123456782B01", "nl123456782B01", "NL123456782b01", "NL12345678XB01", "NL123456782B0X"])
    func `text outside NL, nine digits, B, two digits is refused`(text: String) {
        #expect(throws: Netherlands.BTW.Identification.Error.invalidFormat) {
            try Netherlands.BTW.Identification(text)
        }
    }

    @Test
    func `spaces are refused`() {
        #expect(throws: Netherlands.BTW.Identification.Error.invalidLength(16)) {
            try Netherlands.BTW.Identification("NL 123456782 B01")
        }
    }

    @Test(arguments: ["NL000000000B00", "NL000000000B73"])
    func `nine zero digits are refused even where MOD 97-10 holds`(text: String) {
        #expect(throws: Netherlands.BTW.Identification.Error.invalidChecksum) {
            try Netherlands.BTW.Identification(text)
        }
    }
}
