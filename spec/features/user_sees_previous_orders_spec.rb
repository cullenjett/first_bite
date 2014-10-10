require 'rails_helper'

feature 'User can see his previous orders' do
  scenario 'accessed from the navigation menu' do
    product = Fabricate(:product)
    sign_in
    click_button 'Add'
    page.find('.checkout-btn').click
    click_button 'Submit Order'
    visit user_orders_path
    expect(page).to have_content(product.title)
  end
end
