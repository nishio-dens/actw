require 'active_model/validations'

class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if options[:allow_nil] && value.nil?
    return if options[:allow_blank] && value.blank?
    record.errors.add(attribute, :invalid_url, options) unless valid_url?(value)
  end

  def valid_url?(value)
    url = (value.start_with?('http://') || value.start_with?('https://')) && URI.parse(value)
    url.kind_of?(URI::HTTP) || url.kind_of?(URI::HTTPS)
  rescue
    false
  end
end
