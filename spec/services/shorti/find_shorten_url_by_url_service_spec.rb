module Shorti
  RSpec.describe FindShortenUrlByUrlService do
    context 'Normal cases' do
      describe 'shorten url exist' do
        it 'should fetch record correctly' do
          shorten_url = FactoryBot.create(:shorten_url)

          fetched_shorten_url = described_class.run(url: shorten_url.url)

          expect(fetched_shorten_url).to eq(shorten_url)
        end
      end
    end

    context 'Exception' do
      describe 'shorten url not exist' do
        it 'should raise RecordNotFound' do
          expect {
            described_class.run(url: 'not-found')
          }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end
  end
end
