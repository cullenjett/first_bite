require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should have_many(:order_items) }
  it { should belong_to(:user) }
end
