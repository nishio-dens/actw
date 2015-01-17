require 'feedjira'

class CrawlRssService < BaseService
  def execute(coordination, job_number)
    Feedjira::Feed
      .fetch_and_parse(coordination.url)
      .entries
      .select { |entry| entry_match?(:all, coordination.coordination_conditions, entry) }
      .reject { |entry| entry_match?(:any, coordination.coordination_exclude_conditions, entry) }
      .each { |entry| persist_entry(coordination, job_number, entry) }
  end

  private

  def entry_match?(any_all, coordination_conditions, entry)
    coordination_conditions.send("#{any_all}?") do |condition|
      value = entry.send(condition.condition_key)
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
