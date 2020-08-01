require 'rails_helper'
RSpec.describe Friendship, type: :model do
  before(:all) do
    User.create!(name: 'Jamesa', email: 'email@mail.ng', password: '1234567')
    User.create!(name: 'Muhammady', email: 'emaial@ail.ng', password: '1234567')
  end

  describe '#valides' do
    it 'validates friendship instance' do
      friendship = Friendship.new(user_id: 2, friendship_id: 1)
      expect(friendship).to be_valid
    end
    it 'validates friendship instance' do
      friendship = Friendship.new(user_id: 2, friendship_id: 1)
      friendship.user_id = ''
      expect(friendship).not_to be_valid
    end
  end

  describe '#association' do
    let(:user1) { User.create(name: 'Jamezjaz', email: 'microverse@email.com', password: '1234567') }
    let(:user2) { User.create(name: 'Chigozie', email: 'rails@email.com', password: '1234567') }
    let(:friend1) { user1.friendships.create(friendship_id: 2) }

    it 'frienship belongs to a user' do
      user1
      user2
      friend1
      expect(Friendship.first.user_id).not_to be_nil
    end
  end
end
