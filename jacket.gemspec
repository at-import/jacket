require './lib/jacket'

Gem::Specification.new do |s|

  # Project Information
  s.name = "jacket"
  s.version = Jacket::VERSION
  s.date = Jacket::DATE
  s.rubyforge_project = "jacket"
  s.rubygems_version = "1.7.2"
  s.required_rubygems_version = Gem::Requirement.new(">= 1.2")

  # Author Information
  s.authors = ["Rob Wierzbowski"]
  s.email = ["hello@robwierzbowski.com"]
  s.homepage = "http://github.com/robwierzbowski/jacket"

  # Project Description
  s.description = "Manage multiple css builds from a single stylesheet"
  s.summary = "Jacket helps orgainze your stylesheets for a multi-context build
  process. Write and maintain a master stylesheet, then output custom tailored
  stylesheets for specific browsers, mobile/desktop sites, and app builds."

  # Gem Files
  s.files = ["readme.md"]
  # s.files += ["changelog.md"]
  s.files += Dir.glob("lib/**/*.*")
  s.files += Dir.glob("stylesheets/**/*.*")

  # Dependencies
  s.add_dependency 'sass',    '~> 3.3.0.rc.2'
  s.add_dependency 'compass', "~> 1.0.0.alpha.17"
end
