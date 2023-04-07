# uule_converter.gemspec
Gem::Specification.new do |spec|
  spec.name          = 'uule_converter'
  spec.version       = '0.1.0'
  spec.authors       = ['Emirhan Akdeniz']
  spec.email         = ['kagermanovtalks@gmail.com']
  spec.summary       = 'Coordinates to UULE parameter converter for Google search'
  spec.description   = 'A Ruby library for encoding and decoding UULE parameters in Google search URLs using coordinates'
  spec.homepage      = 'https://github.com/serpapi/uule_converter'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*.rb']
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.5.0'

  spec.add_dependency 'geocoder', '~> 1.7'
end
