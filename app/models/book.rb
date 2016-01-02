class Book < ActiveRecord::Base
  belongs_to :author
  has_many :ratings
  has_many :users, through: :ratings
end
