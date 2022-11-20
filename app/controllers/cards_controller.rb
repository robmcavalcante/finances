class CardsController < ApplicationController
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

  private

  def card_params
    params.require(:card).permit(:description, :flag, :limit, :closure, :expiration)
  end
end
