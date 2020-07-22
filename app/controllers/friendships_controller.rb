class FriendshipsController < ApplicationController
  # def create
  #   @friendship =  Friendship.new
  #   @friendship.user_id = current_user.id
  #   @friendship.friendship_id = params[:user_id]
  #   @friendship.status = "Pending"
  #   if @friendship.save
  #     flash[:alert] = "Friend Request Sent"
  #     redirect_to user_path(params[:user_id])
  #   else
  #     flash[:alert] = "Friend Request Not Sent"
  #   end
  #
  # end
  #
  # def update
  #     @friendship = Friendship.find(params[:user_id])
  #     @friendship.status = "Confirmed"
  #     if @friendship.save
  #       flash[:alert] = "Friend Request Accepted"
  #       redirect_to user_path(@friendship.user_id)
  #     end
  # end
  #
  # def destroy
  #   @friendship = Friendship.find(params[:user_id])
  #   if @friendship.delete
  #     flash[:alert] = "Friend Request Deleted"
  #     redirect_to user_path(@friendship.user_id)
  #   end
  # end
  #
  #
  #
  #
  #

end
