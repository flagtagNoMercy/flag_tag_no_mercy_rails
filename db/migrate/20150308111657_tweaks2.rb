class Tweaks2 < ActiveRecord::Migration
  def change
    remove_column :games, :players_count, :integer
    change_column :flags, :in_radius, :boolean, default: false
    add_column :games, :players_count, :integer
  end
end
