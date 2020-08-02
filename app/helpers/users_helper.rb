module UsersHelper
  def friendship_status_check(user_id)
    friendship_status(user_id) if current_user != user_id
  end

  def friendship_status(user_id)
    if current_user.friend?(user_id)
      link_to 'Unfriend', friendship_path(user_id, method_name: 'delete'), method: :delete, class: 'friend_button'
    elsif current_user.pend_friends.include?(user_id)
      link_to 'Cancel', friendship_path(user_id, method_name: 'cancel'), method: :delete, class: 'friend_button'
    elsif current_user.received_requests.include?(user_id)
      # link_to 'Reject', friendship_path(user_id), method: :delete, class: 'friend_button'
      # link_to 'Approve', friendship_path(user_id), method: :put, class: 'friend_button'
      render 'received_links', user_id: user_id
    else
      link_to 'Send Friend Request', friendships_path(friendship_id: user_id), method: :post, class: 'friend_button'
    end
  end

  def mutual_friends(mutual1, mutual2)
    mutual = []
    mutual1.each do |x|
      mutual << x if mutual2.include?(x)
    end
    mutual
  end
end
