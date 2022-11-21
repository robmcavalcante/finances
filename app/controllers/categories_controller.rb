class CategoriesController < ApplicationController
  def index
    @pagy, @categories = pagy(Category.all, items: 10)
  end
end
