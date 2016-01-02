class User < ActiveRecord::Base

  has_secure_password

  has_many :ratings
  has_many :books, through: :ratings
  has_many :authors, through: :books
end
