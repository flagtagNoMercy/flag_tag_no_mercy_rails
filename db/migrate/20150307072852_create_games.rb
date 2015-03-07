class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.float :latitude, null: false, default: ""
      t.float :longitude, null: false, default: ""
      t.integer :users_count
      t.timestamps null: false
    end
  end
end
