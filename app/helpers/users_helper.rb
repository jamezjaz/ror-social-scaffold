module UsersHelper
  def friendship_status_check(user_id)
    friendship_status(user_id) if current_user.id != user_id
  end

  def friendship_status(user_id)
    case_request  = nil
    if current_user.friend?(user_id)
      link_to 'Unfriend', user_friendships_path(user_id, requestname: "Unfriend"), method: :post, class: 'friend_button'
    elsif current_user.pending_requests.include?(user_id)
      link_to 'Cancel', user_friendships_path(user_id, requestname: "Unfriend"), method: :post, class: 'friend_button'
    elsif current_user.received_requests.include?(user_id)
      # link_to 'Reject', user_friendships_path(user_id, requestname: "Unfriend"), method: :post, class: 'friend_button'
      link_to 'Approve request', user_friendships_path(user_id, requestname: "Approve"), method: :post, class: 'friend_button'

    else
      case_request = "Send"
      link_to 'Send Request', user_friendships_path(user_id, requestname: "Send"), method: :post, class: 'friend_button'
      # link_to 'Send Request', friendships_path(user_id), method: :post, class: 'friend_button'
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
