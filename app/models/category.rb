class Category < ApplicationRecord
  belongs_to :user

  has_many :categories_entities, dependent: :destroy
  has_many :entities, through: :categories_entities, dependent: :destroy


  has_many :categories_transfers, dependent: :destroy
  has_many :transfers, through: :categories_transfers, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true

  def total_amount
    transfers.sum(:amount)
  end

  validates :name, presence: true
  validates :icon, presence: true
end
