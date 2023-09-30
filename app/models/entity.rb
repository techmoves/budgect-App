class Entity < ApplicationRecord
  belongs_to :user

  has_many :categories_entities, dependent: :destroy
  has_many :categories, through: :categories_entities, dependent: :destroy

  validates :name, presence: true
  validates :amount, presence: true
end
