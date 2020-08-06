class AdminsController < ApplicationController
  def login
    @admin = Admin.new
  end

  def check

    if @admin
      flash.notice = 'logged in'
      #session[:auth] = @admin
      redirect_to new_category_path
    else
      flash.notice = 'Incorrect username'
      redirect_to admins_login_path
    end
  end

  
  def destroy
  end
end
