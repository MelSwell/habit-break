class UserHabit < ApplicationRecord
  belongs_to :user 
  belongs_to :habit 
  has_many :habit_logs
  has_many :encouragements
end
