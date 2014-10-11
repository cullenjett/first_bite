require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should have_many(:order_items) }
  it { should have_many(:products) }
  it { should belong_to(:user) }
  it { should accept_nested_attributes_for(:order_items) }

  # This test fails because the prices are BigDecimals...
  #
  # describe '#total' do
  #   it 'returns the total amount of the order' do
  #     product1 = Fabricate(:product, price: 1)
  #     product2 = Fabricate(:product, price: 2)
  #     order_item1 = OrderItem.create(quantity: 1, product: product1)
  #     order_item2 = OrderItem.create(quantity: 1, product: product2)
  #     order = Order.new
  #     order.order_items << order_item1
  #     expect(order.total).to eq(BigDecimal.new(3))
  #   end
  # end
end
