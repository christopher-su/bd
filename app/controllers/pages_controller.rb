=begin
User Controller
For Home Page
=end

class PagesController < ApplicationController
	
  def home
    @advpics = Advpic.all
    @categories = Category.all
  end

  def admin
    
  end

end
