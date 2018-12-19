class Item < ApplicationRecord
  validates_presence_of :item_name, :image_url,
                        :inventory, :price, :description, :user_id

  belongs_to :user
  has_many :order_items
  has_many :orders, through: :order_items

  def merchant_name
    user.name
  end
end
