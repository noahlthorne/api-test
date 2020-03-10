class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  acts_as_token_authenticatable

  def full_name
    first_name + " " + last_name
  end

  def coordinates
    [rand(max 90), rand(max 90)]
  end

  def age
    rand(1..100)
  end

  acts_as_favoritable
  has_many :posts, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
end
