# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shoppe/discounts/version'

Gem::Specification.new do |spec|
  spec.name          = "shoppe-discounts"
  spec.version       = Shoppe::Discounts::VERSION
  spec.authors       = ["Renaldo Pierre-Louis"]
  spec.email         = ["pirelouisd87@gmail.com"]

  spec.summary       = %q{Enable discount codes during purchase}
  spec.description   = %q{Sometimes when running a marketing campaign, you want to give discount codes. This shoppe extension gem helps you do just that}
  spec.homepage      = "https://github.com/daltonrenaldo/shoppe-discounts"

  spec.files         = Dir['{lib}/**/*', 'Rakefile', 'CODE_OF_CONDUCT.md' 'README.md'] # `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency "shoppe"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
