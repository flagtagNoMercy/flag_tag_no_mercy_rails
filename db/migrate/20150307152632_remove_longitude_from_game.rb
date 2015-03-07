class RemoveLongitudeFromGame < ActiveRecord::Migration
  def change
    remove_column :games, :longitude, :float
  end
end
