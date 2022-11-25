class TransactionService
  def self.validation(transaction)
    if transaction[:invoice].nil?
      Transaction.new(transaction)
    else
      create_invoice(transaction)
    end
  end

  private

  def self.create_invoice(transaction)
    month = transaction[:invoice][0..1]
    year = transaction[:invoice][3..6]

    invoice = Invoice.new(month: month, year: year)
    invoice.save

    transaction.delete(:invoice)
    transaction[:invoice_id] = invoice.id

    Transaction.new(transaction)
  end
end