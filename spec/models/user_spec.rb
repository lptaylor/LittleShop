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
end
