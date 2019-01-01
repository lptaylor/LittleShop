class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :address, :city, :state, :zipcode,
                        :name, :password, :role

  has_many :orders
  has_many :items

  has_secure_password
  enum role: ["registered_user", "merchant", "admin"]

  def self.existing_email(user_params)
    if find_by(email: user_params[:email]).class == User
      find_by(email: user_params[:email]).email
    else
      nil
    end
  end

  def self.active_merchants
    merchant.where("active = true")
  end

  def self.registered_users
    where(role: "registered_user")
  end

  def self.merchants
    where(role: "merchant")
  end

  def self.top_sellers_by_quantity
    User.joins(:items, {items: :order_items})
      .select("users.*, sum(order_items.quantity) as top_by_qty")
      .group(:id)
      .where("order_items.fulfilled=?", true)
      .where("users.role = 1")
      .order("top_by_qty desc")
      .limit(3)
  end

  def self.top_sellers_by_revenue
    User.joins(:items, {items: :order_items})
      .select("users.*, sum(order_items.price*order_items.quantity) as revenue")
      .group(:id)
      .group("order_items.item_id")
      .where("order_items.fulfilled=?", true)
      .where("users.role = 1")
      .order("revenue desc")
      .limit(3)
  end

  def self.ordered_by_fulfillment(direction)
    User.joins(items: :order_items)
    .select("users.*, avg(order_items.updated_at-order_items.created_at) as avg_fulfill_time")
    .group(:id)
    .where("order_items.fulfilled = true")
    .where("users.role = 1")
    .order("avg_fulfill_time #{direction}")
    .limit(3)
  end

  def self.ordered_by_states_most_shipped_to
    User.joins(:orders, {orders: :order_items})
    .select("users.state, count(*) as total_by_state")
    .where("order_items.fulfilled = true")
    .where("users.role = 0")
    .group("users.state")
    .order("total_by_state desc")
    .limit(3)
  end

  def enable
    update_column(:active, true)
  end

  def disable
    update_column(:active, false)
  end

  def upgrade_to_merchant
    update_column(:role, "merchant")
  end

  def downgrade_to_user
    update_column(:role, "registered_user")
  end
end
