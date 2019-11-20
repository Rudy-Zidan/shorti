module Shorti
  class CreateShortenUrlService < BaseService
    def initialize(url:, domain:)
      @url = url
      @domain = domain
    end

    def run
      ShortenUrl.create(
        original_url: @url,
        url: generate_shorten_url
      )
    end

    private

    def generate_shorten_url
      uri = URI.parse(@url)

      loop do
        url = "#{uri.scheme}://#{@domain}/#{SecureRandom.urlsafe_base64(6)}"
        return url unless ShortenUrl.where(url: url).any?
      end
    rescue
      nil
    end
  end
end
