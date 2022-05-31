class ApplicationController < ActionController::Base
  helper_method :current_user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def is_logged_in?
    redirect_to login_path, alert: 'You must be signed in' if current_user.nil?
  end
end
