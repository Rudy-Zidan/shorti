module Shorti
  RSpec.describe ShortenUrlCollectionPresenter do
    it 'should present a collection of shorten_url' do
      shorten_url = FactoryBot.create(:shorten_url)
      presented = described_class.present(shorten_urls: [shorten_url])

      expect(presented[:data][0][:id]).to eq(shorten_url.id)
      expect(presented[:data][0][:original_url]).to eq(shorten_url.original_url)
      expect(presented[:data][0][:url]).to eq(shorten_url.url)
      expect(presented[:data][0][:created_at]).to eq(shorten_url.created_at.to_i)
      expect(presented[:data][0][:updated_at]).to eq(shorten_url.updated_at.to_i)
    end
  end
end
