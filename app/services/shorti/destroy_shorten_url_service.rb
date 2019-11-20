module Shorti
  class DestroyShortenUrlService < BaseService
    def initialize(shorten_url:)
      @shorten_url = shorten_url
    end

    def run
      @shorten_url&.destroy
    end
  end
end
