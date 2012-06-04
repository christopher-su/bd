=begin
User Controller
For Home Page
=end

class PagesController < ApplicationController
	skip_before_filter :authorize,:only => :home
  def home
    @advpics = Advpic.all.reverse
    @categories = Category.all
  end

  def admin
    
  end

end
