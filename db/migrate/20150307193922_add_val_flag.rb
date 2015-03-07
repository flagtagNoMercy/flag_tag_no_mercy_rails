class AddValFlag < ActiveRecord::Migration
  def change
    add_column :flags, :current_value, :integer, default: 10
    add_column :flags, :item_description, :text, default: "", null: false
    add_foreign_key :flags, :users_games
  end
end
