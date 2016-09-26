class UsersController < ApplicationController
  before_filter :authenticate_user!
  # before_action :set_user, only: [:show, :edit, :update]
  # after_action :verify_authorized

  def index
    if current_user.admin?
      @users = User.all
    else
      redirect_to :root
      flash[:error] = "You do not have admin access."
    end
  end

  def new

  end

  def show
    if params[:id].to_i == current_user.id || current_user.admin?
      @user = User.find(params[:id])
    else
      redirect_to :root
      flash[:error] = "Unauthorized Access"
    end
  end
end
