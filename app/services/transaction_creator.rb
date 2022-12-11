class TransactionCreator
  def initialize(params)
    @transaction = params.except(:invoice, :transaction_items_attributes, :card_id)
    @invoice = params.slice(:invoice).values[0]
    @items = params[:transaction_items_attributes]
    @card = params.slice(:card_id).values[0].to_i
  end

  def call
    if @invoice.present?
      invoice = InvoiceCreator.new(@invoice, @card).call
      @transaction[:invoice_id] = invoice.id
    end

    transaction = Transaction.new(@transaction)
    transaction.value = calc_total
    transaction.save
    
    items_creator(transaction)
    return true 
  end

  private

  def calc_total
    total = 0
    @items.each do |item|
      total = total + item[1][:value].to_f
    end
    total
  end

  def items_creator(transaction)
    @items.each do |item|
      item = TransactionItem.new(description: item[1][:description], value: item[1][:value], transaction_id: transaction.id)
      item.save
    end
  end
end