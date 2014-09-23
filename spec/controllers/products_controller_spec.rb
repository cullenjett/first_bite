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

  describe 'PUT update' do
    context 'with valid attributes' do
      it 'redirects to the products index page' do
        product = Fabricate(:product, title: 'original title')
        put :update, { id: product.to_param, product: {title: 'new title'} }
        expect(response).to redirect_to products_path
      end

      it 'updates the product' do
        product = Fabricate(:product, title: 'original title')
        put :update, { id: product.to_param, product: {title: 'new title'} }
        expect(product.reload.title).to eq('new title')
      end
    end
  end#PUT update
end
