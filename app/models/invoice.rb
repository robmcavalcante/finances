class Invoice < ApplicationRecord
  def month_year
    "#{month}/#{year}"
  end
end
