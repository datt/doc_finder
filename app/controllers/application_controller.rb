require 'cancan'
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  raise CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => "You are not authorise to access this page"
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
