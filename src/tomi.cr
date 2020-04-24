require "./crypto/*"
require "./Tomi/*"

wallet = Tomi::Wallet::BTC.new
puts wallet.private_key.to_s(16)
puts wallet.public_key.to_s(16)
puts wallet.generate_address
