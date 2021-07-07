class AddIndexToTaggings < ActiveRecord::Migration[5.2]
  def change
    add_index :taggings, [:article_id, :tag_id], unique: :true
  end
end
