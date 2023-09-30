require 'rails_helper'

RSpec.describe Category, type: :model do
  before :each do
    @user = User.new(name: 'Shafiu', email: 'shafiu@gmail.com')
    @category = Category.new(name: 'Clothes', icon: 'shirt.png', user_id: @user.id)
  end

  it 'name should be present' do
    expect(@category.name).to eq('Clothes')
  end

  it 'icon shold be present' do
    expect(@category.icon).to eq('shirt.png')
  end
end
