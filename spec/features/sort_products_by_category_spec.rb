require 'rails_helper'
require 'capybara/rails'

feature 'sort products by category' do
  scenario 'show only a specific category' do
    create_products_with_categories
    visit root_path
    click_button("Entree")
    expect(page).to have_content('hamburger')
    expect(page).not_to have_content('ice cream')
  end

  private

  def create_products_with_categories
    hamburger = Fabricate(:product, title: 'hamburger')
    ice_cream = Fabricate(:product, title: 'ice cream')
    entree = Category.create(title: 'Entree')
    dessert = Category.create(title: 'Dessert')
    hamburger.categories << entree
    ice_cream.categories << dessert
  end
end
