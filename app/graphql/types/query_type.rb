module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me

    field :user, Types::UserType, null: true, description: "A user" do
      argument :id, ID, required: true
    end

    def user(id:)
      User.where(id: id).first
    end

    field :users, [Types::UserType], null: false

    def users
      User.all
    end

    field :post, Types::PostType, null: true, description: "A post" do
      argument :id, ID, required: true
    end

    def post(id:)
      Post.where(id: id).first
    end

    field :posts, [Types::PostType], null: false

    def posts
      Post.all
    end

  end
end
