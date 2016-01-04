class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :username
  validates :username, uniqueness: true

  has_many :ratings
  has_many :books, through: :ratings
  has_many :authors, through: :books
  has_many :genres, through: :books
  has_many :friendships
  has_many :friends, through: :friendships
end
