# swift-netherlands-standard

Use this package when you take a Dutch identifier as text and need to know it is well-formed before you store or send it. Start from `Netherlands.BSN` for a citizen service number, `Netherlands.RSIN` for a legal entity's fiscal number, `Netherlands.KVK.Number` for a Chamber of Commerce number and `Netherlands.BTW.Identification` for a VAT number. A value that passes is well-formed. It is not necessarily issued.

## Laws

- Text is never cleaned up. Spaces, dots, lowercase letters and missing leading zeros are all refused, and `value` holds the text exactly as given.
- Only ASCII digits count as digits. Digits from other scripts, such as Arabic-Indic ones, are refused.
- For `Netherlands.BSN`, `Netherlands.RSIN` and `Netherlands.KVK.Number`, characters are checked before length. Text with a separator fails as an invalid character even when its length is also wrong.
- `Netherlands.BSN` and `Netherlands.RSIN` take exactly nine digits that pass the eleven test: the digits weighted 9, 8, 7, 6, 5, 4, 3, 2 and -1 must sum to a multiple of 11. Nine zeros meet that arithmetic but are the placeholder printed on forms, so they are refused as a checksum failure.
- `Netherlands.KVK.Number` takes exactly eight digits. It has no check digit, so any eight digits pass. The twelve-digit vestigingsnummer is refused.
- `Netherlands.BTW.Identification` takes exactly 14 characters: uppercase `NL`, nine digits, uppercase `B`, two digits. Length is checked before shape.
- A `Netherlands.BTW.Identification` is accepted if its nine digits pass the eleven test, as numbers built on an RSIN do, or if the whole text passes ISO 7064 MOD 97-10 with letters converted as in an IBAN, as sole-proprietor numbers issued since 2020 do. Under the eleven test the last two digits are not checked.
- Nine zero digits are refused in a `Netherlands.BTW.Identification` too, even where MOD 97-10 would hold, as in `NL000000000B73`.
