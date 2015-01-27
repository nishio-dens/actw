# == Schema Information
#
# Table name: users # ユーザ
#
#  id                     :integer          not null, primary key  # ID
#  name                   :string(255)      not null               # ユーザ名
#  email                  :string(255)      not null               # メールアドレス
#  encrypted_password     :string(255)      not null               # 暗号化済パスワード
#  reset_password_token   :string(255)                             # リセットパスワードトークン
#  reset_password_sent_at :datetime                                # リセットパスワード送信日
#  sign_in_count          :integer          default("0"), not null # ログイン数
#  current_sign_in_at     :datetime                                # 最近ログインした日時
#  last_sign_in_at        :datetime                                # 最後にログインした日時
#  current_sign_in_ip     :string(255)                             # 最近ログインしたログイン元IP
#  last_sign_in_ip        :string(255)                             # 最後にログインしたログイン元IP
#  uid                    :string(255)      default(""), not null  # UID
#  provider               :string(255)      default(""), not null  # プロバイダ
#  temporary              :integer          default("1"), not null # 仮登録
#  created_at             :datetime         not null               # 作成日時
#  updated_at             :datetime         not null               # 更新日時
#

class User < ActiveRecord::Base
  devise :database_authenticatable, :omniauthable, :recoverable,
         :registerable, :trackable, :validatable

  has_many :filters
  has_one :user_profile
  has_many :user_category_summaries
  has_many :categories, through: :user_category_summaries

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, email: true, uniqueness: true
  validates :password, presence: true

  def self.find_for_twitter_oauth(auth, sign_in_resource)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    if user.present?
      user
    else
      User.create(
        name: auth.info.nickname,
        provider: auth.provider,
        uid: auth.uid,
        email: auth.info.nickname + "@dummy.com",
        password: Devise.friendly_token
      )
    end
  end
end
