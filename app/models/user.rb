class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password
  validates_uniqueness_of :email
  validates_presence_of :password, :on => :create
  has_many :user_searches
  has_many :searches, through: :user_searches
end