require 'rails_helper'

RSpec.describe Cart do
  describe 'instance methods' do
    it 'shows total item count' do
      cart = Cart.new({"1" => 2, "3" => 5})

      expect(cart.total_item_count).to eq(7)
    end

    it 'can add an item' do
      cart = Cart.new({"1" => 1, "2" => 2})
      cart.add_item(3)
      cart.add_item(4)

      expected = {
        "1" => 1,
        "2" => 2,
        "3" => 1,
        "4" => 1,
      }
      expect(cart.contents).to eq(expected)
    end

    it 'can count number of items by item_id' do
      cart = Cart.new({"1" => 1, "2" => 2})

      expect(cart.count_of(1)).to eq(1)
      expect(cart.count_of(2)).to eq(2)
      expect(cart.count_of(14)).to eq(0)
    end

  end
end
