class UsersController < ApplicationController
  def index
    @user = User.all.order(:id)
  end

  def show
    @message = 'Here is the user with id'
  end
end
