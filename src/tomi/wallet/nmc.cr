require "./btc"

module Tomi
  module Wallet
    class NMC < BTC
      getter version = 0x34
      getter version_testnet = 0x6f
    end
  end
end
