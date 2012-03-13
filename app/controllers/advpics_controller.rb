class AdvpicsController < ApplicationController

  def index
    @advpics = Advpic.all
  end

  def new
    @advpic = Advpic.new
  end

  def create
    @advpic = Advpic.new(params[:advpic])
    if @advpic.save
      flash[:notice] = "Successfully upload image."
      redirect_to advpics_path
    else
      render :action => 'new'
    end
  end

  def show
    @advpic = Advpic.find(params[:id])
  end

  def destroy
    @advpic = Advpic.find(params[:id])
    @advpic.photo.destroy if @advpic.destroy
    flash[:notice] = "Successfully destroyed image."
    redirect_to advpics_url
  end

end
