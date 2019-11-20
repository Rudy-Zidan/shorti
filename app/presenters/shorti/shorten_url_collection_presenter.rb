module Shorti
  class ShortenUrlCollectionPresenter < BasePresenter
    def initialize(shorten_urls:, pagy:)
      @shorten_urls = shorten_urls
      @pagy = pagy
    end

    def present
      {
        meta: build_meta,
        data: build_data
      }
    end

    private

    def build_data
      @shorten_urls.map do |shorten_url|
        ShortenUrlPresenter.present(shorten_url: shorten_url)
      end
    end

    def build_meta
      {
        current_page: @pagy.page,
        total_pages: @pagy.pages
      }
    end
  end
end
