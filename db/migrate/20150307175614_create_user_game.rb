class CreateUserGame < ActiveRecord::Migration
  def change
    create_table :user_games do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :points, default: 0
    end
  end
end
