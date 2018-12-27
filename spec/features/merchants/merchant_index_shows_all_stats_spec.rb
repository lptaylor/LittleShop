require 'rails_helper'

describe 'Visitors' do
  before(:each) do
    visit '/merchants'
    @merch_1 = create(:user, role:1)
    @merch_2 = create(:user, role:1)
    @merch_3 = create(:user, role:1)
    @merch_4 = create(:user, role:1)
    @user_1 = create(:user)
    @user_2 = create(:user)
    @user_3 = create(:user)
    @user_4 = create(:user)
    @order_1 = create(:order, user_id: @user_1.id)
    @order_2 = create(:order, user_id: @user_1.id)
    @order_3 = create(:order, user_id: @user_2.id)
    @order_4 = create(:order, user_id: @user_3.id)
    @order_5 = create(:order, user_id: @user_4.id)
    @item_1 = create(:item, user_id: @merch_1.id)
    @item_2 = create(:item, user_id: @merch_1.id)
    @item_3 = create(:item, user_id: @merch_1.id)
    @item_4 = create(:item, user_id: @merch_1.id)
    @item_5 = create(:item, user_id: @merch_2.id)
    @item_6 = create(:item, user_id: @merch_2.id)
    @item_7 = create(:item, user_id: @merch_2.id)
    @item_8 = create(:item, user_id: @merch_3.id)
    @item_9 = create(:item, user_id: @merch_3.id)
    @item_10 = create(:item, user_id: @merch_4.id)
    @order_1.items += [@item_1, @item_2, @item_3, @item_2]
    @order_2.items += [@item_1, @item_2, @item_3, @item_2, @item_1, @item_2, @item_3, @item_2]
    @order_3.items += [@item_9, @item_9, @item_9, @item_9, @item_9, @item_9, @item_9, @item_9]
    @order_4.items += [@item_1, @item_2, @item_3, @item_4, @item_5, @item_6, @item_7, @item_8]
    @order_5.items += [@item_8, @item_9]
    binding.pry
    # @order_item_1 = build(:order_item, order_id: @order_1.id, item_id: [@item_1.id, @item_2.id, @item_3.id, @item_2.id], created_at: 1.days.ago)
    # @order_item_2 = build(:order_item, order_id: @order_2.id, item_id: [@item_1.id, @item_2.id, @item_3.id, @item_2.id, @item_1.id, @item_2.id, @item_3.id, @item_2.id], created_at: 1.days.ago)
    # @order_item_3 = build(:order_item, order_id: @order_3.id, item_id: [@item_9.id, @item_9.id, @item_9.id, @item_9.id, @item_9.id, @item_9.id, @item_9.id, @item_9.id], created_at: 4.days.ago)
    # @order_item_4 = build(:order_item, order_id: @order_4.id, item_id: [@item_1.id, @item_2.id, @item_3.id, @item_4.id, @item_5.id, @item_6.id, @item_7.id, @item_8.id], created_at: 1.days.ago)
  end

  it 'Shows top 3 merchants by quantity sold' do
    within ".high-merchant-stats" do
      expect(page).to have_content("Our Top Merchants")
      within "#by-quantity" do
        expect(page).to have_content(@merch_3.name)
        expect(page).to have_content(@merch_1.name)
        expect(page).to have_content(@merch_2.name)
      end
    end
  end
end
