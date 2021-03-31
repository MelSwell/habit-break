class UsersController < ApplicationController

  def home
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @friendships = User.find(params[:id]).followers.map{|f| f.id}

    if @friendships.include?(cookies[:user_id].to_i)
      @friendship_id = Friendship.find_by(follower_id: cookies[:user_id], followee_id: params[:id]).id
    end
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.create(user_params)
  
    if @user.valid?
      cookies[:user_id] = @user.id
      redirect_to user_home_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end
  
  def edit
    @user = User.find(cookies[:user_id])
  end

  def update
    byebug
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end
  
end