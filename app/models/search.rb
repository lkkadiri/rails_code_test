class Search < ActiveRecord::Base
  attr_accessible :query
  has_many :google_search_results
  has_many :twitter_search_results
  has_many :user_searches
  has_many :users, through: :user_searches
end
