class CreateTagsUsersTable < ActiveRecord::Migration
  def change
    create_table :tags_users, :id => false do |t|
      t.integer :tag_id
      t.integer :user_id
    end
  end
end
