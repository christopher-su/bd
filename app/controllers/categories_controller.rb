=begin
User Controller
For Each Category Page
=end

class CategoriesController < ApplicationController
  skip_before_filter :authorize,:only => :show

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @projects = @category.projects
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to categories_path
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to(categories_path,
                                  :notice => '类别修改成功.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      redirect_to categories_path
    end
  end
end
