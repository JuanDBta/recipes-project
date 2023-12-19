class RecipeFoodsController < ApplicationController
  def new
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @foods = Food.all
    @food = Food.new
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])

    selected_food_id = params[:recipe_food][:food_id]

    food = Food.find(selected_food_id.to_i)

    if food

      @recipe_food = RecipeFood.new(
        recipe_id: @recipe.id,
        food_id: food.id,
        quantity: params[:recipe_food][:quantity]
      )

      if @recipe_food.save
        redirect_to show_user_recipe_path(current_user, @recipe), notice: 'Ingredient added successfully.'
      else
        render 'recipe/show'
      end
    else
      flash[:alert] = 'Ingredient not found. Please select a valid ingredient.'
      render 'recipe/show'
    end
  end

  def edit
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])
    @recipe = @recipe_food.recipe
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])

    if @recipe_food.update(quantity: params[:recipe_food][:quantity])
      @recipe = @recipe_food.recipe
      redirect_to show_user_recipe_path(current_user, @recipe), notice: 'Quantity updated !!!'
    else
      render 'recipe/edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.find(params[:id])

    if @recipe_food.destroy
      redirect_to show_user_recipe_path(current_user, @recipe), notice: 'Ingredient removed successfully.'
    else
      redirect_to show_user_recipe_path(current_user, @recipe), alert: 'Failed to remove ingredient.'
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food_name, :quantity)
  end
end
