module Shorti
  RSpec.describe ShortenUrlPresenter do
    it 'should present shorten_url' do
      shorten_url = FactoryBot.create(:shorten_url)
      presented = described_class.present(shorten_url: shorten_url)

      expect(presented[:id]).to eq(shorten_url.id)
      expect(presented[:original_url]).to eq(shorten_url.original_url)
      expect(presented[:url]).to eq(shorten_url.url)
      expect(presented[:created_at]).to eq(shorten_url.created_at.to_i)
      expect(presented[:updated_at]).to eq(shorten_url.updated_at.to_i)
    end
  end
end
