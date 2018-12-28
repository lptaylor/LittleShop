require 'rails_helper'

describe 'As a merchant' do
    before(:each) do
      @merchant = create(:user, role: 1)
      @item_1 = create(:item, user_id: @merchant.id)
      @item_2 = create(:item, user_id: @merchant.id)
      @item_3 = create(:item, user_id: @merchant.id, enabled: false)
      @order_1 = create(:order)
      @order_1.items += [@item_2]

      visit root_path
      click_link "Login"

      fill_in :email, with: @merchant.email
      fill_in :password, with: @merchant.password

      click_button "Login"
    end

    it 'Can see a link and navigate to my items' do
      expect(page).to have_link("My Items")

      click_link "My Items"

      expect(current_path).to eq(dashboard_items_path)
  end

    it "Items page shows desired info for each item" do
      click_link "My Items"

      expect(page).to have_link("Add New Item")

      within ".item-#{@item_1.id}" do
        expect(page).to have_content(@item_1.id)
        expect(page).to have_content(@item_1.item_name)
        expect(page).to have_content(@item_1.price)
        expect(page).to have_content(@item_1.inventory)
        expect(page).to have_link("Edit This Item")
        expect(page).to have_link("Delete This Item")
        expect(page).to have_button("Deactivate")
        expect(page).to_not have_button("Activate")
      end

      within ".item-#{@item_2.id}" do
        expect(page).to_not have_link("Delete This Item")
      end

      within ".item-#{@item_3.id}" do
        expect(page).to have_button("Activate")
        expect(page).to_not have_button("Deactivate")
      end
    end

    it 'deactivates an item' do
      click_link "My Items"

      within ".item-#{@item_1.id}" do
        click_button "Deactivate"
      end

      within ".item-#{@item_1.id}" do
        expect(page).to have_button("Activate")
      end
    end

    it 'deletes an item' do
      click_link 'My Items'

      within ".item-#{@item_1.id}" do
        click_link "Delete This Item"
      end

      expect(page).to_not have_content(@item_1.item_name)
      expect(page).to_not have_content(@item_1.description)
    end

end
