class EncouragementsController < ApplicationController
  def new
    @encouragement = Encouragement.new
    @habit_log = HabitLog.find(params[:habit_log_id])
  end
  
  def create
    @encouragement = Encouragement.create(encouragement_params)
    if @encouragement.valid?
      redirect_to habit_log_path(@encouragement.habit_log_id)
    else
      flash[:errors] = @encouragement.errors.full_messages
      redirect_back fallback_location: { action: "new", habit_log_id: @encouragement.habit_log_id }
    end
  end

  def edit
    @encouragement = Encouragement.find(params[:id])
    @habit_log = HabitLog.find(@encouragement.habit_log_id)
  end

  def update
    @encouragement = Encouragement.find(params[:id])

    if @encouragement.update(encouragement_params)
      redirect_to habit_log_path(@encouragement.habit_log_id)
    else
      flash[:errors] = @encouragement.errors.full_messages
      redirect_back fallback_location: { action: "edit", habit_log_id: @encouragement.habit_log_id }
    end
  end

  def destroy
    Encouragement.find(params[:id]).destroy
    redirect_back fallback_location: { action: "home", user_home_path: cookies[:user_id].to_i }
  end

  private

  def encouragement_params
    params.require(:encouragement).permit(:user_id, :comment, :habit_log_id)
  end
end