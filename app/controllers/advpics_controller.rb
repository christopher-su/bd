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
      flash[:notice] = "Successfully upload images."
      redirect_to advpics_path
    else
      render :action => 'new'
    end
  end

  def show
    @advpic = Advpic.find(params[:id])
  end

end
