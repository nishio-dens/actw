# == Schema Information
#
# Table name: coordination_conditions # 自動連携条件
#
#  id              :integer          not null, primary key
#  coordination_id :integer          not null               # 自動連携ID
#  condition_key   :string(50)       not null               # 連携条件キー
#  relation        :string(10)       not null               # 比較演算
#  condition_value :string(255)      not null               # 連携条件値
#  category_id     :integer          not null               # カテゴリID
#  tagging         :boolean          default("1"), not null # タグ付け
#  created_at      :datetime         not null               # 作成日時
#  updated_at      :datetime         not null               # 更新日時
#

class CoordinationCondition < ActiveRecord::Base
  belongs_to :coordination
  belongs_to :category
  has_many :coordination_condition_filters
end
