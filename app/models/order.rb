class Order < ApplicationRecord
  validates_presence_of :order_status, :user_id

  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  enum order_status: ["pending", "completed", "cancelled"]
end
