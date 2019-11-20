module Shorti
  RSpec.describe 'Index Shorten Urls', :request do
    context 'Normal Case' do
      describe 'shorten url exist without pagination' do
        let!(:shorten_url) { FactoryBot.create(:shorten_url) }

        it 'should return 200' do
          get "/shorten_urls"

          expect(response).to have_http_status(:success)
          data = JSON.parse(response.body)

          expect(data['data'].size).to eq(1)
          expect(data['data'][0]['id']).to eq(shorten_url.id)
        end
      end

      describe 'shorten url not exist with pagination' do
        it 'should return empty data' do
          get "/shorten_urls", params: { page: 1, per_page: 10 }

          expect(response).to have_http_status(:success)
          data = JSON.parse(response.body)

          expect(data['data'].size).to eq(0)
        end
      end
    end
  end
end
