class DatetimeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if (DateTime.parse(value.to_s) rescue ArgumentError) == ArgumentError
      record.errors[attribute] << 'must be a valid datetime'
    end
  end
end