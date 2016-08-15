class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    email_changed = @user.email != params[:user][:email]
    is_facebook_account = !@user.provider.blank?
    successfully_updated = if !is_facebook_account
      @user.update_with_password(update_params_with_password)
    else
      @user.update_without_password(update_params_without_password)
    end
    if successfully_updated
      sign_in @user, :bypass => true
      redirect_to user_path(current_user)
    else
      render "edit"
    end
  end

  private

  def sign_up_params
      params.require(:user).permit(:name, :occupation, :email, :password, :password_confirmation)
  end

  def update_params_with_password
    params.require(:user).permit(:name, :occupation, :email, :password, :password_confirmation, :current_password)
  end

  def update_params_without_password
    params.require(:user).permit(:name, :occupation, :email, :password, :password_confirmation)
  end
end
