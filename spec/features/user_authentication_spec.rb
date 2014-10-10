require 'rails_helper'
require 'capybara/rails'

feature 'user registers a new account' do
  scenario 'with an empty shopping cart' do
    visit root_path
    register_new_user
    expect(current_path).to eq(products_path)
    user_sees_name_on_page
  end

  private

  def register_new_user
    click_link 'Register'
    fill_in 'Name', with: 'Alice Smith'
    fill_in 'Email', with: 'alice@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign Up'
  end

  def user_sees_name_on_page
    expect(page).to have_content('Alice Smith')
  end
end


feature 'existing user signs in' do
  scenario 'sign in with an empty shopping cart' do
    user = Fabricate(:user)
    visit root_path
    click_button 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    within('.main-content') do
      click_button 'Sign In'
    end
    expect(page).to have_content(user.name)
  end
end
