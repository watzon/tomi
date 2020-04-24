require "./crypto/*"
require "./tomi/*"

wallet = Tomi::Wallet::XRP.new
puts wallet.private_key.to_s(16)
puts wallet.public_key.to_s(16)
puts wallet.generate_address
