class PostsController < ApplicationController
  def index
    @message = 'Here are a list of all the posts'
  end

  def show
    @message = "Here is the post with id #{params[:id]}"
  end
end
