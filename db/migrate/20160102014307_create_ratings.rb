class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :amount
      t.integer :user_id
      t.integer :book_id
    end
  end
end
