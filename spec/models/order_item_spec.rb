require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  it { should belong_to(:product) }
  it { should belong_to(:order) }
  it { should validate_presence_of(:order) }
  it { should validate_presence_of(:product) }
  it { should validate_numericality_of(:quantity).is_greater_than_or_equal_to(0) }

  describe '#subtotal' do
    it 'returns the total for the line item' do
      product = Fabricate(:product, price: 1.01)
      order_item = OrderItem.create(quantity: 5, product: product)
      expect(order_item.subtotal).to eq(5.05)
    end
  end
end
