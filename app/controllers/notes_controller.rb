class NotesController < ApplicationController

  def create
    @ceu = current_user.ceus.find_by(id: params[:id])
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    @note.save
    flash[:success] = "Note successfully created!"
    redirect_to user_path(current_user)
  end

  def edit
    @note = Note.find_by(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    @note.save
    flash[:success] = "Note successfully updated."
    redirect_to user_path(current_user)
  end

  # def destroy
  #   @note = Note.find(params[:id])
  #   @note.destroy
  #   flash[:error] = "Note successfully deleted."
  #   redirect_to user_path(current_user)
  # end

  private

  def note_params
    params.require(:note).permit(:content, :ceu_id, :user_id)
  end


end
