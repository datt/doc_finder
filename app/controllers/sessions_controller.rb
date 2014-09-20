class SessionsController < ApplicationController
  skip_before_filter :authenticate_user!
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    user.remember_me = true
    sign_in user
    # session[:user_id] = user.id
    redirect_to root_url
  end
end

