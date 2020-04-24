require "./btc"

module Tomi
  module Wallet
    class DOGE < BTC
      getter version = 0x1e
      getter version_testnet = 0x71
    end
  end
end
