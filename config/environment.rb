# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Brosis::Application.initialize!

# To make the validation errors display as input field's value
#ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
#  if instance.error_message.kind_of?(Array)
#    error_msg = instance.error_message.join(',')
#  else
#    error_msg = instance.error_message
#  end
#
#  if html_tag =~ /<(input|textarea)[^>]+value=/
#    value_attribute = html_tag =~ /value=['"]/
#    html_tag.insert(value_attribute + 7, "#{error_msg}; ")
#  elsif html_tag =~ /<(input|textarea)/
#    first_whitespace = html_tag =~ /\s/
#    html_tag[first_whitespace] = " value='#{error_msg}' "
#  end
#  %(<div class="field_with_errors">#{html_tag}</div>).html_safe
#end
