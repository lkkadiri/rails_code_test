class GoogleSearchResult < ActiveRecord::Base
  attr_accessible :link, :title, :search_type
  belongs_to :search

  def search_provider
    "Google"
  end
end
