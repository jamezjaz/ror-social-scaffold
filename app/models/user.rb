class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friendships, class_name: 'Friendship', foreign_key: 'user_id'
  has_many :friends_user, class_name: 'Friendship', foreign_key: 'friendship_id'
  has_many :folks, through: :friends_user, source: :friends


  def friends
    request_i_sent = Friendship.where(user_id:id, status: "Confirmed").pluck(:friendship_id)
  end


  # def friends_array
  #   friends_list = friendships.map{ |friendship| friendship.friendship_id if friendship.status == 'Confirmed' }
  #   # friends_list + folks.map{ |friendship| friendship.user_id if friendship.status == 'Confirmed' }
  #   friends_list.compact
  # end

  # has_many :user_friendship, class_name: 'Friendship', foreign_key: 'user_id'
  # has_many :friends, through: :user_friendship, source: :friendship_user
  # has_many :friendships, class_name: 'Friendship', foreign_key: 'friendship_id'
  # has_many :folks, through: :friendships, source: :friendship_folk

  # has_many :friendships
  # has_many :friends, through: :friendships
  # has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friendship_id'
end
