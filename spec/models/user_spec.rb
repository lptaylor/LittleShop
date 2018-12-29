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
  end
end
