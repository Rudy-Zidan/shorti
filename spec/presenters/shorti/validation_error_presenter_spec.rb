module Shorti
  RSpec.describe ValidationErrorPresenter do
    it 'should present errors' do
      shorten_url = ShortenUrl.create({})
      presented = described_class.present(errors: shorten_url.errors)

      expect(presented).to eq(
        [
          {field: :url, message: "can't be blank"},
          {field: :url, message: "is invalid"},
          {field: :original_url, message: "can't be blank"},
          {field: :original_url, message: "is invalid"}
        ]
      )
    end
  end
end
