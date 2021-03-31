class UserHabitsController < ApplicationController

  def show
    @user_habit = UserHabit.find(params[:id])
  end

  def new
    @user_habit = UserHabit.new
    @habits = Habit.all
    @categories = Habit.all.map{ |h| h.category}.uniq
  end
  
  def create
    if user_habit_params == "bad"
      flash[:errors] = ["Please select either an existing habit or create a new one"]
      redirect_to new_user_habit_path
    else
      @user_habit = UserHabit.create(user_habit_params)

      if @user_habit.valid?
        redirect_to user_habit_path(@user_habit)
      else
        flash[:errors] = @user_habit.errors.full_messages
        redirect_to new_user_habit_path
      end
    end
  end

  private 

  def user_habit_params
    if params[:habit_name] == "" || params[:category] == ""
      params.permit(:user_id, :active, :habit_id, :daily_goal, :weekly_expenditure, :target_days)
    elsif params[:habit_name].length > 0 && params[:category].length > 0 && params[:habit_id][:habit_id].length > 0
      "bad"
    end

  end


end