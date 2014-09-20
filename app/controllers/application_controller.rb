require 'cancan'
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    if current_user
      redirect_to root_path, :alert => "You are not authorise to access this page"
    else
      redirect_to new_user_session_path, :alert => "You are not authorise to access this page"
    end
  end

  private
    def current_user
      if session[:user_id]
        @current_user ||= User.find(session[:user_id])
      else
        super
      end
    end
    helper_method :current_user
end
