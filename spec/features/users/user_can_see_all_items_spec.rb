require 'rails_helper'

describe 'as a user' do
    before(:each) do
      @item_1 = create(:item)
      @item_2 = create(:item)
      @item_3 = create(:item)
      @item_4 = create(:item)
      @item_5 = create(:item)
      @item_6 = create(:item)
    end
    it 'can see all items in items view' do

    visit items_path

    expect(page).to have_content(@item_1.description)
    expect(page).to have_content(@item_1.item_name)
    expect(page).to have_content(@item_1.inventory)
    expect(page).to have_content(@item_1.merchant_name)

    click_on "#{@item_4.item_name}"

    expect(current_path).to eq(item_path(@item_4))
  end

end
