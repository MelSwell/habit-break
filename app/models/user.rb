class User < ApplicationRecord
  has_many :user_habits
  has_many :habits, through: :user_habits
  has_many :habit_logs, through: :user_habits

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Friendship'
  has_many :followees, through: :followed_users
  
  has_many :following_users, foreign_key: :followee_id, class_name: 'Friendship'
  has_many :followers, through: :following_users
end
