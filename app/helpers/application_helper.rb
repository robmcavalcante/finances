module ApplicationHelper
  include Pagy::Frontend
  
  def active_link(value)
    if request.fullpath.include?("#{value}")
      "active"
    end
  end
end
