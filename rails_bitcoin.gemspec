$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_bitcoin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_bitcoin"
  s.version     = RailsBitcoin::VERSION
  s.authors     = ["hpyhacking"]
  s.email       = ["crazyflapjack@gmail.com"]
  s.homepage    = "https://github.com/peatio/rails_bitcoin"
  s.summary     = "Bitcoin Tools in Rails."
  s.description = "bitcoin address validator, sign message validator."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "ffi", "~> 1.9.0"
  s.add_dependency "bitcoin-ruby", "~> 0.0.1"
end
