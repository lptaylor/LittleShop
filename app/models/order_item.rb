class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def subtotal
    quantity * price
  end

  def self.orders_for_merchant(order_id, user_id)
    joins(:item).where('order_id =? AND user_id =?', order_id, user_id )
  end
end
