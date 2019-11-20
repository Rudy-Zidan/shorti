FactoryBot.define do
  factory :shorten_url, class: Shorti::ShortenUrl do
    original_url { Faker::Internet.url }
    url { Faker::Internet.url }
  end
end
