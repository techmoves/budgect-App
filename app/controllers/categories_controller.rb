class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(name: category_params[:name], icon: category_params[:icon], user_id: current_user.id)

    if @category.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to root_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
