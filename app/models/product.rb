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
#  job_number   :integer                                 # 連携ジョブ番号
#  published_at :datetime         not null               # 公開日
#  created_at   :datetime         not null               # 作成日時
#  updated_at   :datetime         not null               # 更新日時
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
  before_create :increment_user_category_summary_count
  before_update :update_user_category_summary_count
  before_destroy :decrement_user_category_summary_count

  private

  # FIXME: フィルターアップデートのタイミングでカウントが更新されない

  def increment_filter_data_count_on_create
    self.product_filters.each do |filter|
      Filter.increment_counter(:data_count, filter.filter_id)
    end
  end

  def decrement_filter_data_count_and_destroy_product_filters
    self.product_filters.each do |filter|
      Filter.decrement_counter(:data_count, filter.filter_id)
    end
    self.product_filters.each(&:destroy)
  end

  def increment_user_category_summary_count
    UserCategorySummary
      .increment_data_count_of(user_id: user_id, category_id: Category.all_category_id)
    UserCategorySummary
      .increment_data_count_of(user_id: user_id, category_id: category_id)
  end

  def update_user_category_summary_count
    if category_id != category_id_was
      UserCategorySummary
        .decrement_data_count_of(user_id: user_id, category_id: category_id_was)
      UserCategorySummary
        .increment_data_count_of(user_id: user_id, category_id: category_id)
    end
  end

  def decrement_user_category_summary_count
    UserCategorySummary
      .decrement_data_count_of(user_id: user_id, category_id: Category.all_category_id)
    UserCategorySummary
      .decrement_data_count_of(user_id: user_id, category_id: category_id)
  end
end
