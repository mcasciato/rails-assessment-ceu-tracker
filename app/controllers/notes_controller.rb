class NotesController < ApplicationController
  # before_action :set_note, only: [:show, :edit, :update, :destroy]


  def create
    note = Note.new(note_params)
    note.user_id = current_user.id
    if note.save
      flash[:success] = "Note successfully created!"
      redirect_to note.ceu
    else
      flash[:error] = "Please enter content for the note."
      redirect_to note.ceu
    end
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
