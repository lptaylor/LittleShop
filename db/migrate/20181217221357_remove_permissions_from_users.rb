class RemovePermissionsFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :permissions, :string
  end
end
