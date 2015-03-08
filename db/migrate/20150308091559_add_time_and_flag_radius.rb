class AddTimeAndFlagRadius < ActiveRecord::Migration
  def change
    add_column :games, :time_limit, :datetime
    add_column :flags, :radius, :float
    add_column :flags, :in_radius,:boolean
  end
end
