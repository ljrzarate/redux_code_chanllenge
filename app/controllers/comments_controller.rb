class CommentsController < ApplicationController
  def index
    @comments = post.comments.order("created_at desc")
    respond_to do |format|
      format.js
    end
  end

  def create
    @comment = post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save!
      MentionProcessorMailer.new(@comment).process
    end
    respond_to do |format|
      format.js
    end
  end

  private
  def post
    @post ||= Post.find(params[:post_id])
  end

  def comment_params
    params.permit(:content)
  end
end
