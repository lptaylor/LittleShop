class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :email
      t.string :password
      t.string :permissions
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
