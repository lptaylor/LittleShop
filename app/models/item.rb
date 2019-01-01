class Item < ApplicationRecord
  validates_presence_of :item_name,
                        :inventory, :price, :description, :user_id

  belongs_to :user
  has_many :order_items
  has_many :orders, through: :order_items

  def merchant_name
    user.name
  end

  def total_for_item
    total = Hash.new(0)
    total[:price] += self.price
    total[:price]
  end

  def toggle_active
    toggle(:enabled).save
  end

  def self.popular_items(direction)
    Item.joins(:order_items)
      .select("items.*, sum(order_items.quantity) as total_sold")
      .group(:id)
      .order("total_sold #{direction}")
      .where("order_items.fulfilled=?", true)
      .limit(5)
  end

  def order_quantity(order)
    order_items.where(order_id: order.id).pluck(:quantity).last
  end
end
