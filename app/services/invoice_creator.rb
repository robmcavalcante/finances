class InvoiceCreator
  def initialize(invoice, card)
    @reference = invoice.gsub('/', '')
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