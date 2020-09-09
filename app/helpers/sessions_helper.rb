module SessionsHelper
  def user_params
    params.require(:user).permit(:name)
  end

  def logged_in?
    !@current_user.nil?
  end
end
