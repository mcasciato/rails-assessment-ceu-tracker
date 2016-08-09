class NotesController < ApplicationController

  def create
    note = Note.create(note_params)
    redirect_to user_path(current_user)
  end

  private

  def note_params
    params.require(:note).permit(:content, :post_id, :user_id)
  end
end
