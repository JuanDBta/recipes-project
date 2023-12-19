class FoodController < ApplicationController
    def index
      @user = User.find(params[:user_id])
      @foods = @user.food
    end
  
    def new
      @food = Food.new
  
      respond_to do |format|
        format.html { render :new, locals: { user: current_user, food: @food } }
      end
    end
  
    def create
      @user = User.find(params[:user_id])
      @food = @user.food.new(food_params)
  
      respond_to do |format|
        if @food.save
          # Create a RecipeFood association
          @recipe = current_user.recipes.find(params[:recipe_id])
          @recipe_food = @recipe.recipe_foods.create(food: @food, quantity: params[:food][:quantity])
  
          format.html { redirect_to user_foods_path(@user), notice: 'Food was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end
  
    def destroy
      @user = User.find(params[:user_id])
      @food = @user.food.find(params[:id])
      @food.destroy
  
      respond_to do |format|
        format.html { redirect_to user_foods_path(@user), notice: 'Food was successfully deleted.' }
      end
    end
  
    private
  
    def food_params
      params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
    end
  end