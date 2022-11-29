module ApplicationHelper
  include Pagy::Frontend

  def concatenate_brazilian_real_sign(value)
    "R$ " + value.to_s
  end

  def current_date
    Date.today.strftime("%d/%m/%Y")
  end

  def active_link(value)
    if request.fullpath.include?("#{value}")
      "active"
    end
  end
end
