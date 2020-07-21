class Friendship < ApplicationRecord
    # belongs_to :friendship_user, class_name: 'User'
    # belongs_to :friendship_folk, class_name: 'User'
    belongs_to :user
    belongs_to :friends, class_name: 'User', foreign_key: 'friendship_id'
end
