class Transaction < ApplicationRecord
  belongs_to :category
  belongs_to :invoice
  has_many :transaction_items
end
