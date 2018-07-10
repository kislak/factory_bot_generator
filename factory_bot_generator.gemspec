# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'factory_bot_generator/version'

Gem::Specification.new do |spec|
  spec.name          = 'factory_bot_generator'
  spec.version       = FactoryBotGenerator::VERSION
  spec.authors       = ['Serge Kislak']
  spec.email         = ['kislak7@gmail.com']

  spec.summary       = 'Render FactoryBot factory existing object.'
  spec.description   = 'Render FactoryBot factory existing object.'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundle-audit'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'reek'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
end
