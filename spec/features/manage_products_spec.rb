require 'rails_helper'
require 'capybara/rails'

feature 'managing products' do
  scenario 'creating a new product' do
    visit new_product_path

    create_product

    visit products_path

    expect(page).to have_content('Cheeseburger')
  end

  private

  def create_product
    fill_in :product_title, with: 'Cheeseburger'
    fill_in :product_description, with: "It's a burger on a bun!"
    fill_in :product_price, with: 7.99
    click_button 'Create Product'
  end
end
