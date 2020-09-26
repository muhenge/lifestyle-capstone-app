class UsersController < ApplicationController
    include UsersHelper
    before_action :set_user, only: %i[:show]

    def show; end

    def articles; end
end
