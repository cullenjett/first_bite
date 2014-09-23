require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do
  describe 'GET new' do
    it 'sets @product as a new Product' do
      get :new
      expect(assigns(:product)).to be_a(Product)
    end
  end#GET new

  describe 'POST create' do
    context 'with valid attributes' do
      it 'redirects to the new product page' do
        post :create, product:Fabricate.attributes_for(:product)
        expect(response).to redirect_to(new_product_path)
      end

      it 'creates a new product' do
        post :create, product: Fabricate.attributes_for(:product)
        expect(Product.count).to eq(1)
      end

      it 'sets the flash[:success] message' do
        post :create, product: Fabricate.attributes_for(:product)
        expect(flash[:success]).to be_present
      end
    end

    context 'with invalid attributes' do
      it 'renders the new product template' do
        post :create, product: { title: 'invalid product' }
        expect(response).to render_template :new
      end

      it 'does not create a new product' do
        post :create, product: { title: 'invalid product' }
        expect(Product.count).to eq(0)
      end

      it 'sets the flash[:danger] message' do
        post :create, product: { title: 'invalid product' }
        expect(flash[:danger]).to be_present
      end
    end
  end#POST create
end
