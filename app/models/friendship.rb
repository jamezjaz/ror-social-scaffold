class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: 'friendship_id'

  def confirm_friendship(user)
    friendship = friends_user.find { |friend| friend.user_id = user }
    friendship.status = 'Confirmed'
    friendship.save
  end
end
