module ExpenseHelper
  def expense_value(expense)
    if expense.invoice.present?
      expense.invoice&.value
    else
      expense.value
    end
  end
end