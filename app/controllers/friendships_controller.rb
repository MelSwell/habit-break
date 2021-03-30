class FriendshipsController < ApplicationController

    def create
        Friendship.create(followee_id: params[:followee_id], follower_id: cookies[:user_id])
        redirect_to user_path(params[:followee_id])
    end

    def destroy
        Friendship.where(follower_id: cookies[:user_id], followee_id: params[:followee_id]).destroy_all
        redirect_to user_path(params[:followee_id])
    end

end
