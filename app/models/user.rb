class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :user_friendship, class_name: 'Friendship', foreign_key: 'user_id'
  has_many :friends, through: :user_friendship, source: :friendship_user
  has_many :friendships, class_name: 'Friendship', foreign_key: 'friendship_id'
  has_many :folks, through: :friendships, source: :friendship_folk
end
