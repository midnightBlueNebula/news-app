class CreateVotingComments < ActiveRecord::Migration[5.2]
  def change
    create_table :voting_comments do |t|
      t.boolean :liked
      t.boolean :author_liked
      t.references :user, foreign_key: true
      t.references :comment, foreign_key: true

      t.timestamps
    end

    add_index :voting_comments, [:user_id, :comment_id], unique: true
  end
end
