class CreateCategoryMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :category_maps do |t|
      t.references :tweet, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
    add_index :category_maps, [:tweet_id, :category_id], unique: true
  end
end
