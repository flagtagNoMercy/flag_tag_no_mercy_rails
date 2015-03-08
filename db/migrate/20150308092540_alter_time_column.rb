class AlterTimeColumn < ActiveRecord::Migration
  def change
    remove_column :games, :time_limit
    add_column :games, :time_limit, :integer, default: 60
    add_column :flags, :flag_time_limit_minutes, :integer, default: 15
  end
end
