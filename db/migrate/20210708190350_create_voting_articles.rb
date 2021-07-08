class CreateVotingArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :voting_articles do |t|
      t.boolean :liked
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true

      t.timestamps
    end

    add_index :voting_articles, [:user_id, :article_id], unique: true
  end
end
