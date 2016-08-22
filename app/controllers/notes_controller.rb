class NotesController < ApplicationController

  def index
    if params[:ceu_id]
      @notes = Ceu.find(params[:ceu_id]).notes
    else
      @notes = Note.all
    end
  end

  def show
    if params[:ceu_id]
      ceu = current_user.ceus.find_by(id: params[:id])
      @note = current_user.notes.find_by(id: params[:id])
    else
      @note = Note.find(params[:id])
    end
  end

  def create
    @ceu = current_user.ceus.find_by(id: params[:id])
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    if @note.save
      flash[:success] = "Note successfully created!"
      redirect_to user_ceu_path(@note.user_id, @note.ceu_id)
    else
      flash[:error] = "Your note must have content"
      redirect_to user_ceu_path(@note.user_id, @note.ceu_id)
    end
  end

  def edit
    if params[:ceu_id]
      ceu = current_user.ceus.find_by(id: params[:id])
      @note = current_user.notes.find_by(id: params[:id])
      render :edit
    else
      @note = Note.find(params[:id])
    end
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    @note.save
    flash[:success] = "Note successfully updated."
    redirect_to user_ceu_path(@note.user_id, @note.ceu_id)
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    flash[:error] = "Note successfully deleted."
    redirect_to user_ceu_path(@note.user_id, @note.ceu_id)
  end

  private

  def note_params
    params.require(:note).permit(:content, :ceu_id, :user_id)
  end


end
