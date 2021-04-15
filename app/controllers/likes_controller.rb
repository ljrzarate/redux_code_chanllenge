class LikesController < ApplicationController
  def update
    @post = Post.find(params[:post_id])
    if params[:liked] == "false"
      @like = Like.create(post: @post, user: current_user)
    else
      Like.where(post: @post, user: current_user).destroy_all
    end
    respond_to do |format|
      format.js
    end
  end
end
