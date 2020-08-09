# frozen_string_literal: true

module SessionsHelper
  def user_params
    params.require(:user).permit(:username)
    end
end
