class User < ApplicationRecord
  validates_presence_of :username, :address, :city, :state, :zipcode,
                        :email, :password, :role

  has_many :orders
  has_many :items
end
