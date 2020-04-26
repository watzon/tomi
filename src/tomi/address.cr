require "qrencode"
require "stumpy_png"

module Tomi
  struct Address
    @address : String
    @wallet : Wallet::Base
    @testnet : Bool

    def initialize(@address : String, @wallet : Wallet::Base, @testnet : Bool = false)
    end

    def to_qr(version = 0)
      QRencode::QRcode.new(@address, version: version)
    end

    def to_ansi_qr(version = 0)
      qr = to_qr(version)
      str = String.build do |str|
        qr.each_row do |row|
          row.each do |byte|
            str.print (QRencode::Util.black?(byte) ? "\033[40m " : "\033[47m ") * 2
          end
          str.puts "\033[0m"
        end
      end
    end

    def to_png_qr(output, version = 0, foreground = nil, background = nil, margin = 20)
      foreground ||= StumpyPNG::RGBA.from_rgb_n(0, 0, 0, 8)
      background ||= StumpyPNG::RGBA.from_rgb_n(255, 255, 255, 8)
      qr = to_qr(version)
      canvas_width = (qr.width.to_i * margin) + margin * 2
      canvas = StumpyPNG::Canvas.new(canvas_width, canvas_width, background)

      x = margin
      qr.each_row do |row|
        y = margin
        row.each do |byte|
          if QRencode::Util.black?(byte)
            (0...margin).each do |i|
              (0...margin).each do |j|
                canvas[x + i, y + j] = foreground
              end
            end
          end
          y += margin
        end
        x += margin
      end

      StumpyPNG.write(canvas, output)
    end
  end
end
