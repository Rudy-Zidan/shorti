require 'rails_helper'

module Shorti
  RSpec.describe CreateShortenUrlService do
    context 'Normal cases' do
      let(:params) do
        {
          url: Faker::Internet.url,
          domain: Faker::Internet.domain_name,
        }
      end

      describe 'create a shorten url' do
        it 'should return a valid shorten_url object' do
          shorten_url = described_class.run(params)

          expect(shorten_url.persisted?).to be_truthy
        end
      end
    end

    context 'Validation Errors' do
      describe 'nil params' do
        let(:params) do
          {
            url: nil,
            domain: nil,
          }
        end

        it 'should return list of errors' do
          shorten_url = described_class.run(params)

          expect(shorten_url.errors.any?).to be_truthy
          expect(shorten_url.errors.full_messages).to eq(["Url can't be blank", "Url is invalid", "Original url can't be blank", "Original url is invalid"])
        end
      end

      describe 'already exist url' do
        let!(:stored_shorten_url) { FactoryBot.create(:shorten_url) }

        before do
          allow_any_instance_of(described_class).to receive(:generate_shorten_url).and_return(stored_shorten_url.url)
        end

        it 'should return already exist' do
          shorten_url = described_class.run({
            url: stored_shorten_url.original_url,
            domain: URI.parse(stored_shorten_url.original_url).host
          })

          expect(shorten_url.errors.any?).to be_truthy
          expect(shorten_url.errors.full_messages).to eq(["Url has already been taken"])
        end
      end
    end
  end
end
