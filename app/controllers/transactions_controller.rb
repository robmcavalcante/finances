class TransactionsController < ApplicationController
  before_action :set_user, only: %i[ edit update destroy ]

  def index
    @pagy, @transactions = pagy(Transaction.all, items: 10)
  end

  def new
    @transaction = Transaction.new
    @transaction.items.build
  end

  def create
    if TransactionService.validation(transaction_params)
      redirect_to transactions_path, notice: 'Transação adicionado com sucesso!'
    else
      redirect_to transactions_path, alert: 'Erro ao tentar salvar a transação. Tente novamente!'
    end
  end

  def edit
  end

  def update
    if @transaction.update(transaction_params)
      redirect_to transactions_path, notice: 'Transação atualizado com sucesso!'
    else
      redirect_to transactions_path, alert: 'Erro ao atualizar os dados da transação. Tente novamente!'
    end
  end

  def destroy
    if @transaction.destroy
      redirect_to transactions_path, notice: 'Transação excluída com sucesso!'
    else
      redirect_to transactions_path, alert: 'Erro ao tentar remover a transação. Tente novamente!'
    end
  end

  private

  def set_user
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:description, :date, :value, :invoice, :category_id, :invoice_id, :card_id, 
      items_attributes: [ :id, :description, :value ]
    )
  end

end
