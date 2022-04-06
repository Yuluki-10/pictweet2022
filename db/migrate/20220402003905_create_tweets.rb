class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string      :name 
      t.text        :text 
      t.text        :image 
      t.timestamps null: true 
    end
  end
end
