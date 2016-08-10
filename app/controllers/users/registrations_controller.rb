class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update_with_password(user_params)
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :occupation, :email, :password, :password_confirmation, :current_password)
  end
end
