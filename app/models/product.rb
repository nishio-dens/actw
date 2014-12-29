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

  before_create :increment_filter_data_count_on_create
  before_destroy :decrement_filter_data_count_and_destroy_product_filters

  private

  def increment_filter_data_count_on_create
    self.filters.each do |filter|
      Filter.increment_counter(:data_count, filter.id)
    end
  end

  def decrement_filter_data_count_and_destroy_product_filters
    self.filters.each do |filter|
      Filter.decrement_counter(:data_count, filter.id)
    end
    self.product_filters.each(&:destroy)
  end
end
