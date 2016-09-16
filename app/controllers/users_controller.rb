class UsersController < ApplicationController
  before_filter :authenticate_user!
  # before_action :set_user, only: [:show, :edit, :update]
  # after_action :verify_authorized

  def index
    if current_user.admin?
      @users = User.all
    else
      redirect_to root_path
      flash[:error] = "You do not have admin access."
    end
  end

  def new

  end

  def show
    @user = User.find(params[:id])
  #   if current_user.admin?
  #     @users = User.all
  #   end
  #   @ceus = current_user.ceus
  #
  end
end
