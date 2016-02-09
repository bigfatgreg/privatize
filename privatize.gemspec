# coding: utf-8

unless $LOAD_PATH.include?(File.expand_path('../lib', __FILE__))
  $LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))
end
 
require 'privatize/version'

Gem::Specification.new do |spec|
  spec.name          = "privatize"
  spec.version       = Privatize::VERSION
  spec.authors       = ["rob allen"]
  spec.email         = ["rob.all3n@gmail"]

  spec.summary       = %q{This gem 'privatizes' images.}
  spec.description   = %q{This gem pixilates images using rmagick.}
  spec.homepage      = "https://github.com/bigfatgreg/privatize"

  spec.files         = Dir.glob("spec/**/*") #.select { |f| f.match(/spec\.rb$/) } 
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  
  spec.add_dependency "mini_magick"
end
