class Friendship < ApplicationRecord
    belongs_to :user
    # belongs_to :friendship_folk, class_name: 'User'
end
