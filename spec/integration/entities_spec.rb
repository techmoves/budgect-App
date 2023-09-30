require 'rails_helper'

RSpec.describe Entity, type: :system do
  include Devise::Test::IntegrationHelpers
  user = User.create!(name: 'shafiu', email: "shafiu#{Random.rand(1...1000)}@example.com", password: 'password')
  category = Category.create!(user_id: user.id, name: 'test', icon: 'burger.png')
  subject do
    Entity.new(user_id: user.id, name: 'test', amount: 20)
  end
  before do
    login_as(user, scope: :user)
    subject.save
  end
  describe 'index page' do
    it "I can see the categories's name" do
      visit category_entities_path(category.id)
      page.has_content?(subject.name)
    end

    it "I can see the categories's amount." do
      visit category_entities_path(category.id)
      page.has_content?(subject.amount)
    end

    it 'When I click on a Add new trasaction button, it redirects me to that new trasaction page' do
      visit category_entities_path(category.id)
      click_on 'ADD TRANSANCTION'
      visit new_category_entity_path(category.id)
      page.has_content?('TRANSACTION')
    end
  end
end
