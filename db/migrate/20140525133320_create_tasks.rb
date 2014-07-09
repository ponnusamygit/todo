class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.time :due_date
      t.integer :user_id
      t.string :status
       
      t.timestamps
    end
  end
end
