class UsersController < ApplicationController
  before_filter :authenticate_user!
  # before_action :set_user, only: [:show, :edit, :update]
  # after_action :verify_authorized

  def index

  end

  def new

  end

  def show
    @user = User.find(params[:id])
  end
end
