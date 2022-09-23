class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.author_id = current_user.id
    @like.post_id = params[:post_id]

    respond_to do |format|
      format.html do
        redirect_to user_post_path(current_user.id, Post.find(params[:post_id])) if @like.save
      end
    end
  end
end
