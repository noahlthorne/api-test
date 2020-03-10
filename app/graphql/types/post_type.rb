class Type::PostType < Types::BaseObject
  description post_description "user post"

  field :id, ID, null: false
  field :content, String, null: false
  field :likes, Int, null: true
  field :retweets, Int, null: true

end
