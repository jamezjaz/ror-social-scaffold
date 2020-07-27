class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { minimum: 5, maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX, message: 'The email is not valid' }
  validates :password, presence: true, length: { minimum: 6, maximum: 32 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friendships
  has_many :friends_user, class_name: 'Friendship', foreign_key: 'friendship_id'
  has_many :folks, through: :friends_user, source: :friend
  # has_many :pending_friendships, -> { where status: 'Pending' }, class_name: 'Friendship', foreign_key: 'user_id'
  # has_many :confirmed_friendships, -> { where status: 'Confirmed' }, class_name: 'Friendship'

  def friends
    friends_array = friendships.map { |friendship| friendship.friendship_id if friendship.status == 'Confirmed' }
    friends_array += friends_user.map { |friendship| friendship.user_id if friendship.status == 'Confirmed' }
    friends_array.compact
  end

  def received_requests
    friends_array = friends_user.map { |friendship| friendship.user_id if friendship.status == 'Pending' }
    friends_array.compact
  end

  def pending_requests
    friends_array = friendships.map { |friendship| friendship.friendship_id if friendship.status == 'Pending' }
    friends_array.compact
  end

  def confirm_friendship(user)
    friendship = friends_user.find { |friend| friend.user_id = user }
    friendship.status = 'Confirmed'
    friendship.save
  end

  def friend?(user)
    friends.include?(user)
  end

  # # Users who have yet to confirm friend requests
  # def pending_friends
  #   friendships.map { |friendship| friendship.friend unless friendship.confirmed }.compact
  # end

  # # Users who have requested to be friends
  # def friend_requests
  #   folks.map { |friendship| friendship.user unless friendship.confirmed }.compact
  # end

  # def confirm_friend(user)
  #   friendship = inverse_friendships.find { |friendship| friendship.user == user }
  #   friendship.confirmed = true
  #   friendship.save
  # end

  # def friend?(user)
  #   friends.include?(user)
  # end

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
