# == Schema Information
#
# Table name: auto_coordination_job_histories # 自動連携ジョブ履歴
#
#  id                 :integer          not null, primary key
#  coordination_id    :integer          not null               # 自動連携ID
#  job_name           :string(255)      not null               # ジョブ名称
#  job_id             :string(40)       not null               # ジョブID
#  job_status_id      :string(10)       not null               # ジョブステータス
#  data_count         :integer          default("0"), not null # 連携データ数
#  request_program_id :string(10)                              # 要求元プログラム
#  error_message      :text(65535)                             # 実行エラーメッセージ
#  finished_at        :datetime                                # ジョブ実行完了日時
#  created_at         :datetime         not null               # 作成日時
#  updated_at         :datetime         not null               # 更新日時
#

class AutoCoordinationJobHistory < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :coordination
  belongs_to_active_hash :job_status, class_name: 'Division::JobStatus'

  def self.create_history(job_id, coordination)
    AutoCoordinationJobHistory.create(
      job_id: job_id,
      coordination_id: coordination.id,
      job_name: coordination.title,
      job_status_id: Division::JobStatus::RUNNING.id,
      user_id: coordination.user_id
    )
  end

  def record_success(data_count)
    self.tap do |h|
      h.coordination.update(last_updated_at: Time.current)
      h.job_status_id = Division::JobStatus::SUCCESS.id
      h.data_count = data_count
      h.finished_at = Time.current
      h.save
    end
  end

  def record_failure(error_message)
    self.tap do |h|
      h.error_message = error_message
      h.job_status_id = Division::JobStatus::FAILURE.id
      h.finished_at = Time.current
      h.save
    end
  end
end
