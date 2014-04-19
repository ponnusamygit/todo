class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :name
      t.datetime :estimation

      t.timestamps
    end
  end
end
