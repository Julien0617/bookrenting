class ApplicationController < ActionController::Base
  

  def authenticate_user
    unless current_user
      redirect_to login_path, alert: "You don't have access to this page"
    end
  end

  def current_user
    @current_user ||= session[:current_user]
  end
end
