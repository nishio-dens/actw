# == Schema Information
#
# Table name: products # 成果物
#
#  id           :integer          not null, primary key # ID
#  title        :string(255)      not null              # タイトル
#  url          :text(65535)      not null              # URL
#  description  :text(65535)                            # 概要
#  category_id  :integer                                # カテゴリID
#  user_id      :integer          not null              # ユーザID
#  published_at :datetime         not null              # 公開日
#  created_at   :datetime         not null              # 作成日時
#  updated_at   :datetime         not null              # 更新日時
#

class Product < ActiveRecord::Base
  acts_as_taggable_on :tags

  belongs_to :category
  belongs_to :user
  has_many :product_filters
  has_many :filters, through: :product_filters

  accepts_nested_attributes_for :product_filters, allow_destroy: true

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 4096 }
  validates :url, presence: true, length: { maximum: 4096 }, url: true
  validates :user_id, presence: true
  validates :published_at, presence: true
end
