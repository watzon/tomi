require "./btc"

module Tomi
  module Wallet
    class NBT < BTC
      getter version = 0x19
      getter version_testnet = 0x6f
    end
  end
end
