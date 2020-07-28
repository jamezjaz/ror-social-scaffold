class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    # @friends = current_user.friends
    # @friends_list = User.where(id: @friends)
    # @users_list = User.where.not(id: @friends)
    # @requests = current_user.received_requests
    # @request_received = User.where(id: @requests)
    # @pendings = current_user.pending_requests
    # @pending_request = User.where(id: @pendings)
    # @send_request = current_user.send_friend_request(6)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
    @mutual = @user.mutual_friends
    puts "Hello mutual #{@mutual}"
    @mutual2 = current_user.mutual_friends
    puts "Hello mutual2 #{@mutual2}"
  end

  def create
    @user = Friendship.new
    @user_friendship = @user.send_friend_request(5)
    @user_friendship.save
  end
end
