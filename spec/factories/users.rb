# == Schema Information
#
# Table name: users # ユーザ
#
#  id         :integer          not null, primary key # ID
#  name       :string(255)      not null              # ユーザ名
#  uid        :string(255)      default(""), not null # UID
#  provider   :string(255)      default(""), not null # プロバイダ
#  created_at :datetime         not null              # 作成日時
#  updated_at :datetime         not null              # 更新日時
#

FactoryGirl.define do
  factory :user do
    
  end

end
