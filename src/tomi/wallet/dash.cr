require "./btc"

module Tomi
  module Wallet
    class DASH < BTC
      getter version = 0x4c
      getter version_testnet = 0x8c
    end
  end
end
