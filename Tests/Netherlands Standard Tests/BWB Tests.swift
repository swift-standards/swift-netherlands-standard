import Netherlands_Standard
import Testing

enum `Netherlands.BWB Tests` {}

extension `Netherlands.BWB Tests` {
    @Suite struct Test {
        @Suite struct Unit {}
        @Suite struct `Edge Case` {}
    }
}

extension `Netherlands.BWB Tests`.Test.Unit {

    @Test(arguments: ["BWBR0003045", "BWBR0001840", "BWBR0001854"])
    func `a national regulation is BWBR and seven digits`(text: String) throws {
        let bwb = try Netherlands.BWB(text)
        #expect(bwb.value == text)
        #expect(bwb.kind == .regulation)
        #expect(bwb.description == text)
    }

    @Test
    func `a treaty is BWBV and seven digits`() throws {
        #expect(try Netherlands.BWB("BWBV0001000").kind == .treaty)
        #expect(try Netherlands.BWB("BWBV0005225").value == "BWBV0005225")
    }
}

extension `Netherlands.BWB Tests`.Test.`Edge Case` {

    @Test
    func `length is checked before shape`() {
        #expect(throws: Netherlands.BWB.Error.invalidLength(10)) { try Netherlands.BWB("BWBR000304") }
        #expect(throws: Netherlands.BWB.Error.invalidLength(12)) { try Netherlands.BWB("BWBR 0003045") }
        #expect(throws: Netherlands.BWB.Error.invalidLength(8)) { try Netherlands.BWB("BWBW5113") }
        #expect(throws: Netherlands.BWB.Error.invalidLength(0)) { try Netherlands.BWB("") }
    }

    @Test
    func `the prefix is uppercase BWBR or BWBV`() {
        #expect(throws: Netherlands.BWB.Error.invalidPrefix("bwbr")) { try Netherlands.BWB("bwbr0003045") }
        #expect(throws: Netherlands.BWB.Error.invalidPrefix("BWBX")) { try Netherlands.BWB("BWBX0003045") }
        #expect(throws: Netherlands.BWB.Error.invalidPrefix("CVDR")) { try Netherlands.BWB("CVDR0003045") }
    }

    @Test
    func `the number is seven ASCII digits`() {
        #expect(throws: Netherlands.BWB.Error.invalidCharacter) { try Netherlands.BWB("BWBR000304A") }
        #expect(throws: Netherlands.BWB.Error.invalidCharacter) { try Netherlands.BWB("BWBR-003045") }
        #expect(throws: Netherlands.BWB.Error.invalidLength(18)) { try Netherlands.BWB("BWBR٠٠٠٣٠٤٥") }
    }
}
