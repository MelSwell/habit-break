class RemoveColumnFromEncouragements < ActiveRecord::Migration[6.1]
  def change
    remove_column :encouragements, :user_habit_id, :integer
  end
end
