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

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      redirect_to projects_path
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes(params[:project])

    unless params[:project][:pics].nil?
      params[:project][:pics].each do |pic|
        @propic = Propic.find(pic.second.to_i)
        @propic.photo.destroy if @propic.destroy
      end
    end

    redirect_to  projects_path
  end

end
