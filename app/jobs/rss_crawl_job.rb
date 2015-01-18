class RssCrawlJob < ActiveJob::Base
  queue_as :default

  def perform(coordination)
    history = AutoCoordinationJobHistory.create_history(self.job_id, coordination)
    begin
      data_count = CrawlRssService.new.execute(coordination, history.id)
      history.record_success(data_count)
    rescue => e
      history.record_failure(e.message + e.backtrace.join("\n"))
    end
  end
end
