class CardsController < ApplicationController
  before_action :set_user, only: %i[ edit update destroy ]

  def index
    @pagy, @cards = pagy(Card.all, items: 10)
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)

    if @card.save
      redirect_to cards_path, notice: 'Cartão adicionado com sucesso!'
    else
      redirect_to cards_path, alert: 'Erro ao tentar salvar o cartão. Tente novamente!'
    end
  end

  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to cards_path, notice: 'Cartão atualizado com sucesso!'
    else
      redirect_to cards_path, alert: 'Erro ao tentar atualizar os dados do cartão. Tente novamente!'
    end
  end

  def destroy
    if @card.destroy
      redirect_to cards_path, notice: 'Cartão excluído com sucesso!'
    else
      redirect_to cards_path, alert: 'Erro ao tentar remover o cartão. Tente novamente!'
    end
  end

  private

  def set_user
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:description, :flag, :limit, :closure, :expiration)
  end
end
