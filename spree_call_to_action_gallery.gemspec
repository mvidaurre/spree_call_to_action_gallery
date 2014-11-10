# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_call_to_action_gallery'
  s.version     = '2.4.0.rc4-1'
  s.summary     = 'A spree extension for a call to actions gallery'
  s.description = 'This extension allows to have a gallery with a call to action and pictures. Mainly to be used in the Store Home'
  s.required_ruby_version = '>= 2.1.3'

  s.author    = 'Manuel Vidaurre'
  s.email     = 'manuel.vidaurre@agiltec.com.mx'
  s.homepage  = 'http://about.me/manuel.vidaurre'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.4.0.rc4'

  s.add_development_dependency 'capybara', '~> 2.4'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 3.1'
  s.add_development_dependency 'sass-rails', '~> 4.0.2'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'guard-rspec'
  
end
