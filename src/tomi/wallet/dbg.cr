require "./btc"

module Tomi
  module Wallet
    class DGB < BTC
      getter version = 0x1e
      getter version_testnet = 0x6f
    end
  end
end
