class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  def full_name
    first_name + " " + last_name
  end

  # def random_posts
  #   posts.take(rand(1..5))
  # end

  acts_as_favoritable
  has_many :posts, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
end
