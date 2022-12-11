class Expense < ApplicationRecord
  has_one :invoice
end
