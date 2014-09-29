require 'rails_helper'

RSpec.describe OrdersHelper do
  describe '#product_count' do
    #good place to use stubs/doubles/etc?
    it 'returns the total number of products in an order' do
      apple = Fabricate(:product)
      banana = Fabricate(:product)
      order_item1 = OrderItem.create(product: apple, quantity: 1)
      order_item2 = OrderItem.create(product: banana, quantity: 1)
      order = Order.create()
      order.order_items << order_item1
      order.order_items << order_item2
      expect(product_count(order)).to eq(2)
    end
  end
end
