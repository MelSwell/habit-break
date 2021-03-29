class HabitLog < ApplicationRecord
  belongs_to :user_habit
  has_many :encouragements

end
