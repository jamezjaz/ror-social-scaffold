class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friendship_id
      t.string :status

      t.timestamps
    end
    add_foreign_key :friendships, :users, column: :friendship_id
  end
end
