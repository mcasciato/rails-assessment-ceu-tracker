class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if @user.update_with_password(update_params)
      sign_in @user, :bypass => true
      redirect_to user_path(current_user), notice: 'User updated'
    else
      render "edit", alert: 'Unable to update user'
    end
  end

  private

  # def sign_up_params
  #     params.require(:user).permit(:name, :occupation, :email, :password, :password_confirmation)
  # end

  def update_params
    params.require(:user).permit(:name, :occupation, :email, :password, :password_confirmation, :current_password)
  end
end
