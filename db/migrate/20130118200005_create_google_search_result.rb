class CreateGoogleSearchResult < ActiveRecord::Migration
  def change
    create_table :google_search_results do |t|
      t.string :title
      t.string :link
      t.integer :search_id

      t.timestamps
    end
  end
end
