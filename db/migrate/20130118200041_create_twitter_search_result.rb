class CreateTwitterSearchResult < ActiveRecord::Migration
  def change
    create_table :twitter_search_results do |t|
      t.integer :tweet_id
      t.string :username
      t.string :text
      t.integer :search_id

      t.timestamps
    end
  end
end
