class NotesController < ApplicationController

  def create
    note = Note.new(note_params)
    note.user_id = current_user.id
    note.save
    redirect_to note.ceu
  end

  private

  def note_params
    params.require(:note).permit(:content, :ceu_id, :user_id)
  end

end
