class ExpensesController < ApplicationController
  def index
    @pagy, @expenses = pagy(Expense.all, items: 6)
  end
end
