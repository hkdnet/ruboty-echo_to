# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/echo_channel/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruboty-echo_channel'
  spec.version       = Ruboty::EchoChannel::VERSION
  spec.authors       = ['hkdnet']
  spec.email         = ['hkdnet@users.noreply.github.com']

  spec.summary       = 'echo given message to the other channel.'
  spec.homepage      = %q(TODO: Put your gem's website or public repo URL here.)
  spec.license       = 'MIT'

  spec.require_paths = ['lib']

  spec.add_dependency 'ruboty'
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
end
