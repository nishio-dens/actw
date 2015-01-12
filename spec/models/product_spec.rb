require 'spec_helper'

RSpec.describe Product, type: :model do
  describe 'Filterカウント' do
    it '保存時にフィルタデータ数もカウントアップすること' do
      FactoryGirl.create(:product)
    end
  end
end
