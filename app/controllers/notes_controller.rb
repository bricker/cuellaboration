class NotesController < ApplicationController
  before_filter :set_note, only: [:show, :edit, :update, :destroy]
  
  #-----------------------
  
  def index
    @notes = Note.order("created_at")
  end
  
  #-----------------------
  
  def show
  end
  
  #-----------------------
  
  def new
    @note = Note.new
  end
  
  #-----------------------
  
  def edit
  end
  
  #-----------------------
  
  def create
    @note = Note.new(note_params)
    flash[:notice] = "Added Note" if @note.save
    respond_with @note
  end
  
  #-----------------------
  
  def update
    flash[:notice] = "Updated Note" if @note.update_attributes(note_params)
    respond_with @note
  end
  
  #-----------------------
  
  def destroy
    @note.destroy
    respond_with @note, notice: "Removed Note"
  end
  
  #-----------------------
  
  private
  
  def set_note
    @note = Note.find(params[:id])
  end

  #-----------------------
  
  def note_params
    params.require(:note).permit(:notable_id, :notable_type, :collaborator_id, :body)
  end
end
