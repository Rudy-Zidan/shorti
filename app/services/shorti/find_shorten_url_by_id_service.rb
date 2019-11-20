module Shorti
  class FindShortenUrlByIdService < BaseService
    def initialize(id:)
      @id = id
    end

    def run
      ShortenUrl.find(@id)
    end
  end
end
