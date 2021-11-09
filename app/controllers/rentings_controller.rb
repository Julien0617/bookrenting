class RentingsController < ApplicationController
  before_action :authenticate_user

  def index
    @book = current_user.rentings
  end

  
end
