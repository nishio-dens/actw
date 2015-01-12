# == Schema Information
#
# Table name: products # 成果物
#
#  id           :integer          not null, primary key  # ID
#  title        :string(255)      not null               # タイトル
#  url          :text(65535)      not null               # URL
#  description  :text(65535)                             # 概要
#  category_id  :integer                                 # カテゴリID
#  user_id      :integer          not null               # ユーザID
#  manual       :boolean          default("0"), not null # 手動登録
#  published_at :datetime         not null               # 公開日
#  created_at   :datetime         not null               # 作成日時
#  updated_at   :datetime         not null               # 更新日時
#

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
