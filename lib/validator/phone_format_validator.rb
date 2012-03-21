class PhoneFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value =~ /[\d\s\(\)-\+\.]{7,20}/i
      object.errors[attribute] << (options[:message] || "not formatted properly")
    end
  end
end