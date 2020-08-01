class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friendship_params)
    @friendship.status = 'Pending'
    flash[:notice] = 'Friend Request Sent' if @friendship.save
    flash[:notice] = 'Friend Request Not Sent' unless @friendship.save
    redirect_to users_path
  end

  def update
    @friendship = Friendship.where("friendship_id = #{current_user.id}"). where("user_id = #{params[:id]}")
    @friendship.first.status = 'Confirmed'
    if @friendship.first.save
      @friendship = Friendship.create!(user_id: current_user.id, friendship_id: params[:id], status: 'Confirmed')
      flash[:notice] = 'Friend Request Approved'
    else
      flash[:notice] = 'Friend Request Not Approved'
    end
    redirect_to users_path
  end

  def destroy
    if params[:method_name] == 'delete'
      friendship = Friendship.where("friendship_id = #{current_user.id}"). where("user_id = #{params[:id]}")
      friendship.first.destroy
      reverse_friendship = Friendship.where("user_id = #{current_user.id}"). where("friendship_id = #{params[:id]}")
      reverse_friendship.first.destroy
      flash[:notice] = 'Friend Request Removed'
    else
      cancel_friendship = Friendship.where("user_id = #{current_user.id}"). where("friendship_id = #{params[:id]}")
      cancel_friendship.first.destroy
      flash[:notice] = 'Friend Request Cancelled'
    end
    redirect_to users_path
  end

  private

  def friendship_params
    params.permit(:friendship_id, :user_id)
  end
end
