# cards
will = Card.new(description: "Will", flag: "Mastercard", limit: 1540, closure: 25, expiration: 05)
will.save

pic = Card.new(description: "PicPay", flag: "Mastercard", limit: 600, closure: 25, expiration: 05)
pic.save

nu = Card.new(description: "Nubank", flag: "Mastercard", limit: 400, closure: 25, expiration: 05)
nu.save

# categories
cat = Category.new(name: "Supermercado", icon: "fas fa-shopping-cart", color: "blue")




# invoice
invoice = Invoice.new(month: 12, year: 2022, expense_id: )
invoice.save

# transactions
Transaction.create(description: "", value: , invoice_id: invoice.id, card_id: will.id, category_id: cat.id)
Transaction.create(description: "", value: , invoice_id: invoice.id, card_id: will.id, category_id: cat.id)
Transaction.create(description: "", value: , invoice_id: invoice.id, card_id: will.id, category_id: cat.id)
Transaction.create(description: "", value: , invoice_id: invoice.id, card_id: will.id, category_id: cat.id)
Transaction.create(description: "", value: , invoice_id: invoice.id, card_id: will.id, category_id: cat.id)
will_total

Transaction.create(description: "", value: , invoice_id: invoice.id, card_id: pic.id, category_id: cat.id)
Transaction.create(description: "", value: , invoice_id: invoice.id, card_id: will.id, category_id: cat.id)
Transaction.create(description: "", value: , invoice_id: invoice.id, card_id: will.id, category_id: cat.id)
Transaction.create(description: "", value: , invoice_id: invoice.id, card_id: will.id, category_id: cat.id)
Transaction.create(description: "", value: , invoice_id: invoice.id, card_id: will.id, category_id: cat.id)
pic_total

Transaction.create(description: "", value: , invoice_id: invoice.id, card_id: nu.id, category_id: cat.id)
Transaction.create(description: "", value: , invoice_id: invoice.id, card_id: will.id, category_id: cat.id)
Transaction.create(description: "", value: , invoice_id: invoice.id, card_id: will.id, category_id: cat.id)
Transaction.create(description: "", value: , invoice_id: invoice.id, card_id: will.id, category_id: cat.id)
Transaction.create(description: "", value: , invoice_id: invoice.id, card_id: will.id, category_id: cat.id)
nu_total

expense = Expense.new(status: 0, value: will_total, description: "Will - Fatura 12/2022"  date: will)
expense = Expense.new(status: 0, value: pic_total, description: "PicPay - Fatura 12/2022"  date: "")
expense = Expense.new(status: 0, value: nu_total, description: "Nubank - Fatura 12/2022"  date: "")


# icons

