class AddValCaptureFlag < ActiveRecord::Migration
  def change
    add_column :capture_flags, :value, :integer, default: 10
    add_foreign_key :capture_flags, :users_games
    remove_column :capture_flags, :user_id
  end
end
