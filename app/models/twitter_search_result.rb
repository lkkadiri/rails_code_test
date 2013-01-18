class TwitterSearchResult < ActiveRecord::Base
  attr_accessible :link, :tweet, :username
  belongs_to :search
end
