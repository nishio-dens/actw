# == Schema Information
#
# Table name: user_category_summaries # ユーザ/カテゴリ集計
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null               # ユーザID
#  category_id :integer          not null               # カテゴリID
#  data_count  :integer          default("0"), not null # 集計数
#  created_at  :datetime         not null               # 作成日時
#  updated_at  :datetime         not null               # 更新日時
#

class UserCategorySummary < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  def self.increment_data_count_of(user_id: nil, category_id: nil)
    return if category_id.nil?
    UserCategorySummary
      .find_or_create_by(user_id: user_id, category_id: category_id)
      .tap { |c| c.increment(:data_count) }
      .tap { |c| c.save }
  end

  def self.decrement_data_count_of(user_id: nil, category_id: nil)
    return if category_id.nil?
    UserCategorySummary
      .find_by(user_id: user_id, category_id: category_id)
      .tap { |c| c.decrement(:data_count) }
      .tap { |c| c.save }
  end
end
