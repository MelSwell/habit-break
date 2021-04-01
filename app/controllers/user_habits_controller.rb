class UserHabitsController < ApplicationController

  def show
    @user_habit = UserHabit.find(params[:id])
  end

  def new
    @user_habit = UserHabit.new
    @habits = Habit.all
  end
  
  def create
    @user_habit = UserHabit.create(user_habit_params)

    if @user_habit.valid?
      redirect_to user_habit_path(@user_habit)
    else
      flash[:errors] = @user_habit.errors.full_messages
      redirect_to new_user_habit_path
    end
  end

  def toggle_active
    @user_habit = UserHabit.find(params[:id])
    @user_habit.toggle_active
    @user_habit.save
    redirect_to user_habit_path(@user_habit)
  end

  private 

  def user_habit_params
    params.require(:user_habit).permit(:user_id, :habit_id, :weekly_expenditure, :daily_goal, :target_days, :active)
  end

end