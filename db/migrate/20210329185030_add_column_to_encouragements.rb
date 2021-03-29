class AddColumnToEncouragements < ActiveRecord::Migration[6.1]
  def change
    add_column :encouragements, :habit_log_id, :integer
  end
end
