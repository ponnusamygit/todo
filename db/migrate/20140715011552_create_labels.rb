class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string :name
      t.integer :user_id
      t.string :color
      t.timestamps
    end

    create_join_table :labels, :tasks do |t|
      t.index [:label_id, :task_id]
      t.index [:task_id, :label_id]
    end

  end
end
