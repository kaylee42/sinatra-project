class Author < ActiveRecord::Base
  has_many :books
  has_many :genres, through: :books
  has_many :ratings, through: :books

  validates_presence_of :name, message: "Author name must be given a name!"
end
