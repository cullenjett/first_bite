require 'rails_helper'
require 'capybara/rspec'

feature 'User updates the quantity of an item in his cart' do
  scenario 'add an item to the cart, then change the quantity' do
    product = Fabricate(:product)
    visit root_path
    first(:button, 'Add to cart').click
    fill_in "order_order_items_attributes_0_quantity", with: 3
    click_button 'Update Cart'
    expect(page).to have_selector("input[value='3']")
  end
end
