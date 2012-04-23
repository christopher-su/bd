=begin
User Controller
For Team Page
=end
class TeamController < ApplicationController

  skip_before_filter :authorize

  def index
    @page_title = "Our Team"
  end
  
end
