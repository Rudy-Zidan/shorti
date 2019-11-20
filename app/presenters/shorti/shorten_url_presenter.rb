module Shorti
  class ShortenUrlPresenter < BasePresenter
    def initialize(shorten_url:)
      @shorten_url = shorten_url
    end

    def present
      {
        id: @shorten_url.id,
        original_url: @shorten_url.original_url,
        url: @shorten_url.url,
        created_at: @shorten_url.created_at.to_i,
        updated_at: @shorten_url.updated_at.to_i,
      }
    end
  end
end
