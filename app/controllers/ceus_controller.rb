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
    @ceu = Ceu.new(user_id: params[:user_id])
  end

  private

  def ceu_params
    params.require(:ceu).permit(:title, :date, :duration)
end
