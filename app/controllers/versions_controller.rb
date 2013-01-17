class VersionsController < ApplicationController
  before_filter :set_project
  before_filter :set_version, only: [:show, :edit, :update, :destroy]
  
  #-----------------------
  
  def index
    @versions = Version.order("number")
  end
  
  #-----------------------
  
  def show
  end
  
  #-----------------------
  
  def new
    @version = Version.new
  end
  
  #-----------------------
  
  def edit
  end
  
  #-----------------------
  
  def create
    @version = Version.new(version_params)
    @version.cue = @cue
    flash[:notice] = "Added Version" if @version.save
    respond_with @version
  end
  
  #-----------------------
  
  def update
    flash[:notice] = "Updated Version" if @version.update_attributes(version_params)
    respond_with @version
  end
  
  #-----------------------
  
  def destroy
    @version.destroy
    respond_with @version, notice: "Removed Version"
  end
  
  #-----------------------
  
  private
  
  def set_cue
    @cue = Cue.find(params[:cue_id])
  end

  #-----------------------
  
  def set_version
    @version = Version.find(params[:id])
  end
  
  #-----------------------
  
  def version_params
    params.require(:version).permit(:cue_id, :number, :media_file, :delivered_at, :finalized)
  end
end
