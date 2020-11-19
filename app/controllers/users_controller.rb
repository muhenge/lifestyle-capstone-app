class UsersController < ApplicationController
    include UsersHelper
    before_action :set_user, only: %i[show user_articles]
    def index
    end

    def show
        @user_art = @user.articles
    end

    def user_articles
    end
end
