class User < ActiveRecord::Base

  has_secure_password
  validates_presence_of :username

  has_many :ratings
  has_many :books, through: :ratings
  has_many :authors, through: :books
  has_many :genres, through: :books
end
