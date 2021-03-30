class UsersController < ApplicationController

  def home
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @friendships = User.find(params[:id]).followers.map{|f| f.id}

    if @friendships.include?(cookies[:user_id].to_i)
    @friendship_id = Friendship.find_by(follower_id: cookies[:user_id], followee_id: params[:id]).id
    end

  end

  def index
    @users = User.all
  end

end