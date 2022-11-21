class TransactionsController < ApplicationController
  def index
    @pagy, @transactions = pagy(Transaction.all, items: 10)
  end
end
