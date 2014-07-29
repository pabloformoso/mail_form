$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mail_form/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mail_form"
  s.version     = MailForm::VERSION
  s.authors     = ["Pablo Formoso Estrada"]
  s.email       = ["pablo.formoso@softwhisper.es"]
  s.homepage    = "http://pabloformoso.com"
  s.summary     = "Simple gem to add MailForm object based on ActiveModel"
  s.description = "This gem is developed based on Rails4 Craftmanship book by Jose Valim."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.4"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "pry"
end
