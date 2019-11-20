module Shorti
  RSpec.describe NotFoundErrorPresenter do
    it 'should present errors' do
      msg = 'resource not found'
      presented = described_class.present(msg: msg)

      expect(presented).to eq({error: "resource not found"})
    end
  end
end
