require 'rails_helper'
RSpec.describe Friendship, type: :model do
  before(:all) do
    User.create!(name: 'Jamesa', password: '1234567', email: 'email@mail.ru')
    User.create!(name: 'Muhammady', password: '1234567', email: 'emaial@ail.ru')
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
end
