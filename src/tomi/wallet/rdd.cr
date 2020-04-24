require "./btc"

module Tomi
  module Wallet
    class RDD < BTC
      getter version = 0x3d
      getter version_testnet = 0x6f
    end
  end
end
