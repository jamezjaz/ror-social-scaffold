module FriendshipsHelper
  def friend_request(user_id)
    puts 'Yess again' if friend?(user_id)
  end

  # def send_friend_request(user)
  #   # puts user.first.status
  #
  #   # @friend_id = Friendship.find_by(friendship_id: friend_id)
  #   # if @friend_id && current_user.id == @friend_id.user_id
  #   #   if @friend_id.status == 'Pending'
  #   #     link_to('Reject', user_friendship_path(@friend_id.id), method: :delete)
  #   #     link_to('Approve', user_friendship_path(@friend_id.id), method: :put)
  #   #   elsif @friend_id.status == 'Confirmed'
  #   #     link_to('Unfriend', user_friendship_path(@friend_id.id), method: :delete)
  #   #   end
  #   # else
  #   #   link_to('Send Friend Request', user_friendships_path(friend_id), method: :post)
  #   # end
  # end
end
