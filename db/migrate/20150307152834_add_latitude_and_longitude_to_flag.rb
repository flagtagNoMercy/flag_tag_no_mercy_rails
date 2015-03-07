class AddLatitudeAndLongitudeToFlag < ActiveRecord::Migration
  def change
    add_column :flags, :latitude, :float
    add_column :flags, :longitude, :float
  end
end
