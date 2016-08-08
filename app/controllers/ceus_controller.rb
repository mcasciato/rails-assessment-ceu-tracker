class CeusController < ApplicationController
  def index
    if params[:user_id]
      @ceus = User.find(params[:user_id]).ceus
    else
      @ceus = Ceu.all
    end
  end

  def show
    if params[:user_id]
      @ceu = Ceu.find(params[:id])
    else
      @ceu = Ceu.find(params[:id])
    end
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @ceu = Ceu.new
  end

  def create
    @ceu = Ceu.new(ceu_params)
    @ceu.save
    redirect_to user_path(current_user)
      # maybe change this later?
  end

  private

  def ceu_params
    params.require(:ceu).permit(:title, :date, :duration, :location, :certificate_ids => [], certificate_attributes: [:classification])
  end
end
