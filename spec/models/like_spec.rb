 
require 'rails_helper'

RSpec.describe Like, type: :model do
    let(:user1) { User.create(name: 'Jamezjaz', email: 'microverse@email.com', password: '1234567') }
    let(:post1) { user1.posts.create(content: 'This is a new post!') }
    let(:comment1) { post1.comments.create(user_id: 1, content: 'This is a new post!') }
    let(:like1) { user1.likes.create(post_id: 1) }

  context 'check associations' do
    it 'should obtain user\s likes' do
      user1
      post1
      comment1
      like1
      expect(user1.likes).not_to be_nil
    end
  end
end