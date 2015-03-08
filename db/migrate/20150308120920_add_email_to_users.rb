class AddEmailToUsers < ActiveRecord::Migration
  def change
    # Confirmable
    add_column :confirmation_token
    add_column :confirmed_at
    add_column :confirmation_sent_at

  end
end
