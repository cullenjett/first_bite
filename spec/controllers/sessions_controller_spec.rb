require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST create' do
    context 'with valid sign in credentials' do
      it 'redirects to the products page' do
        user = Fabricate(:user)
        post :create, email: user.email, password: user.password
        expect(response).to redirect_to products_path
      end

      it 'sets the user in the session' do
        user = Fabricate(:user)
        post :create, email: user.email, password: user.password
        expect(session[:user_id]).to eq(user.id)
      end

      it 'sets the flash[:success] message' do
        user = Fabricate(:user)
        post :create, email: user.email, password: user.password
        expect(flash[:success]).to be_present
      end

      context 'with invalid sign in credentials' do
        it 'renders the new template' do
          user = Fabricate(:user, password: 'password')
          post :create, email: user.email, password: 'not password'
          expect(response).to render_template :new
        end

        it 'does not set the user in the session' do
          user = Fabricate(:user, password: 'password')
          post :create, email: user.email, password: 'not password'
          expect(session[:user_id]).to be nil
        end

        it 'sets the flash[:danger] message' do
          user = Fabricate(:user, password: 'password')
          post :create, email: user.email, password: 'not password'
          expect(flash[:danger]).to be_present
        end
      end
    end
  end#POST create
end
