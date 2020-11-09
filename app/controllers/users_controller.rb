class UsersController < ApplicationController
    include UsersHelper

    def index
    end
    

    def show
        (@user = User.find(params[:id])) or not_found
    end

    def articles; end

end
