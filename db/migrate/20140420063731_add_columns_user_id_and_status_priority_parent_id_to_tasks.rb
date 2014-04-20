class AddColumnsUserIdAndStatusPriorityParentIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :user_id, :integer
    add_column :tasks, :status, :integer
    add_column :tasks, :priority, :integer
    add_column :tasks, :parent_id, :integer
    
    add_index :tasks, :user_id
    add_index :tasks, :parent_id
  end
end
