class CeusController < ApplicationController
  def index
    if params[:user_id].to_i == current_user.id
      @ceus = current_user.ceus
      respond_to do |format|
        format.json {render json: @ceus}
        format.html {render :index}
      end
    else
      flash[:error] = "You can only access your own CEUs."
      redirect_to :root
    end
  end

  def new
    current_user = User.find_by(id: params[:user_id])
    @ceu = current_user.ceus.build
  end

  def create
    @ceu = current_user.ceus.create(ceu_params)
    if @ceu.save
      # flash[:success] = "CEU successfully created!"
      respond_to do |format|
        format.json {render json: @ceu, status: 201}
      end
    else
      # flash[:error] = "Please fill in all fields."
      render :new
    end
  end

  def show
    params[:user_id].to_i == current_user.id
    @ceu = current_user.ceus.find(params[:id])
    @note = Note.new
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @ceu}
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
      respond_to do |format|
        format.json {render json: @ceu, status: 201}
      end
    else
      render :edit
    end
  end

  def destroy
    @ceu = current_user.ceus.find_by(id: params[:id])
    @ceu.destroy
    flash[:error] = "CEU successfully deleted."
    redirect_to user_ceus_path
  end

  private

  def ceu_params
    params.require(:ceu).permit(:title, :date, :duration, :location, :certificate)
  end
end
