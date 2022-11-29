class Card < ApplicationRecord
  has_many :transactions, dependent: :destroy

  validates :description, presence: true, length: { maximum: 30 }
  validates :flag, presence: true, length: { maximum: 20 }
  validates :limit, presence: true
  validates :closure, presence: true, length: { maximum: 2 }
  validates :expiration, presence: true, length: { maximum: 2 }
end
