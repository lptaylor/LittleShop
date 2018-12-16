class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :image
      t.integer :qty_in_stock
      t.integer :price
      t.string :description

      t.timestamps
    end
  end
end
