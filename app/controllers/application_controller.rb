require 'cancan'
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
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
