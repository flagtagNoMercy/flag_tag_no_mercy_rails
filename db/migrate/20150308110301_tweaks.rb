class Tweaks < ActiveRecord::Migration
  def change
    change_column :games, :players_count, :integer
    add_column :capture_flags, :value, :integer
  end
end
