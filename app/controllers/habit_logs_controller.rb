class HabitLogsController < ApplicationController
  def new
    @habit_log = HabitLog.new
    @user_habit = UserHabit.find(params[:user_habit_id])
  end

  def create
    @habit_log = HabitLog.create(habit_log_params)
    @user_habit = UserHabit.find(params[:habit_log][:user_habit_id])
    
    if @habit_log.valid?
      redirect_to user_habit_path(@user_habit)
    else
      flash[:errors] = @habit_log.errors.full_messages
      redirect_to new_habit_log_path(:user_habit_id => @user_habit.id)
    end
  end

  def edit
    @habit_log = HabitLog.find(params[:id])
  end

  def update

  end

  private

  def habit_log_params
    params.require(:habit_log).permit(:user_habit_id, :mood, :entry, :daily_goal_reached)
  end
end