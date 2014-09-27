require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do
  describe 'POST create' do
    it 'redirects to the order show path' do
      post :create
      expect(response).to redirect_to order_path(order)
    end
  end
end
