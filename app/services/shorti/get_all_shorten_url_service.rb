require 'pagy'

module Shorti
  class GetAllShortenUrlService < BaseService
    include Pagy::Backend

    def initialize(page: 1, per_page: 10)
      @page = page.to_i
      @per_page = per_page.to_i
    end

    def run
      pagy(ShortenUrl.all.order(id: :desc), { page: @page, items: @per_page })
    end
  end
end
