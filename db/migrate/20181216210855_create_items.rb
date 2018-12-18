class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :image_url
      t.integer :inventory
      t.decimal :price
      t.string :description

      t.timestamps
    end
  end
end
