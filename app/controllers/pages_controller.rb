class PagesController < ApplicationController
	
  #Action for home.html.erb
  def home
  	@page_title = "Home"
    @advpics = Advpic.all
  end

end
