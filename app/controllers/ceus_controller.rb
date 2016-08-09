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
      current_user = User.find_by(id: params[:user_id])
      @ceu = current_user.ceus.find(id: params[:id])
    else
      @ceu = Ceu.find(params[:id])
    end
  end

  def new
    current_user = User.find_by(id: params[:user_id])
    @ceu = current_user.ceus.build
  end

  def create
    @ceu = current_user.ceus.create(ceu_params)
    redirect_to user_path(current_user)
  end

  def edit
    if params[:user_id]
      current_user = User.find_by(id: params[:user_id])
      @ceu = current_user.ceus.find_by(id: params[:id])
      redirect_to user_ceu_path(@ceu.id)
    else
      @ceu = Ceu.find(params[:id])
    end
  end

  def update
    @ceu = Ceu.find(params[:id])
    @ceu.update(ceu_params)
    if @ceu.save
      redirect_to @ceu
    else
      render :edit
    end
  end

  private

  def ceu_params
    params.require(:ceu).permit(:title, :date, :duration, :location, :certificate_ids => [], certificate_attributes: [:classification])
  end
end
