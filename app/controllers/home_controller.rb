class HomeController < ApplicationController
  def index
    @users = User.all.map{ |u| [u.username, u.email] }
    @post = Post.new
    @posts = Post.includes(:comments, :likes).order("created_at desc")
  end
end
