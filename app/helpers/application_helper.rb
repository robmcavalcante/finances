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

  def string_to_date(value)
    day = value[0..1]
    month = value[2..3]
    year = value[4..8]

    "#{day}/#{month}/#{year}"
  end
end
