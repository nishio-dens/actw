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

class User < ActiveRecord::Base
    devise :database_authenticatable, :omniauthable, :recoverable,
           :registerable, :rememberable, :trackable, :validatable
end
