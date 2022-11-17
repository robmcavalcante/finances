class CardsController < ApplicationController
  def index
    @pagy, @cards = pagy(Card.all, items: 10)
  end
end
