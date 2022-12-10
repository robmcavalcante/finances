class TransactionCreator < ApplicationService
  # attr_reader :transaction_params

  def initialize(transaction_params)
    @card = transaction_params[:card_id]
    @transaction = transaction_params.delete(:card_id, :invoice, :items_attributes)
    @items = transaction_params[:items_attributes]
    @invoice = transaction_params[:invoice]
  end

  def call
    # Se não existir uma fatura vinculada, crie!
    if @transaction[:invoice_id].nil?
      invoice = InvoiceCreator.call(@card, @invoice)
      @transaction.update(invoice_id: invoice.id)
    end

    transaction = Transaction.new(@transaction)
    transaction.save

    create_items(transaction)
  end

  private

  def self.create_items(transaction) 
    @total = 0 

    @items.each do |i|
      item = TransactionItem.new(description: i[1][:description], value: i[1][:value], transaction_id: transaction.id)
      @total += i[1][:value]
      item.save
    end

    @total
  end
end