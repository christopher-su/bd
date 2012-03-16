=begin
User Controller
For Home Page
=end

class PagesController < ApplicationController
	
  def home
  	@page_title = "Home"
    @advpics = Advpic.all
    @categories = Category.all
  end

end
