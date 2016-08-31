# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/iitd/version'

Gem::Specification.new do |s|
  s.name     = 'omniauth-iitd'
  s.version  = OmniAuth::IITD::VERSION
  s.authors  = ['Harsh Arya']
  s.email    = ['harshaa47@gmail.com', 'cs1140221@iitd.ac.in']
  s.summary  = 'Iitd OAuth2 Strategy for OmniAuth'
  s.homepage = 'https://github.com/harshaa947/omniauth-iitd'
  

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.2'

  s.add_development_dependency 'minitest'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'rake'
end
