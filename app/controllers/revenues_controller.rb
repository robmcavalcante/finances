class RevenuesController < ApplicationController
  before_action :set_revenue, only: %i[ edit update destroy ]

  def index
    @pagy, @revenues = pagy(Revenue.all, items: 6)
  end

  def new
    @revenue = Revenue.new
  end

  def create
    @revenue = Revenue.new(revenue_params)

    if @revenue.save
      redirect_to revenues_path, notice: 'Receita adicionado com sucesso!'
    else
      redirect_to revenues_path, alert: 'Erro ao salvar a receita. Tente novamente!'
    end
  end

  def edit
  end

  def update
    if @revenue.update(revenue_params)
      redirect_to revenues_path, notice: 'Receita atualizado com sucesso!'
    else
      redirect_to revenues_path, alert: 'Erro ao tentar atualizar os dados do receita. Tente novamente!'
    end
  end

  def destroy
    if @revenue.destroy
      redirect_to revenues_path, notice: 'Receita excluída com sucesso!'
    else
      redirect_to revenues_path, alert: 'Erro ao remover a receita. Tente novamente!'
    end
  end

  private

  def set_revenue
    @revenue = Revenue.find(params[:id])
  end

  def revenue_params
    params.require(:revenue).permit(:description, :value)
  end
end
