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

      expect(current_path).to eq(cart_path)
      expect(page).to have_content("Shopping Cart")

      visit root_path
      click_link "Login"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Login")

      visit root_path
      click_link "Register"
      expect(current_path).to eq(register_path)
      expect(page).to have_content("New User")
    end

    it 'shows count of items in shopping cart' do
      user_1 = create(:user)

      item_1 = Item.create(item_name: "Socks", image_url: "https://www.uncommongoods.com/images/items/40200/40240_1_640px.jpg", inventory: 5, price: 10, description: "Taco socks, very warm", user: user_1)
      item_2 = Item.create(item_name: "Shoes", image_url: "https://www.uncommongoods.com/images/items/40200/40240_1_640px.jpg", inventory: 6, price: 12, description: "Shoes to wear with socks", user: user_1)
      item_3 = Item.create(item_name: "Dog Toy", image_url: "https://www.uncommongoods.com/images/items/40200/40240_1_640px.jpg", inventory: 7, price: 11, description: "It's a hedgehog!", user: user_1)
      item_4 = Item.create(item_name: "Chair", image_url: "https://www.uncommongoods.com/images/items/40200/40240_1_640px.jpg", inventory: 8, price: 13, description: "You can sit in it", user: user_1)
      item_5 = Item.create(item_name: "Cellphone", image_url: "https://www.uncommongoods.com/images/items/40200/40240_1_640px.jpg", inventory: 10, price: 14, description: "Call people from this", user: user_1)

      visit root_path
      items = [item_1, item_2, item_3, item_4, item_5]

      expect(page).to have_content("Item Count: #{items.count}")
    end

    it 'shows all items in system except disabled items' do
      user_1 = create(:user)

      item_1 = Item.create(item_name: "Socks", image_url: "https://www.uncommongoods.com/images/items/40200/40240_1_640px.jpg", inventory: 5, price: 10, description: "Taco socks, very warm", user: user_1)
      item_2 = Item.create(item_name: "Shoes", image_url: "https://www.uncommongoods.com/images/items/40200/40240_1_640px.jpg", inventory: 6, price: 12, description: "Shoes to wear with socks", user: user_1)
      item_3 = Item.create(item_name: "Dog Toy", image_url: "https://www.uncommongoods.com/images/items/40200/40240_1_640px.jpg", inventory: 7, price: 11, description: "It's a hedgehog!", user: user_1)
      item_4 = Item.create(item_name: "Chair", image_url: "https://www.uncommongoods.com/images/items/40200/40240_1_640px.jpg", inventory: 8, price: 13, description: "You can sit in it", user: user_1, enabled: false)

      visit items_path

      expect(page).to have_content(item_1.item_name)
      expect(page).to have_content(item_2.item_name)
      expect(page).to have_content(item_3.item_name)
      expect(page).not_to have_content(item_4.item_name)
    end
  end
end
