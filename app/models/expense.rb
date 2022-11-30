class Expense < ApplicationRecord
  has_many :invoices
end
