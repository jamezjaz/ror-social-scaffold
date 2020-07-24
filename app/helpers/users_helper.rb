module UsersHelper
  def friendship_status_check(user_id)
    if current_user.id != user_id
      friendship_status(user_id)
    end
  end
  
  def friendship_status(user_id)
    if current_user.friend?(user_id)
      # link_to 'Unfriend', friendship_path(user_id), method: :delete, class: 'friend_button'
    elsif current_user.pending_requests.include?(user_id)
      # link_to 'Cancel request', friendship_path(user_id), method: :delete, class: 'friend_button'
    elsif current_user.received_requests.include?(user_id)
      # link_to 'Approve request', friendship_path(user_id), method: :put, class: 'friend_button'
      # link_to 'Reject Request', class: 'friend_button'
    else
      link_to 'Send Request', user_friendships_path(user_id), method: :post, class: 'friend_button'
      # link_to 'Send Request', friendships_path(user_id), method: :post, class: 'friend_button'
    end
  end
end
