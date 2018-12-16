class User < ApplicationRecord
  validates_presence_of :user_name, :address, :city, :state, :zipcode,
                        :email, :password, :permissions

  has_many :orders
  has_many :items
end
