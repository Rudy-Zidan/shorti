module Shorti
  class Engine < ::Rails::Engine
    isolate_namespace Shorti
    config.generators.api_only = true

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot
      g.factory_bot dir: 'spec/factories'
    end
  end

  # allow to override engine configurations using initializers
  def self.setup(&block)
    @config ||= Shorti::Engine::Configuration.new
    yield @config if block
    @config
  end

  def self.config
    Rails.application.config
  end
end
