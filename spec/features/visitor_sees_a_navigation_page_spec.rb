require 'rails_helper'

describe 'As a user' do
  describe 'when they visit the welcome page' do
    it 'shows a navigation bar' do
      visit root_path

      click_link "Homepage"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome!")

      visit root_path
      click_link "Items"

      expect(current_path).to eq(items_path)
      expect(page).to have_content("Items")

      visit root_path
      click_link "Merchants"

      expect(current_path).to eq(merchants_path)
      expect(page).to have_content("All Merchants")

      visit root_path
      click_link "Shopping Cart"

      expect(current_path).to eq(cart_index_path)
      expect(page).to have_content("Shopping Cart")

      visit root_path
      click_link "Login"

      expect(current_path).to eq(login_index_path)
      expect(page).to have_content("Login")

      visit root_path
      click_link "Register"
      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("New User")
    end

    it 'shows count of items in shopping cart' do
      user_1 = User.create(username: "Jeff", address: "123 AbC St", city: "Denver", state: "Colorado", zipcode: 80128, email: "jeff@aol.com", password: "dogsaregreat", role: 0)
      item_1 = Item.create(item_name: "Socks", image: "https://www.uncommongoods.com/images/items/40200/40240_1_640px.jpg", qty_in_stock: 5, price: 10, description: "Taco socks, very warm", user: user_1)
      item_2 = Item.create(item_name: "Shoes", image: "https://www.uncommongoods.com/images/items/40200/40240_1_640px.jpg", qty_in_stock: 6, price: 12, description: "Shoes to wear with socks", user: user_1)
      item_3 = Item.create(item_name: "Dog Toy", image: "https://www.uncommongoods.com/images/items/40200/40240_1_640px.jpg", qty_in_stock: 7, price: 11, description: "It's a hedgehog!", user: user_1)
      item_4 = Item.create(item_name: "Chair", image: "https://www.uncommongoods.com/images/items/40200/40240_1_640px.jpg", qty_in_stock: 8, price: 13, description: "You can sit in it", user: user_1)
      item_5 = Item.create(item_name: "Cellphone", image: "https://www.uncommongoods.com/images/items/40200/40240_1_640px.jpg", qty_in_stock: 10, price: 14, description: "Call people from this", user: user_1)

      visit root_path
      items = [item_1, item_2, item_3, item_4, item_5]

      expect(page).to have_content("Item Count: #{items.count}")
    end

  end
end
