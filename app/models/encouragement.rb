class Encouragement < ApplicationRecord
  belongs_to :user
  belongs_to :habit_log
end
