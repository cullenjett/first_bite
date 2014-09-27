require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do
  describe 'POST create' do
    it 'redirects to the order show path' do
      product = Fabricate(:product)
      post :create, product_id: product.id
      expect(response).to redirect_to order_path(Order.find(session[:order_id]))
    end
  end
end
