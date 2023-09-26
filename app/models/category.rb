class Category < ApplicationRecord
    belongs_to :user

    has_many :categories_transfer, dependent :destroy
    has_many :transfers,through :categories_transfers, dependent :destroy

  validates :name, presence: true
  validates :icon, presence: true
end
