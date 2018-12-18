class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates_presence_of :address, :city, :state, :zipcode,
                        :email, :password, :role

  has_many :orders
  has_many :items

  has_secure_password
end
