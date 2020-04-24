require "openssl"

module Tomi
  module Crypto
    def self.ecdsa_keypair(curve : LibCrypto::ECKeyCurve, form = LibCrypto::PointConversionForm::Uncompressed)
      sig = uninitialized LibCrypto::ECDSA_SIG
      ec_key = LibCrypto.ec_key_new_by_curve_name(curve)
      ec_group = LibCrypto.ec_key_get_group(ec_key)
      bn_ctx = LibCrypto.bn_ctx_new
      LibCrypto.ec_key_generate_key(ec_key)

      pk = LibCrypto.ec_key_get_private_key(ec_key)
      pk_hex = String.new(LibCrypto.bn_bn2hex(pk))

      pb_point = LibCrypto.ec_key_get_public_key(ec_key)
      pb_hex = String.new(LibCrypto.ec_point_point2hex(ec_group, pb_point, form, bn_ctx))

      KeyPair.new(BigInt.new(pk_hex, 16), BigInt.new(pb_hex, 16))
    end

    def self.hash_sha(data, size = 256)
      sha256 = OpenSSL::Digest.new("SHA#{size}")
      sha256 << data
      sha256.digest
    end

    def self.hash_ripemd(data, size = 160)
      ripemd = OpenSSL::Digest.new("RIPEMD#{size}")
      ripemd << data
      ripemd.digest
    end

    def self.prepend_bytes(slice, bytes)
      newbytes = Bytes.new(slice.size + bytes.size)
      bytes.copy_to(newbytes)
      slice.copy_to(newbytes.to_unsafe + bytes.size, slice.size)
      newbytes
    end

    def self.append_bytes(slice, bytes)
      newbytes = Bytes.new(slice.size + bytes.size)
      slice.copy_to(newbytes)
      bytes.copy_to(newbytes.to_unsafe + slice.size, bytes.size)
      newbytes
    end

    def self.base58_check(hexstring : String) : String
      code_string = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
      x = BigInt.new(hexstring, 16)
      output_string = ""
      while x > 0
        x, remainder = (x // 58), (x % 58)
        output_string += code_string[remainder]
      end
      md = hexstring.match(/^(0+)/)
      unless md.nil?
        output_string += code_string[0]
      end
      output_string.reverse
    end
  end
end
