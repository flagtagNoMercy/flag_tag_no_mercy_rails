class Tweaks < ActiveRecord::Migration
  def change
    change_column :games, :players_count, :integer
    change_column :flags, :in_radius, :integer, default: false
  end
end
