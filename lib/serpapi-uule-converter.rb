# lib/serpapi-uule-converter.rb
require 'base64'
require 'geocoder'

class UuleConverter
  E7_FACTOR = 10_000_000

  def self.get_gl(latitude, longitude)
    results = Geocoder.search([latitude, longitude])

    # If a result is found, return the country code (gl parameter)
    results.first&.country_code&.downcase
  end

  def self.encode(latitude, longitude, radius: -1, role: 1, producer: 12, provenance: 0, timestamp: nil)
    timestamp ||= (Time.now.to_f * 1_000_000).to_i
    lat_e7 = (latitude * E7_FACTOR).to_i
    lon_e7 = (longitude * E7_FACTOR).to_i

    uule_string = <<~UULE
      role:#{role}
      producer:#{producer}
      provenance:#{provenance}
      timestamp:#{timestamp}
      latlng{
      latitude_e7:#{lat_e7}
      longitude_e7:#{lon_e7}
      }
      radius:#{radius}
    UULE

    'a+' + urlsafe_encode64(uule_string)
  end

  def self.decode(uule_encoded)
    uule_string = urlsafe_decode64(uule_encoded[2..]) # Remove the 'a+' prefix before decoding
    data = {}

    uule_string.lines.each do |line|
      key, value = line.strip.split(':')
      data[key.to_sym] = value
    end

    data[:latitude] = data[:latitude_e7].to_i / E7_FACTOR.to_f
    data[:longitude] = data[:longitude_e7].to_i / E7_FACTOR.to_f
    data.delete(:latitude_e7)
    data.delete(:longitude_e7)

    data
  end

  private

  def self.urlsafe_encode64(str)
    Base64.strict_encode64(str).tr('+/', '-_').delete('=')
  end

  def self.urlsafe_decode64(str)
    str = str.tr('-_', '+/').ljust((str.length + 3) & ~3, '=')
    Base64.strict_decode64(str)
  end
end

# No change has been observed by changing provenance and radius parameters
# I still added them there in case they matter in the future.
# Setting radius to `-1` and provenance to `0` works for now.
# Setting user to `1` means `USER_SPECIFIED_FOR_REQUEST`.
# Setting producer to `12`` means `LOGGED_IN_USER_SPECIFIED`.
# Changing the value for the user and producer is shifting precision of the search.
