class InvoiceCreator < ApplicationService
  attr_reader :invoice_params

  def initialize(card, invoice)
    @card = card
    @reference = invoice.gsub()
  end

  def call
    expense = create_expense

    invoice = Invoice.new(reference: @invoice, value: , card_id: @card, expense_id: expense.id)
    invoice.save
    invoice
  end

  private
  
  def self.create_expense
    expense = Expense.new(description: , date: , value: )
    expense.save
    expense
  end
end