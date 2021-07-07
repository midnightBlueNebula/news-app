class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_author_id

      t.timestamps
    end

    add_index :relationships, [:follower_id, :followed_author_id], unique: true
  end
end
