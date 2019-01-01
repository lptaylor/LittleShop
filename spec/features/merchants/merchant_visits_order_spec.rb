require 'rails_helper'

describe 'when a merchant visits orders show page' do
  before(:each) do
    @user_1 = create(:user)
    @merchant = create(:user, role: 1)
    @item_1 = create(:item, user: @merchant, price: 100.00)
    @item_2 = create(:item, user: @merchant, price: 101.00)
    @order_1 = create(:order, user: @user_1, items: [@item_1, @item_1, @item_2])
    @order_item_1 = create(:order_item, order: @order_1, quantity: 1, price: 301.00)

    visit root_path
    click_link "Login"

    fill_in :email, with: @merchant.email
    fill_in :password, with: @merchant.password

    click_button "Login"
  end
  it 'merchant can see the customers name and address' do
    visit dashboard_order_path(@order_1)

    expect(page).to have_content(@order_1.user.name)
    expect(page).to have_content(@order_1.user.address)
    expect(page).to have_content(@order_1.user.city)
    expect(page).to have_content(@order_1.user.state)
    expect(page).to have_content(@order_1.user.zipcode)
    expect(page).to have_content(@item_1.item_name)
    expect(page).to have_content(@item_1.image_url)
    expect(page).to have_content(@item_1.price)
    expect(page).to have_content(@item_2.item_name)
    expect(page).to have_content(@order_item_1.quantity)
  end
end
