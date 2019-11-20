$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "shorti/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "shorti"
  spec.version     = Shorti::VERSION
  spec.authors     = ["Rudy Zidan"]
  spec.email       = ["rz.zidan@gmail.com"]
  spec.homepage    = ""
  spec.summary     = "A shortener url gem"
  spec.description = "Generate a shorten urls"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.1"

  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "factory_bot_rails"
  spec.add_development_dependency 'generator_spec'
  spec.add_development_dependency 'shoulda-matchers'
  spec.add_development_dependency 'faker'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'dotenv-rails'
end
