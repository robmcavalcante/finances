class InvoiceCreator
  def initialize(invoice, card)
    @reference = invoice.tr("^0-9", '')
    @card = Card.find(card)
  end

  def call
    expense = ExpenseCreator.new(@card, @reference).call

    invoice = Invoice.new(
      reference: @reference,
      card_id: @card.id,
      expense_id: expense.id
    )
    invoice.save
    invoice
  end
end