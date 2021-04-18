module ApplicationHelper
  def post_liked_css_class(post)
    post.liked?(current_user) ? "fas" : "far"
  end
end
