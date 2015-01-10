class RssCrawlJob < ActiveJob::Base
  queue_as :default

  def perform(coordination)
    history = AutoCoordinationJobHistory.create_history(self.job_id, coordination)
    begin
      history.record_success
    rescue
      history.record_failure
    end
  end
end
