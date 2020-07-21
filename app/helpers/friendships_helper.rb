module FriendshipsHelper
  def send_friend_request(friend_id)
    if friend_id
      @friend_id = Friendship.find_by(friendship_id: friend_id)
      if current_user.id == @friend_id.user_id
        if @friend_id.status == 'Pending'
          puts @friend_id.id
          link_to('Approve', user_friendships_path(@friend_id.id), method: :post)
          link_to('Reject', user_friendship_path(@friend_id.id), method: :delete)
        elsif @friend_id.status == 'confirmed'
          link_to('Unfriend', user_friendship_path(@friend_id.id), method: :delete)
        else
          link_to('Send Friend Request', user_friendships_path(@friend_id.id), method: :post)
        end
      end
    end
  end
end
