class AddForeignKeys < ActiveRecord::Migration
  def change
    add_column :games, :user_id, :integer
    add_column :flags, :player_id, :integer
    add_column :capture_flags, :player_id, :integer
  end
end
