class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = params[:user_id]

    p @post
    if @post.save
      redirect_to user_posts_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes([:author])
    @user = @post.author
  rescue ActiveRecord::RecordNotFound
    render file: 'public/404.html', status: :not_found
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
