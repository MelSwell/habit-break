class Habit < ApplicationRecord
  has_many :user_habits
  has_many :users, through: :user_habits
  has_many :habit_logs, through: :user_habits
  accepts_nested_attributes_for :user_habits
  validates :name, :category, presence: true
  validates :category, inclusion: { in: ["general health", "financial health", "career health", "social health", "mental health"]}


end
