require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe 'POST update' do
    it 'redirects to the order show page' do
      pending
    end

    it 'updates the quantity for each order item' do
      pending
      apple = Fabricate(:product)
      banana = Fabricate(:product)
      order = Order.create()
      order_item1 = OrderItem.create(order: order, product: apple, quantity: 1)
      order_item2 = OrderItem.create(order: order, product: banana, quantity: 1)

      post :update
    end
  end
end
