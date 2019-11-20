require 'rails_helper'

module Shorti
  RSpec.describe ShortenUrl, type: :model do
    context 'Validation' do
      describe 'uniqueness' do
        it { should validate_uniqueness_of(:url) }
      end

      describe 'presences' do
        it { should validate_presence_of(:original_url) }
        it { should validate_presence_of(:url) }
      end

      describe 'format' do
        it { should allow_value('https://lh.com/32dasf').for(:url) }
        it { should allow_value('https://google.com/path/to/page').for(:original_url) }
      end
    end
  end
end
