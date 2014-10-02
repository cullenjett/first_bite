require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe 'POST update' do
    context 'updating the quantity' do
      it 'redirects to the order show page' do
        product = Fabricate(:product)
        order = Order.create()
        order_item = OrderItem.create(product: product, order: order, quantity: 1)

        post :update, id: order.id, update_cart: 'Update Cart', order: {
          order_items_attributes: {
            '0' => { 'quantity' => '2', 'id' => product.id }
          }
        }
        expect(response).to redirect_to order_path(order)
      end

      it 'updates the quantity for each order item' do
        product = Fabricate(:product)
        order = Order.create()
        order_item = OrderItem.create(product: product, order: order, quantity: 1)

        post :update, id: order.id, update_cart: 'Update Cart', order: {
          order_items_attributes: {
            '0' => { 'quantity' => '2', 'id' => product.id }
          }
        }
        order_item.reload
        expect(order_item.quantity).to eq(2)
      end
    end

    context 'deleting the cart' do
      it 'redirects to the root path' do
        product = Fabricate(:product)
        order = Order.create()
        order_item = OrderItem.create(product: product, order: order, quantity: 1)

        post :update, id: order.id, empty_cart: 'Empty Cart', order: {
          order_items_attributes: {
            '0' => { 'quantity' => '2', 'id' => product.id }
          }
        }
        expect(response).to redirect_to root_path
      end

      it 'deletes the order' do
        product = Fabricate(:product)
        order = Order.create()
        order_item = OrderItem.create(product: product, order: order, quantity: 1)

        post :update, id: order.id, empty_cart: 'Empty Cart', order: {
          order_items_attributes: {
            '0' => { 'quantity' => '2', 'id' => product.id }
          }
        }
        expect(Order.count).to eq(0)
      end

      it 'removes the order from the session' do
        product = Fabricate(:product)
        order = Order.create()
        order_item = OrderItem.create(product: product, order: order, quantity: 1)
        session[:order_id] = order.id
        
        post :update, id: order.id, empty_cart: 'Empty Cart', order: {
          order_items_attributes: {
            '0' => { 'quantity' => '2', 'id' => product.id }
          }
        }
        expect(session[:order_id]).to be nil
      end
    end
  end#POST update
end
