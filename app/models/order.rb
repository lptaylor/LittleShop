class Order < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  validates_presence_of :order_status, :user_id

  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  enum order_status: ["pending", "completed", "cancelled"]

  def total_order_items
    order_items.count
  end

  def total_order_price
    order_items.sum("order_items.price * order_items.quantity")
  end

end
