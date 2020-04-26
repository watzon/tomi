module Tomi
  module Wallet
    abstract class Base
      getter keypair : KeyPair

      delegate :private_key, :public_key, to: @keypair

      def initialize
        @keypair = generate_keypair
      end

      def initialize(@keypair : KeyPair)
      end

      def initialize(private_key, public_key)
        @keypair = KeyPair.new(private_key, public_key)
      end

      abstract def generate_keypair : KeyPair
      abstract def generate_address : Address
    end
  end
end

require "./wallet/*"
