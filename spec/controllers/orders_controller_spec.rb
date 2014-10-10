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

  describe 'POST submit' do
    context 'when user is not signed in' do
      it 'redirects to the sign in page' do
        order = Order.create(user: nil)
        session[:order_id] = order.id
        post :submit
        expect(response).to redirect_to sign_in_path
      end

      it 'sets the flash[:info] message' do
        order = Order.create(user: nil)
        session[:order_id] = order.id
        post :submit
        expect(flash[:info]).to be_present
      end

      it 'does not allow a user without a cart to submit an order' do
        post :submit
        expect(response).to redirect_to root_path
      end
    end

    context 'when user is signed it' do
      it 'redirects to the confirmation page' do
        user = Fabricate(:user)
        session[:user_id] = user.id
        order = Order.create()
        session[:order_id] = order.id
        post :submit
        expect(response).to redirect_to order_confirmation_path
      end

      it 'associates the order with the user' do
        user = Fabricate(:user)
        session[:user_id] = user.id
        order = Order.create()
        session[:order_id] = order.id
        post :submit
        user.reload
        expect(user.orders.include?(order)).to be true
      end

      it 'updates the order status to submitted' do
        user = Fabricate(:user)
        session[:user_id] = user.id
        order = Order.create()
        session[:order_id] = order.id
        post :submit
        order.reload
        expect(order.status).to eq('submitted')
      end
    end
  end
end
