require "./btc"

module Tomi
  module Wallet
    class ETH < BTC
      # https://www.royalfork.org/2017/12/10/eth-graphical-address/
      def generate_address(testnet = false) : String
        pubkey = @keypair.public_key.to_s(16).rjust(130, '0').hexbytes
        keccak = Crypto.hash_sha3(pubkey)
        "0x" + keccak[-20..].hexstring
      end
    end
  end
end
