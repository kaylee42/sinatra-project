class Book < ActiveRecord::Base
  belongs_to :author
  belongs_to :genre
  has_many :ratings
  has_many :users, through: :ratings
end
