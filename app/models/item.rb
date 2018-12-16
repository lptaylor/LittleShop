class Item < ApplicationRecord
  validates_presence_of :item_name, :image,
                        :qty_in_stock, :price, :description, :user_id

  belongs_to :user
  has_many :order_items
  has_many :orders, through: :order_items
end
