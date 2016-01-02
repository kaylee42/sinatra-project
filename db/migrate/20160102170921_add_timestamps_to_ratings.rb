class AddTimestampsToRatings < ActiveRecord::Migration
  def change
    add_timestamps :ratings
  end
end
