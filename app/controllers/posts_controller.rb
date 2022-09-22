class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(id: :desc)
  end

  def show
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render file: 'public/404.html', status: :not_found
  end
end
