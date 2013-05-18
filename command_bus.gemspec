# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
  
require 'command_bus/version'

Gem::Specification.new do |s|
    s.name          = 'command_bus'
    s.version       = CommandBus::Version
    s.platform      = Gem::Platform::RUBY
    s.authors       = ['Louis Salin']
    s.email         = ['louis.phil@gmail.com']
    s.summary       = 'A simple command bus'
    s.description   = 'Execute a command and the command bus will look up the proper handler class automatically and execute it'

    s.add_development_dependency 'rspec'
    s.files        = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md CHANGELOG.md)
end
