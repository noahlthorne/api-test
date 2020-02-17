json.array! @posts do |post|
  json.extract! post, :id, :user_id, :content
  json.user do
    json.extract! post.user, :id, :first_name, :last_name, :email
  end
end
