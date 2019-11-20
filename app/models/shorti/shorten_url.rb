module Shorti
  class ShortenUrl < ApplicationRecord
    self.table_name = :shorten_urls

    validates :url, :original_url, presence: true
    validates :url, uniqueness: true
    validates_format_of :url, :original_url, with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix
  end
end
