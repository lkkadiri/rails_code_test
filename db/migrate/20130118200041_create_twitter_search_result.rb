class CreateTwitterSearchResult < ActiveRecord::Migration
  def change
    create_table :twitter_search_results do |t|
      t.string :username
      t.string :link
      t.string :tweet
      t.integer :search_id

      t.timestamps
    end
  end
end
