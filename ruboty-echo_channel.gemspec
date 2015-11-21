# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/echo_to/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruboty-echo_to'
  spec.version       = Ruboty::EchoTo::VERSION
  spec.authors       = ['hkdnet']
  spec.email         = ['hkdnet@users.noreply.github.com']

  spec.summary       = 'echo given message to another channel.'
  spec.homepage      = 'https://github.com/hkdnet/ruboty-echo_to'
  spec.license       = 'MIT'

  spec.require_paths = ['lib']

  spec.add_dependency 'ruboty'
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
end
