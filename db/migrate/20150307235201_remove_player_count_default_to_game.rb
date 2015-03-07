class RemovePlayerCountDefaultToGame < ActiveRecord::Migration
  def change
    change_column :games, :players_count, :integer
  end
end
