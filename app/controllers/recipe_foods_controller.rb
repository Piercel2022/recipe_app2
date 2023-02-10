class RecipeFoodsController < ApplicationController
  load_and_authorize_resource
  def new
    @foods = current_user.foods
    @recipe = Recipe.find(params[:recipe_id])
    @recipefood = Recipefood.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipefood = Recipefood.new(recipefood_params)
    @recipefood.recipe = @recipe

    if @recipefood.save
      redirect_to recipe_path(@recipe), notice: 'New ingredient was successfully added.'
    else
      flash[:alert] = 'New Ingredient adding Failed. Please try again.'
    end
  end

  def destroy
    @recipefood = Recipefood.find(params[:id])

    unless @recipefood.recipe.user == current_user
      flash[:alert] = 'You do not have access to delete the ingredient belongs to other Users.'
      return redirect_to recipes_path
    end

    if @recipefood.destroy
      flash[:notice] = 'Ingredient was successfully removed.'
    else
      flash[:alert] = 'Ingredient removal Failed. Please try again.'
    end
    redirect_to recipes_path
  end

  def recipefood_params
    params.require(:recipefood).permit(:quantity, :food_id)
  end
end
