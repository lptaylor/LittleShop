json.extract! user, :id, :user_name, :address, :city, :state, :zipcode, :email, :password, :permissions, :created_at, :updated_at
json.url user_url(user, format: :json)
