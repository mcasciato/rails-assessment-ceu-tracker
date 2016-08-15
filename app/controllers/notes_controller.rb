class NotesController < ApplicationController
  # before_action :set_note, only: [:show, :edit, :update, :destroy]


  def create
    note = Note.new(note_params)
    note.user_id = current_user.id
    note.save
    redirect_to note.ceu
  end

  # def show
  #
  # end
  #
  # def edit
  #
  # end
  #
  # ** ADD THESE LATER **
  #
  # def update
  #
  # end
  #
  # def destroy
  #
  # end

  private

  def note_params
    params.require(:note).permit(:content, :ceu_id, :user_id)
  end
  #
  # def set_note
  #   @note = Note.find(params[:id])
  # end

end
