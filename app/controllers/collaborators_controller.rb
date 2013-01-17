class CollaboratorsController < ApplicationController
  before_filter :set_collaborator, only: [:show, :edit, :update, :destroy]
  
  #-----------------------
  
  def index
    @collaborators = Collaborator.order("created_at")
  end

  #-----------------------
  
  def show
  end

  #-----------------------
  
  def new
    @collaborator = Collaborator.new
  end

  #-----------------------
  
  def edit
  end

  #-----------------------
  
  def create
    @collaborator = Collaborator.new(collaborator_params)
    flash[:notice] = "Added Collaborator" if @collaborator.save
    respond_with @collaborator
  end

  #-----------------------
  
  def update
    flash[:notice] = "Updated Collaborator" if @collaborator.update_attributes(collaborator_params)
    respond_with @collaborator
  end

  #-----------------------
  
  def destroy
    @collaborator.destroy
    respond_with @collaborator, notice: "Removed Collaborator"
  end

  #-----------------------
  
  private
  
  def set_collaborator
    @collaborator = Collaborator.find(params[:id])
  end
  
  #-----------------------
  
  def collaborator_params
    params.require(:collaborator).permit(:password, :password_confirmation, :name, :email)
  end
end
