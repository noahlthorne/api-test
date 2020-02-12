json.array! @posts do |post|
  json.extract! post, :id, :user_id
  json.user do
    json.extract! @post.user, :id, :first_name, :last_name, :email, :photo, :follower_count, :following_count, :admin
  end
end
