# == Schema Information
#
# Table name: coordination_filters # 自動連携登録先フィルタ
#
#  id              :integer          not null, primary key
#  coordination_id :integer          not null              # 自動連携ID
#  filter_id       :integer          not null              # フィルタID
#  created_at      :datetime         not null              # 作成日時
#  updated_at      :datetime         not null              # 更新日時
#

class CoordinationFilter < ActiveRecord::Base
  belongs_to :coordination
  belongs_to :filter
end
