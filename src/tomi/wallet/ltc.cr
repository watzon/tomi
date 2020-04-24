require "./btc"

module Tomi
  module Wallet
    class LTC < BTC
      getter version = 0x30
      getter version_testnet = 0x6F
    end
  end
end
