module Shorti
  RSpec.describe GetAllShortenUrlService do
    context 'Normal cases' do
      describe 'return shorten urls without paginations' do
        it 'should fetch records' do
          shorten_url = FactoryBot.create(:shorten_url)

          pagy, records = described_class.run

          expect(records.first).to eq(shorten_url)
          expect(pagy).to be_kind_of(Pagy)
        end
      end

      describe 'return shorten urls with paginations' do
        it 'should fetch records' do
          shorten_url = FactoryBot.create(:shorten_url)

          pagy, records = described_class.run(page: 1, per_page: 1)

          expect(records.first).to eq(shorten_url)
          expect(pagy).to be_kind_of(Pagy)
        end
      end
    end
  end
end
