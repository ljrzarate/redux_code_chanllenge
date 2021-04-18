class HomeController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.includes(:comments, :likes).order("created_at desc")
  end
end
