class Category < ApplicationRecord
  belongs_to :user

  has_many :categories_entities, dependent: :destroy
  has_many :entities, through: :categories_entities, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true
end
