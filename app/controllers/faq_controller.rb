=begin
User Controller
For FAQ Page
=end

class FaqController < ApplicationController
  skip_before_filter :authorize
  def index
    @page_title = "FAQ"
    @faqs = Faq.all
  end

end
