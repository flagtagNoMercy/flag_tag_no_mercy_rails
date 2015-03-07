class RemoveUserCountGames < ActiveRecord::Migration
  def change
    remove_column :games, :users_count
  end
end
