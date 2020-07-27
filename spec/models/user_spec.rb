require 'rails_helper'

RSpec.describe User, :type => :model do
    before(:each) do
      @user = User.new(name: 'James', email: 'mohammed002@gamil.com', password: '12345678')
      @user.save
    end

  describe 'Validation tests' do
    it 'should be invalid if name is more than 20 characters' do
      @user.name = 'name>20' * 3
      @user.save
      expect(@user).to_not be_valid
    end

    it 'should be invalid if name is nil' do
      @user.name = nil
      @user.save
      expect(@user).to_not be_valid
    end

    it 'should be valid if name is not less than 5 characters' do
      @user.name = 'Fahad'
      @user.save
      expect(@user).to be_valid
    end

    it 'should be invalid when email format is wrong' do
      @user.email = 'abc@.com'
      @user.email
      expect(@user).to_not be_valid
    end

    it 'email address should be unique' do
      another_user = @user.dup
      another_user.email = @user.email
      another_user.save
      expect(another_user).to_not be_valid
    end

    it 'email address should not be nil' do
      @user.email = nil
      @user.save
      expect(@user).to_not be_valid
    end

    it 'password should not be nil' do
      @user.password = nil
      @user.save
      expect(@user).to_not be_valid
    end

    it 'should be valid if password is not less than 6 characters' do
      @user.password = '1234567'
      @user.save
      expect(@user).to be_valid
    end

    it 'should be invalid if password is more than 32 characters' do
      @user.password = 'abcdef' * 6
      @user.save
      expect(@user).to_not be_valid
    end
  end

#   describe 'Association tests' do
#     it { should have_many(:posts) }
#   end
end