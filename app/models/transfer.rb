class Transfer < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :categories_transfers, dependent: :destroy
  has_many :categories, through: :categories_transfers, dependent: :destroy

  validates :name, presence: true
  validates :amount, presence: true
end
