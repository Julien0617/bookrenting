class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:email]
    password = params[:password]
    user_find = User.find_by(email: email)
    user = User.find_by(email: email)&.authenticate(password)
    if user
      session[:current_user] = user
      if user_find.is_admin == false
        redirect_to users_path, notice: 'User Successfully logged in'
      else
        redirect_to user_books_path(current_user), notice: 'Admin Successfully logged in'
      end
    else
      redirect_to login_path, alert: 'email or password incorrect'
    end
  end

  def destroy
    session[:current_user] = nil
    redirect_to login_path, notice: 'Successfully logged out'
  end

  private
  def user
    @user ||= User.find(params[:user_id])
  end
end
