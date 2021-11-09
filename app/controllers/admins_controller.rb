class AdminsController < ApplicationController
  before_action :authenticate_user, only: [:index]
  def index
    @book = Book.all
  end

  def show
    # user_id = current_user[:id]
    id = params[:id]
    @book = Book.where(is_rental: true, rental_id: id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to admins_path, notice: 'Book was successfully updated'
    else
      flash[:error] = "Book has errors"
      render 'edit'
    end
  end

  private
  def book_params
    params.require(:book).permit(:name, :author_name, :description, :gender, :is_rental)
  end
end
