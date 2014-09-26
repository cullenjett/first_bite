require 'rails_helper'
require 'capybara/rails'

feature 'create a new order' do
  scenario 'user adds an item to his cart' do
    pending
    apple = Fabricate(:product)
    banana = Fabricate(:product)
    visit root_path
    click_button 'Add to cart'
  end
end
