class GoogleSearchResult < ActiveRecord::Base
  attr_accessible :link, :title
  belongs_to :search
end
