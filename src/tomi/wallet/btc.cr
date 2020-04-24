module Tomi
  module Wallet
    class BTC < BaseWallet
      getter version = 0x00
      getter version_testnet = 0x6f

      def generate_keypair : KeyPair
        Crypto.ecdsa_keypair(LibCrypto::ECKeyCurve::Secp256k1)
      end

      # https://en.bitcoin.it/wiki/Technical_background_of_version_1_Bitcoin_addresses
      def generate_address(testnet = false) : String
        version_byte = testnet ? version_testnet.chr : version.chr
        step_one = @keypair.public_key.to_s(16).rjust(130, '0').hexbytes
        step_two = Crypto.hash_sha(step_one)
        step_three = Crypto.hash_ripemd(step_two)
        step_four = Crypto.prepend_bytes(step_three, Bytes.new(version_byte.bytes.to_unsafe, 1))
        step_five = Crypto.hash_sha(step_four)
        step_six = Crypto.hash_sha(step_five)
        step_seven = step_six[0, 4]
        step_eight = Crypto.append_bytes(step_four, step_seven)
        step_nine = Crypto.base58_check(step_eight.hexstring)
        step_nine
      end
    end
  end
end
