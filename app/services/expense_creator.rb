class ExpenseCreator
  def initialize(card, reference)
    @description = "#{card.description} - Fatura #{reference.insert(2, '/')}"
    @date = "#{card.expiration}#{reference}" 
  end

  def call
    expense = Expense.new(description: @description, date: @date)
    expense.save
    expense
  end
end