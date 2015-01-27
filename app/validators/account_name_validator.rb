require 'active_model/validations'

class AccountNameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid_account_format, options) unless valid_name?(value)
  end

  def valid_name?(value)
    value =~ /^[0-9a-zA-Z\-_ ]+$/
  end
end
