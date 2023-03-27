require "rqrcode"

p "What kind of QR code would you like to generate? "
puts "\n1. Open a URL"
puts "2. Join a wifi network"
puts "3. Send a text message"
puts "\nEnter the corresponding number to make a choice or enter '4' to exit.\n"

user_input = gets.chomp.to_i

if user_input == 1
  puts "\nEnter the URL that you would like to encode.\n"
  user_qr = gets.chomp

elsif user_input == 2
  puts "\nWhat is the name of the wifi network?\n"
  wifi_name = gets.chomp

  puts "\nWhat is the wifi password?\n"
  wifi_pass = gets.chomp

  user_qr = "WIFI:T:WPA;S:#{wifi_name};P:#{wifi_pass};;"
end

puts "\nWhat would you like to call the PNG?\n"
png_name = gets.chomp

qrcode = RQRCode::QRCode.new("#{user_qr}")

png = qrcode.as_png({ :size => 500 })

IO.binwrite("#{png_name}.png", png.to_s)
