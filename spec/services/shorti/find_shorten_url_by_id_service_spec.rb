module Shorti
  RSpec.describe FindShortenUrlByIdService do
    context 'Normal cases' do
      describe 'shorten url exist' do
        it 'should fetch record correctly' do
          shorten_url = FactoryBot.create(:shorten_url)

          fetched_shorten_url = described_class.run(id: shorten_url.id)

          expect(fetched_shorten_url).to eq(shorten_url)
        end
      end
    end

    context 'Exception' do
      describe 'shorten url not exist' do
        it 'should raise RecordNotFound' do
          expect {
            described_class.run(id: 'not-found')
          }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end
  end
end
