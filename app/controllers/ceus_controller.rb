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
    @ceu = @user.ceus.build
  end

  def create
    @ceu = current_user.ceus.create(ceu_params)
    redirect_to user_path(current_user)
  end

  private

  def ceu_params
    params.require(:ceu).permit(:title, :date, :duration, :location, :certificate_ids => [], certificate_attributes: [:classification])
  end
end
