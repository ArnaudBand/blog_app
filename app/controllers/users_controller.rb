class UsersController < ApplicationController
  def index
    @message = 'Here are a list of all the users'
  end

  def show
    @message = "Here is the user with id #{params[:id]}"
  end
end
