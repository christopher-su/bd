=begin
User Controller
For FAQ Page
=end

class FaqController < ApplicationController

  def index
    @faqs = Faq.all
  end

end
