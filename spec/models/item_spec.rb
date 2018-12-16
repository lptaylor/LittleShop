require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should have_many(:order_items) }
    it { should have_many(:orders).through(:order_items) }
  end
  describe 'validations' do
    it {should validate_presence_of(:item_name)}
    it {should validate_presence_of(:image)}
    it {should validate_presence_of(:qty_in_stock)}
    it {should validate_presence_of(:price)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:user_id)}
  end
end
