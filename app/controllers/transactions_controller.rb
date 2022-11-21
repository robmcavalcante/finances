class TransactionsController < ApplicationController
  def index
    @pagy, @transactions = pagy(Transaction.all, items: 10)
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      redirect_to transactions_path, notice: 'Transação adicionado com sucesso!'
    else
      redirect_to transactions_path, alert: 'Erro ao tentar salvar a transação. Tente novamente!'
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:description, :date, :value, :category_id, :invoice_id, :card_id )
  end

end
