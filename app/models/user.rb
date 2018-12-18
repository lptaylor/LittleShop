class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :address, :city, :state, :zipcode,
                        :password, :role

  has_many :orders
  has_many :items

  has_secure_password
  enum role: ["registered_user", "merchant", "admin"]
end
