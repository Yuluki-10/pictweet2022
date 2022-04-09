class RemoveNameFromTweets < ActiveRecord::Migration[6.1]
  def change
    remove_column :tweets, :name, :string
  end
end
