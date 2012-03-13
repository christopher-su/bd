class Admin::CategoryController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to(admin_category_path,
            :notice => '类别修改成功.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
  end

end
