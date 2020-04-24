require "./btc"

module Tomi
  module Wallet
    class PPC < BTC
      getter version = 0x37
      getter version_testnet = 0x6f
    end
  end
end
