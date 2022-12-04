class Card < ApplicationRecord
  has_many :invoices, dependent: :destroy
end
