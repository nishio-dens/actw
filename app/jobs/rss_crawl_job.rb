class RssCrawlJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    Rails.logger.info('call')
  end
end
