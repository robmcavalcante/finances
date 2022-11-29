class TransactionService
  def self.validation(transaction)
    items = transaction[:items_attributes]
    transaction.delete(:items_attributes)

    transaction[:value] = value_transaction(items)

    if transaction[:invoice].nil?
      t = Transaction.new(transaction)

      t.save
      create_items(items, t.id)
    else
      id = create_invoice(transaction)
      transaction[:item_id] = id

      t = Transaction.new(transaction)
      t.save
      create_items(items, t.id)
    end

    return true
  end

  private

  def self.count_items(items)
    n_items = 0

    items.each do |i|
      n_items = n_items + 1;
    end

    n_items
  end

  def self.create_items(items, transaction_id)
    n_items = count_items(items)

    n_items.times do |index|
      item = Item.new(description: items["#{index}"][:description], value: items["#{index}"][:value], transaction_id: transaction_id)
      item.save
    end
  end

  def self.create_invoice(transaction)
    month = transaction[:invoice][0..1]
    year = transaction[:invoice][3..6]

    invoice = Invoice.new(month: month, year: year)
    invoice.save

    invoice.id
  end

  def self.value_transaction(items)
    n_items = count_items(items)

    total = 0

    n_items.times do |index|
      total = total + items["#{index}"][:value].to_f
    end

    total
  end
end