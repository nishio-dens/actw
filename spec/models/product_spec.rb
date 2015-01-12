require 'spec_helper'

RSpec.describe Product, type: :model do
  describe 'Filterカウント' do
    it '保存時にフィルタデータ数もカウントアップすること' do
      binding.pry
      FactoryGirl.create(:product)
    end
  end
end
