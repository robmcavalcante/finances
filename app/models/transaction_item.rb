class TransactionItem < ApplicationRecord
  belongs_to :my_transaction, class_name: "Transaction"
end
