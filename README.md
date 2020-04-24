# Tomi

Tomi is a Crystal library which provides a unified wallet/address generation API for a variety of crypto currencies.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     tomi:
       github: watzon/tomi
   ```

2. Run `shards install`

## Usage

```crystal
require "tomi"

wallet = Tomi::Wallet::BTC.new

puts wallet.private_key
# => e13e9bc64a0e636b330c188be88227862c4ca515b1081595ee6ff5796e7e1cb2

puts wallet.public_key
# => 48a5558d4a6a29601d8efa1390e145ac4e96fc5bb8f83039dcf7e0702578e0c7e2bd50500c69908bb1569e1dbceaf8b0baaa8ede672d633aa2a57d3b40dbde40a

puts wallet.generate_address
# => 1EyM8rAJTDBQRimbnnzSThfvr4PigPQJZD
```

## Progress

<!-- https://github.com/libbitcoin/libbitcoin-system/wiki/Altcoin-Version-Mappings#bip44-altcoin-version-mapping-table -->

- [ ] BTC and Derivations
  - [x] BTC
  - [x] LTC
  - [ ] DOGE
  - [ ] RDD
  - [ ] DASH
  - [ ] PPC
  - [ ] NMC
  - [ ] FTC
  - [ ] XCP
  - [ ] BLK
  - [ ] NSR
  - [ ] NBT
  - [ ] MZC
  - [ ] VIA
  - [ ] XCH
  - [ ] RBY
  - [ ] GRS
  - [ ] DGC
  - [ ] CCN
  - [ ] DGB
  - [ ] MONA
  - [ ] CLAM
  - [ ] XPM
  - [ ] NEOS
  - [ ] JBS
  - [ ] ZRC
  - [ ] VTC
  - [ ] NXT
  - [ ] MUE
  - [ ] ZOOM
  - [ ] VPN
  - [ ] CDN
  - [ ] SDC
  - [ ] PKB
  - [ ] PND
  - [ ] START
  - [ ] GCR
  - [ ] NVC
  - [ ] AC
  - [ ] BTCD
  - [ ] TPC
  - [ ] ETH
  - [ ] OK
  - [ ] DOGED
  - [ ] EFL
  - [ ] POT
  - [ ] XRP
  - [ ] XMR
  - [ ] ZEC
  - [ ] XTZ
- [ ] Ether Based
- [ ] SushiChain


## Contributing

1. Fork it (<https://github.com/watzon/tomi/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Chris Watson](https://github.com/watzon) - creator and maintainer
