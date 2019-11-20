module Shorti
  RSpec.describe 'Redirect Shorten Url by url', :request do
    context 'Normal Case' do
      let(:domain) { ENV['SHORTI_DOMAIN'] }
      let(:shorten_url) { FactoryBot.create(:shorten_url, url: "http://#{domain}/rtSxc2") }

      before do
        host! domain
      end

      describe 'shorten url exist' do
        it 'should redirect to original_url' do
          get "#{shorten_url.url}"

          expect(response).to have_http_status(:found)
          expect(response.redirect_url).to eq(shorten_url.original_url)
        end
      end
    end

    context 'Not found' do
      describe 'shorten url not exist' do
        it 'should return 400' do
          get "http://#{ENV['HOST']}/not-found"

          expect(response).to have_http_status(:not_found)
          data = JSON.parse(response.body)

          expect(data['error']).to eq("Couldn't find Shorti::ShortenUrl")
        end
      end
    end
  end
end
