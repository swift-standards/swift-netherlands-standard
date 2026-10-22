# swift-netherlands-standard

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Swift implementation of identifiers the Dutch state issues.

## Overview

Each type has one initializer, and it validates:

| Type | Identifier | Check |
|---|---|---|
| `Netherlands.BSN` | burgerservicenummer | nine digits, eleven test |
| `Netherlands.RSIN` | RSIN | nine digits, eleven test |
| `Netherlands.KvK.Number` | KvK-nummer | eight digits (no check digit) |
| `Netherlands.BTW.Identification` | btw-identificatienummer | `NL` + nine digits + `B` + two digits; eleven test or ISO 7064 MOD 97-10 |

```swift
import Netherlands_Standard

let bsn = try Netherlands.BSN("111222333")
let btw = try Netherlands.BTW.Identification("NL000099998B57")
```

A valid number is well-formed; it is not necessarily issued.

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
