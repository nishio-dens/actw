# == Schema Information
#
# Table name: coordination_condition_filters # 自動連携条件登録先フィルタ
#
#  id                        :integer          not null, primary key
#  coordination_condition_id :integer          not null              # 自動連携条件ID
#  filter_id                 :integer          not null              # フィルタID
#  created_at                :datetime         not null              # 作成日時
#  updated_at                :datetime         not null              # 更新日時
#

class CoordinationConditionFilter < ActiveRecord::Base
  belongs_to :coordination
  belongs_to :filter
end
