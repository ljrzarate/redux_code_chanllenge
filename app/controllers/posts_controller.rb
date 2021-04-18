class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      MentionMailerJob.perform_later(@post)
    end
    respond_to do |format|
      format.js
    end
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
