class RssCrawlJob < ActiveJob::Base
  queue_as :default

  def perform(coordination)
    AutoCoordinationJobHistory.create(
      job_id: self.job_id,
      coordination_id: coordination.id,
      job_status_id: 'start'
    )
    Rails.logger.info("call #{coordination.id}")
  end
end
