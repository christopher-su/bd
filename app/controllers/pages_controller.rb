=begin
User Controller
For Home Page
=end

class PagesController < ApplicationController
	skip_before_filter :authorize,:only => :home
  def home
    @advpics = Advpic.all
    @categories = Category.all
  end

  def admin
    
  end

end
