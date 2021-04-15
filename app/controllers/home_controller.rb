class HomeController < ApplicationController
  def index
    @posts = Post.where.not(user: current_user).includes(:comments)
  end
end
