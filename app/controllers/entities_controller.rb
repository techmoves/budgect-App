class EntitiesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @entities = @category.entities
    @categories = current_user.categories.all
  end

  def new
    @entity = Entity.new
    @group = Category.new
    @categories = current_user.categories.all
  end

  def create
    @entity = Entity.new(name: entity_params[:name], amount: entity_params[:amount], user_id: current_user.id)
    if @entity.save
      @categories_entites = CategoriesEntity.new(category_id: params[:category_id], entity_id: @entity.id)
      if @categories_entites.save
        redirect_to category_entities_path, notice: 'Entity was successfully created.'
      else
        render :new
      end
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @entity = @category.entities.find(params[:id])
    @entity.destroy
    redirect_to category_entities_path(@category)
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
