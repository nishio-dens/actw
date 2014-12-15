# == Schema Information
#
# Table name: filters # フィルタ
#
#  id             :integer          not null, primary key # ID
#  name           :string(255)      not null              # フィルタ名
#  display_order  :integer          default(1), not null  # 表示順
#  display_mypage :integer          default(1), not null  # マイページ表示
#  created_at     :datetime         not null              # 作成日時
#  updated_at     :datetime         not null              # 更新日時
#

FactoryGirl.define do
  factory :filter do
    
  end

end
