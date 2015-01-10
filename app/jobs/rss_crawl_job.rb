class RssCrawlJob < ActiveJob::Base
  queue_as :default

  def perform(coordination)
    Rails.logger.info("call #{coordination.id}")
  end
end
