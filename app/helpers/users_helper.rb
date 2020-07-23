module UsersHelper
  def friendship_status(user_id)
    if current_user.friend?(user_id)
      link_to 'Unfriend', :class => "friend_button"
    elsif current_user.pending_requests.include?(user_id)
      link_to 'Cancel request', class: 'friend_button'
    elsif current_user.received_requests.include?(user_id)
      link_to 'Approve request' , class: 'friend_button'
      # link_to 'Reject Request', class: 'friend_button'
    else
      link_to 'Send Request', class: 'friend_button'
    end
  end
end