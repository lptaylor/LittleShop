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

  def enable
    update_column(:active, true)
  end

  def disable
    update_column(:active, false)
  end
end
