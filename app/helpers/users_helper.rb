module UsersHelper
    def user_params
        params.require(:user).permit(:username, :email, :avatar, :article_id)
    end

    def not_found
        raise ActionController::RoutingError, 'Not Found'
    end

    private

    def set_user
        @user = User.find(params[:id]) or not_found
    end
end
