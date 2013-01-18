class TwitterSearchResult < ActiveRecord::Base
  attr_accessible :tweet_id, :text, :username
  belongs_to :search

  def search_provider
    "Twitter"
  end
end
