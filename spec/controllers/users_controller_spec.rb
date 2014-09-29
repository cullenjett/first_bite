require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe 'POST create' do
    context 'with valid inputs' do

      it 'redirects to the products page' do
        post :create, user: Fabricate.attributes_for(:user)
        expect(response).to redirect_to products_path
      end

      it 'creates a new user' do
        post :create, user: Fabricate.attributes_for(:user)
        expect(User.count).to eq(1)
      end

      it 'signs in the new user' do
        post :create, user: Fabricate.attributes_for(:user, id: 1)
        expect(session[:user_id]).to eq(1)
      end

      it 'sets the flash[:success] message' do
        post :create, user: Fabricate.attributes_for(:user)
        expect(flash[:success]).to be_present
      end
    end

    context 'with invalid inputs' do
      it 'renders the new template' do
        post :create, user: { name: 'not enough info' }
        expect(response).to render_template :new
      end

      it 'does not create a new user' do
        post :create, user: { name: 'not enough info' }
        expect(User.count).to eq(0)
      end

      it 'sets the flash[:danger] message' do
        post :create, user: { name: 'not enough info' }
        expect(flash[:danger]).to be_present
      end
    end
  end#POST create
end
