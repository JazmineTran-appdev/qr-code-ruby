require "rqrcode"

# encoding this will allow you to join a wifi network
WIFI:T:WPA;S:My wifi network;P:supersecretpassword;;
# `My wifi network` is the name of the network to be joined, and `supersecretpassword` is the password for that network

# Use this to encode some text
qrcode = RQRCode::QRCode.new("https://en.wikipedia.org/wiki/QR_code")

# use the .as_png method to create a 500 pixels by 500 pixels image
png = qrcode.as_png({ :size => 500 })

# Write the image data to a file
IO.binwrite("sometext.png", png.to_s)

# running this from here will create a file in your file tree called `sometext.png`
# this opens up a google search for "wikipedia qr code", we replace this with an actual link and it will send us to that link!

# If you want the QR code to send a text message, encode in this format (no space for phone number and you can include country codes)
SMSTO:9876543210:Hi Alice!
# when scanned, it will open the messages app with the message `Hi Alice!` and the phone number `9876543210` pre-filled
