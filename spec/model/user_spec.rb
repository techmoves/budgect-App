require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Test', email: 'test@gmail.com') }

  before { subject.save }

  it 'name should be present' do
    expect(subject.name).to eq('Test')
  end

  it 'email should be present' do
    expect(subject.email).to eq('test@gmail.com')
  end
end
