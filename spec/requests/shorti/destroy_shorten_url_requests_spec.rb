module Shorti
  RSpec.describe 'Desstroy Shorten Url by id', :request do
    context 'Normal Case' do
      let(:shorten_url) { FactoryBot.create(:shorten_url) }

      describe 'shorten url exist' do
        it 'should return 200' do
          delete "/shorti/shorten_urls/#{shorten_url.id}"

          expect(response).to have_http_status(:success)
        end
      end
    end

    context 'Not found' do
      describe 'shorten url not exist' do
        it 'should return 400' do
          delete "/shorti/shorten_urls/not-found"

          expect(response).to have_http_status(:not_found)
          data = JSON.parse(response.body)

          expect(data['error']).to eq("Couldn't find Shorti::ShortenUrl with 'id'=not-found")
        end
      end
    end
  end
end
