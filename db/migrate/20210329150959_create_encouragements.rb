class CreateEncouragements < ActiveRecord::Migration[6.1]
  def change
    create_table :encouragements do |t|
      t.integer :user_id
      t.integer :user_habit_id
      t.text :comment, :default => nil

      t.timestamps
    end
  end
end
