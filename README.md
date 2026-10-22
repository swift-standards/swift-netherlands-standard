# swift-netherlands-standard

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Swift implementation of identifiers the Dutch state issues.

## Overview

Each type has one initializer, and it validates:

| Type | Identifier | Check |
|---|---|---|
| `Netherlands.BSN` | burgerservicenummer | nine digits, eleven test |
| `Netherlands.RSIN` | RSIN | nine digits, eleven test |
| `Netherlands.KVK.Number` | KvK-nummer | eight digits (no check digit) |
| `Netherlands.BTW.Identification` | btw-identificatienummer | `NL` + nine digits + `B` + two digits; eleven test or ISO 7064 MOD 97-10 |

```swift
import Netherlands_Standard

let bsn = try Netherlands.BSN("111222333")
let btw = try Netherlands.BTW.Identification("NL000099998B57")
```

The eleven test weights the nine digits 9, 8, 7, 6, 5, 4, 3, 2 and −1 and requires a multiple of 11. Nine zeros satisfy that arithmetic but are the placeholder forms print, so they are refused, also in a btw-identificatienummer, where `NL000000000B73` would satisfy MOD 97-10.

The Belastingdienst issues two kinds of btw-identificatienummer: numbers built on the holder's fiscal number (RSIN), whose nine digits pass the eleven test, and numbers issued to sole proprietors since 2020, whose whole text passes ISO 7064 MOD 97-10 with letters converted as in an IBAN. A number passing either is accepted.

The KvK-nummer carries no check digit, so its validation is structural. It is distinct from the twelve-digit vestigingsnummer.

A valid number is well-formed; it is not necessarily issued.

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
