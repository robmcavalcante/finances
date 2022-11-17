class Transaction < ApplicationRecord
  belongs_to :invoice
  belongs_to :card
  belongs_to :category
end
