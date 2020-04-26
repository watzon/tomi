require "./crypto/*"
require "./tomi/*"

wallet = Tomi::Wallet::ETH.new
puts wallet.private_key.to_s(16)
puts wallet.public_key.to_s(16)

address = wallet.generate_address
# puts wallet.get_account(address)
address.to_png_qr("address.png")
