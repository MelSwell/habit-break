class CreateHabitLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :habit_logs do |t|
      t.integer :user_habit_id
      t.string :mood
      t.text :entry
      t.boolean :daily_goal_reached

      t.timestamps
    end
  end
end
