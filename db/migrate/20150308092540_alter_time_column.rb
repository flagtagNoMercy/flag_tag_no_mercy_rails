class AlterTimeColumn < ActiveRecord::Migration
  def change
    change_column :games, :time_limit, :integer, default: 60
    add_column :flags, :flag_time_limit_minutes, :integer, default: 15
  end
end
