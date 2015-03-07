class UsersGamesEdit < ActiveRecord::Migration
  def change
    rename_table :user_games, :users_games
  end
end
