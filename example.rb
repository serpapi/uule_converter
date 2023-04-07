require_relative 'lib/uule_converter'

latitude = 30.266666
longitude = -97.733330

# Get GL parameter from coordinates (Optional, For more precise results)
gl_parameter = UuleConverter.get_gl(latitude, longitude)
puts "GL Parameter: #{gl_parameter}"

# Encode coordinates to UULE
uule_encoded = UuleConverter.encode(latitude, longitude)
puts "Encoded UULE: #{uule_encoded}"

# Decode UULE to coordinates
uule_decoded = UuleConverter.decode(uule_encoded)
puts "Decoded UULE: #{uule_decoded}"

puts "Example Google Link: https://www.google.com/search?q=Cafe&tbm=lcl&gl=#{gl_parameter}&uule=#{uule_encoded}"
