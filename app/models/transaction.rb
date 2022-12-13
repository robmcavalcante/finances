class Transaction < ApplicationRecord
  belongs_to :category
  belongs_to :invoice
  has_many :transaction_items, dependent: :destroy

  accepts_nested_attributes_for :transaction_items, allow_destroy: true

  # add the amount to the linked invoice
  after_create do
    self.invoice.value = 50
  end
end
