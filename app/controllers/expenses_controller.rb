class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[ edit update destroy ]

  def index
    @pagy, @expenses = pagy(Expense.all, items: 6)
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)

    if @expense.save
      redirect_to expenses_path, notice: 'Despesa cadastrada com sucesso!'
    else
      redirect_to expenses_path, alert: 'Ocorreu um erro no cadastro do despesa. Tente novamente!'
    end
  end

  def edit
  end

  def update
    if @expense.update(expense_params)
      redirect_to expenses_path, notice: 'Despesa atualizada com sucesso!'
    else
      redirect_to expenses_path, alert: 'Ocorreu um erro atualizar os dados da despesa. Tente novamente!'
    end
  end

  def destroy
    if @expense.destroy
      redirect_to expenses_path, notice: 'Despesa excluída com sucesso!'
    else
      redirect_to expenses_path, alert: 'Ocorreu um erro ao remover a despesa. Tente novamente!'
    end
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:description, :date, :value)
  end
end
