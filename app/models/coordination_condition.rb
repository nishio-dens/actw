# == Schema Information
#
# Table name: coordination_conditions # 自動連携条件
#
#  id              :integer          not null, primary key
#  coordination_id :integer          not null              # 自動連携ID
#  condition_key   :string(50)       not null              # 連携条件キー
#  predicate       :string(10)       not null              # 検索述語
#  condition_value :string(255)      not null              # 条件値
#  created_at      :datetime         not null              # 作成日時
#  updated_at      :datetime         not null              # 更新日時
#

class CoordinationCondition < ActiveRecord::Base
  belongs_to :coordination
  belongs_to :category
end
