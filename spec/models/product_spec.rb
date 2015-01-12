require 'spec_helper'

RSpec.describe Product, type: :model do
  before(:all) do
    DatabaseCleaner.start
    @val = FactoryGirl.create(:product)
  end
  after(:all) do
    DatabaseCleaner.clean
  end

  describe 'Filterカウント' do
    it 'Dummy1' do
      FactoryGirl.create(:product)
      expect(Product.count).to eq(2)
      expect(@val).to be_present
    end

    it 'Dummy2' do
      expect(Product.count).to eq(1)
    end
  end
end
