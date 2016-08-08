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
end
