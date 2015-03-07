class RemoveCapturedFlags < ActiveRecord::Migration
  def change
    remove_column :flags, :captured
  end
end
