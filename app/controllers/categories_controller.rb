class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ edit update destroy ]

  def index
    @pagy, @categories = pagy(Category.all, items: 6)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path, notice: 'Categoria cadastrada com sucesso!'
    else
      redirect_to categories_path, alert: 'Ocorreu um erro no cadastro da categoria. Tente novamente!'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Categoria atualizada com sucesso!'
    else
      redirect_to categories_path, alert: 'Ocorreu um erro atualizar os dados da categoria. Tente novamente!'
    end
  end

  def destroy
    if @category.destroy
      redirect_to categories_path, notice: 'Categoria excluída com sucesso!'
    else
      redirect_to categories_path, alert: 'Ocorreu um erro ao remover a categoria. Tente novamente!'
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:description, :icon, :color)
  end
end
