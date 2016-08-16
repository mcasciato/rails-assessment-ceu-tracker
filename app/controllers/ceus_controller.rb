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
      @ceu = current_user.ceus.find(params[:id])
      @note = @ceu.notes.build
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
    @certificate = Certificate.new(classification: params[:certificate][:classification], ceu_id: @ceu.id)
    @ceu.certificate = @certificate
    if @ceu.save
      flash[:success] = "CEU successfully created!"
      redirect_to user_path(current_user)
    else
      flash[:error] = "Please fill in all fields."
      render :new
    end
  end

  def edit
    if params[:user_id]
      current_user = User.find_by(id: params[:user_id])
      @ceu = current_user.ceus.find_by(id: params[:id])
      render :edit
    else
      @ceu = Ceu.find(params[:id])
    end
  end

  def update
    @ceu = Ceu.find(params[:id])
    @ceu.update(ceu_params)
    if @ceu.save
      flash[:success] = "CEU successfully updated."
      redirect_to user_ceu_path
    else
      render :edit
    end
  end

  def destroy
    @ceu = current_user.ceus.find_by(id: params[:id])
    @ceu.destroy
    flash[:error] = "CEU successfully deleted."
    redirect_to user_path(current_user)
  end

  private

  def ceu_params
    params.require(:ceu).permit(:title, :date, :duration, :location, certificate_attributes: [:classification, :ceu_id])
  end
end
