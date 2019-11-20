module Shorti
  RSpec.describe 'Create Shorten Url', :request do
    context 'Normal Case' do
      let(:params) do
        {
          url: Faker::Internet.url,
          domain: Faker::Internet.domain_name,
        }
      end

      describe 'create a shorten request' do
        it 'should return 201' do
          post '/shorti/shorten_urls', params: params

          expect(response).to have_http_status(:created)
          data = JSON.parse(response.body)

          expect(data['original_url']).to eq(params[:url])
        end
      end
    end

    context 'Validations' do
      describe 'presence' do
        it 'should return 422' do
          post '/shorti/shorten_urls', params: { url: nil, domain: nil }

          expect(response).to have_http_status(:unprocessable_entity)
          data = JSON.parse(response.body)

          expect(data).to eq(
            {
              "errors"=>[
                {"field"=>"url", "message"=>"can't be blank"},
                {"field"=>"url", "message"=>"is invalid"},
                {"field"=>"original_url", "message"=>"can't be blank"},
                {"field"=>"original_url", "message"=>"is invalid"}
              ]
            }
          )
        end
      end

      describe 'uniqueness' do
        let!(:stored_shorten_url) { FactoryBot.create(:shorten_url) }
        let(:params) do
          {
            url: stored_shorten_url.original_url,
            domain: URI.parse(stored_shorten_url.original_url).host
          }
        end

        before do
          allow_any_instance_of(CreateShortenUrlService).to receive(:generate_shorten_url).and_return(stored_shorten_url.url)
        end

        it 'should return 422' do
          post '/shorti/shorten_urls', params: params

          expect(response).to have_http_status(:unprocessable_entity)
          data = JSON.parse(response.body)

          expect(data).to eq({"errors"=>[{"field"=>"url", "message"=>"has already been taken"}]})
        end
      end
    end
  end
end
