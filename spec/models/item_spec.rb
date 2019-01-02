require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should have_many(:order_items) }
    it { should have_many(:orders).through(:order_items) }
  end
  describe 'validations' do
    it {should validate_presence_of(:item_name)}
    it {should validate_presence_of(:inventory)}
    it {should validate_presence_of(:price)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:user_id)}
  end
  describe 'items can be bot made' do
    before(:each) do
      @item_1 = create(:item)
      @item_2 = create(:item)
      @item_3 = create(:item)
      @item_4 = create(:item)
      @item_5 = create(:item)
      @item_6 = create(:item)
    end

    it 'items have merchant ids' do
      item_count = Item.all.count

      expect(item_count).to eq(6)
      expect(@item_1.user_id.class).to eq(Integer)
    end

    it 'items all belong to merchant roles' do
      summed_ids = Item.joins(:user).sum(:role)

      expect(summed_ids).to eq(6)
    end

    it 'shows merchant name' do
      merchant_1 = create(:user, name: 'Marty')
      item_7 = Item.create(item_name: 'socks', image_url: 'http//:something.org', inventory: 4, price: 123.00, description: "something nice", user_id: merchant_1.id)
      merchant = item_7.merchant_name

      expect(merchant).to eq('Marty')
    end
  end
  describe 'class methods' do
    it 'returns popular items' do
      user = create(:user)
      item_1 = create(:item)
      item_2 = create(:item)
      item_3 = create(:item)
      item_4 = create(:item)
      item_5 = create(:item)
      item_6 = create(:item)
      item_7 = create(:item)
      item_8 = create(:item)
      item_9 = create(:item)
      item_10 = create(:item)
      item_11= create(:item)
      item_12 = create(:item)

      order_1 = create(:order, user: user)
      order_2 = create(:order, user: user)
      order_3 = create(:order, user: user)
      order_4 = create(:order, user: user)
      order_5 = create(:order, user: user)
      order_6 = create(:order, user: user)
      order_7 = create(:order, user: user)
      order_8 = create(:order, user: user)
      order_9 = create(:order, user: user)
      order_10 = create(:order, user: user)
      order_11 = create(:order, user: user)
      order_12 = create(:order, user: user)
      
      order_item_1 = create(:order_item, item: item_1, order: order_1, quantity: 12, fulfilled: true)
      order_item_2 = create(:order_item, item: item_2, order: order_2, quantity: 11, fulfilled: true)
      order_item_3 = create(:order_item, item: item_3, order: order_3, quantity: 10, fulfilled: true)
      order_item_4 = create(:order_item, item: item_4, order: order_4, quantity: 9, fulfilled: true)
      order_item_5 = create(:order_item, item: item_5, order: order_5, quantity: 8, fulfilled: true)
      order_item_6 = create(:order_item, item: item_6, order: order_6, quantity: 7, fulfilled: true)
      order_item_7 = create(:order_item, item: item_7, order: order_7, quantity: 6, fulfilled: true)
      order_item_8 = create(:order_item, item: item_8, order: order_8, quantity: 5, fulfilled: true)
      order_item_9 = create(:order_item, item: item_9, order: order_9, quantity: 4, fulfilled: true)
      order_item_10 = create(:order_item, item: item_10, order: order_10, quantity: 3, fulfilled: true)
      order_item_11 = create(:order_item, item: item_11, order: order_11, quantity: 2, fulfilled: true)
      order_item_12 = create(:order_item, item: item_12, order: order_12, quantity: 1, fulfilled: true)


      most_popular = Item.popular_items("desc")
      most_popular_items = most_popular.map {|item| item.item_name}
      expected_1 = [item_1.item_name, item_2.item_name, item_3.item_name, item_4.item_name, item_5.item_name]

      least_popular = Item.popular_items("asc")
      least_popular_items = least_popular.map {|item| item.item_name}
      expected_2 = [item_12.item_name, item_11.item_name, item_10.item_name, item_9.item_name, item_8.item_name]

      expect(most_popular_items.count).to eq(5)
      expect(most_popular_items).to eq(expected_1)
      expect(least_popular_items.count).to eq(5)
      expect(least_popular_items).to eq(expected_2)

    end
  end

  describe 'instance methods' do
    it 'can add total items within cart' do
      item_1 = Item.create(item_name: 'socks', image_url: 'http//:something.org', inventory: 4, price: 123.00, description: "something nice")

      expect(item_1.total_for_item).to eq(123)
    end

    it 'can check order quantity for merchant item' do
      user = create(:user, role: 1)
      item_1 = create(:item, user: user)

      order_1 = create(:order, user: user)
      create(:order_item, order: order_1, item: item_1, price: 2.5, quantity: 5)

      query = item_1.order_quantity(order_1)

      expect(query).to eq(5)
    end

    it 'changes item from actice to inactive and back' do
      item_1 = create(:item)

      expect(item_1.enabled).to be true

      expect(item_1.toggle_active).to be true

      expect(item_1.enabled).to be false
    end
  end
end
