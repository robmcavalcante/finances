class Expense < ApplicationRecord
  has_one :invoice, dependent: :destroy
end
