class BooksController < ApplicationController
  before_action :authenticate_user

  def index
    @book = Book.all
    @current_user_id = User.find(params[:user_id])
  end

  def show
    id = params[:id]
    @book = Book.find(id)
  end

  def new
    @book = user.books.build
  end

  def create
    @book = user.books.build(book_params)
    if @book.save 
      redirect_to user_books_path, notice: 'Your book was successfully created'
    else
      flash[:error] = "Book has errors"
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to user_books_path, notice: 'Book was successfully updated'
    else
      flash[:error] = "Book has errors"
      render 'edit'
    end
  end

  def destroy
    id = params[:id]
    book = Book.find(id)
    book.destroy
    redirect_to user_books_path(current_user), notice: 'Book was successfully deleted'
  end

  private
  def user
    @user ||= User.find(params[:user_id])
  end

  def book_params
    params.require(:book).permit(:name, :author_name, :description, :gender, :is_rental)
  end
end
