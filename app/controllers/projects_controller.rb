class ProjectsController < ApplicationController
  before_filter :set_project, only: [:show, :edit, :update, :destroy]
  
  #-----------------------
  
  def index
    @projects = Project.order("created_at")
  end
  
  #-----------------------
  
  def show
  end
  
  #-----------------------
  
  def new
    @project = Project.new
  end
  
  #-----------------------
  
  def edit
  end
  
  #-----------------------
  
  def create
    @project = Project.new(project_params)
    flash[:notice] = "Added Project" if @project.save
    respond_with @project
  end
  
  #-----------------------
  
  def update
    flash[:notice] = "Updated Project" if @project.update_attributes(project_params)
    respond_with @project
  end
  
  #-----------------------
  
  def destroy
    @project.destroy
    respond_with @project, notice: "Removed Project"
  end
  
  #-----------------------
  
  private

  def set_project
    @project = Project.find(params[:id])
  end
  
  #-----------------------
  
  def project_params
    params.require(:project).permit(:title, :media_location)
  end
end
