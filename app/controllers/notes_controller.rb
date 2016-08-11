class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]


  def show
  end

  def create
    note = Note.new(note_params)
    note.user_id = current_user.id
    note.save
    redirect_to note.ceu
  end

  # def edit
  #
  # end
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

  def set_note
    @note = Note.find(params[:id])
  end

end
