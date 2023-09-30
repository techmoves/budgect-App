require 'rails_helper'

RSpec.describe Entity, type: :model do
  before :each do
    @user = User.new(name: 'Shafiu', email: 'shafiu@gmail.com')
    @entity = Entity.new(name: 'Clothes', amount: 50, user_id: @user.id)
  end

  it 'name should be present' do
    expect(@entity.name).to eq('Clothes')
  end

  it 'amound should be present' do
    expect(@entity.amount).to eq(50)
  end
end
