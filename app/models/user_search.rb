class UserSearch < ActiveRecord::Base
  attr_accessible :search_id, :user_id
  belongs_to :search
  belongs_to :user
end
