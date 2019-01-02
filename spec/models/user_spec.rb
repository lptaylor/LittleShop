require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it {should have_many(:orders)}
    it {should have_many(:items)}
  end
  describe 'validations' do
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:address)}
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:state)}
    it {should validate_presence_of(:zipcode)}
    it {should validate_presence_of(:password)}
    it {should validate_presence_of(:role)}
  end
  describe 'roles' do
    it 'it can be created as an admin' do
      admin = create(:user, role: 2)

      expect(admin.role).to eq('admin')
      expect(admin.admin?).to be_truthy
  end
    it 'can be created as an merchant' do
      merchant = create(:user, role: 1)

      expect(merchant.role).to eq('merchant')
      expect(merchant.merchant?).to be_truthy
  end
    it 'can be created as a registered user' do
      registered_user = create(:user, role: 0)

      expect(registered_user.role).to eq('registered_user')
      expect(registered_user.registered_user?).to be_truthy
    end
    it 'creates user as default role 0' do
      registered_user = create(:user)

      expect(registered_user.role).not_to eq('merchant')
      expect(registered_user.merchant?).to be_falsey
      expect(registered_user.role).not_to eq('admin')
      expect(registered_user.admin?).to be_falsey
    end
  end
  describe 'class methods' do
    it 'will return only active merchants' do
      user_1 = create(:user, role: 1)
      user_2 = create(:user, role: 1)
      user_3 = create(:user, role: 1)
      user_4 = create(:user, role: 1, active: false, created_at: 3.days.ago)
      user_5 = create(:user, role: 1, active: false, created_at: 3.days.ago)

      expect(User.active_merchants).to eq([user_1, user_2, user_3])
    end

    it 'will return only registered users' do
      user_1 = create(:user)
      user_2 = create(:user)
      user_3 = create(:user)
      user_4 = create(:user, role: 1)
      user_5 = create(:user, role: 1)
      user_6 = create(:user, role: 2)
      user_7 = create(:user, role: 2)

      expect(User.registered_users).to eq([user_1, user_2, user_3])
    end


    it 'will return only merchants' do
      user_1 = create(:user)
      user_2 = create(:user)
      user_3 = create(:user)
      user_4 = create(:user, role: 1)
      user_5 = create(:user, role: 1)
      user_6 = create(:user, role: 2)
      user_7 = create(:user, role: 2)

      expect(User.merchants).to eq([user_4, user_5])
    end
  end

  describe 'instance methods' do
    it 'changes a user from disabled to enabled' do
      user_1 = create(:user, active: false)
      user_1.enable

      expect(user_1.active).to eq(true)
      expect(user_1.active).to_not eq(false)
    end

    it 'changes a user from enabled to disabled' do
      user_1 = create(:user)
      user_1.disable

      expect(user_1.active).to eq(false)
      expect(user_1.active).to_not eq(true)
    end

    it 'changes a registered user to a merchant' do
      user_1 = create(:user)
      user_1.upgrade_to_merchant

      expect(user_1.role).to eq("merchant")
      expect(user_1.role).to_not eq("registered_user")
    end

    it 'changes a merchant to a registered user' do
      merchant_1 = create(:user, role: 1)
      merchant_1.downgrade_to_user

      expect(merchant_1.role).to eq("registered_user")
      expect(merchant_1.role).to_not eq("merchant")
    end
  end

  describe 'statistics methods' do
    before(:each) do
      @user_1 = create(:user, city: "Springfield", state: "Colorado")
      @user_2 = create(:user, city: "Springfield", state: "Colorado")
      @user_3 = create(:user, city: "Springfield", state: "Colorado")
      @user_4 = create(:user, city: "Dayton", state: "Florida")
      @user_5 = create(:user, city: "Dayton", state: "Florida")
      @user_6 = create(:user, city: "Springfield", state: "Ohio")
      @user_7 = create(:user, city: "Dayton", state: "Florida")
      @user_8 = create(:user, city: "Springfield", state: "Colorado")
      @user_9 = create(:user, city: "Springfield", state: "Ohio")
      @user_10 = create(:user, city: "Jho", state: "D.C.")
      @user_11 = create(:user, city: "Miami", state: "Colorado")
      @user_12 = create(:user, city: "Blue Field", state: "Washington")

      @merch_1 = create(:user, role: 1, name: "merch_1")
      @merch_2 = create(:user, role: 1, name: "merch_2")
      @merch_3 = create(:user, role: 1, name: "merch_3")
      @merch_4 = create(:user, role: 1, name: "merch_4")
      @merch_5 = create(:user, role: 1, name: "merch_5")
      @merch_6 = create(:user, role: 1, name: "merch_6")
      @merch_7 = create(:user, role: 1, name: "merch_7")
      @merch_8 = create(:user, role: 1, name: "merch_8")
      @merch_9 = create(:user, role: 1, name: "merch_9")
      @merch_10 = create(:user, role: 1, name: "merch_10")
      @merch_11 = create(:user, role: 1, name: "merch_11")
      @merch_12 = create(:user, role: 1, name: "merch_12")

      @item_1 = create(:item, user: @merch_1, price: 1)
      @item_2 = create(:item, user: @merch_2, price: 2)
      @item_3 = create(:item, user: @merch_3, price: 3)
      @item_4 = create(:item, user: @merch_4, price: 4)
      @item_5 = create(:item, user: @merch_5, price: 5)
      @item_6 = create(:item, user: @merch_6, price: 6)
      @item_7 = create(:item, user: @merch_7, price: 7)
      @item_8 = create(:item, user: @merch_8, price: 8)
      @item_9 = create(:item, user: @merch_9, price: 9)
      @item_10 = create(:item, user: @merch_10, price: 2500030)
      @item_11= create(:item, user: @merch_11, price: 6000030)
      @item_12 = create(:item, user: @merch_12, price: 20000030)

      @order_1 = create(:order, user: @user_1)
      @order_2 = create(:order, user: @user_2)
      @order_3 = create(:order, user: @user_3)
      @order_4 = create(:order, user: @user_4)
      @order_5 = create(:order, user: @user_5)
      @order_6 = create(:order, user: @user_6)
      @order_7 = create(:order, user: @user_7)
      @order_8 = create(:order, user: @user_8)
      @order_9 = create(:order, user: @user_9)
      @order_10 = create(:order, user: @user_10)
      @order_11 = create(:order, user: @user_11)
      @order_12 = create(:order, user: @user_12)

      @order_item_1 = create(:order_item, item: @item_1, order: @order_1, quantity: 300, fulfilled: true, created_at: 12.days.ago, updated_at: 10.days.ago, price: @item_1.price)
      @order_item_2 = create(:order_item, item: @item_2, order: @order_2, quantity: 175, fulfilled: true, created_at: 12.days.ago, updated_at: 9.days.ago, price: @item_2.price)
      @order_item_3 = create(:order_item, item: @item_3, order: @order_3, quantity: 400, fulfilled: false, created_at: 12.days.ago, updated_at: 4.days.ago, price: @item_3.price)
      @order_item_4 = create(:order_item, item: @item_4, order: @order_4, quantity: 9, fulfilled: true, created_at: 12.days.ago, updated_at: 2.days.ago, price: @item_4.price)
      @order_item_5 = create(:order_item, item: @item_5, order: @order_5, quantity: 200, fulfilled: true, created_at: 12.days.ago, updated_at: 1.days.ago, price: @item_5.price)
      @order_item_6 = create(:order_item, item: @item_6, order: @order_6, quantity: 7, fulfilled: true, created_at: 12.days.ago, updated_at: 5.days.ago, price: @item_6.price)
      @order_item_7 = create(:order_item, item: @item_7, order: @order_7, quantity: 6, fulfilled: true, created_at: 12.days.ago, updated_at: 5.days.ago, price: @item_7.price)
      @order_item_8 = create(:order_item, item: @item_8, order: @order_8, quantity: 5, fulfilled: true, created_at: 12.days.ago, updated_at: 3.days.ago, price: @item_8.price)
      @order_item_9 = create(:order_item, item: @item_9, order: @order_9, quantity: 4, fulfilled: true, created_at: 12.days.ago, updated_at: 5.days.ago, price: @item_9.price)
      @order_item_10 = create(:order_item, item: @item_10, order: @order_10, quantity: 30, fulfilled: true, created_at: 12.days.ago, updated_at: 5.days.ago, price: @item_10.price)
      @order_item_11 = create(:order_item, item: @item_11, order: @order_11, quantity: 25, fulfilled: true, created_at: 12.days.ago, updated_at: 5.days.ago, price: @item_11.price)
      @order_item_12 = create(:order_item, item: @item_12, order: @order_12, quantity: 50, fulfilled: true, created_at: 12.days.ago, updated_at: 11.days.ago, price: @item_12.price)
    end

    it 'will return merchants ordered by qty sold' do
      ordered_merch = User.top_sellers_by_quantity

      expect(ordered_merch).to eq([@merch_1, @merch_5, @merch_2])
    end

    it 'will return merchants ordered by revenue' do
      ordered_merch = User.top_sellers_by_revenue

      expect(ordered_merch).to eq([@merch_12, @merch_11, @merch_10])
    end

    it 'will return merchants ordered by avg fulfillment time' do
      top_ordered_merch = User.ordered_by_fulfillment("asc")

      expect(top_ordered_merch).to eq([@merch_12, @merch_1, @merch_2])
    end

    it 'will return merchants ordered by avg fulfillment time' do
      bot_ordered_merch = User.ordered_by_fulfillment("desc")

      expect(bot_ordered_merch).to eq([@merch_5, @merch_4, @merch_8])
    end

    it 'will return top states shipped to' do
      top_states_dirty = User.ordered_by_states_most_shipped_to
      top_states = top_states_dirty.map {|user| user.state}
      expect(top_states).to eq([@user_1.state, @user_4.state, @user_6.state])
    end

    it 'will return top states shipped to' do
      top_cities_dirty = User.ordered_by_cities_most_shipped_to
      top_cities = top_cities_dirty.map {|user| user.city}
      expect(top_cities).to eq([@user_1.city, @user_4.city, @user_6.city])
    end
  end
end
