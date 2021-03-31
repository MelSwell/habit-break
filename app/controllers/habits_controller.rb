class HabitsController < ApplicationController
  def new
    @habit = Habit.new
    @categories = Habit.all.map { |h| h.category }.uniq
    @user_habit = UserHabit.new
  end

  def create
    @habit = Habit.create(habit_params)
    
    if @habit.valid?
      @user_habit = UserHabit.new(user_habit_params)
      @user_habit.update(habit_id: @habit.id)
      
      if @user_habit.save
        redirect_to user_habit_path(@user_habit)
      else
        flash[:errors] = @user_habit.errors.full_messages
        @habit.destroy
        redirect_to new_habit_path
      end
    
    else
      flash[:errors] = @habit.errors.full_messages
      redirect_to new_habit_path
    end
  end

  private
  
  def habit_params
    params.require(:habit).permit(:name, :category)
  end

  def user_habit_params
    params.require(:user_habits).permit(:user_id, :active, :daily_goal, :weekly_expenditure, :target_days)
  end
end
