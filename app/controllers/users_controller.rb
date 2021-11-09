class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index]

  def index
    @book = Book.is_not_rental
    @current_user = User.find(current_user['id'])
  end

  def show
    id = params[:id]
    @user = User.find(id)
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: 'Your account was successfully created'
    else
      flash[:error] = "User has errors"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: 'User was successfully updated'
    else
      flash[:error] = "User has errors"
      render 'edit'
    end
  end


  def rentbook
      @book = Book.find(params[:book])
      @book.update(is_rental: true, rental_id: params[:user])
      redirect_to users_path, notice: 'Book was successfully updated'
  end

  def destroy
    id = params[:id]
    user = User.find(id)
    user.destroy
    redirect_to users_path, notice: 'User was successfully deleted'
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :city, :town, :password, :password_confirmation)
  end

  def book_params
    params.require(:book).permit(:name, :author_name, :description, :gender, :is_rental)
  end
end
