class UsersController < ApplicationController
    include UsersHelper

    def show
        (@user = User.find(params[:id])) or not_found
    end

    def articles; end
    private

    def user_params
        params.require(:user).permit(:username, :email, :profile_image)
    end

end
