class Invoice < ApplicationRecord
  belongs_to :card
  belongs_to :expense
  has_many :transactions
end
