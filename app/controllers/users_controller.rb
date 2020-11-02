class UsersController < ApplicationController
    include UsersHelper

    def index
    end
    

    def show
        (@user = User.find(params[:id])) or not_found
    end

    def articles; end
    private

    def user_params
        params.require(:user).permit(:username, :email, :avatar, :article_id)
    end

end
