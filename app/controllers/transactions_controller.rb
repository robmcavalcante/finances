class TransactionsController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @pagy, @transactions = pagy(Transaction.all, items: 10)
  end

  def show
    @items = Item.where(transaction_id: params[:id])
  end

  def new
    @transaction = Transaction.new
    @transaction.transaction_items.build
  end

  def create
    transaction_params
    @transaction = TransactionCreator.call(transaction_params)

    # if @transaction.save
    #   redirect_to cards_path, notice: 'Transaçãoo cadastrada com sucesso!'
    # else
    #   redirect_to cards_path, alert: 'Ocorreu um erro no cadastro da transação. Tente novamente!'
    # end
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
    transaction = @transaction

    if @transaction.destroy
      redirect_to transactions_path, notice: 'Transação excluída com sucesso!'
      InvoiceService.update_value(transaction)
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
