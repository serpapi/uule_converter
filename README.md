<h1 align="center">UULE Converter</h1>
<h4 align="center">A Ruby library for encoding and decoding UULE parameters in Google search URLs using coordinates</h4>


<div align="center">

  <a href="">[![Gem Version][gem-shield]][gem-url]</a>
  <a href="">[![Contributors][contributors-shield]][contributors-url] </a>
  <a href="">[![Forks][forks-shield]][forks-url]</a>
  <a href="">[![Stargazers][stars-shield]][stars-url]</a>
  <a href="">[![Issues][issues-shield]][issues-url]</a>
  <a href="">[![Issues][issuesclosed-shield]][issuesclosed-url]</a>
  <a href="">[![MIT License][license-shield]][license-url]</a>

</div>


<p align="center">
  <img src="https://user-images.githubusercontent.com/73674035/231456927-53508370-3462-4aef-81df-644569c66af3.jpg" alt="uule_converter"/>
</p>

<p align="center">
  A Blog Post with example usecase: <a href="">Real World Example of GPS Targeted Local SERP</a>
</p>

</br>
<h3 align="center">Installation</h3>

```bash
gem install uule_converter
```

<h3 align="center">Example</h3>

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

<h3 align="center">Output</h3>

```bash
GL Parameter: us

Encoded UULE: a+cm9sZToxCnByb2R1Y2VyOjEyCnByb3ZlbmFuY2U6MAp0aW1lc3RhbXA6MTY4MDg3NzkwNjIzNjczNgpsYXRsbmd7CmxhdGl0dWRlX2U3OjMwMjY2NjY2MApsb25naXR1ZGVfZTc6LTk3NzMzMzMwMAp9CnJhZGl1czotMQo

Decoded UULE: {:role=>"1", :producer=>"12", :provenance=>"0", :timestamp=>"1680877906236736", :"latlng{"=>nil, :"}"=>nil, :radius=>"-1", :latitude=>30.266666, :longitude=>-97.73333}

Example Google Link: https://www.google.com/search?q=Cafe&tbm=lcl&gl=us&uule=a+cm9sZToxCnByb2R1Y2VyOjEyCnByb3ZlbmFuY2U6MAp0aW1lc3RhbXA6MTY4MDg3NzkwNjIzNjczNgpsYXRsbmd7CmxhdGl0dWRlX2U3OjMwMjY2NjY2MApsb25naXR1ZGVfZTc6LTk3NzMzMzMwMAp9CnJhZGl1czotMQo

```

<h3 align="center">Result</h3>

<img width="1460" alt="image" src="https://user-images.githubusercontent.com/73674035/230626568-f6a5e57f-7053-4325-802a-eedd23ff7a49.png">

[gem-shield]: https://img.shields.io/gem/v/uule_converter.svg
[gem-url]: https://rubygems.org/gems/uule_converter
[contributors-shield]: https://img.shields.io/github/contributors/serpapi/uule_converter.svg
[contributors-url]: https://github.com/serpapi/uule_converter/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/serpapi/uule_converter.svg
[forks-url]: https://github.com/serpapi/uule_converter/network/members
[stars-shield]: https://img.shields.io/github/stars/serpapi/uule_converter.svg
[stars-url]: https://github.com/serpapi/uule_converter/stargazers
[issues-shield]: https://img.shields.io/github/issues/serpapi/uule_converter.svg
[issues-url]: https://github.com/serpapi/uule_converter/issues
[issuesclosed-shield]: https://img.shields.io/github/issues-closed/serpapi/uule_converter.svg
[issuesclosed-url]: https://github.com/serpapi/uule_converter/issues?q=is%3Aissue+is%3Aclosed
[license-shield]: https://img.shields.io/github/license/serpapi/uule_converter.svg
[license-url]: https://github.com/serpapi/uule_converter/blob/master/LICENSE

