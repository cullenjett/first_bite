require 'rails_helper'
require 'capybara/rails'

feature 'User sumbits his order' do
  scenario 'user must sign in before checking out' do
    product = Fabricate(:product)
    visit root_path
    click_button 'Add to cart'
    click_button 'Submit Order'
    expect(current_path).to eq(sign_in_path)
  end
end
