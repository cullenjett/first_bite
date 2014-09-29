require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do
  describe 'POST create' do
    it 'redirects to the order show path' do
      product = Fabricate(:product)
      post :create, product_id: product.id
      expect(response).to redirect_to order_path(Order.find(session[:order_id]))
    end

    it 'creates a new order item' do
      product = Fabricate(:product)
      post :create, product_id: product.id
      expect(OrderItem.all.count).to eq(1)
    end

    it 'increments the quantity of the product by 1' do
      product = Fabricate(:product)
      post :create, product_id: product.id
      expect(OrderItem.first.quantity).to eq(1)
    end
  end
end
