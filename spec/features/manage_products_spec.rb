require 'rails_helper'
require 'capybara/rails'

feature 'managing products' do
  scenario 'creating a new product' do
    sign_in
    create_product('Cheeseburger')
    visit products_path
    expect(page).to have_content('Cheeseburger')
  end

  scenario 'editing an existing product' do
    sign_in
    create_product('Cheeseburger')
    visit products_path
    click_link 'Edit'
    fill_in :product_title, with: 'Veggie Burger'
    click_button 'Update Product'
    expect(page).to have_content('Veggie Burger')
  end

  private

  def create_product(product_title)
    click_link 'Add Product'
    fill_in :product_title, with: product_title
    fill_in :product_description, with: "It's a burger on a bun!"
    fill_in :product_price, with: 7.99
    click_button 'Create Product'
  end
end
