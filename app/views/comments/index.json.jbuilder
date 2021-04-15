json.array! @comments do |comment|
  json.id comment.id
  json.post_id comment.post.id
  json.content comment.content
  json.created_at comment.created_at
  json.author comment.post.user.username
end
