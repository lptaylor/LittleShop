class Order < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  validates_presence_of :order_status, :user_id

  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  enum order_status: ["pending", "completed", "cancelled"]

  def total_order_items
    items.count
  end

  def total_order_price
    prices = items.map do |item|
      item.price
    end
    number_to_currency(prices.sum.to_f)
  end
end
