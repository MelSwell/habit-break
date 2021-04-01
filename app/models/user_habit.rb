class UserHabit < ApplicationRecord
  belongs_to :user 
  belongs_to :habit 
  has_many :habit_logs
  validates :daily_goal, :target_days, presence: true

  def toggle_active
    self.active = !self.active
  end
end
