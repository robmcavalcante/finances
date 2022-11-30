class InvoiceService
  def self.update_value(transaction)
    invoice_id = transaction[:invoice_id].to_i
    transaction_value = transaction[:value]

    invoice = Invoice.find(invoice_id)

    total = invoice.value.round(2) - transaction_value.round(2)

    invoice.update(value: total)

    # delete invoice and expense belonging to it
    if invoice.value == 0
      expense_id = invoice[:expense_id].to_i
      expense = Expense.find(expense_id)

      invoice.destroy
      expense.destroy
    end
  end
end