$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ecm/opening_times/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ecm_opening_times"
  s.version     = Ecm::OpeningTimes::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["roberto@vasquez-angel.de"]
  s.homepage    = "https://github.com/robotex82/ecm_opening_times"
  s.summary     = "ECM Opening Times Module."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 5.1.0"
  s.add_dependency 'acts_as_list'

  s.add_development_dependency "sqlite3"

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'guard-bundler'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'i18n-debug'
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'shoulda-matchers'
end
