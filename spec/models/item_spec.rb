require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should have_many(:order_items) }
    it { should have_many(:orders).through(:order_items) }
  end
  describe 'validations' do
    it {should validate_presence_of(:item_name)}
    it {should validate_presence_of(:image_url)}
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
  describe 'instance methods' do
    it 'can add total items within cart' do
      item_1 = Item.create(item_name: 'socks', image_url: 'http//:something.org', inventory: 4, price: 123.00, description: "something nice")

      expect(item_1.total_for_item).to eq(123)
    end
  end
end
