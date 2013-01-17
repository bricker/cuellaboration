class CuesController < ApplicationController
  before_filter :set_project
  before_filter :set_cue, only: [:show, :edit, :update, :destroy]
  
  #-----------------------
  
  def index
    @cues = Cue.order("number")
  end
  
  #-----------------------
  
  def show
  end
  
  #-----------------------
  
  def new
    @cue = Cue.new
  end
  
  #-----------------------
  
  def edit
  end
  
  #-----------------------
  
  def create
    @cue = Cue.new(cue_params)
    @cue.project = @project
    flash[:notice] = "Added Cue" if @cue.save
    respond_with @cue
  end
  
  #-----------------------
  
  def update
    flash[:notice] = "Updated Cue" if @cue.update_attributes(cue_params)
    respond_with @cue
  end
  
  #-----------------------
  
  def destroy
    @cue.destroy
    respond_with @cue, notice: "Removed Cue"
  end
  
  #-----------------------
  
  private
  
  def set_project
    @project = Project.find(params[:project_id])
  end

  #-----------------------
  
  def set_cue
    @cue = Cue.find(params[:id])
  end
  
  #-----------------------
  
  def cue_params
    params.require(:cue).permit(:project, :title, :number, :approved)
  end
end
