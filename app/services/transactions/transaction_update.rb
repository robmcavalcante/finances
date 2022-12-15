class Transactions::TransactionUpdate
  def initialize(params)
    @transaction = params.except(:invoice, :transaction_items_attributes, :card_id)
    @invoice = params.slice(:invoice).values[0]
    @items = params[:transaction_items_attributes]
    @card = params.slice(:card_id).values[0].to_i
  end

  def call
    # update transaction
    Transaction.update(@transaction)

    # update items or remove/add more items
    items_update
  end

  private

  def items_update
    # new items?
    @items.each do |item|
      if item[1][:id].blank?
        novos = item[1][:description]
    end
  end
end