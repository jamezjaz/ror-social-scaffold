class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end

  def create
    @user = Friendship.new
    @user_friendship = @user.send_friend_request(5)
    @user_friendship.save
  end
end
