class CreateCaptureFlags < ActiveRecord::Migration
  def change
    create_table :capture_flags do |t|
      t.integer :user_id
      t.integer :flag_id

      t.timestamps null: false
    end
  end
end
