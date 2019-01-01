require 'rails_helper'

include ActionView::Helpers::NumberHelper

describe 'as a user' do
    before(:each) do
      @item_1 = create(:item)
      @item_2 = create(:item)
      @item_3 = create(:item)
      @item_4 = create(:item)
      @item_5 = create(:item)
      @item_6 = create(:item)
    end
    describe 'when they visit the item show page' do
      it 'displays info about the item' do

      visit item_path(@item_1)

      expect(current_path).to eq("/items/#{@item_1.id}")
      expect(page).to have_content(@item_1.item_name)
      expect(page).to have_content(@item_1.description)
      expect(page).to have_content("Quantity in Stock: #{@item_1.inventory}")
      expect(page).to have_content("Merchant: #{@item_1.merchant_name}")
      expect(page).to have_content("Price: #{number_to_currency(@item_1.price)}")
      expect(page).to have_button("Add Item to Cart")
    end
  end


end
