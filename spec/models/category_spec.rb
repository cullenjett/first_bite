require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should validate_presence_of(:title) }
  it { should have_many(:products) }
end
