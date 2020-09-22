module UsersHelper
    def user_params
        params.require(:user).permit(:username, :email, :profile_image)
    end
end
