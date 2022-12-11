class TransactionItem < ApplicationRecord
  belongs_to :tx, class_name: "Transaction"
end
