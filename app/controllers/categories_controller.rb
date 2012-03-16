=begin
User Controller
For Each Category Page
=end

class CategoriesController < ApplicationController

  def index
    
  end

  def show
    @category = Category.find(params[:id])
    @projects = @category.projects
  end
end
