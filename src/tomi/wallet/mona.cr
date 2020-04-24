require "./btc"

module Tomi
  module Wallet
    class MONA < BTC
      getter version = 0x32
      getter version_testnet = 0x6f
    end
  end
end
