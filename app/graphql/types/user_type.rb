class Types::UserType < Types::BaseObject
  description new_description "A user"

  field :id, ID, null: false
  field :first_name, String, null: true
  field :last_name, String, null: true
  field :full_name, String, null: true
  field :photo, String, null: true
  field :follower_count, Int, null: true
  field :following_count, Int, null: true

  field :coordinates, Types::CoordinatesType, null: false
end
