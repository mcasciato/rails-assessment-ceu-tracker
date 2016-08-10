class Users::RegistrationsController < Devise::RegistrationsController
    def edit
        @user = current_user
    end

    def update
        if @user.update(account_update_params)
            redirect_to user_path(@user), notice: 'User updated'
        else
            redirect_to user_path(@user), alert: 'Unable to update user'
        end
    end

    private

    def sign_up_params
        params.require(:user).permit(:name, :occupation, :email, :password, :password_confirmation)
    end

    def account_update_params
        params.require(:user).permit(:name, :occupation, :email, :password, :password_confirmation, :current_password)
    end
end
