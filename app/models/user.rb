class User < ApplicationRecord
  has_many :user_habits, dependent: :destroy
  has_many :habits, through: :user_habits
  has_many :habit_logs, through: :user_habits

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Friendship'
  has_many :followees, through: :followed_users
  
  has_many :following_users, foreign_key: :followee_id, class_name: 'Friendship'
  has_many :followers, through: :following_users

  validates :name, :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true

  def active_user_habits
    self.user_habits.where(active: true)
  end

  def inactive_user_habits
    self.user_habits.where(active: false)
  end

  def followee_logs_sorted
    logs = []
    self.followees.each do |followee|
      followee.user_habits.each do |uh|
        uh.habit_logs.each do |log| 
          logs << log
        end  
      end
    end
    logs.sort { |log_a, log_b| log_b.created_at <=> log_a.created_at } 
  end

end
