class TransactionService
  def self.validation(transaction)
    items = transaction[:items_attributes]
    transaction.delete(:items_attributes)

    transaction[:value] = value_transaction(items)

    if transaction[:invoice].nil?
      t = Transaction.new(transaction)
      t.save

      value_transaction = transaction[:value]

      invoice = Invoice.find(transaction[:invoice_id].to_i)

      invoice_value = invoice[:value]

      total = invoice_value + value_transaction

      invoice.update(value: total)

      create_items(items, t.id)
    else
      id = create_invoice(transaction, items)
      transaction[:invoice_id] = id

      p "$$$$$$$$$$"
      p transaction
      p "$$$$$$$$$$$$"

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

  def self.create_expense(transaction, items)
    date = transaction[:invoice]
    card = Card.find(transaction[:card_id])

    expense = Expense.new(description: "#{card.description} - Fatura #{date}", value: transaction[:value], date: date)
    expense.save
    expense.id
  end

  def self.create_invoice(transaction, items)
    month = transaction[:invoice][0..1]
    year = transaction[:invoice][3..6]
    
    expense_id = create_expense(transaction, items)
    
    transaction.delete(:invoice)


    invoice = Invoice.new(month: month, year: year, value: transaction[:value], expense_id: expense_id)
    invoice.save

    p "########"
    p invoice.id
    p "########"

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