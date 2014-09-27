require 'rails_helper'
require 'capybara/rails'

feature 'create a new order' do
  scenario 'unathenticated user adds an item to his cart' do
    apple = Fabricate(:product, title: 'apple')
    banana = Fabricate(:product, title: 'banana')
    visit root_path
    first(:button, 'Add to cart').click
    within('.main-content') do
      expect(page).to have_content('Your Cart')
      expect(page).to have_content(apple.title)
      expect(page).not_to have_content(banana.title)
    end
  end
end
