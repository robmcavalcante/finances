class RevenuesController < ApplicationController
  def index
    @pagy, @revenues = pagy(Revenue.all, items: 6)
  end
end
