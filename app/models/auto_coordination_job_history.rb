# == Schema Information
#
# Table name: auto_coordination_job_histories # 自動連携ジョブ履歴
#
#  id                 :integer          not null, primary key
#  coordination_id    :integer          not null              # 自動連携ID
#  job_id             :string(40)       not null              # ジョブID
#  job_status_id      :integer          not null              # ジョブステータス
#  request_program_id :string(10)                             # 要求元プログラム
#  finished_at        :datetime                               # ジョブ実行完了日時
#  created_at         :datetime         not null              # 作成日時
#  updated_at         :datetime         not null              # 更新日時
#

class AutoCoordinationJobHistory < ActiveRecord::Base
  belongs_to :coordination
end
