class ChangeColumnNameEstimate < ActiveRecord::Migration
  def change
    rename_column :tasks, :estimation, :due_date
  end
end
