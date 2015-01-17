require 'feedjira'

class CrawlRssService < BaseService
  def execute(coordination, job_number)
    feed = Feedjira::Feed.fetch_and_parse(coordination.url)
    # TODO conditionを考慮
    feed.entries.each do |entry|
      persist_entry(coordination, job_number, entry)
    end
  end

  private

  def persist_entry(coordination, job_number, entry)
    # TODO フィルタ追加・タグ追加
    unless Product.where(user_id: coordination.user_id, url: entry.url).exists?
      product = Product.new(
        title: entry.title,
        url: entry.url,
        description: entry.summary,
        category_id: coordination.category_id,
        user_id: coordination.user_id,
        manual: false,
        job_number: job_number,
        published_at: entry.published
      )
    end
  end
end
