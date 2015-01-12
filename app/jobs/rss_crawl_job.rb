class RssCrawlJob < ActiveJob::Base
  queue_as :default

  def perform(coordination)
    history = AutoCoordinationJobHistory.create_history(self.job_id, coordination)
    begin
      CrawlRssService.new.execute(coordination)
      history.record_success
    rescue => e
      history.record_failure(e.message)
    end
  end
end
