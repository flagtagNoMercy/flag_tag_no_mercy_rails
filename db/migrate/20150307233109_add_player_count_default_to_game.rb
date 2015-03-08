class AddPlayerCountDefaultToGame < ActiveRecord::Migration
  def change
    change_column :games, :players_count, :integer, :default => 1
  end
end
