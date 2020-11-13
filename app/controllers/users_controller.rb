class UsersController < ApplicationController
    include UsersHelper
    before_action :set_user, only: %i[show user_articles]
    def index
    end
    
    def show; end

    def user_articles
        user_art = @user.articles
    end

end
