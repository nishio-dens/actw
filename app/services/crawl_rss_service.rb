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

  def feed_match?(coordination_conditions, feed)
    coordination_conditions.any? do |condition|
      value = feed.send(condition.condition_key)
      if !value.present?
        false
      elsif condition.predicate == 'cont'
        if value.is_a? Array
          value.any? { |v| v.to_s.include?(condition.condition_value) }
        else
          value.to_s.include?(condition.condition_value)
        end
      elsif condition.predicate == 'eq'
        if value.is_a? Array
          value.any? { |v| v.to_s == condition.condition_value }
        else
          value.to_s == condition.condition_value
        end
      end
    end
  end

  def persist_entry(coordination, job_number, entry)
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
      product.tag_list = entry.categories if coordination.tagging
      coordination.coordination_filters.each do |filter|
        product.product_filters.build(filter_id: filter.filter_id)
      end
      unless product.save
        raise ActiveRecord::RecordInvalid(
          "SaveError[coordination_id: #{coordination.id}]" + product.errors.full_messages.join("\n")
        )
      end
    end
  end
end
