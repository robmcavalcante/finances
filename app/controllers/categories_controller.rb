class CategoriesController < ApplicationController
  before_action :set_user, only: %i[ edit update ]

  def index
    @pagy, @categories = pagy(Category.all, items: 10)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path, notice: 'Categoria adicionada com sucesso!'
    else
      redirect_to categories_path, alert: 'Erro ao salvar a nova categoria. Tente novamente!'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon, :color)
  end
end
