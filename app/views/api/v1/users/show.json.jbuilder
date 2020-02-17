json.extract! @user, :id, :first_name, :last_name, :email, :photo, :follower_count, :following_count, :admin
json.posts @user.posts do |post|
  json.extract! post, :id, :content, :likes, :retweets
end
