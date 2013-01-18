class CreateUserSearches < ActiveRecord::Migration
  def change
    create_table :user_searches do |t|
      t.integer :user_id
      t.integer :search_id

      t.timestamps
    end
  end
end
