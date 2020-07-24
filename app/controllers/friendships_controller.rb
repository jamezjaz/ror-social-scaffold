# rubocop:disable Style/GuardClause

class FriendshipsController < ApplicationController
  def create
    @user = Friendship.new(friendship_id: params[:user_id])
    @user.user_id = current_user.id
    @user.status = 'Pending'
    if @user.save
      flash[:notice] = 'Friend Request Sent'
      redirect_to users_path
    end
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.update(status: true)
    @user = Friendship.where(user_id: current_user.id, friendship_id: params[:user_id])
    # if @user.save
    #   flash[:notice] = 'Friend Request Accepted'
    #   redirect_to users_path
    # end
  end

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
  #   fail
  #     # @friendship = Friendship.find(params[:user_id])
  #     # @friendship.status = "Confirmed"
  #     # if @friendship.save
  #     #   flash[:alert] = "Friend Request Accepted"
  #     #   redirect_to user_path(@friendship.user_id)
  #     # end
  # end
  #
  # def destroy
  #   @friendship = Friendship.find(params[:user_id])
  #   if @friendship.delete
  #     flash[:alert] = "Friend Request Deleted"
  #     redirect_to user_path(@friendship.user_id)
  #   end
  # end
end

# rubocop:enable Style/GuardClause
