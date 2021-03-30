class UserHabitsController < ApplicationController
  def show
    @user_habit = UserHabit.find(params[:id])
  end
end