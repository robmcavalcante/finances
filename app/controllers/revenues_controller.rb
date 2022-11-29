class RevenuesController < ApplicationController
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

  private

  def revenue_params
    params.require(:revenue).permit(:description, :value)
  end
end
