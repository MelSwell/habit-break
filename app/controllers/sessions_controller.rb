class SessionsController < ApplicationController
  def new_login
  end

  def login 
    user = User.find_by(username: params[:session][:username])

    if user && user.password == params[:session][:password]
      cookies[:user_id] = user.id 
      redirect_to user_home_path(user)
    else
      flash[:error] = "Password or Username is incorrect"
      redirect_to root_path
    end
  end

  def logout
    cookies.delete(:user_id)
    redirect_to root_path
  end
  
end