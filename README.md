# uule_converter
A Ruby library for encoding and decoding UULE parameters in Google search URLs using coordinates

### Installation

```bash
gem install uule_converter
```

### Example
```rb

require 'uule_converter'

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

```

### Output
```bash
GL Parameter: us

Encoded UULE: a+cm9sZToxCnByb2R1Y2VyOjEyCnByb3ZlbmFuY2U6MAp0aW1lc3RhbXA6MTY4MDg3NzkwNjIzNjczNgpsYXRsbmd7CmxhdGl0dWRlX2U3OjMwMjY2NjY2MApsb25naXR1ZGVfZTc6LTk3NzMzMzMwMAp9CnJhZGl1czotMQo

Decoded UULE: {:role=>"1", :producer=>"12", :provenance=>"0", :timestamp=>"1680877906236736", :"latlng{"=>nil, :"}"=>nil, :radius=>"-1", :latitude=>30.266666, :longitude=>-97.73333}

Example Google Link: https://www.google.com/search?q=Cafe&tbm=lcl&gl=us&uule=a+cm9sZToxCnByb2R1Y2VyOjEyCnByb3ZlbmFuY2U6MAp0aW1lc3RhbXA6MTY4MDg3NzkwNjIzNjczNgpsYXRsbmd7CmxhdGl0dWRlX2U3OjMwMjY2NjY2MApsb25naXR1ZGVfZTc6LTk3NzMzMzMwMAp9CnJhZGl1czotMQo

```

### Result

<img width="1460" alt="image" src="https://user-images.githubusercontent.com/73674035/230626568-f6a5e57f-7053-4325-802a-eedd23ff7a49.png">
