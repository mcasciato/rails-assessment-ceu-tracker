class NotesController < ApplicationController

  def create
    current_user = User.find_by(id: params[:user_id])
    note = Note.create(note_params)
    redirect_to user_path(current_user)
  end

  private

  def note_params
    params.require(:note).permit(:content, :post_id, :user_id)
  end
end
