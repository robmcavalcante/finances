class Transaction < ApplicationRecord
  belongs_to :category
  belongs_to :invoice
  has_many :items, class_name: 'TransactionItem', dependent: :destroy
end
