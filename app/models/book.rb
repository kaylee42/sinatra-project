class Book < ActiveRecord::Base
  belongs_to :author
  belongs_to :genre
  has_many :ratings
  has_many :users, through: :ratings

  validates_presence_of :name, message: "Book must be created with a title!"
  validates_presence_of :author_id, message: "Book must be created with an author!"
end
