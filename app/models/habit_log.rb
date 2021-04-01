class HabitLog < ApplicationRecord
  belongs_to :user_habit
  has_many :encouragements, dependent: :destroy
  validates :entry, :mood, :user_habit_id, presence: true
  validates :entry, length: {minimum: 20}

  def formatted_time
    time_arr = self.created_at.localtime.to_s.split
    hour = time_arr[1].split(":")[0].to_i
    if hour == 12
      "#{hour}:#{time_arr[1].split(":")[1]} PM"
    elsif hour > 12
      hour -= 12
      "#{hour}:#{time_arr[1].split(":")[1]} PM"
    else
      "#{hour}:#{time_arr[1].split(":")[1]} AM"
    end
  end
end
