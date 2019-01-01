class Order < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  validates_presence_of :order_status, :user_id

  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  enum order_status: ["pending", "completed", "cancelled"]

  def total_order_items
    order_items.sum(:quantity)
  end

  def total_order_price
    order_items.sum("order_items.price * order_items.quantity")
  end

  def add_cart_items(cart_contents)
    cart_contents.each do |content|
      key = content.first
      order_items.create( item_id: key,
                          price: Item.find(key).price,
                          quantity: content.last)
    end
  end

  def update_inventory
    order_items.each do |oitem|
      to_update = oitem.item.inventory
      oitem.item.update( inventory: to_update -= oitem.quantity )
    end
  end

  def add_back_inventory
    items.each do |item|
      order_items.each do |oi|
        if oi.item_id == item.id
          item.update( inventory: item.inventory += oi.quantity )
        end
      end
    end
  end

  def self.largest_orders
    Order.joins(:order_items)
    .select("order_items.quantity, orders.*, sum(quantity)")
    .where("order_items.fulfilled = true")
    .group(:id)
    .group(:order_id)
    .group(:quantity)
    .order("quantity desc")
    .limit(3)
  end

end
