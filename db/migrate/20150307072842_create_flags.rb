class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.boolean :captured
      t.timestamps null: false
    end
  end
end
