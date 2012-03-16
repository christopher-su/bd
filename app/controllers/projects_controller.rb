=begin
Admin Controller
For Project Administrating
=end

class ProjectsController < ApplicationController

  def index
    @projects =  Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = "Successfully upload image."
      redirect_to projects_path
    else
      render :action => 'new'
    end
  end

end
