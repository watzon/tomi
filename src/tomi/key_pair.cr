require "big"

module Tomi
  struct KeyPair
    getter private_key : BigInt
    getter public_key : BigInt

    def initialize(@private_key, @public_key)
    end
  end
end
