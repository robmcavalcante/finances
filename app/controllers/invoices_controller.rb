class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.where(card_id: params[:id])

    render json: @invoices
  end
end