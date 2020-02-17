json.extract! @post, :id, :content, :likes, :retweets, :created_at
json.user do
  json.extract! @post.user, :id, :first_name, :last_name, :email, :admin
end
