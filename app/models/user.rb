class User < ApplicationRecord
  has_many :user_habits
  has_many :habits, through: :user_habits
end
