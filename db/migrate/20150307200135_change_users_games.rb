class ChangeUsersGames < ActiveRecord::Migration
  def change
    rename_table :users_games, :players
  end
end
