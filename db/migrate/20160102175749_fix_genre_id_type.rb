class FixGenreIdType < ActiveRecord::Migration
  def change
    change_column :books, :genre_id, :integer
  end
end
