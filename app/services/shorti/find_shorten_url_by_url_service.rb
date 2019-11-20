module Shorti
  class FindShortenUrlByUrlService < BaseService
    def initialize(url:)
      @url = url
    end

    def run
      ShortenUrl.find_by!(url: @url)
    end
  end
end
