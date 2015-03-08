class AddLatitudeAndLongtitudeToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :player_latitude, :float
    add_column :players, :player_longitude, :float
  end
end
