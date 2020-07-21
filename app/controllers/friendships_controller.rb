class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.find(params[:user_id])
    @friendship.status = "confirmed"
    @friendship.save
  end

  def destroy
    @friendship = Friendship.find(params[:user_id])
    @friendship.delete
  end
end
