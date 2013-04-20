require './lib/jacket'

Gem::Specification.new do |s|
  s.version = Jacket::VERSION
  s.date = Jacket::DATE

  # Gem Details
  s.name = "jacket"
  s.rubyforge_project = "jacket"
  s.rubygems_version = "1.7.2"
  s.required_rubygems_version = Gem::Requirement.new(">= 1.2")
  # Description of your extension
  s.description = %q{A generalized Compass extension to build off of}
  # A summary of your Compass extension. Should be different than Description
  s.summary = %q{An easy to use system for writing and managing media queries.}
  # The names of the author(s) of the extension.
  # If more than one author, comma separate inside of the brackets
  s.authors = ["First Last"]
  # The email address(es) of the author(s)
  # If more than one author, comma separate inside of the brackets
  s.email = ["firstlast@extension.com"]
  # URL of the extension
  s.homepage = "http://extension.com"

  # Gem Files
  # README file
  s.files = ["README.md"]

  # CHANGELOG
  s.files += ["CHANGELOG.md"]

  # Library Files
  s.files += Dir.glob("lib/**/*.*")

  # Sass Files
  s.files += Dir.glob("stylesheets/**/*.*")

  # Gem Bookkeeping
  # Versions of Ruby and Rubygems you require
  s.required_rubygems_version = ">= 1.3.6"
  s.rubygems_version = %q{1.3.6}

  # Gems Dependencies
  s.add_dependency("sass",      [">=3.2.0"])
end
