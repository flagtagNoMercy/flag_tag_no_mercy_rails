class RemoveLatitudeFromGame < ActiveRecord::Migration
  def change
    remove_column :games, :latitude, :float
  end
end
