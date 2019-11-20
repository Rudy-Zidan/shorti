module Shorti
  RSpec.describe DestroyShortenUrlService do
    context 'Normal cases' do
      describe 'shorten url exist' do
        it 'should destroy record correctly' do
          shorten_url = FactoryBot.create(:shorten_url)

          fetched_shorten_url = described_class.run(shorten_url: shorten_url)

          expect(fetched_shorten_url).to be_truthy
        end
      end
    end

    context 'Exception' do
      describe 'shorten url not-exist' do
        it 'should not destroy record' do
          fetched_shorten_url = described_class.run(shorten_url: nil)

          expect(fetched_shorten_url).to be_falsey
        end
      end
    end
  end
end
