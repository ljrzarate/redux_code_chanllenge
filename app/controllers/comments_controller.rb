class CommentsController < ApplicationController
  def index
    respond_to do |format|
      @post = Post.find(params[:post_id])
      @comments = @post.comments
      format.js#on { render json: @comments }
    end
  end
end
