class CreateUserHabits < ActiveRecord::Migration[6.1]
  def change
    create_table :user_habits do |t|
      t.integer :user_id
      t.integer :habit_id
      t.float :weekly_expenditure, :default => nil
      t.integer :longest_streak, :default => 0
      t.text :daily_goal
      t.integer :target_days
      t.boolean :active

      t.timestamps
    end
  end
end
