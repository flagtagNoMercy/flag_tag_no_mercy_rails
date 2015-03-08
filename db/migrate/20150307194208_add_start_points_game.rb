class AddStartPointsGame < ActiveRecord::Migration
  def change
    add_column :games, :longitude_start_point, :float
    add_column :games, :latitude_start_point, :float
    add_column :games, :radius, :float
  end
end
