module ApplicationHelper
  include Pagy::Frontend

  def integer_to_real_currency(value)
    "R$ " + value.to_s
  end
end
