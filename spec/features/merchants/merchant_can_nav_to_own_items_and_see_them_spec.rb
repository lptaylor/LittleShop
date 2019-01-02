require 'rails_helper'
include ActionView::Helpers::NumberHelper

describe 'As a merchant' do
    before(:each) do
      @merchant = create(:user, role: 1)
      @item_1 = create(:item, user_id: @merchant.id)
      @item_2 = create(:item, user_id: @merchant.id)
      @item_3 = create(:item, user_id: @merchant.id, enabled: false)
      @item_4 = create(:item, user_id: @merchant.id)
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
        expect(page).to have_content(number_to_currency(@item_1.price))
        expect(page).to have_content(@item_1.inventory)
        expect(page).to have_link("Edit This Item")
        expect(page).to have_link("Delete This Item")
        expect(page).to have_button("Deactivate")
        expect(page).to_not have_button("Activate")
        expect(@item_1.enabled).to be true
      end

      within ".item-#{@item_2.id}" do
        expect(page).to_not have_link("Delete This Item")
      end

      within ".item-#{@item_3.id}" do
        expect(page).to have_button("Activate")
        expect(page).to_not have_button("Deactivate")
        expect(@item_3.enabled).to be false
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
      expect(page).to have_content("You have deleted this item.")
    end

    it 'adds an item' do
      click_link 'My Items'

      click_link 'Add New Item'
      expect(current_path).to eq(new_dashboard_item_path)

      item_1 = build(:item)
      fill_in :item_item_name, with: item_1.item_name
      fill_in :item_image_url, with: item_1.image_url
      fill_in :item_inventory, with: item_1.inventory
      fill_in :item_price, with: item_1.price
      fill_in :item_description, with: item_1.description

      click_on 'Create Item'

      expect(current_path).to eq(dashboard_items_path)

      within ".item-#{Item.last.id}"

      expect(page).to have_content(item_1.item_name)
      expect(page).to have_content(item_1.inventory)
      expect(page).to have_content(number_to_currency(item_1.price))
    end

    it 'will not create item without required details' do
      click_link 'My Items'

      click_link 'Add New Item'
      expect(current_path).to eq(new_dashboard_item_path)

      item_1 = build(:item)
      fill_in :item_item_name, with: item_1.item_name
      fill_in :item_image_url, with: item_1.image_url
      fill_in :item_price, with: item_1.price
      fill_in :item_description, with: item_1.description

      click_on 'Create Item'
      expect(page).to have_content("1 error prohibited this item from")
    end

    it 'saves item if image_url is blank' do

      click_link 'My Items'

      click_link 'Add New Item'
      expect(current_path).to eq(new_dashboard_item_path)

      item_1 = build(:item)
      fill_in :item_item_name, with: item_1.item_name
      fill_in :item_inventory, with: item_1.inventory
      fill_in :item_price, with: item_1.price
      fill_in :item_description, with: item_1.description

      click_on 'Create Item'

      expect(current_path).to eq(dashboard_items_path)

      within ".item-#{Item.last.id}" do
        expect(page).to have_content(item_1.item_name)
        expect(page).to have_content(item_1.inventory)
        expect(page).to have_content(number_to_currency(item_1.price))
      end
    end

    it 'allows editing of items' do
      click_link "My Items"
      within ".item-#{@item_4.id}" do
        click_link "Edit This Item"
      end

      expect(current_path).to eq(edit_dashboard_item_path(@item_4))
      fill_in :item_item_name, with: "LANCE EDIT"

        click_on "Update Item"

      expect(current_path).to eq(dashboard_items_path)

      within ".item-#{@item_4.id}" do
        expect(page).to have_content("LANCE EDIT")
        expect(page).to have_content(@item_4.inventory)
        expect(page).to have_content(number_to_currency(@item_4.price))
      end
    end

    it 'will not save edit if missing info' do
      click_link 'My Items'

      within ".item-#{@item_4.id}" do
        click_link "Edit This Item"
      end

      fill_in :item_item_name, with: ""

      click_on 'Update Item'
      expect(page).to have_content("1 error prohibited this item from")
    end
end
