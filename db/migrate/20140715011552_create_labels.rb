class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string :name
      t.integer :user_id
      t.string :color
      t.timestamps
    end

    create_table :labels_tasks, :id => false do |t|
    	t.integer :label_id
    	t.integer :task_id
    end

  end
end
