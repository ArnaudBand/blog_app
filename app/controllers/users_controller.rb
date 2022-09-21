class UsersController < ApplicationController
  def index
    @user = User.all.order(:id)
  end

  def show
    @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to users_path, :flash => { :error => "Record not found." }
  end
end
