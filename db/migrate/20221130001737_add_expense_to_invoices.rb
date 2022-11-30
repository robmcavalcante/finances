class AddExpenseToInvoices < ActiveRecord::Migration[7.0]
  def change
    add_reference :invoices, :expense, null: false, foreign_key: true
  end
end
