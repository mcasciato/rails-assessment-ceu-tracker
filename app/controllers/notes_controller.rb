class NotesController < ApplicationController

  def create
    @ceu = current_user.ceus.find_by(id: params[:id])
    note = Note.new(note_params)
    note.user_id = current_user.id
    note.save
    flash[:success] = "Note successfully created!"
    redirect_to user_path(current_user)
    # else
    #   flash[:error] = "Please enter content for the note."
    #   redirect_to user_ceu_path(current_user, @ceu)
    # end
  end

  private

  def note_params
    params.require(:note).permit(:content, :ceu_id, :user_id)
  end


end
