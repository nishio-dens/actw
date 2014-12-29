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
end
