class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tweet, null: false, foreign_key: true

      t.timestamps
      t.index [:user_id, :tweet_id], unique: true #同じユーザー・同じ投稿への「いいね！」が投稿できないように、DB側で制御
    end
  end
end
