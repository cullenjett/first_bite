require 'rails_helper'
require 'capybara/rspec'

feature 'User updates the quantity of an item in his cart' do
  scenario 'add an item to the cart, then change the quantity' do
    product = Fabricate(:product)
    visit root_path
    first(:button, 'Add to cart').click
    fill_in "order_item_quantity", with: 3
    click_button 'Update Order'
    expect(page).to have_content('3')
    expect(page).not_to have_content('1')
  end
end
